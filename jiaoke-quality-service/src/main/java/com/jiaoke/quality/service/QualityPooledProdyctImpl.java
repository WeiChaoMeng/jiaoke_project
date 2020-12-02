/**
 * FileName: QualityPooledProdyctImpl
 * author:   Melone
 * Date:     2020/10/23 10:15
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.quality.dao.QualityPooledProdyctDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/10/23 10:15
 * @Description:
 */
@Service
public class QualityPooledProdyctImpl implements QualityPooledProdyctInf {

    @Resource
    private QualityPooledProdyctDao qualityPooledProdyctDao;

    @Override
    public List<Map<String,String>> getProdycyTotalByDate(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.selectProdycyTotalByDate(startDate,lastDate);
        return res;
    }

    @Override
    public List<Map<String, String>> getEverDayProdacuByDate(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.selectEverDayProdacuByDate(startDate,lastDate);
        return res;
    }

    @Override
    public List<Map<String, String>> getAllProductTypeTotal(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.getAllProductTypeTotal(startDate,lastDate);
        return res;
    }

    @Override
    public List<Map<String, String>> getTwoCrewProduct(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.getTwoCrewProduct(startDate,lastDate);
        return res;
    }

    @Override
    public List<Map<String, String>> getProductTotalAndReagenerateTotal(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.getProductTotalAndReagenerateTotal(startDate,lastDate);
        return res;
    }

    @Override
    public List<Map<String, String>> getTwoCrewMoreThan100Regenerate(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.getTwoCrewMoreThan100Regenerate(startDate,lastDate);
        return res;
    }
    @Override
    public List<Map<String, String>> getwoCrewMoreThan100Product(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.getwoCrewMoreThan100Product(startDate,lastDate);
        return res;
    }

    @Override
    public List<Map<String, String>> getTwoCrewMoreThan100RegenerateProduct(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.getTwoCrewMoreThan100RegenerateProduct(startDate,lastDate);
        return res;
    }

    @Override
    public List<Map<String, String>> getAllSquadTotal(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.getAllSquadTotal(startDate,lastDate);
        return res;
    }

    @Override
    public List<Map<String, String>> getAllSquadRegenerate(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.getAllSquadRegenerate(startDate,lastDate);
        return res;
    }

    @Override
    public List<Map<String, String>> geAllSquadProduct(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.getAllSquadTotal(startDate,lastDate);
        return res;
    }

    @Override
    public List<Map<String, String>> getAllSquadProductMakeUp(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.getAllSquadProductMakeUp(startDate,lastDate);
        return res;
    }

    @Override
    public List<Map<String, String>> getProjectTotal(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.getProjectTotal(startDate,lastDate);
        return res;
    }
    @Override
    public List<Map<String, String>> getProjectTotalByDate(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.getProjectTotalByDate(startDate,lastDate);
        return res;
    }


    @Override
    public List<Map<String, String>> getRegenerateTypeTotal(String startDate, String lastDate) {
        List<Map<String,String>> res = qualityPooledProdyctDao.getRegenerateTypeTotal(startDate,lastDate);
        return res;
    }

    @Override
    public Map<String,Map<String,List<Map<String,Double>>>> getTwoCrewContinuousThanProduct(String startDate, String lastDate) throws ParseException {
        List<Map<String,String>> res = qualityPooledProdyctDao.getTwoCrewContinuousThanProduct(startDate,lastDate);
        Map<String,Map<String,List<Map<String,Double>>>> temMap = new HashMap<>();
        temMap.put("crew1",new HashMap<>());
        temMap.put("crew2",new HashMap<>());
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String crew1LastDate = " ";
        String crew2LastDate = " ";
        Date crew1LastDateTime = null;
        Date crew2LastDateTime = null;
        String crew1LastRatio = "";
        String crew2LastRatio = "";
        //根据日期创建list
        for (int i = 0; i < res.size();i++){
            String crewNum = res.get(i).get("crew");
            String proDate = String.valueOf(res.get(i).get("proDate"));
            if ("crew1".equals(crewNum)){
                temMap.get("crew1").put(proDate,new ArrayList<>());
            }else {
                temMap.get("crew2").put(proDate,new ArrayList<>());
            }
        }
        double crew1Double = 0.00;
        double crew2Double = 0.00;
        for (int i = 0; i < res.size();i++){
            String crewNum = String.valueOf(res.get(i).get("crew"));
            String proDate = String.valueOf(res.get(i).get("proDate"));
            String proName = String.valueOf(res.get(i).get("proName"));
            String proTime = String.valueOf(res.get(i).get("proTime"));
            String total = String.valueOf(res.get(i).get("total"));
            Date productDateTime = sdf.parse(proDate + " " + proTime);
            if ("crew1".equals(crewNum)){
                if (crew1LastDateTime == null){
                    crew1Double += Double.parseDouble(total);
                }else {
                    double crew1Min = DateUtil.getWorkTime(productDateTime, crew1LastDateTime);
                    if (crew1LastDate.equals(proDate) &&crew1LastRatio.equals(proName) && crew1Min > 0 && crew1Min < 15){
                        crew1Double += Double.parseDouble(total);
                    }else {
                        if (crew1Double > 100){
                            Map<String,Double> crew1Map = new HashMap<>();
                            crew1Map.put(crew1LastRatio,crew1Double);
                            List<Map<String, Double>> crew1 = temMap.get("crew1").get(crew1LastDate);
                            crew1.add(crew1Map);
                        }
                        crew1Double = Double.parseDouble(total);
                    }
                }
                crew1LastDateTime = productDateTime;
                crew1LastRatio = proName;
                crew1LastDate = proDate;
            }else {
                if (crew2LastDateTime == null){
                    crew2Double += Double.parseDouble(total);
                }else {
                    double crew2Min = DateUtil.getWorkTime(productDateTime, crew2LastDateTime);
                    if (crew2LastDate.equals(proDate) && crew2LastRatio.equals(proName) && crew2Min > 0 && crew2Min < 15){
                        crew2Double += Double.parseDouble(total);
                    }else {
                        if (crew2Double > 100){
                            Map<String,Double> crew2Map = new HashMap<>();
                            crew2Map.put(crew2LastRatio,crew2Double);
                            List<Map<String, Double>> crew2 = temMap.get("crew2").get(crew2LastDate);
                            crew2.add(crew2Map);
                        }
                        crew2Double = Double.parseDouble(total);
                    }
                }
                crew2LastDateTime = productDateTime;
                crew2LastRatio = proName;
                crew2LastDate = proDate;
            }

        }
        return temMap;
    }

    @Override
    public List<Map<String, String>> getPlateNumberByDate(String startDate, String lastDate) throws ParseException {
        //查询两个机组时间段内生产数据
        List<Map<String,String>> list = qualityPooledProdyctDao.getTwoCrewProductByDate(startDate,lastDate);
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Map<String,String>> res = new ArrayList<>();
        //定义生产段开始时间
        String crew1StartDate = "";
        String crew2StartDate = "";
        //定义生产段结束时间
        String crew1EndDate = "";
        String crew2EndDate = "";
        //定义个数
        int crew1Count = 0;
        int crew2Count = 0;
        for (int i = 0; i < list.size();i++){
            String crew = list.get(i).get("crew");
            String produceDate = String.valueOf(list.get(i).get("produce_date"));
            String produceTime = String.valueOf(list.get(i).get("produce_time"));
            Date productDateTime = sdf.parse(produceDate + " " + produceTime);

            //一号机
            if ("crew1".equals(crew)){
                if ( crew1Count == 0){
                    crew1StartDate = sdf.format(productDateTime);
                    crew1EndDate = sdf.format(productDateTime);
                    crew1Count++;
                }else {
                    double crew1Min = DateUtil.getWorkTime(productDateTime,sdf.parse(crew1EndDate));
                    if (crew1Min > 60){
                        //查询开始时间到结束时间+30分钟出厂数据
                        Date crew1EndDateTime = sdf.parse(crew1EndDate);
                        //增加30分钟
                        String afterDate  = sdf.format(new Date(crew1EndDateTime.getTime() + 1800000));
                        String beforeDate = crew1StartDate;
                        Map<String,String> resMap = qualityPooledProdyctDao.getCrew1WeighDataByDate(beforeDate,afterDate);
                        //存入数据
                        if (resMap == null || resMap.isEmpty()){
                            //更新count
                            crew1Count = 1;
                            crew1StartDate = sdf.format(productDateTime);
                            crew1EndDate = sdf.format(productDateTime);
                        }else {
                            Map<String,String> temMap = new HashMap<>();
                            temMap.put("crew",crew);
                            temMap.put("startDate",crew1StartDate);
                            temMap.put("endDate",crew1EndDate);
                            temMap.put("productCount",String.valueOf(crew1Count));
                            temMap.put("weighCount",resMap.get("total"));
                            res.add(temMap);
                            //更新count
                            crew1Count = 1;
                            crew1StartDate = sdf.format(productDateTime);
                            crew1EndDate = sdf.format(productDateTime);
                        }

                    }else {
                        crew1EndDate = sdf.format(productDateTime);
                        crew1Count++;
                    }
                }

            //二号机
            }else {
                if ( crew2Count == 0){
                    crew2StartDate = sdf.format(productDateTime);
                    crew2EndDate = sdf.format(productDateTime);
                    crew2Count++;
                }else {
                    double crew2Min = DateUtil.getWorkTime(productDateTime,sdf.parse(crew2EndDate));
                    if (crew2Min > 60){
                        //查询开始时间到结束时间+30分钟出厂数据
                        Date crew2EndDateTime = sdf.parse(crew2EndDate);
                        //增加30分钟
                        String afterDate  = sdf.format(new Date(crew2EndDateTime.getTime() + 1800000));
                        String beforeDate = crew2StartDate;
                        Map<String,String> resMap = qualityPooledProdyctDao.getCrew2WeighDataByDate(beforeDate,afterDate);
                        if (resMap == null || resMap.isEmpty()){
                            //更新count
                            crew2Count = 1;
                            crew2StartDate = sdf.format(productDateTime);
                            crew2EndDate = sdf.format(productDateTime);
                        }else {
                            //存入数据
                            Map<String,String> temMap = new HashMap<>();
                            temMap.put("crew",crew);
                            temMap.put("startDate",crew2StartDate);
                            temMap.put("endDate",crew2EndDate);
                            temMap.put("productCount",String.valueOf(crew2Count));
                            temMap.put("weighCount",resMap.get("total"));
                            res.add(temMap);
                            //更新count
                            crew2Count = 1;
                            crew2StartDate = sdf.format(productDateTime);
                            crew2EndDate = sdf.format(productDateTime);
                        }

                    }else {
                        crew2EndDate = sdf.format(productDateTime);
                        crew2Count++;
                    }
                }
            }
        }


        return res;
    }
}
