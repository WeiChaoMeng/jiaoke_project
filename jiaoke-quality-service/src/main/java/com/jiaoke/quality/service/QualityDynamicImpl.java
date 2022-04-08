/**
 * FileName: QualityDynamicImpl
 * author:   Melone
 * Date:     2018/12/18 16:32
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSON;
import com.jiake.utils.QualityDynamicUtil;
import com.jiaoke.quality.dao.QualityDynamicDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/12/18 16:32
 * @Description:
 */
@Service
public class QualityDynamicImpl implements QualityDynamicInf {

    @Resource
    private QualityDynamicDao qualityDynamicDao;

    @Override
    public void getLastDayToChars(HttpServletRequest request) {


        List<Map<String,String>> list = qualityDynamicDao.getLastDayToChars();

        if (list.size() == 0) return;
        //设置日期格式
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

        String format = df.format(new Date());

        QualityDynamicUtil.setRequestAttributeUtil(list,qualityDynamicDao,"ratio_stone","material_asphalt","crew1",request,format);

    }


    @Override
    public String getRatioListByDate(String proData,String crew) {

        if (proData.isEmpty() || crew.isEmpty()) {return null;}
        String[] array = proData.split("to");

        //处理 一、二机组区别
        String crewNum;
        switch (crew){
            case "data1":
                crewNum = "crew1";
                break;
            case "data2":
                crewNum = "crew2";
                break;
            default:
                crewNum = "crew1";
        }

        List<Map<String,String>> map = qualityDynamicDao.selectRatioListByDate(array[0], array[1],crew,crewNum);

        return JSON.toJSONString(map);
    }

    @Override
    public void getEcharsDataByMaterialAndDate(String date, String material, String ratioNum, String crew,HttpServletRequest request) {

        String[] strArray = date.split("to");
        List<Map<String,String>> list = qualityDynamicDao.selectProductByMaterialAndDate(strArray[0],strArray[1],material,ratioNum,crew);
        String ratioName;
        String crewName = "crew1";
        if (list.size() == 0){ return;}

        switch (crew){
            case "data1":
                crewName = "crew1";
                request.setAttribute("crewNum","一号");
                break;
            case "data2":
                crewName = "crew2";
                request.setAttribute("crewNum","二号");
                break;
        }

        switch (material){
            case "material_aggregate_6":
                ratioName = "repertory_six";
                request.setAttribute("material","六仓材料");
                break;
            case "material_aggregate_5":
                ratioName = "repertory_five";
                request.setAttribute("material","五仓材料");
                break;
            case "material_aggregate_4":
                ratioName = "repertory_four";
                request.setAttribute("material","四仓材料");
                break;
            case "material_aggregate_3":
                ratioName = "repertory_three";
                request.setAttribute("material","三仓材料");
                break;
            case "material_aggregate_2":
                ratioName = "repertory_two";
                request.setAttribute("material","二仓材料");
                break;
            case "material_aggregate_1":
                ratioName = "repertory_one";
                request.setAttribute("material","一仓材料");
                break;
            case "material_asphalt":
                ratioName = "ratio_stone";
                break;
            case "material_stone":
                ratioName = "breeze";
                request.setAttribute("material","石粉含量");
                break;
            default:
                ratioName = "ratio_stone";
        }


        QualityDynamicUtil.setRequestAttributeUtil(list,qualityDynamicDao,ratioName,material,crewName,request,date);

        //回显
        request.setAttribute("proDate",date);
        request.setAttribute("crew",crew);
        request.setAttribute("ratioNum",ratioNum);

    }


    @Override
    public String getDataToIndexChars(String ratioNum, String crew, HttpServletRequest request) {
        List<Map<String,String>> list = qualityDynamicDao.getLastWeekByRationAndCrew(ratioNum,crew);

        if (list == null){
            return  null;
        }
        //设置日期格式
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

        String format = df.format(new Date());
        String crewName = " ";
        switch (crew){
            case "data1":
                crewName = "crew1";
                request.setAttribute("crewNum","一号");
                break;
            case "data2":
                crewName = "crew2";
                request.setAttribute("crewNum","二号");
                break;
        }
        return QualityDynamicUtil.returnJsonData(list,qualityDynamicDao,"ratio_stone","material_asphalt",crewName,request,format);

    }

    @Override
    public void getLastWeekToChars(HttpServletRequest request) {
        List<Map<String,String>> list = qualityDynamicDao.getLastWeekToChars();

        if (list.size() == 0) {return;}
        //设置日期格式
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

        String format = df.format(new Date());

        QualityDynamicUtil.setRequestAttributeUtil(list,qualityDynamicDao,"ratio_stone","material_asphalt","crew1",request,format);

    }
}
