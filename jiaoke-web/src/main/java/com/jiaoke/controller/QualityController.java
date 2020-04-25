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
import com.alibaba.fastjson.JSONObject;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.QualityMatchingUtil;
import com.jiaoke.common.bean.PageBean;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.OaCollaborationService;
import com.jiaoke.oa.service.UserInfoService;
import com.jiaoke.quality.bean.QualityDataManagerDay;
import com.jiaoke.quality.bean.QualityProjectItem;
import com.jiaoke.quality.bean.QualityRatioModel;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.service.*;
import org.activiti.engine.HistoryService;
import org.activiti.engine.ManagementService;
import org.activiti.engine.TaskService;
import org.activiti.engine.impl.identity.Authentication;
import org.activiti.engine.task.Task;
import org.apache.logging.log4j.util.Strings;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
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
    @Autowired
    private QualityExperimentalManagerForeignInf QualityExperimentalManagerForeignInf;
    @Autowired
    private QualityProjectInf qualityprojectInf;
    @Resource
    private ActivitiUtil activitiUtil;
    @Resource
    private UserInfoService userInfoService;
    @Resource
    private OaCollaborationService oaCollaborationService;
    @Resource
    private ManagementService managementService;
    @Resource
    private HistoryService historyService;
    @Resource
    private TaskService taskService;

    /**
     * 获取当前登录用户信息
     *
     * @return userInfo
     */
    private UserInfo getCurrentUser() {
        return (UserInfo) SecurityUtils.getSubject().getPrincipal();
    }

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

        try{
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
        }catch (Exception e){
            e.printStackTrace();
        }


    }

    /**
     *
     * 功能描述: <br>
     *  <车盘接收程序>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/15 15:50
     */

    @RequestMapping(value = {"/getCarNum.do"} ,method = RequestMethod.POST)
    public void  getCarNum(HttpServletRequest request, HttpServletResponse response){

        try{
            InputStream in=request.getInputStream();
            int size=request.getContentLength();
            String charset=null;
            int readCount = 0; // 已经成功读取的字节的个数
            int nRead = 0;
            byte[] buf = new byte[size];

            while (readCount < size) {
                nRead = in.read(buf, readCount, size - readCount);
                if( nRead == -1) // 到末尾
                {
                    break;
                }
                readCount += nRead;
                //readCount += in.read(buf, readCount, size - readCount);
            }

            if ((charset == null || charset.length() == 0) && (size ==readCount))
            {
                qualityprojectInf.editProductionDataByCarNum(new String(buf,"UTF-8"));

                show_json(new String(buf));
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public static void show_json(String m_str)
    {
        //获取设备名称
        JSONObject Json = JSONObject.parseObject(m_str);
        String deviceName= Json.getJSONObject("AlarmInfoPlate").getString("result");
        System.out.println(deviceName);


//        //获取识别车牌号
//        String license= Json.getJSONObject("AlarmInfoPlate").getJSONObject("result").getJSONObject("PlateResult").getString("license");
//        System.out.println(license);


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

        String lastWeekCrewDataJson = "";
        try{
            lastWeekCrewDataJson =  qualityIndexInf.getLastWeekCrewData();
        }catch (Exception e){
            e.printStackTrace();
        }

        return lastWeekCrewDataJson;
    }

    /**********************************  质量监控首页 end ************************************************/

    /************************************  工程管理 start **********************************************/
    @RequestMapping("qc_project_manager.do")
    public String goProjectManager(){
        return "quality/qc_project_manager";
    }
    @ResponseBody
    @RequestMapping(value = "/addProjectItem.do",method = RequestMethod.POST)
    public String addProjectItem(QualityProjectItem fromData){
        Map<String,String> map = new HashMap<>();
        try{
            int res = qualityprojectInf.addProjectItem(fromData);
            if (res > 0){
                map.put("message","success");
            }else {
                map.put("message","fail");
            }
        }catch (Exception e){
            map.put("message","error");
        }
        return JSON.toJSONString(map);
    }

    @ResponseBody
    @RequestMapping("/getUserProjectList.do")
    public String getUserProjectList(){
        Map<String,Object> map = new HashMap<>();
        try{
            List<QualityProjectItem> list = qualityprojectInf.getUserProjectList();
            if (list.size() > 0){
                map.put("message","success");
                map.put("projectList",list);
            }else {
                map.put("message","empty");
            }
        }catch (Exception e){
            map.put("message","error");
        }
        return JSON.toJSONString(map);
    }
    @ResponseBody
    @RequestMapping("/getUserProjectById.do")
    public String getUserProjectById(String id){
        Map<String,Object> map = new HashMap<>();
        try{
            QualityProjectItem proMsg = qualityprojectInf.getUserProjectById(id);
            if (proMsg != null){
                map.put("message","success");
                map.put("proMsg",proMsg);
            }else {
                map.put("message","fail");
            }
        }catch (Exception e){
            map.put("message","error");
        }
        return JSON.toJSONString(map);
    }

    @ResponseBody
    @RequestMapping(value = "/delectUserProject.do",method = RequestMethod.POST)
    public String delectUserProject (String idStr){

        Map<String,Object> map = new HashMap<>();
        try{
            if (idStr.indexOf(",") >= 0){
                String[] idArr = idStr.split(",");
                int res = qualityprojectInf.delectUserProjectByIdArray(idArr);
                if (res > 0){
                    map.put("message","success");
                }else {
                    map.put("message","fail");
                }
            }else {
                int res = qualityprojectInf.delectUserProject(idStr);
                if (res > 0){
                    map.put("message","success");
                }else {
                    map.put("message","fail");
                }
            }
        }catch (Exception e){
            map.put("message","error");
        }
        return JSON.toJSONString(map);

    }

    @ResponseBody
    @RequestMapping(value = "/editProjectItem.do",method = RequestMethod.POST)
    public String editProjectItem(QualityProjectItem fromData){
        Map<String,Object> map = new HashMap<>();
        try{
            if (fromData != null){
                int res = qualityprojectInf.editProjectItem(fromData);
                if (res > 0){
                    map.put("message","success");
                }else {
                    map.put("message","fail");
                }
            }else {
                map.put("message","fail");
            }
        }catch (Exception e){
            map.put("message","error");
        }
        return JSON.toJSONString(map);
    }
    /************************************  工程管理 end **********************************************/

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

        try{
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
        }catch (Exception e){
            e.printStackTrace();
        }

        return "quality/qc_matching_model";
    }

    /**
     *
     * 功能描述: <br>
     *  <查询往年配比>
     * @param
     * @return
     * @auther Melone
     * @date 2020/3/19 22:01
     */
      @ResponseBody
      @RequestMapping("/getOldRation.do")
      public String getOldRation(){
          String str = qualityMatchingInf.getOldRation();
          return str;
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

        try{
            boolean bo =  qualityMatchingInf.insetRatioTemplate(qualityRatioTemplate);
        }catch (Exception e){
            e.printStackTrace();
        }

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
        String jsonMessage = "";
        try{
            jsonMessage =  qualityMatchingInf.delectRation(idStr);
        }catch (Exception e){
            e.printStackTrace();
        }
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
        String jsonMessage = "";
        try{
            jsonMessage =  qualityMatchingInf.selectRationById(idStr);
        }catch (Exception e){
            e.printStackTrace();
        }
        return jsonMessage;
    }

    @ResponseBody
    @RequestMapping("/getOldGrading.do")
    public String getOldGrading(){
        String str = qualityMatchingInf.getOldGrading();
        return str;
    }
    @ResponseBody
    @RequestMapping(value ={"/addGrading.do"} , method = RequestMethod.POST)
    public String addGrading(String jsonData,String crew1Id,String crew2Id,String gradingName,String upUser,String gradingRemaker){

        String jsonMessage = "";
        try{
            jsonMessage =  qualityMatchingInf.insetGrading(jsonData,crew1Id,crew2Id,gradingName,upUser,gradingRemaker);
        }catch (Exception e){
            e.printStackTrace();
        }
        return jsonMessage;
    }


    @RequestMapping(value ={"/EditRation.do"} , method = RequestMethod.POST)
    public String EditRation(QualityRatioTemplate qualityRatioTemplate){
        try{
            Boolean res =   qualityMatchingInf.EditRationById(qualityRatioTemplate);
        }catch (Exception e){
            e.printStackTrace();
        }

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
        String JsonData = "";
        try{
            JsonData = qualityDataMontoringInf.selectProductionData();
        }catch (Exception e){
            e.printStackTrace();
        }

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

        String jsonStr = "";
        try{
            jsonStr = qualityDataMontoringInf.getRealTimeDataEcharsTemp();
        }catch (Exception e){
            e.printStackTrace();
        }

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

        String jsonStr = "";
        try{
            jsonStr = qualityDataMontoringInf.getRealTimeDataEcharsMaterial();
        }catch (Exception e){
            e.printStackTrace();
        }

        return jsonStr;
    }

    @ResponseBody
    @RequestMapping("/getRealTimeThreeProductSVG.do")
    public String getRealTimeThreeProductSVG(){
        String res = "";
        try{
            res =  qualityDataMontoringInf.getRealTimeThreeProductSVG();
        }catch (Exception e){
            e.printStackTrace();
        }
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

        try{
            String temp = request.getParameter("currentPageNum");
            String url = QualityMatchingUtil.getUrl(request);

            PageBean<QualityDataManagerDay> pageBean = new PageBean<QualityDataManagerDay>();
            if ( temp == null || temp.trim().isEmpty() ){
                pageBean = qualityDataManagerInf.selectHistoryDataToDay(1,url);
            }else {
                pageBean = qualityDataManagerInf.selectHistoryDataToDay(Integer.parseInt(temp),url);
            }

            request.setAttribute("pageBean",pageBean);
        }catch (Exception e){
            e.printStackTrace();
        }


        return "quality/qc_data_manager";
    }

    @ResponseBody
    @RequestMapping(value = "/getMsgByUserAndDate.do",method = RequestMethod.POST)
    public String getMsgByUserAndDate(String userNum,String proDate){

        String str = "";
        try{
            str = qualityDataManagerInf.getMsgByUserAndDate(userNum,proDate);
        }catch (Exception e){
            e.printStackTrace();
        }
        return str;
    }
    @RequestMapping("/getProducttionByDate.do")
    public String getProducttionByDate(HttpServletRequest request,String producedDate,String crewNum){

        if (Strings.isBlank(producedDate) || Strings.isBlank(crewNum) ) {return null;}

        try{
            Map<String,Object> map = qualityDataManagerInf.selectProducttionByDate(producedDate,crewNum, request);
        }catch (Exception e){
            e.printStackTrace();
        }

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
    public String getProductMessage(HttpServletRequest request,@RequestParam("id") String id,@RequestParam("crewNum") String crewNum,@RequestParam("proDate") String proDate){

        if (id.isEmpty()) return "";

        try{
            Map<String,Object> map =  qualityDataManagerInf.selectProductMessageById(id,crewNum,proDate);

            request.setAttribute("product",map);
        }catch (Exception e){
            e.printStackTrace();
        }


        return "quality/qc_dm_data_detail";
    }
    @RequestMapping("getProListByRatioNumAndDate.do")
    public String getProListByRatioNumAndDate(HttpServletRequest request,@RequestParam("ratioNum") String ratioNum,@RequestParam("crewNum") String crewNum,@RequestParam("date") String date){

        if (ratioNum.isEmpty() || crewNum.isEmpty() || date.isEmpty()) {return null;}


        try{
            Map<String,Object> prolist = qualityDataManagerInf.selectProListByRatioNumAndDate(ratioNum,crewNum,date);


            request.setAttribute("baseMap",prolist);
        }catch (Exception e){
            e.printStackTrace();
        }


        return "quality/qc_data_message";
    }

    @RequestMapping(value = "showTwentyProductSVG.do")
    public String getTwentyProductSVG( ){
        return "quality/qc_dm_data_message_svg";
    }

    @ResponseBody
    @RequestMapping(value = "getProSVGRationAndModelRation.do",method = RequestMethod.POST)
    public String getProSVGRationAndModelRation(String ProductSVG){
        String res = "";
        try{
            res = qualityDataManagerInf.getProSVGRationAndModelRation(ProductSVG);
        }catch (Exception e){
            e.printStackTrace();
        }

       return res;
    }

    @ResponseBody
    @RequestMapping(value ="/getProductSvgGrading.do",method = RequestMethod.POST)
    public String getProductSvgGrading(String ProductSVG){

        String res = "";
        try{
             res = qualityDataManagerInf.getProductSvgGrading(ProductSVG);
        }catch (Exception e){
            e.printStackTrace();
        }
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
        String listStr = "";
        try{
            listStr = qualityRealTimeWarningInf.selectLastWarningData();
        }catch (Exception e){
            e.printStackTrace();
        }

        return listStr;
    }

    @ResponseBody
    @RequestMapping(value = "/getWarningEcharsData.do",method = RequestMethod.POST)
    public String getWarningEcharsData(){

        String jsonStr = "";
        try{
            jsonStr = qualityRealTimeWarningInf.getWarningEcharsData();
        }catch (Exception e){
            e.printStackTrace();
        }
        return jsonStr;
    }


    @ResponseBody
    @RequestMapping("/getGlobalWarningData.do")
    public String getGlobalWarningData(){

        String res = "";
        try{
            res = qualityRealTimeWarningInf.getGlobalWarningData();
        }catch (Exception e){
            e.printStackTrace();
        }
        return res;
    }

    @RequestMapping("/getWarningPage.do")
    public String getWarningPage(){
        return "quality/qc_warning_page";
    }

    @ResponseBody
    @RequestMapping("/getWarningLevelData.do")
    public String getWarningLevelData(){
        Map<String,Object> res = qualityRealTimeWarningInf.getWarningLevelData();
        return JSON.toJSONString(res);
    }
    @ResponseBody
    @RequestMapping(value = "/editWarningLevel.do",method = RequestMethod.POST)
    public String editWarningLevel(@RequestParam("fromData") String fromData){
        Map<String,Object> res = qualityRealTimeWarningInf.editWarningLevel(fromData);
        return JSON.toJSONString(res);
    }
    /********************************  质量预警 end *****************************************/


    /********************************  辅助分析 Start *****************************************/

    @RequestMapping("/qc_auxiliary_analysis.do")
    public String auxiliaryAnalysis(HttpServletRequest request){

        try{
            String temp = request.getParameter("currentPageNum");
            String warningLive = request.getParameter("warningLive");
            String proData = request.getParameter("proData");
            String crew = request.getParameter("crew");
            String rationId = request.getParameter("rationId");
            String url = QualityMatchingUtil.getUrl(request);

            if ("" == warningLive || warningLive == null)  warningLive = "0";

            PageBean<Map<String,String>> pageBean = new PageBean<Map<String,String>>();
            if ( temp == null || temp.trim().isEmpty() ){
                if (proData != null){
                    pageBean = qualityAuxiliaryAnalysisInf.selelectWarningLiveData(1,url,warningLive,proData,crew, rationId );
                }
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
        }catch (Exception e){
            e.printStackTrace();
        }


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


        try{
            qualityAuxiliaryAnalysisInf.getPageByProductIdAndProdate(producedId,prodate,discNum,crew,request);
        }catch (Exception e){
            e.printStackTrace();
        }

         return "quality/qc_auxiliary_message";
    }

    @ResponseBody
    @RequestMapping("/getProductMessageById.do")
    public String getProductMessageById(@RequestParam("id") String id,@RequestParam("crewNum") String crewNum){
        String result = "";

        try{
            result = qualityAuxiliaryAnalysisInf.getRealTimeDataEcharsMaterial(id,crewNum);
        }catch (Exception e){
            e.printStackTrace();
        }
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

        String res = "";

        try{
            res = qualityStatementInf.selectLastMonthStatementToEchars();
        }catch (Exception e){
            e.printStackTrace();
        }


       return res;
    }

    @ResponseBody
    @RequestMapping("/getMonthStatementToData.do")
    public String getMonthStatementToData(){

        String res = "";

        try{
            res = qualityStatementInf.selectMonthStatementToData();
        }catch (Exception e){
            e.printStackTrace();
        }


        return res;
    }
    //获取上一年生产信息，及当前年份集合
    @ResponseBody
    @RequestMapping("/getYearStatementDateAndDate.do")
    public String getYearStatementDateAndDate(){
        String res = "";

        try{
            res = qualityStatementInf.selectYearStatementDateAndDate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return res;
    }
    //返回各个月份集合
    @ResponseBody
    @RequestMapping("/getMonthDateList.do")
    public String getMonthDateList(){
        String res = "";

        try{
            res = qualityStatementInf.selectMonthDateList();
        }catch (Exception e){
            e.printStackTrace();
        }
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
        List<Map<String,String>> list = new ArrayList<>();
        try{
            list = qualityTimelyDataFalseService.getTimeSurveillanceFalseData();
        }catch (Exception e){
            e.printStackTrace();
        }
        return JsonHelper.toJSONString(list);
    }

    @RequestMapping("/getFalseDataToChars.do")
    @ResponseBody
    public String getFalseDataToChars(){
        String resoure ="";
        try{
            resoure = qualityTimelyDataFalseService.selectFalseDataToChars();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return  resoure;
    }

    @RequestMapping("/getFalseDataEcharsTemp.do")
    @ResponseBody
    public String getFalseDataEcharsTemp(){
        String resoure ="";
        try{
            resoure = qualityTimelyDataFalseService.selectFalseDataEcharsTemp();
        }catch (Exception e) {
            e.printStackTrace();
        }
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
        try{
            String temp = request.getParameter("currentPageNum");
            String url = QualityMatchingUtil.getUrl(request);

            PageBean<QualityDataManagerDay> pageBean = new PageBean<>();
            if ( temp == null || temp.trim().isEmpty() ){
                pageBean = qualityHistoricalDataService.selectHistoryDataToDay(1,url);
            }else {
                pageBean = qualityHistoricalDataService.selectHistoryDataToDay(Integer.parseInt(temp),url);
            }

            request.setAttribute("pageBean",pageBean);
        }catch (Exception e) {
            e.printStackTrace();
        }

        return "quality/qc_historical_data";
    }


    @RequestMapping(value = "/getFalseDataByDate.do")
    public String getFalseDataByDate( HttpServletRequest request,String producedDate,String crewNum ){

        List<Map<String,String>> list;
        try{
            list = qualityHistoricalDataService.selectHistoryByDateAndcrewNum(producedDate,crewNum);
            request.setAttribute("prolist",list);
        }catch (Exception e) {
            e.printStackTrace();
        }

        return "quality/qc_false_data_list";
    }


    /********************************  历史数据（假） end *****************************************/

    /********************************  动态管理 start *****************************************/

    @RequestMapping("/qc_dynamic_management.do")
    public String getLastDayAsphaltRationToChars (HttpServletRequest request){
        try{
            qualityDynamicInf.getLastDayToChars(request);
        }catch (Exception e) {
            e.printStackTrace();
        }

        return "quality/qc_dynamic_management";
    }


    @RequestMapping(value = "/getEcharsDataByMaterialAndDate.do")
    public String dayToChars(String date,String material,String ratioNum ,String crew,HttpServletRequest request){

        try{
            qualityDynamicInf.getEcharsDataByMaterialAndDate(date,material,ratioNum,crew,request);
        }catch (Exception e) {
            e.printStackTrace();
        }

        return "quality/qc_dynamic_management";
    }

    @ResponseBody
    @RequestMapping(value = "/getRatioListByDate.do" , method = RequestMethod.POST)
    public  String getRatioListByDate(String proData,String crew){
        String res = "";
        try{
            res =  qualityDynamicInf.getRatioListByDate(proData,crew);
        }catch (Exception e) {
            e.printStackTrace();
        }
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
        String res = "";
        try{
            res = qualityDataSummaryInf.getThreeDayData();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @ResponseBody
    @RequestMapping(value = "/getRatioListByDateTime.do",method = RequestMethod.POST)
    public String getRatioListByDateTime(@RequestParam("startDateTime") String startDate,@RequestParam("endDateTime") String endDate,@RequestParam("crew") String crew){
        if (startDate.isEmpty() || endDate.isEmpty() || crew.isEmpty()) {
            return null;
        }

        Map<String,Object> map = new HashMap<>();
        try{
            map = qualityDataSummaryInf.getRatioListByDateTimeAndCrew(startDate,endDate,crew);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return  JSON.toJSONString(map);
    }

    @ResponseBody
    @RequestMapping(value = "/getProjectNameByDate.do",method = RequestMethod.POST)
    public String getProjectNameByDate(@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate){
        Map<String,Object> res = new HashMap<>();
        try {
            res =  qualityDataSummaryInf.getProjectNameByDate(startDate,endDate);
        }catch (Exception e){
            res.put("success","error");
            e.printStackTrace();
        }
        return JSON.toJSONString(res);
    }


    @ResponseBody
    @RequestMapping(value = "/getPromessageByRaionModel.do",method = RequestMethod.POST)
    public String getPromessageByRaionModel(String startDate,String endDate,String crew, String rationId,String projectName){

        List<Map<String,Object>> list = new ArrayList<>();
        try{
            list =  qualityDataSummaryInf.getPromessageByRaionModel(startDate,endDate,crew,rationId,projectName);
        }catch (Exception e) {
            e.printStackTrace();
        }

        return JSON.toJSONString(list);
    }

    @RequestMapping(value = "/getProjectByDateTimeAndCrewAndRation.do",method = RequestMethod.POST)
    public String getProjectByDateTimeAndCrewAndRation(String startDate,String endDate,String crew, String rationId){
        Map<String,Object> map = new HashMap<>();
        try{
            map =  qualityDataSummaryInf.getProjectByDateTimeAndCrewAndRation(startDate,endDate,crew,rationId);
        }catch (Exception e) {
            e.printStackTrace();
        }

        return JSON.toJSONString(map);
    }

    @RequestMapping("/getProSvgmessage.do")
    public String getProSvgmessage(String startDate,String endDate,String crew, String rationId,HttpServletRequest request){
        try{
            qualityDataSummaryInf.getProSvgmessage(startDate,endDate,crew,rationId,request);
        }catch (Exception e) {
            e.printStackTrace();
        }
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
        String res = "";
        try{
            res = qualityGradingManagerInf.getGradingModelList();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @ResponseBody
    @RequestMapping("/delectGrading.do")
    public String delectGrading(String idStr){

        String res = "";
        try{
            res = qualityGradingManagerInf.delectGrading(idStr);
        }catch (Exception e) {
            e.printStackTrace();
        }

        return res;
    }

    @ResponseBody
    @RequestMapping("/getGrading.do")
    public String getGrading(String id){
        String res = "";
        try{
            res = qualityGradingManagerInf.getGrading(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
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

        String res = "";
        try{
            res = qualityExperimentalManagerInf.getAllSamplingPage();
        }catch (Exception e) {
            e.printStackTrace();
        }

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
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getSamplingPageFromData();
        }catch (Exception e) {
            e.printStackTrace();
        }
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
        String res = "";
        try{
            res =  qualityExperimentalManagerInf.addSample(materials,manufacturers,specification,tunnage,creat_time,remark);
        }catch (Exception e) {
            e.printStackTrace();
        }
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
     @Transactional(rollbackFor=Exception.class)
     public String removeSampleById(@RequestParam("id") String id){
         String res = "";
         try{
             res = qualityExperimentalManagerInf.removeSampleById(id);
         }catch (Exception e) {
             e.printStackTrace();
         }
         return res;
     }

     @ResponseBody
     @RequestMapping(value = "/confirmCompletedById.do",method = RequestMethod.POST)
     public String confirmCompletedById(@RequestParam("id") String id){

         String res = "";
         try{
             res = qualityExperimentalManagerInf.confirmCompletedById(id);
         }catch (Exception e) {
             e.printStackTrace();
         }
        return res;
     }

     @ResponseBody
     @RequestMapping(value = "/getSampleStatusById.do",method = RequestMethod.POST)
     @Transactional(rollbackFor=Exception.class)
     public String getSampleStatusById(@RequestParam("id") String id){
         String res = "";
         try{
             res = qualityExperimentalManagerInf.getSampleStatusById(id);
         }catch (Exception e) {
             System.out.println(e.fillInStackTrace());
         }
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
        String res = "";
        try{
            res =  qualityExperimentalManagerInf.getAllexperimental();
        }catch (Exception e) {
            e.printStackTrace();
        }
       return res;
    }

    @ResponseBody
    @RequestMapping(value = "/getExperimentalMessageById.do",method = RequestMethod.POST)
    public String getExperimentalMessageById(@RequestParam("id") String id){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getExperimentalMessageById(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
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
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getExperimentalItemByOrderNum(orderNum);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value ="/getExperimentalItemById.do",method = RequestMethod.POST)
    public String getExperimentalItemById(@RequestParam("id") String id){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getExperimentalItemById(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/addExperimentalItemByOrderTicketNum.do",method = RequestMethod.POST)
    @Transactional(rollbackFor=Exception.class)
    public String addExperimentalItemByOrderTicketNum(@RequestParam("orderTicketNum") String orderTicketNum,@RequestParam("experimentalItemId") String experimentalItemId){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.addExperimentalItemByOrderTicketNum(orderTicketNum,experimentalItemId);
        }catch (Exception e) {
            e.printStackTrace();
        }
         return res;
    }
    @ResponseBody
    @RequestMapping(value = "/getExperimentalItemCount.do",method = RequestMethod.POST)
    public String getExperimentalItemCount(@RequestParam("orderTicketNum") String orderTicketNum){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getExperimentalItemCount(orderTicketNum);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @ResponseBody
    @RequestMapping("/getMaterialsAndManufacturersMsg.do")
    public String getMaterialsAndManufacturersMsg (){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getMaterialsAndManufacturersMsg();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @ResponseBody
    @RequestMapping(value = "/addMaterialsAndManufacturers.do",method = RequestMethod.POST)
    @Transactional(rollbackFor=Exception.class)
    public String addMaterialsAndManufacturers(@RequestParam("fromData") String fromData){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.addMaterialsAndManufacturers(fromData);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping("/getMaterialsMatchupManufacturers.do")
    public String getMaterialsMatchupManufacturers(){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getMaterialsMatchupManufacturers();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/deleteMaterialAndManufacturersById.do",method = RequestMethod.POST)
    public String deleteMaterialAndManufacturersById(@RequestParam("id") String id){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.deleteMaterialAndManufacturersById(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @ResponseBody
    @RequestMapping(value = "/getManufacturersByMaterials.do",method = RequestMethod.POST)
    public String getManufacturersByMaterials(@RequestParam("id") String id){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getManufacturersByMaterials(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
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
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getAllExperimentalItem();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }


    @RequestMapping("/getExperimentalItemMsgPage.do")
    public String getExperimentalItemMsgPage(@RequestParam("id") String id,HttpServletRequest request){

        try{
            request.setAttribute("id",id);
            request.setAttribute("nickname",getCurrentUser().getNickname());
        }catch (Exception e) {
            System.out.println(e.fillInStackTrace());
        }

        return "quality/qc_em_experimental_model";
    }

    @ResponseBody
    @RequestMapping("/getExperimentalItemMsgById.do")
    public String getExperimentalItemMsgById(@RequestParam("id") String id){
        String msg = "";
        try{
            msg = qualityExperimentalManagerInf.getExperimentalItemMsgById(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }

    @ResponseBody
    @RequestMapping("/getExperimentalItemListById.do")
    public String getExperimentalItemListById(@RequestParam("id") String id){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getExperimentalItemNumList(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    /**
     * 发送实验报告并开启审批流程
     *
     * @param fromJson fromJson
     * @param firstTest firstTest
     * @param coarseTest coarseTest
     * @return res
     */

    @ResponseBody
    @RequestMapping(value = "/sendFromData.do",method = RequestMethod.POST)
    @Transactional(rollbackFor=Exception.class)
    public String sendFromData(@RequestParam("fromJson") String fromJson,
                                   @RequestParam("firstTest") String firstTest,
                                       @RequestParam("coarseTest") String coarseTest,
                               HttpServletRequest request){



        return qualityExperimentalManagerInf.addExperimentalMsgAndItem(fromJson,firstTest,coarseTest);
    }

    /********************************  实验审批 Start *****************************************/
    /**
     * 详情页面
     * @param id 主键
     * @param taskId 任务id
     * @param model model
     * @return jsp
     */
    @RequestMapping(value = "/detailsExperimentalItems.do")
    public String experimentalItemsDetails(String id,String taskId,Model model){

        try{
            if ("undefined".equals(taskId) || "".equals(taskId)){
                //根据业务键查询流程实例Id
                taskId = historyService.createHistoricProcessInstanceQuery().processInstanceBusinessKey("quality_test_lab_report:" + id).singleResult().getId();
            }

            //获取批注信息
            List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);

            model.addAttribute("id",id);
            model.addAttribute("commentsList",commentsList);
            model.addAttribute("commentsSize",commentsList.size());
        }catch (Exception e) {
            e.printStackTrace();
        }

        return "quality/qc_em_experimental_message";
    }

    /**
     * 跳转审批页面
     * @param id 主键
     * @param taskId 任务id
     * @param model model
     * @return jsp
     */
    @RequestMapping(value = "/approvalExperimentalItems.do")
    public String experimentalItemsApproval(String id, String taskId, Model model){

        try{
            //获取批注信息
            List<Comments> commentsList = activitiUtil.selectHistoryComment(activitiUtil.getTaskByTaskId(taskId).getProcessInstanceId());

            model.addAttribute("nickname",getCurrentUser().getNickname());
            model.addAttribute("id",id);
            model.addAttribute("taskId",taskId);
            model.addAttribute("commentsList",commentsList);
            model.addAttribute("commentsSize",commentsList.size());
        }catch (Exception e) {
            e.printStackTrace();
        }

        return "quality/qc_em_experimental_approval";
    }

    /**
     * 审批操作
     * @param processingOpinion 处理意见
     * @param taskId  任务Id
     * @param flag 1,同意 2,不同意
     * @param chargePerson  负责的人
     * @param checkPerson 审核的人
     * @param id 主键
     * @return s/e
     */
    @RequestMapping(value = "/experimentApprovalSubmit")
    @ResponseBody
    public String experimentApprovalSubmit(String processingOpinion, String taskId,Integer flag,String chargePerson,String checkPerson,String id) {

        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //审核人处理结果
        String experimentReviewerDecide = "eg0";
        //负责人处理结果
        String experimentPrincipalDecide = "eg1";
        //知会组
        String notifyGroup = "notifyGroup";

        if (processingOpinion == null){
            processingOpinion = " ";
        }

        if (chargePerson != null | checkPerson != null){
            //更新审批人签字
            qualityExperimentalManagerInf.updateExperimentalItemApproval(id,chargePerson,checkPerson);
        }

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        }

        //同意
        if (flag == 1) {
            //下个节点
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //下个节点是否为end直接结束
            if (end.equals(nextNode)) {
                //更新实验项目状态
                qualityExperimentalManagerInf.updateExperimentalItemStateById(id,3);
                //插入批注
                Authentication.setAuthenticatedUserId(getCurrentUser().getNickname());
                taskService.addComment(taskId, task.getProcessInstanceId(), processingOpinion);
                activitiUtil.endProcess(taskId);
                return "success";

                //材料部审批后的知会
            } else if(notifyGroup.equals(nextNode)){
                Map<String, Object> map = new HashMap<>(16);
                ArrayList<String> list = new ArrayList<>();
                //当前执行人批注
                Authentication.setAuthenticatedUserId(getCurrentUser().getNickname());
                taskService.addComment(taskId, task.getProcessInstanceId(), processingOpinion);
                //查询知会人（多个）
                List<UserInfo> userInfoList = userInfoService.selectMultipleByPermission(notifyGroup);
                for (UserInfo userInfo : userInfoList) {
                    list.add(userInfo.getId().toString());
                }
                map.put("userList", list);
                taskService.complete(taskId, map);
                return "success";

                //审核人通过
            } else if(experimentReviewerDecide.equals(nextNode)){
                Map<String, Object> map = new HashMap<>(16);
                UserInfo userInfo = userInfoService.getUserInfoByPermission("experimentPrincipal");
                Authentication.setAuthenticatedUserId(getCurrentUser().getNickname());
                taskService.addComment(taskId, task.getProcessInstanceId(), processingOpinion);
                map.put("decide", 0);
                map.put("experimentPrincipal",  userInfo.getId());
                taskService.complete(taskId, map);
                return "success";

                //负责人通过
            }else if (experimentPrincipalDecide.equals(nextNode)) {
                Map<String, Object> map = new HashMap<>(16);
                map.put("decide", 0);
                map.put(promoter, activitiUtil.getStartUserId(task.getProcessInstanceId()));
                activitiUtil.completeAndAppointNextNode(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), map);
                return "success";
            }else {
                return "error";
            }

            //发送材料部
        } else if (flag == 3){
            Map<String, Object> map = new HashMap<>(16);
            UserInfo userInfo = userInfoService.getUserInfoByPermission("materialPrincipal");
            Authentication.setAuthenticatedUserId(getCurrentUser().getNickname());
            taskService.addComment(taskId, task.getProcessInstanceId(), processingOpinion);
            map.put("decide", 1);
            map.put("materialPrincipal",  userInfo.getId());
            taskService.complete(taskId, map);
            return "success";

            //回退
        } else {
            //插入批注
            Authentication.setAuthenticatedUserId(getCurrentUser().getNickname());
            taskService.addComment(taskId, task.getProcessInstanceId(), processingOpinion);
            //驳回
            managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
            //修改协同表单表单状态
            oaCollaborationService.updateState(id,3);
            //更新实验项目状态
            qualityExperimentalManagerInf.updateExperimentalItemStateById(id,2);
            return "success";
        }
    }

    /**
     * 删除
     *
     * @param id                id
     * @param processInstanceId processInstanceId
     * @return jsp
     */
    @RequestMapping(value = "/deleteExperimentalItems.do")
    @ResponseBody
    public String delete(String id, String processInstanceId) {

        //删除流程
        if (activitiUtil.deleteByProcessInstanceId(processInstanceId) == 1) {
            //执行删除数据
            qualityExperimentalManagerInf.deleteExperimentalItemById(id);
            return "success";
        } else {
            return "error";
        }
    }

    /**
     * 撤销流程
     *
     * @param id                id
     * @param processInstanceId processInstanceId
     * @return jsp
     */
    @RequestMapping(value = "/rescindExperimentalItems.do")
    @ResponseBody
    public String rescind(String id, String processInstanceId) {
        int rescind = activitiUtil.rescindByProcessInstanceId(processInstanceId);
        if (rescind < 0) {
            //流程结束无法撤销
            return "end";
        } else if (rescind > 0) {
            //撤销成功后更新state为2
            oaCollaborationService.updateState(id, 2);
            return "success";
        } else {
            //错误
            return "error";
        }
    }
    /********************************  实验审批 end *****************************************/

    @RequestMapping("/getExperimentalMsgById.do")
    public String getExperimentalMsgById(@RequestParam("id") String id,Model model){
        try{
            //根据业务键查询流程实例Id
            String processInstanceId = historyService.createHistoricProcessInstanceQuery().processInstanceBusinessKey("quality_test_lab_report:" + id).singleResult().getId();
            //获取批注信息
            List<Comments> commentsList = activitiUtil.selectHistoryComment(processInstanceId);

            model.addAttribute("id",id);
            model.addAttribute("commentsList",commentsList);
            model.addAttribute("commentsSize",commentsList.size());
        }catch (Exception e) {
            e.printStackTrace();
        }

        return "quality/qc_em_experimental_message";
    }
    @ResponseBody
    @RequestMapping(value = "/getExperimentalProjectMessage.do",method = RequestMethod.POST)
    public String getExperimentalProjectMessage(@RequestParam("id") String  id){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getExperimentalProjectMessage(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/showExperimentalProjectItem.do",method = RequestMethod.POST)
    public String showExperimentalProjectItem(@RequestParam("tableName") String tableName,@RequestParam("experiment_num") String experiment_num){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getExperimentalProjectItem(tableName,experiment_num);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/removeExperimentalItemById.do",method = RequestMethod.POST)
    public String removeExperimentalItemById(@RequestParam("id") String id){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.removeExperimentalItemById(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    /********************************  未完实验 end *****************************************/

    /********************************  台账相关 end *****************************************/

    /**
     *
     * 功能描述: <br>
     *  <台账首页跳转>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/17 17:25
     */
    @RequestMapping("/getStandingBookPage.do")
    public String standing_book(){
        return "quality/qc_em_standing_book";
    }

    /**
     *
     * 功能描述: <br>
     *  <原材料台账首页>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/24 11:00
     */
    @ResponseBody
    @RequestMapping("/getSevenDayRawMaterialStandingBook.do")
    public String getSevenDayRawMaterialStandingBook(){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getSevenDayRawMaterialStandingBook();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    /**
     *
     * 功能描述: <br>
     *  <粗集料台账>
     * @param
     * @return
     * @auther Melone
     * @date 2019/12/10 14:29
     */
    @ResponseBody
    @RequestMapping("/getSevenDayCoarseStandingBook.do")
    public String getSevenDayCoarseStandingBook(){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getSevenDayCoarseStandingBook();
        }catch (Exception e){
            e.printStackTrace();
        }
        return res;
    }

    /**
     *
     * 功能描述: <br>
     *  <查询细集料台账>
     * @param
     * @return
     * @auther Melone
     * @date 2019/12/16 13:26
     */
    @ResponseBody
    @RequestMapping("/getSevenDayFineStandingBook.do")
    public String getSevenDayFineStandingBook(){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getSevenDayFineStandingBook();
        }catch (Exception e){
            e.printStackTrace();
        }
        return res;
    }

    /**
     *
     * 功能描述: <br>
     *  <查询七日内矿粉信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/12/16 15:23
     */
    @ResponseBody
    @RequestMapping("/getSevenDayBreezeStandingBook.do")
    public String getSevenDayBreezeStandingBook(){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getSevenDayBreezeStandingBook();
        }catch (Exception e){
            e.printStackTrace();
        }
        return res;
    }

    @ResponseBody
    @RequestMapping("/getSevenDayAsphaltStandingBook.do")
    public String getSevenDayAsphaltStandingBook(){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getSevenDayAsphaltStandingBook();
        }catch (Exception e){
            e.printStackTrace();
        }
        return res;
    }
    /**
     *
     * 功能描述: <br>
     *  <根据日期查询原材相关信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/25 11:40
     */
    @ResponseBody
    @RequestMapping(value = "/getRawMaterialStandingBookByDate.do",method = RequestMethod.POST)
    public String getRawMaterialStandingBookByDate(@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getRawMaterialStandingBookByDate(startDate,endDate);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    };

    /**
     *
     * 功能描述: <br>
     *  <根据日期、规格、厂家、材料查询台账信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/12/19 16:38
     */
    @ResponseBody
    @RequestMapping(value = "/searchStandingBook.do",method = RequestMethod.POST)
    public String searchStandingBook(@RequestParam("fromData") String fromData){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.searchStandingBook(fromData);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    /**
     *
     * 功能描述: <br>
     *  <返回沥青原材七日内试验数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/25 13:16
     */

    @ResponseBody
    @RequestMapping(value = "/getAsphaltStandingBook.do")
    public String getAsphaltStandingBook(){
        String res = "";
        try{
            res =  qualityExperimentalManagerInf.getAsphaltStandingBook();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/getAsphaltStandingBookByDate.do",method = RequestMethod.POST)
    public String getAsphaltStandingBookByDate(@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getAsphaltStandingBookByDate(startDate,endDate);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @ResponseBody
    @RequestMapping(value = "/getTestStandingBook.do")
    public String getTestStandingBook(){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getTestStandingBook();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @ResponseBody
    @RequestMapping(value = "/getTestStandingBookByDate.do",method = RequestMethod.POST)
    public String getTestStandingBookByDate(@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getTestStandingBookByDate(startDate,endDate);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    /********************************  台账相关 end *****************************************/


    /********************************  设置相关 Start *****************************************/
    @RequestMapping("/getExperimentSetting.do")
    public String getPerimentSetting(){
        return "quality/qc_em_experimental_setting";
    }
    @ResponseBody
    @RequestMapping("/getSpecificationDataAndManufacturersData.do")
    public String getSpecificationDataAndManufacturersData(){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getSpecificationDataAndManufacturersData();
        }catch (Exception e) {
            e.printStackTrace();
        }

        return res;
    }
    @ResponseBody
    @RequestMapping("/deleteSpecificationOrManufacturersById.do")
    public String deleteSpecificationOrManufacturersById(@RequestParam("id") String id,@RequestParam("make") String make){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.deleteSpecificationOrManufacturersById(id,make);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/sendSpecificationFrom.do",method = RequestMethod.POST)
    public String sendSpecificationFrom(@RequestParam("specificationName") String specificationName){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.insertSpecificationFrom(specificationName);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/sendManufacturersFrom.do",method = RequestMethod.POST)
    public String sendManufacturersFrom(@RequestParam("manufacturersName") String manufacturersName){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.insertManufacturersFrom(manufacturersName);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/getSpecificationOrManufacturersById.do",method = RequestMethod.POST)
    public String getSpecificationOrManufacturersById(@RequestParam("id") String id,@RequestParam("make") String make){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getSpecificationOrManufacturersById(id,make);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/updateSpecificationOrManufacturersById.do",method = RequestMethod.POST)
    public String updateSpecificationOrManufacturersById(@RequestParam("id") String id,@RequestParam("make") String make,@RequestParam("updateName") String updateName){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.updateSpecificationOrManufacturersById(id,make,updateName);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
     /********************************  设置相关 end *****************************************/


    /********************************  实验管理(对外) start *****************************************/



    /**
     *
     * 功能描述: <br>
     *  <跳转到取样单页面>
     * @param []
     * @return java.lang.String
     * @auther Melone
     * @date 2019/6/26 11:48
     */
    @RequestMapping("/getSampleManagementPageForeign.do")
    public String getSampleManagementPageForeign(){
        return "quality/qc_em_sample_management_foreign";
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
    @RequestMapping("/getAllSamplingPageForeign.do")
    public String getAllSamplingPageForeign(){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getAllSamplingPage();
        }catch (Exception e) {
            e.printStackTrace();
        }
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
    @RequestMapping("/getSamplingPageFromDataForeign.do")
    public String getSamplingPageFromDataForeign(){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getSamplingPageFromData();
        }catch (Exception e) {
            e.printStackTrace();
        }
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
    @RequestMapping(value = "/addSampleForeign.do",method = RequestMethod.POST)
    public String addSampleForeign(String materials,String manufacturers,String specification,String tunnage,String creat_time,String remark ){
        String res = "";
        try{
            res =  QualityExperimentalManagerForeignInf.addSample(materials,manufacturers,specification,tunnage,creat_time,remark);
        }catch (Exception e) {
            e.printStackTrace();
        }
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
    @RequestMapping(value = "/removeSampleByIdForeign.do",method = RequestMethod.POST)
    public String removeSampleByIdForeign(@RequestParam("id") String id){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.removeSampleById(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @ResponseBody
    @RequestMapping(value = "/confirmCompletedByIdForeign.do",method = RequestMethod.POST)
    public String confirmCompletedByIdForeign(@RequestParam("id") String id){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.confirmCompletedById(id);
        }catch (Exception e) {
            e.printStackTrace();
        }

        return res;
    }

    @ResponseBody
    @RequestMapping(value = "/getSampleStatusByIdForeign.do",method = RequestMethod.POST)
    public String getSampleStatusByIdForeign(@RequestParam("id") String id){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getSampleStatusById(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    //实验管理页面(委托单列表)

    @RequestMapping(value = "/getExperimentalManagementForeign.do")
    public String getExperimentalManagementForeign(){
        return "quality/qc_em_experimental_management_foreign";
    }

    @ResponseBody
    @RequestMapping(value = "/getAllexperimentalForeign.do")
    public String getAllexperimentalForeign(){
        String res = "";
        try{
            res =  QualityExperimentalManagerForeignInf.getAllexperimental();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @ResponseBody
    @RequestMapping(value = "/getExperimentalMessageByIdForeign.do",method = RequestMethod.POST)
    public String getExperimentalMessageByIdForeign(@RequestParam("id") String id){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getExperimentalMessageById(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
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
    @RequestMapping(value = "/getExperimentalItemByOrderNumForeign.do",method = RequestMethod.POST)
    public String getExperimentalItemByOrderNumForeign(@RequestParam("orderNum") String orderNum){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getExperimentalItemByOrderNum(orderNum);
        }catch (Exception e) {
            e.printStackTrace();
        }

        return res;
    }
    @ResponseBody
    @RequestMapping(value ="/getExperimentalItemByIdForeign.do",method = RequestMethod.POST)
    public String getExperimentalItemByIdForeign(@RequestParam("id") String id){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getExperimentalItemById(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/addExperimentalItemByOrderTicketNumForeign.do",method = RequestMethod.POST)
    public String addExperimentalItemByOrderTicketNumForeign(@RequestParam("orderTicketNum") String orderTicketNum,@RequestParam("experimentalItemId") String experimentalItemId){
        String res = "";
        try{
          res = QualityExperimentalManagerForeignInf.addExperimentalItemByOrderTicketNum(orderTicketNum,experimentalItemId);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/getExperimentalItemCountForeign.do",method = RequestMethod.POST)
    public String getExperimentalItemCountForeign(@RequestParam("orderTicketNum") String orderTicketNum){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getExperimentalItemCount(orderTicketNum);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    /********************************  实验管理 end *****************************************/

    /********************************  未完实验 Start *****************************************/

    @RequestMapping(value ="/getExperimentMessagePageForeign.do")
    public String getExperimentMessagePageForeign(){
        return "quality/qc_em_unfinished_experimental_foreign";
    }
    @ResponseBody
    @RequestMapping("/getAllExperimentalItemForeign.do")
    public String getAllExperimentalItemForeign(){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getAllExperimentalItem();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }


    @RequestMapping("/getExperimentalItemMsgPageForeign.do")
    public String getExperimentalItemMsgPageForeign(@RequestParam("id") String id,HttpServletRequest request){
        request.setAttribute("id",id);
        return "quality/qc_em_experimental_model_foreign";
    }

    @ResponseBody
    @RequestMapping("/getExperimentalItemMsgByIdForeign.do")
    public String getExperimentalItemMsgByIdForeign(@RequestParam("id") String id){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getExperimentalItemMsgById(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @ResponseBody
    @RequestMapping("/getExperimentalItemListByIdForeign.do")
    public String getExperimentalItemListByIdForeign(@RequestParam("id") String id){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getExperimentalItemNumList(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @ResponseBody
    @RequestMapping(value = "/sendFromDataForeign.do",method = RequestMethod.POST)
    public String sendFromDataForeign(@RequestParam("fromJson") String fromJson,@RequestParam("firstTest") String firstTest,@RequestParam("coarseTest") String coarseTest){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.addExperimentalMsgAndItem(fromJson,firstTest,coarseTest);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @RequestMapping("/getExperimentalMsgByIdForeign.do")
    public String getExperimentalMsgByIdForeign(@RequestParam("id") String id,HttpServletRequest request){
        request.setAttribute("id",id);
        return "quality/qc_em_experimental_message_foreign";
    }
    @ResponseBody
    @RequestMapping(value = "/getExperimentalProjectMessageForeign.do",method = RequestMethod.POST)
    public String getExperimentalProjectMessageForeign(@RequestParam("id") String  id){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getExperimentalProjectMessage(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/showExperimentalProjectItemForeign.do",method = RequestMethod.POST)
    public String showExperimentalProjectItemForeign(@RequestParam("tableName") String tableName,@RequestParam("experiment_num") String experiment_num){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getExperimentalProjectItem(tableName,experiment_num);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/removeExperimentalItemByIdForeign.do",method = RequestMethod.POST)
    public String removeExperimentalItemByIdForeign(@RequestParam("id") String id){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.removeExperimentalItemById(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    /********************************  未完实验 end *****************************************/

    /********************************  台账相关 end *****************************************/

    /**
     *
     * 功能描述: <br>
     *  <台账首页跳转>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/17 17:25
     */
    @RequestMapping("/getStandingBookPageForeign.do")
    public String standing_bookForeign(){
        return "quality/qc_em_standing_book_foreign";
    }

    /**
     *
     * 功能描述: <br>
     *  <原材料台账首页>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/24 11:00
     */
    @ResponseBody
    @RequestMapping("/getSevenDayRawMaterialStandingBookForeign.do")
    public String getSevenDayRawMaterialStandingBookForeign(){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getSevenDayRawMaterialStandingBook();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    /**
     *
     * 功能描述: <br>
     *  <根据日期查询原材相关信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/25 11:40
     */
    @ResponseBody
    @RequestMapping(value = "/getRawMaterialStandingBookByDateForeign.do",method = RequestMethod.POST)
    public String getRawMaterialStandingBookByDateForeign(@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getRawMaterialStandingBookByDate(startDate,endDate);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    };

    /**
     *
     * 功能描述: <br>
     *  <返回沥青原材七日内试验数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/25 13:16
     */

    @ResponseBody
    @RequestMapping(value = "/getAsphaltStandingBookForeign.do")
    public String getAsphaltStandingBookForeign(){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getAsphaltStandingBook();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/getAsphaltStandingBookByDateForeign.do",method = RequestMethod.POST)
    public String getAsphaltStandingBookByDateForeign(@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getAsphaltStandingBookByDate(startDate,endDate);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @ResponseBody
    @RequestMapping(value = "/getTestStandingBookForeign.do")
    public String getTestStandingBookForeign(){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getTestStandingBook();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @ResponseBody
    @RequestMapping(value = "/getTestStandingBookByDateForeign.do",method = RequestMethod.POST)
    public String getTestStandingBookByDateForeign(@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getTestStandingBookByDate(startDate,endDate);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    /********************************  台账相关 end *****************************************/


    /********************************  设置相关 Start *****************************************/
    @RequestMapping("/getExperimentSettingForeign.do")
    public String getPerimentSettingForeign(){
        return "quality/qc_em_experimental_setting_foreign";
    }
    @ResponseBody
    @RequestMapping("/getSpecificationDataAndManufacturersDataForeign.do")
    public String getSpecificationDataAndManufacturersDataForeign(){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getSpecificationDataAndManufacturersData();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping("/deleteSpecificationOrManufacturersByIdForeign.do")
    public String deleteSpecificationOrManufacturersByIdForeign(@RequestParam("id") String id,@RequestParam("make") String make){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.deleteSpecificationOrManufacturersById(id,make);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/sendSpecificationFromForeign.do",method = RequestMethod.POST)
    public String sendSpecificationFromForeign(@RequestParam("specificationName") String specificationName){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.insertSpecificationFrom(specificationName);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/sendManufacturersFromForeign.do",method = RequestMethod.POST)
    public String sendManufacturersFromForeign(@RequestParam("manufacturersName") String manufacturersName){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.insertManufacturersFrom(manufacturersName);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/getSpecificationOrManufacturersByIdForeign.do",method = RequestMethod.POST)
    public String getSpecificationOrManufacturersByIdForeign(@RequestParam("id") String id,@RequestParam("make") String make){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.getSpecificationOrManufacturersById(id,make);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/updateSpecificationOrManufacturersByIdForeign.do",method = RequestMethod.POST)
    public String updateSpecificationOrManufacturersByIdForeign(@RequestParam("id") String id,@RequestParam("make") String make,@RequestParam("updateName") String updateName){
        String res = "";
        try{
            res = QualityExperimentalManagerForeignInf.updateSpecificationOrManufacturersById(id,make,updateName);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    /********************************  设置相关 end *****getExperimentalProjectMessage************************************/

    /********************************  关键预警数据 Start *****************************************/

    @RequestMapping("/qc_critical_warning.do")
    public String criticalWarning(){
        return "quality/qc_critical_warning";
    }

    @ResponseBody
    @RequestMapping("/getAllCriticalWarning.do")
    public String getAllCriticalWarning(){
        String res = "";
        try{
            res = qualityDataSummaryInf.getAllCriticalWarning();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/getAllCriticalWarningByDate.do",method = RequestMethod.POST)
    public String getAllCriticalWarningByDate(@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate){
        String res = "";
        try{
            res = qualityDataSummaryInf.getAllCriticalWarningByDate(startDate,endDate);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @RequestMapping("/getCeiticalWarning.do")
    public String getCeiticalWarning(HttpServletRequest request,@RequestParam("proDate") String proDate,@RequestParam("produceDisc") String produceDisc,@RequestParam("crewNum") String crewNum){
        try{
            Map<String,Object> map = qualityDataSummaryInf.getCeiticalWarning(proDate,produceDisc,crewNum);
            request.setAttribute("product",map);
        }catch (Exception e) {
            e.printStackTrace();
        }

        return "quality/qc_dm_data_detail";
    }
    /********************************  关键预警数据 End *****************************************/


    /*********************************移动端数据管理start***************************************/
    /**
     *
     * 功能描述: <br>
     *  <查询指定日期内生产的产品类型>
     * @param
     * @return
     * @auther Melone
     * @date 2019/9/17 10:08
     */
    @ResponseBody
    @RequestMapping(value = "/mobileGetRatioListByDate.do",method = RequestMethod.POST)
    public String mobileGetRatioListByDate(@RequestParam("startDateTime") String startDate,@RequestParam("crew") String crew){
        if (startDate.isEmpty() || crew.isEmpty()) {
            return null;
        }
        List<Map<String,Object>> res = new ArrayList<>();
        try{
            res = qualityDataSummaryInf.mobileGetRatioListByDate(startDate,crew);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return  JSON.toJSONString(res);
    }

    /**
     *
     * 功能描述: <br>
     *  <移动端根据日期机组获取生产信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/9/17 10:32
     */
    @ResponseBody
    @RequestMapping(value = "/getMobilePromessage.do",method = RequestMethod.POST)
    public String getMobilePromessageByRaionModel(String startDate,  String crew, String rationId){

        List<Map<String,Object>> list = new ArrayList<>();
        try{
            list =  qualityDataSummaryInf.getMobilePromessageByRaionModel(startDate,crew,rationId);
        }catch (Exception e) {
            e.printStackTrace();
        }

        return JSON.toJSONString(list);
    }

    /**
     *
     * 功能描述: <br>
     *  <移动端获取产品详细信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/9/24 12:16
     */
    @ResponseBody
    @RequestMapping(value = "/getMobileProductMessage.do",method = RequestMethod.POST )
    public String getMobileProductMessage( String id,String crewNum,String proDate){

        if (id.isEmpty()) return "";
        Map<String,Object> map = new HashMap<>();

        try{
            map =  qualityDataManagerInf.selectProductMessageById(id,crewNum,proDate);
            String res = qualityDataManagerInf.selectEchartsDataById(id,crewNum);
            //json处理
            String modelMessage = JSON.toJSONString(map.get("modelMessage"));
            String proBase = JSON.toJSONString(map.get("proBase"));
            String proMessage = JSON.toJSONString(map.get("proMessage"));

            map.put("modelMessage",modelMessage);
            map.put("proBase",proBase);
            map.put("proMessage",proMessage);
            map.put("echarts",res);
        }catch (Exception e) {
            e.printStackTrace();
        }

        return JSON.toJSONString(map);
    }



    /**
     *
     * 功能描述: <br>
     *  <查询昨天生产情况>
     * @param
     * @return
     * @auther Melone
     * @date 2019/10/8 20:39
     */
    @ResponseBody
    @RequestMapping("/getYesterdayProduct.do")

    public String getYesterdayProduct(){

        List<Map<String,Object>> res = new ArrayList<>();
        try{
            res = qualityDataSummaryInf.mobileGetYesterdayProduct();
        }catch (Exception e) {
            e.printStackTrace();
        }

        return  JSON.toJSONString(res);
    }


    @ResponseBody
    @RequestMapping(value = "/getYesterdayCriticalWarning.do")
    public String getYesterdayCriticalWarning(){
        String res = "";
        try{
            res = qualityDataSummaryInf.getAllCriticalWarning();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @ResponseBody
    @RequestMapping(value = "/getMobileWarningMessage.do",method = RequestMethod.POST)
    public String getMobileWarningMessage(String crewNum,String produceDate,String produceTime){
        Map<String,Object> map = new HashMap<>();
        try{
            map =  qualityDataManagerInf.selectWarningMessageById(crewNum,produceDate,produceTime);
            Map<String,String> pro = (Map<String,String>) map.get("proBase");
            String res = qualityDataManagerInf.selectEchartsDataById(String.valueOf(pro.get("Id")),crewNum);
            //json处理
            String modelMessage = JSON.toJSONString(map.get("modelMessage"));
            String proBase = JSON.toJSONString(map.get("proBase"));
            String proMessage = JSON.toJSONString(map.get("proMessage"));

            map.put("modelMessage",modelMessage);
            map.put("proBase",proBase);
            map.put("proMessage",proMessage);
            map.put("echarts",res);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return JSON.toJSONString(map);

    }

    @ResponseBody
    @RequestMapping(value = "/getMobileWarningDataByDate.do",method = RequestMethod.POST)
    public String getMobileWarningDataByDate(  String startDate, String crew ){
        String res = "";
        try{
            res = qualityDataSummaryInf.getWarningDataByDate(crew,startDate);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    /**
     *
     * 功能描述: <br>
     *  <移动端获取所有未填写实验>
     * @param
     * @return
     * @auther Melone
     * @date 2019/10/12 10:12
     */
    @ResponseBody
    @RequestMapping("/getMobileUnfinishedExperimental.do")
    public String getMobileUnfinishedExperimental(){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getMobileUnfinishedExperimental();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    /**
     *
     * 功能描述: <br>
     *  <获取近一周已完成实验数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/10/12 10:21
     */
    @ResponseBody
    @RequestMapping("/getLastWeekExperimentHistory.do")
    public String getLastWeekExperimentHistory(){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getLastWeekExperimentHistory();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    /**
     *
     * 功能描述: <br>
     *  <根据日期获取当日所有实验>
     * @param
     * @return
     * @auther Melone
     * @date 2019/10/12 10:38
     */
    @ResponseBody
    @RequestMapping("/getMobileExperimentByDate.do")
    public String getMobileExperimentByDate(String startDate){
        String res = "";
        try{
            res = qualityExperimentalManagerInf.getMobileExperimentByDate(startDate);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    /*********************************移动端数据管理end***************************************/

}

