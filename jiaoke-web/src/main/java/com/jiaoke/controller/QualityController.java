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
import com.jiake.utils.QualityMatchingUtil;
import com.jiaoke.common.bean.PageBean;
import com.jiaoke.quality.bean.QualityRatioModel;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.service.QualityIndexInf;
import com.jiaoke.quality.service.QualityMatchingInf;
import com.jiaoke.quality.service.ReceiveDataInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
    ReceiveDataInf receiveDataInf;
    @Autowired
    QualityIndexInf qualityIndexInf;
    @Autowired
    QualityMatchingInf qualityMatchingInf;
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


    @ResponseBody
    @RequestMapping(value ={"/addRation.do"} , method = RequestMethod.POST)
    public String addRation(QualityRatioTemplate qualityRatioTemplate){
        Map<String,String> map = new HashMap<String, String>();
        map.put("messages","success");
       String str = JSON.toJSONString(map);
        return str;
    }
}
