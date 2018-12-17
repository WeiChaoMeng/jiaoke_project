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
import com.jiake.utils.QualityMatchingUtil;
import com.jiaoke.common.bean.PageBean;
import com.jiaoke.quality.bean.QualityDataManagerDay;
import com.jiaoke.quality.bean.QualityRatioModel;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.service.*;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
    public void receiveByClient(@RequestParam("messageStr") String messageStr){

        if (StringUtils.isEmpty(messageStr)) return;

        receiveDataInf.receiveDataToDB(messageStr);



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

    /********************************  质量预警 end *****************************************/


    /********************************  辅助分析 Start *****************************************/

    @RequestMapping("/qc_auxiliary_analysis.do")
    public String auxiliaryAnalysis(HttpServletRequest request){

        String temp = request.getParameter("currentPageNum");
        String warningLive = request.getParameter("warningLive");
        String url = QualityMatchingUtil.getUrl(request);

        if ("" == warningLive || warningLive == null)  warningLive = "0";

        PageBean<Map<String,String>> pageBean = new PageBean<Map<String,String>>();
        if ( temp == null || temp.trim().isEmpty() ){
            pageBean = qualityAuxiliaryAnalysisInf.selelectWarningLiveData(1,url,warningLive);
        }else {
            pageBean = qualityAuxiliaryAnalysisInf.selelectWarningLiveData(Integer.parseInt(temp),url,warningLive);
        }
        List<Map<String,String>> list = qualityAuxiliaryAnalysisInf.selectWaringData(pageBean);

        request.setAttribute("pageBean",pageBean);
        request.setAttribute("waringList",list);

        return "quality/qc_auxiliary_analysis";
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



}
