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
    @RequestMapping(value = "/qualityData.do")
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

        if (null == pageBean) return null;


        //获取再生料以及添加剂类型
        List<Map<String,String>> listAdditive = qualityMatchingInf.selectAdditiveTypeList();
        List<Map<String,String>> listRegenerate = qualityMatchingInf.selectRegenerateTypeList();

        //添加到域对象内
        request.setAttribute("listAdditive",listAdditive);
        request.setAttribute("listRegenerate",listRegenerate);
        request.setAttribute("pageBean",pageBean);

        return "quality/qc_matching_model";
    }



    @RequestMapping(value ={"/addRation.do"} , method = RequestMethod.POST)
    public String addRation(QualityRatioTemplate qualityRatioTemplate){

        boolean bo =  qualityMatchingInf.insetRatioTemplate(qualityRatioTemplate);

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


    @ResponseBody
    @RequestMapping(value = "/getRealTimeDataEcharsTemp.do",method = RequestMethod.POST)
    public String getRealTimeDataEcharsTemp(){

        String jsonStr = qualityDataMontoringInf.getRealTimeDataEcharsTemp();

        return jsonStr;

    }

    @ResponseBody
    @RequestMapping(value = "/getRealTimeDataEcharsMaterial.do",method = RequestMethod.POST)
    public String getRealTimeDataEcharsMaterial(){

        String  jsonStr = qualityDataMontoringInf.getRealTimeDataEcharsMaterial();
        return jsonStr;
    }

    /********************************  实时监控 end *****************************************/



    /********************************  数据管理 Start *****************************************/

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

        request.setAttribute("pageBean",pageBean);

        return "quality/qc_auxiliary_analysis";
    }

    /********************************  辅助分析 end *****************************************/


    /********************************  产品列表 Start *****************************************/

    @RequestMapping("/qc_prodoct_list.do")
    public String prodoctList(){

        return "quality/qc_prodoct_list";
    }

    /********************************  产品列表 end *****************************************/


    /********************************  实验检测 Start *****************************************/

    @RequestMapping("/qc_test_detection.do")
    public String testDetection(){

        return "quality/qc_test_detection";
    }

    /********************************  实验检测 end *****************************************/


    /********************************  真实数据 Start *****************************************/

    @RequestMapping("/qc_real_data.do")
    public String realData(){

        return "quality/qc_real_data";
    }

    /********************************  真实数据 end *****************************************/


}
