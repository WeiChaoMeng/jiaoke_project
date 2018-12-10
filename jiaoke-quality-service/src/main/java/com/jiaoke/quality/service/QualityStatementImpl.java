/**
 * FileName: QualityStatementImpl
 * author:   Melone
 * Date:     2018/11/2 10:59
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSON;
import com.jiaoke.quality.dao.QualityStatementDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/11/2 10:59
 * @Description:
 */
@Service
public class QualityStatementImpl implements  QualityStatementInf {

    @Resource
    private  QualityStatementDao qualityStatementDao;


    @Override
    public String selectLastMonthStatementToEchars() {

        List<Map<String,Object>> list =  qualityStatementDao.selectLastMonthStatementToEchars();

        String json = JSON.toJSONString(list);

        return json;
    }

    /**
     *
     * 功能描述: <br>
     *  <查询上月相关数据得集合函数>
     * @param
     * @return java.lang.String
     * @auther Melone
     * @date 2018/11/16 13:20
     */
    @Override
    public String selectMonthStatementToData() {

        Map<String,List<Map<String,String>>> map = new HashMap<>();

        List<Map<String,String>> dateAndCount =  qualityStatementDao.selectDateAndCount();
        List<Map<String,String>> materialMaxLever =  qualityStatementDao.selectMaterialMaxLever();
        List<Map<String,String>> maxRationAndcount =  qualityStatementDao.selectMaxRationAndcount();

        map.put("dateAndCount",dateAndCount);
        map.put("materialMaxLever",materialMaxLever);
        map.put("maxRationAndcount",maxRationAndcount);


        return JSON.toJSONString(map);
    }

    @Override
    public String selectYearStatementDateAndDate() {

        Map<String,List<Map<String,String>>> map = new HashMap<>();

        List<Map<String,String>> lastYearDateList = qualityStatementDao.selectYearList();
        List<Map<String,String>>  lastYearAndCount = qualityStatementDao.selectLastYearAndCount();
        List<Map<String,String>> lastYearMaterialMaxLever = qualityStatementDao.selectLastYearMaterialMaxLever();
        List<Map<String,String>> lastYearMaxRationAndcount = qualityStatementDao.selectLastYearMaxRationAndcount();
        List<Map<String,String>> lastYearEcharsData = qualityStatementDao.selectLastYearStatementToEchars();

        map.put("lastYearDateList",lastYearDateList);
        map.put("lastYearAndCount",lastYearAndCount);
        map.put("lastYearMaterialMaxLever",lastYearMaterialMaxLever);
        map.put("lastYearMaxRationAndcount",lastYearMaxRationAndcount);
        map.put("lastYearEcharsData",lastYearEcharsData);

        return JSON.toJSONString(map);
    }

    /**
     * 返回生产月份集合
     * @return
     */
    @Override
    public String selectMonthDateList() {
        List<Map<String,String>> MonthDateList = qualityStatementDao.selectMonthDateList();

        return JSON.toJSONString(MonthDateList);
    }
}
