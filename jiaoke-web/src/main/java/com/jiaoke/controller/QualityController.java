/**
 * FileName: QualityController
 * author:   Melone
 * Date:     2018/10/8 10:11
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.controller;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSON;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.QualityMatchingUtil;
import com.jiaoke.common.bean.PageBean;
import com.jiaoke.quality.bean.QualityDataManagerDay;
import com.jiaoke.quality.bean.QualityRatioModel;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.service.QualityGradingManagerInf;
import com.jiaoke.quality.service.*;
import org.apache.ibatis.annotations.Param;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *  质量管理相关跳转Controller,首页查询最新产品功能在CommonController内实现
 * @author: Melone
 * @create: 2018/10/8 10:11
 * @Description:
 */
@Controller
public class QualityController {

    @Autowired
    private  ReceiveDataInf receiveDataInf;
    @Autowired
    private QualityIndexInf qualityIndexInf;
    @Autowired
    private QualityMatchingInf qualityMatchingInf;
    @Autowired
    private QualityDataMontoringInf qualityDataMontoringInf;
    @Autowired
    private  QualityDataManagerInf qualityDataManagerInf;
    @Autowired
    private QualityAuxiliaryAnalysisInf qualityAuxiliaryAnalysisInf;
    @Autowired
    private QualityRealTimeWarningInf qualityRealTimeWarningInf;
    @Autowired
    private QualityStatementInf qualityStatementInf;
    @Autowired
    private QualityDynamicInf qualityDynamicInf;
    @Resource
    private QualityTimelyDataFalseService qualityTimelyDataFalseService;
    @Resource
    private QualityHistoricalDataService qualityHistoricalDataService;
    @Autowired
    private QualityDataSummaryInf qualityDataSummaryInf;
    @Autowired
    private QualityGradingManagerInf qualityGradingManagerInf;
    @Autowired
    private QualityExperimentalManagerInf qualityExperimentalManagerInf;

    /**
     *
     * 功能描述: <br>
     *     后台获取数据
     *  <机组端发送数据，存入预警表>
     * @param: [messageStr]
     * @return: void
     * @auther:
     * @date: 2018/10/9 17:43
     */
    @RequestMapping(value ={"/qualityData.do"} , method = RequestMethod.POST)
    public void receiveByClient(@RequestParam("messageStr") String messageStr) {

        if (StringUtils.isEmpty(messageStr)) return;

        long startTime = System.currentTimeMillis();

        receiveDataInf.receiveDataToDB(messageStr);

        class MyThread implements Runnable{
            private  String messageStr;
            private  ReceiveDataInf receiveDataInf;
            public void setMessageStr(String messageStr)
            {
                this.messageStr = messageStr;
            }
            public void setReceiveDataInf(ReceiveDataInf receiveDataInf)
            {
                this.receiveDataInf = receiveDataInf;
            }
            @Override
            public void run() {
                receiveDataInf.receiveDataToDBSham(messageStr);
            }
        }
        MyThread myThread = new MyThread();
        myThread.setMessageStr(messageStr);
        myThread.setReceiveDataInf(receiveDataInf);
        Thread thread = new Thread(myThread);
        thread.start();

        long endTime = System.currentTimeMillis();

        System.out.println("程序运行时间：" + (endTime - startTime) + "ms");    //输出程序运行时间


    }
    /**********************************  质量监控首页 Start ************************************************/

    /**
     *
     * 功能描述: <br>
     *  <首页柱状图数据请求接口，返回json字符串>
     * @param: []
     * @return: java.lang.String
     * @auther:
     * @date: 2018/10/10 16:45
     */
    @ResponseBody
    @RequestMapping("/getLastWeekCrewData.do")
    public String getLastWeekCrewData(){

        String lastWeekCrewDataJson = qualityIndexInf.getLastWeekCrewData();

        return lastWeekCrewDataJson;
    }

    /**********************************  质量监控首页 end ************************************************/

    /************************************  配比管理 String **********************************************/

    /**
     *
     * 功能描述: <br>
     *  <配比模板页面加载时调用方法>
     * @param: [request]
     * @return: java.lang.String
     * @auther:
     * @date: 2018/10/11 18:35
     */
    @RequestMapping("/qc_matching_model.do")
    public String gotoMatchingPage(HttpServletRequest request){

        String temp = request.getParameter("currentPageNum");
        String url = QualityMatchingUtil.getUrl(request);


        PageBean<QualityRatioModel> pageBean = new PageBean<QualityRatioModel>();
        if ( temp == null || temp.trim().isEmpty() ){
            pageBean = qualityMatchingInf.selectMatchingMoudelByLimte(1,url);
        }else {
            pageBean = qualityMatchingInf.selectMatchingMoudelByLimte(Integer.parseInt(temp),url);
        }

        if (null == pageBean) {return null;}


        //获取再生料以及添加剂类型
        List<Map<String,String>> listAdditive = qualityMatchingInf.selectAdditiveTypeList();
        List<Map<String,String>> listRegenerate = qualityMatchingInf.selectRegenerateTypeList();

        //添加到域对象内
        request.setAttribute("listAdditive",listAdditive);
        request.setAttribute("listRegenerate",listRegenerate);
        request.setAttribute("pageBean",pageBean);

        return "quality/qc_matching_model";
    }


    /**
     *
     * 功能描述: <br>
     *  <添加配比>
     * @param [qualityRatioTemplate]
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/25 18:45
     */
    @RequestMapping(value ={"/addRation.do"} , method = RequestMethod.POST)
    public String addRation(QualityRatioTemplate qualityRatioTemplate){

        boolean bo =  qualityMatchingInf.insetRatioTemplate(qualityRatioTemplate);

        return "redirect:qc_index.do";
    }

    /**
     *
     * 功能描述: <br>
     *  <删除模板，传入多个模板id字符串>
     * @param [idStr]
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/25 18:47
     */
    @ResponseBody
    @RequestMapping(value ={"/delectRation"} , method = RequestMethod.POST)
    public String delectRation(String idStr){
        String jsonMessage =  qualityMatchingInf.delectRation(idStr);
        return jsonMessage;
    }
    /**
     *
     * 功能描述: <br>
     *  <根据id返回模板对象>
     * @param [idStr]
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/26 13:32
     */
    @ResponseBody
    @RequestMapping(value ={"/showRatioById.do"} , method = RequestMethod.POST)
    public String showRatioById(String idStr){

        String jsonMessage =  qualityMatchingInf.selectRationById(idStr);
        return jsonMessage;
    }


    @ResponseBody
    @RequestMapping(value ={"/addGrading.do"} , method = RequestMethod.POST)
    public String addGrading(String jsonData,String crew1Id,String crew2Id,String gradingName,String upUser,String gradingRemaker){

        String jsonMessage = qualityMatchingInf.insetGrading(jsonData,crew1Id,crew2Id,gradingName,upUser,gradingRemaker);

        return jsonMessage;
    }


    @RequestMapping(value ={"/EditRation.do"} , method = RequestMethod.POST)
    public String EditRation(QualityRatioTemplate qualityRatioTemplate){
      Boolean res =   qualityMatchingInf.EditRationById(qualityRatioTemplate);

        return "redirect:qc_index.do";
    }
    /************************************  配比管理 end **********************************************/


    /********************************  实时监控 Start *****************************************/

    @RequestMapping("/qc_real_time_monitoring.do")
    public String realTimeMonitoring(){

        return "quality/qc_real_time_monitoring";
    }

    /**
     *
     * 功能描述: <br>
     *  <返回质量监控页面字符数据需要的数据>
     * @param []
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/16 14:46
     */
    @ResponseBody
    @RequestMapping("/getRealTimeData.do")
    public String getRealTimeData(){

        String JsonData = qualityDataMontoringInf.selectProductionData();

        if (JsonData == "") return null;
        return JsonData;
    }

    /**
     *
     * 功能描述: <br>
     *  <返回几天内材料温度>
     * @param []
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/29 18:44
     */
    @ResponseBody
    @RequestMapping(value = "/getRealTimeDataEcharsTemp.do",method = RequestMethod.POST)
    public String getRealTimeDataEcharsTemp(){

        String jsonStr = qualityDataMontoringInf.getRealTimeDataEcharsTemp();

        return jsonStr;

    }

    /**
     *
     * 功能描述: <br>
     *  <返回材料图表的数据>
     * @param []
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/29 18:45
     */
    @ResponseBody
    @RequestMapping(value = "/getRealTimeDataEcharsMaterial.do",method = RequestMethod.POST)
    public String getRealTimeDataEcharsMaterial(){

        String  jsonStr = qualityDataMontoringInf.getRealTimeDataEcharsMaterial();
        return jsonStr;
    }

    @ResponseBody
    @RequestMapping("/getRealTimeThreeProductSVG.do")
    public String getRealTimeThreeProductSVG(){
       String res =  qualityDataMontoringInf.getRealTimeThreeProductSVG();
       return res;
    }


    /********************************  实时监控 end *****************************************/



    /********************************  数据管理 Start *****************************************/
    /**
     *
     * 功能描述: <br>
     *  <数据管理首页获取数据渲染>
     * @param [request]
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/26 15:03
     */
    @RequestMapping("/qc_data_manager.do")
    public String dataManager(HttpServletRequest request){

        String temp = request.getParameter("currentPageNum");
        String url = QualityMatchingUtil.getUrl(request);

        PageBean<QualityDataManagerDay> pageBean = new PageBean<QualityDataManagerDay>();
        if ( temp == null || temp.trim().isEmpty() ){
            pageBean = qualityDataManagerInf.selectHistoryDataToDay(1,url);
        }else {
            pageBean = qualityDataManagerInf.selectHistoryDataToDay(Integer.parseInt(temp),url);
        }

        request.setAttribute("pageBean",pageBean);

        return "quality/qc_data_manager";
    }


    @RequestMapping("/getProducttionByDate.do")
    public String getProducttionByDate(HttpServletRequest request,String producedDate,String crewNum){

        if (Strings.isBlank(producedDate) || Strings.isBlank(crewNum) ) {return null;}

        Map<String,Object> map = qualityDataManagerInf.selectProducttionByDate(producedDate,crewNum, request);

        return "quality/qc_dm_data_matching";
    }

    /**
     *
     * 功能描述: <br>
     *  <点击查看产品详情页面>
     * @param [request, id]
     * @return java.lang.String
     * @auther Melone
     * @date 2018/11/13 9:52
     */
    @RequestMapping(value = "/getProductMessage.do",method = RequestMethod.GET )
    public String getProductMessage(HttpServletRequest request,@RequestParam("id") String id,@RequestParam("crewNum") String crewNum){

        if (id.isEmpty()) return "";

        Map<String,Object> map =  qualityDataManagerInf.selectProductMessageById(id,crewNum);

        request.setAttribute("product",map);

        return "quality/qc_dm_data_detail";
    }
    @RequestMapping("getProListByRatioNumAndDate.do")
    public String getProListByRatioNumAndDate(HttpServletRequest request,@RequestParam("ratioNum") String ratioNum,@RequestParam("crewNum") String crewNum,@RequestParam("date") String date){

        if (ratioNum.isEmpty() || crewNum.isEmpty() || date.isEmpty()) {return null;}


        Map<String,Object> prolist = qualityDataManagerInf.selectProListByRatioNumAndDate(ratioNum,crewNum,date);


        request.setAttribute("baseMap",prolist);

        return "quality/qc_data_message";
    }

    @RequestMapping(value = "showTwentyProductSVG.do")
    public String getTwentyProductSVG( ){
        return "quality/qc_dm_data_message_svg";
    }

    @ResponseBody
    @RequestMapping(value = "getProSVGRationAndModelRation.do",method = RequestMethod.POST)
    public String getProSVGRationAndModelRation(String ProductSVG){
       String res = qualityDataManagerInf.getProSVGRationAndModelRation(ProductSVG);
       return res;
    }

    @ResponseBody
    @RequestMapping(value ="/getProductSvgGrading.do",method = RequestMethod.POST)
    public String getProductSvgGrading(String ProductSVG){
        String res = qualityDataManagerInf.getProductSvgGrading(ProductSVG);
        return res;
    }
    /********************************  数据管理 end *****************************************/


    /********************************  质量预警 Start *****************************************/

    @RequestMapping("/qc_quality_warning.do")
    public String qualityWarning(){

        return "quality/qc_quality_warning";
    }

    @ResponseBody
    @RequestMapping(value = "/getQualityWarningData.do",method = RequestMethod.POST,produces = {"text/html;charset=utf-8"})
    public String getQualityWarningData(){

        String listStr = qualityRealTimeWarningInf.selectLastWarningData();

        return listStr;
    }

    @ResponseBody
    @RequestMapping(value = "/getWarningEcharsData.do",method = RequestMethod.POST)
    public String getWarningEcharsData(){

        String jsonStr = qualityRealTimeWarningInf.getWarningEcharsData();

        return jsonStr;
    }

    @ResponseBody
    @RequestMapping("/getGlobalWarningData.do")
    public String getGlobalWarningData(){
        String res = qualityRealTimeWarningInf.getGlobalWarningData();

        return res;
    }

    @RequestMapping("/getWarningPage.do")
    public String getWarningPage(){
        return "quality/qc_warning_page";
    }
    /********************************  质量预警 end *****************************************/


    /********************************  辅助分析 Start *****************************************/

    @RequestMapping("/qc_auxiliary_analysis.do")
    public String auxiliaryAnalysis(HttpServletRequest request){

        String temp = request.getParameter("currentPageNum");
        String warningLive = request.getParameter("warningLive");
        String proData = request.getParameter("proData");
        String crew = request.getParameter("crew");
        String rationId = request.getParameter("rationId");
        String url = QualityMatchingUtil.getUrl(request);

        if ("" == warningLive || warningLive == null)  warningLive = "0";

        PageBean<Map<String,String>> pageBean = new PageBean<Map<String,String>>();
        if ( temp == null || temp.trim().isEmpty() ){
            pageBean = qualityAuxiliaryAnalysisInf.selelectWarningLiveData(1,url,warningLive,proData,crew, rationId );
        }else {
            pageBean = qualityAuxiliaryAnalysisInf.selelectWarningLiveData(Integer.parseInt(temp),url,warningLive,proData,crew, rationId );
        }

        List<Map<String,String>> list = new ArrayList<>();

//        if (pageBean.getPageData().size() != 0){
//            list = qualityAuxiliaryAnalysisInf.selectWaringData(pageBean);
//        }


        request.setAttribute("pageBean",pageBean);
//        request.setAttribute("waringList",list);
        request.setAttribute("proData",proData);
        request.setAttribute("crew",crew);
        request.setAttribute("rationId",rationId);
        request.setAttribute("warningLive",warningLive);

        return "quality/qc_auxiliary_analysis";
    }

    /**
     * 查询基本信息
     * @param producedId
     * @param prodate
     * @param discNum
     * @param request
     * @return
     */
    @RequestMapping("/getProductById.do")
    public String getPageByProductId(@RequestParam("producedId") String producedId,@RequestParam("prodate") String prodate,@RequestParam("discNum") String discNum,@RequestParam("crew") String crew,HttpServletRequest request){

       qualityAuxiliaryAnalysisInf.getPageByProductIdAndProdate(producedId,prodate,discNum,crew,request);

        return "quality/qc_auxiliary_message";
    }

    @ResponseBody
    @RequestMapping("/getProductMessageById.do")
    public String getProductMessageById(@RequestParam("id") String id,@RequestParam("crewNum") String crewNum){
        String result = qualityAuxiliaryAnalysisInf.getRealTimeDataEcharsMaterial(id,crewNum);

        return result;
    }
    /********************************  辅助分析 end *****************************************/


    /********************************  产品报表 Start *****************************************/

    /**
     *
     * 功能描述: <br>
     *  <跳转到产品报表方法>
     * @param []
     * @return java.lang.String
     * @auther Melone
     * @date 2018/11/2 10:51
     */
    @RequestMapping("/qc_prodoct_list.do")
    public String prodoctList(){

        return "quality/qc_prodoct_list";
    }

    /**
     *
     * 功能描述: <br>
     *  <返回上个月各级预警材料总重>
     * @param []
     * @return java.lang.String
     * @auther Melone
     * @date 2018/11/2 10:56
     */
    @ResponseBody
    @RequestMapping("/getMonthStatementToEchars.do")
    public String getMonthStatementToEchars(){

       String res = qualityStatementInf.selectLastMonthStatementToEchars();

       return res;
    }

    @ResponseBody
    @RequestMapping("/getMonthStatementToData.do")
    public String getMonthStatementToData(){

        String res = qualityStatementInf.selectMonthStatementToData();

        return res;
    }
    //获取上一年生产信息，及当前年份集合
    @ResponseBody
    @RequestMapping("/getYearStatementDateAndDate.do")
    public String getYearStatementDateAndDate(){
        String res = qualityStatementInf.selectYearStatementDateAndDate();
        return res;
    }
    //返回各个月份集合
    @ResponseBody
    @RequestMapping("/getMonthDateList.do")
    public String getMonthDateList(){
        String  res = qualityStatementInf.selectMonthDateList();

        return res;
    }

    /********************************  产品报表 end *****************************************/


    /********************************  实验检测 Start *****************************************/

    @RequestMapping("/qc_test_detection.do")
    public String testDetection(){

        return "quality/qc_test_detection";
    }

    /********************************  实验检测 end *****************************************/


    /********************************  实时监测（假） start *****************************************/
    /**
     * 跳转实时监测（假）页面
     *
     * @return qc_real_time_surveillance.jsp
     */
    @RequestMapping(value = "/qc_real_time_surveillance.do")
    public String toRealTimeSurveillanceFalse(){
        return "quality/qc_real_time_surveillance";
    }

    @RequestMapping(value = "/getRealTimeSurveillanceFalse.do")
    @ResponseBody
    public String getRealTimeSurveillanceFalse(){
        List<Map<String,String>> list = qualityTimelyDataFalseService.getTimeSurveillanceFalseData();
        return JsonHelper.toJSONString(list);
    }

    @RequestMapping("/getFalseDataToChars.do")
    @ResponseBody
    public String getFalseDataToChars(){
        String  resoure = qualityTimelyDataFalseService.selectFalseDataToChars();
        return  resoure;
    }

    @RequestMapping("/getFalseDataEcharsTemp.do")
    @ResponseBody
    public String getFalseDataEcharsTemp(){
        String  resoure = qualityTimelyDataFalseService.selectFalseDataEcharsTemp();
        return  resoure;
    }


    /********************************  实时监测（假） end *****************************************/



    /********************************  历史数据（假） start *****************************************/
    /**
     * 跳转历史数据页面
     *
     * @return qc_historical_data.jsp
     */
    @RequestMapping(value = "/qc_historical_data.do")
    public String toHistoricalData(HttpServletRequest request){
        String temp = request.getParameter("currentPageNum");
        String url = QualityMatchingUtil.getUrl(request);

        PageBean<QualityDataManagerDay> pageBean = new PageBean<>();
        if ( temp == null || temp.trim().isEmpty() ){
            pageBean = qualityHistoricalDataService.selectHistoryDataToDay(1,url);
        }else {
            pageBean = qualityHistoricalDataService.selectHistoryDataToDay(Integer.parseInt(temp),url);
        }

        request.setAttribute("pageBean",pageBean);
        return "quality/qc_historical_data";
    }


    @RequestMapping(value = "/getFalseDataByDate.do")
    public String getFalseDataByDate( HttpServletRequest request,String producedDate,String crewNum ){
        List<Map<String,String>> list = qualityHistoricalDataService.selectHistoryByDateAndcrewNum(producedDate,crewNum);
        request.setAttribute("prolist",list);
        return "quality/qc_false_data_list";
    }


    /********************************  历史数据（假） end *****************************************/

    /********************************  动态管理 start *****************************************/

    @RequestMapping("/qc_dynamic_management.do")
    public String getLastDayAsphaltRationToChars (HttpServletRequest request){
        qualityDynamicInf.getLastDayToChars(request);
        return "quality/qc_dynamic_management";
    }


    @RequestMapping(value = "/getEcharsDataByMaterialAndDate.do")
    public String dayToChars(String date,String material,String ratioNum ,String crew,HttpServletRequest request){

        qualityDynamicInf.getEcharsDataByMaterialAndDate(date,material,ratioNum,crew,request);
        return "quality/qc_dynamic_management";
    }

    @ResponseBody
    @RequestMapping(value = "/getRatioListByDate.do" , method = RequestMethod.POST)
    public  String getRatioListByDate(String proData,String crew){
        String res =  qualityDynamicInf.getRatioListByDate(proData,crew);
        return res;
    }

    /********************************  动态管理 end *****************************************/

    /********************************  数据汇总 Start *****************************************/

    @RequestMapping("qc_data_summary.do")
    public String dataSummary(){
        return "quality/qc_data_summary";
    }

    /**
     *
     * 功能描述: <br>
     *  <获取前三天生产数据用于展示>
     * @param
     * @return
     * @auther Melone
     * @date 2019/4/30 10:32
     */
    @ResponseBody
    @RequestMapping("/getThreeDayData.do")
    public String getThreeDayData(){
        String res = qualityDataSummaryInf.getThreeDayData();
        return res;
    }

    @ResponseBody
    @RequestMapping(value = "/getRatioListByDateTime.do",method = RequestMethod.POST)
    public String getRatioListByDateTime(@RequestParam("startDateTime") String startDate,@RequestParam("endDateTime") String endDate,@RequestParam("crew") String crew){
        if (startDate.isEmpty() || endDate.isEmpty() || crew.isEmpty()) {
            return null;
        }

        List<Map<String,Object>> res = qualityDataSummaryInf.getRatioListByDateTimeAndCrew(startDate,endDate,crew);


        return  JSON.toJSONString(res);
    }

    @ResponseBody
    @RequestMapping(value = "getPromessageByRaionModel.do",method = RequestMethod.POST)
    public String getPromessageByRaionModel(String startDate,String endDate,String crew, String rationId){

        List<Map<String,Object>> list =  qualityDataSummaryInf.getPromessageByRaionModel(startDate,endDate,crew,rationId);

        return JSON.toJSONString(list);
    }

    @RequestMapping("/getProSvgmessage.do")
    public String getProSvgmessage(String startDate,String endDate,String crew, String rationId,HttpServletRequest request){
        qualityDataSummaryInf.getProSvgmessage(startDate,endDate,crew,rationId,request);
        return "quality/qc_ds_message";
    }

    /********************************  数据汇总 end *****************************************/

    /********************************  级配管理 start *****************************************/
    @RequestMapping("/qc_grading_manager.do")
    public String toGradingManagerPage(HttpServletRequest request){
        return "quality/qc_grading_manager";
    }

    @ResponseBody
    @RequestMapping("/getGradingList.do")
    public String getGradingList(){
        String res = qualityGradingManagerInf.getGradingModelList();
        return res;
    }

    @ResponseBody
    @RequestMapping("/delectGrading.do")
    public String delectGrading(String idStr){

        String res = qualityGradingManagerInf.delectGrading(idStr);

        return res;
    }

    @ResponseBody
    @RequestMapping("/getGrading.do")
    public String getGrading(String id){
        String res = qualityGradingManagerInf.getGrading(id);
        return res;
    }

    /********************************  级配管理 end *****************************************/


    /********************************  实验管理 start *****************************************/

    /**
     *
     * 功能描述: <br>
     *  <实验首页跳转>
     * @param []
     * @return java.lang.String
     * @auther Melone
     * @date 2019/6/26 11:48
     */
    @RequestMapping("/experimental_management.do")
    public String experimentalManagement(){
        return "quality/qc_em_index";
    }

    /**
     *
     * 功能描述: <br>
     *  <跳转到取样单页面>
     * @param []
     * @return java.lang.String
     * @auther Melone
     * @date 2019/6/26 11:48
     */
    @RequestMapping("/getSampleManagementPage.do")
    public String getSampleManagementPage(){
        return "quality/qc_em_sample_management";
    }

    /**
     *
     * 功能描述: <br>
     *  <查询所有取样单>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/27 10:57
     */
    @ResponseBody
    @RequestMapping("/getAllSamplingPage.do")
    public String getAllSamplingPage(){
        String res = qualityExperimentalManagerInf.getAllSamplingPage();
        return res;
    }

    /**
     *
     * 功能描述: <br>
     *  <返回from表单下拉框字段>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/26 11:51
     */
    @ResponseBody
    @RequestMapping("/getSamplingPageFromData.do")
    public String getSamplingPageFromData(){
        String res = qualityExperimentalManagerInf.getSamplingPageFromData();
        return res;
    };

    /**
     *
     * 功能描述: <br>
     *  <新建取样单方法>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/27 10:02
     */
    @ResponseBody
    @RequestMapping(value = "/addSample.do",method = RequestMethod.POST)
    public String addSample(String materials,String manufacturers,String specification,String tunnage,String creat_time,String remark ){
       String res =  qualityExperimentalManagerInf.addSample(materials,manufacturers,specification,tunnage,creat_time,remark);
       return res;
    };

    /**
     *
     * 功能描述: <br>
     *  <根据ID删除取样单>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/26 17:38
     */
     @ResponseBody
     @RequestMapping(value = "/removeSampleById.do",method = RequestMethod.POST)
     public String removeSampleById(@RequestParam("id") String id){
         String res = qualityExperimentalManagerInf.removeSampleById(id);
         return res;
     }

     @ResponseBody
     @RequestMapping(value = "/confirmCompletedById.do",method = RequestMethod.POST)
     public String confirmCompletedById(@RequestParam("id") String id){
        String res = qualityExperimentalManagerInf.confirmCompletedById(id);
        return res;
     }


     //实验管理页面(委托单列表)

    @RequestMapping(value = "/getExperimentalManagement.do")
    public String getExperimentalManagement(){
         return "quality/qc_em_experimental_management";
    }

    @ResponseBody
    @RequestMapping(value = "/getAllexperimental.do")
    public String getAllexperimental(){
       String res =  qualityExperimentalManagerInf.getAllexperimental();
       return res;
    }

    @ResponseBody
    @RequestMapping(value = "/getExperimentalMessageById.do",method = RequestMethod.POST)
    public String getExperimentalMessageById(@RequestParam("id") String id){
         String res = qualityExperimentalManagerInf.getExperimentalMessageById(id);
         return res;
    }
    /**
     *
     * 功能描述: <br>
     *  <根据ID查询当前选择的已经选择的试验项目>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/3 10:45
     */
    @ResponseBody
    @RequestMapping(value = "/getExperimentalItemByOrderNum.do",method = RequestMethod.POST)
    public String getExperimentalItemByOrderNum(@RequestParam("orderNum") String orderNum){
        String res = qualityExperimentalManagerInf.getExperimentalItemByOrderNum(orderNum);
        return res;
    }
    @ResponseBody
    @RequestMapping(value ="/getExperimentalItemById.do",method = RequestMethod.POST)
    public String getExperimentalItemById(@RequestParam("id") String id){
        String res = qualityExperimentalManagerInf.getExperimentalItemById(id);
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/addExperimentalItemByOrderTicketNum.do",method = RequestMethod.POST)
    public String addExperimentalItemByOrderTicketNum(@RequestParam("orderTicketNum") String orderTicketNum,@RequestParam("experimentalItemId") String experimentalItemId){
         String res = qualityExperimentalManagerInf.addExperimentalItemByOrderTicketNum(orderTicketNum,experimentalItemId);
         return res;
    }
    @ResponseBody
    @RequestMapping(value = "/getExperimentalItemCount.do",method = RequestMethod.POST)
    public String getExperimentalItemCount(@RequestParam("orderTicketNum") String orderTicketNum){
        String res = qualityExperimentalManagerInf.getExperimentalItemCount(orderTicketNum);
        return res;
    }
    /********************************  实验管理 end *****************************************/

    /********************************  未完实验 Start *****************************************/

    @RequestMapping(value ="/getExperimentMessagePage.do")
    public String getExperimentMessagePage(){
        return "quality/qc_em_unfinished_experimental";
    }
    @ResponseBody
    @RequestMapping("/getAllExperimentalItem.do")
    public String getAllExperimentalItem(){
        String res = qualityExperimentalManagerInf.getAllExperimentalItem();
        return res;
    }


    @RequestMapping("/getExperimentalItemMsgPage.do")
    public String getExperimentalItemMsgPage(@RequestParam("id") String id,HttpServletRequest request){
        request.setAttribute("id",id);
        return "quality/qc_em_experimental_model";
    }

    @ResponseBody
    @RequestMapping("/getExperimentalItemMsgById.do")
    public String getExperimentalItemMsgById(@RequestParam("id") String id){
        String msg = qualityExperimentalManagerInf.getExperimentalItemMsgById(id);
        return msg;
    }

    @ResponseBody
    @RequestMapping("/getExperimentalItemListById.do")
    public String getExperimentalItemListById(@RequestParam("id") String id){
        String res = qualityExperimentalManagerInf.getExperimentalItemNumList(id);
        return res;
    }

    @ResponseBody
    @RequestMapping(value = "/sendFromData.do",method = RequestMethod.POST)
    public String sendFromData(@RequestParam("fromJson") String fromJson,@RequestParam("firstTest") String firstTest,@RequestParam("coarseTest") String coarseTest){
        String res = qualityExperimentalManagerInf.addExperimentalMsgAndItem(fromJson,firstTest,coarseTest);
        return res;
    }

    @RequestMapping("/getExperimentalMsgById.do")
    public String getExperimentalMsgById(@RequestParam("id") String id,HttpServletRequest request){
        request.setAttribute("id",id);
        return "quality/qc_em_experimental_message";
    }
    @ResponseBody
    @RequestMapping(value = "/getExperimentalProjectMessage.do",method = RequestMethod.POST)
    public String getExperimentalProjectMessage(@RequestParam("id") String  id){
        String res = qualityExperimentalManagerInf.getExperimentalProjectMessage(id);
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/showExperimentalProjectItem.do",method = RequestMethod.POST)
    public String showExperimentalProjectItem(@RequestParam("tableName") String tableName,@RequestParam("experiment_num") String experiment_num){
        String res = qualityExperimentalManagerInf.getExperimentalProjectItem(tableName,experiment_num);
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/removeExperimentalItemById.do",method = RequestMethod.POST)
    public String removeExperimentalItemById(@RequestParam("id") String id){
        String res = qualityExperimentalManagerInf.removeExperimentalItemById(id);
        return res;
    }
    /********************************  未完实验 end *****************************************/

}
