/**
 * FileName: QualityProjectImpl
 * author:   Melone
 * Date:     2019/11/14 16:59
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jiake.utils.CarDateUtil;
import com.jiake.utils.QualityGetProjectByCarNumUtil;
import com.jiaoke.quality.bean.QualityProjectItem;
import com.jiaoke.quality.dao.QualityProjectDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.*;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/11/14 16:59
 * @Description:
 */
@Service
public class QualityProjectImpl implements QualityProjectInf {

    @Resource
    private QualityProjectDao qualityProjectDao;
    @Resource
    private AmqpTemplate amqpTemplate;


    @Override
    public int addProjectItem(QualityProjectItem fromData) {
        int res = qualityProjectDao.insertProjectItem(fromData);
        return res;
    }

    @Override
    public List<QualityProjectItem> getUserProjectList() {
        List<QualityProjectItem> list = qualityProjectDao.selectUserProjectList();
        return list;
    }

    @Override
    public QualityProjectItem getUserProjectById(String id) {
        QualityProjectItem list = qualityProjectDao.selectUserProjectById(id);
        return list;
    }

    @Override
    public int delectUserProject(String idStr) {
        int res  = qualityProjectDao.delectUserProject(idStr);
        return res;
    }

    @Override
    public int delectUserProjectByIdArray(String[] idArr) {
        int res  = qualityProjectDao.delectUserProjectByIdArray(idArr);
        return res;
    }

    @Override
    public int editProjectItem(QualityProjectItem fromData) {
        int res  = qualityProjectDao.updateProjectItem(fromData);
        return res;
    }

    @Override
    public  void editProductionDataByCarNum(String carNum) throws ParseException,NullPointerException {
        //获取设备名称
        JSONObject Json = JSONObject.parseObject(carNum);
        //获取识别车牌号
        String license= Json.getJSONObject("AlarmInfoPlate").getJSONObject("result").getJSONObject("PlateResult").getString("license");
        //获取时间
        String recotime= Json.getJSONObject("AlarmInfoPlate").getJSONObject("result").getJSONObject("PlateResult").getString("recotime");
        //获取机组号
        String crewNum = Json.getJSONObject("AlarmInfoPlate").getString("ParkID");
        System.out.println("车号：" + "\n" + Json);
        //获取监控摄像头拍摄到车牌的时间
        String carDate = recotime.split(" ")[0];
        //获取当前机组最后一条车号数据
        String crewId = "data1".equals(crewNum) ? "1":"2";
        Map<String,Object> lastCarNumMap = qualityProjectDao.selectLastCarNumByCrewNumAndTime(crewId,recotime);
        //根据时间差值与车号对比确认是否是重复数据
        String fromDate = lastCarNumMap.get("upTime").toString();
        int minutes = CarDateUtil.twoTimeDifference(fromDate,recotime,"yyyy-MM-dd HH:mm:ss");
        if (license.equals(lastCarNumMap.get("carNum").toString())  && minutes < 50){
            //判断车盘号三分中内是否重复
            System.out.println("数据重复");
            return;
        }
        //判断车牌是否为空
        if ( StringUtils.isBlank(license)){
            return;
        }
        //判断是否为京牌 判断尾部是否为汉字 容错车牌
        String[] locenseArry = license.split("");
        if (!("京".equals(locenseArry[0])) ||  QualityGetProjectByCarNumUtil.isContainChinese(locenseArry[locenseArry.length - 1])){
            return;
        }
        //存入车牌识别表
         qualityProjectDao.insertCarNum(license,recotime,crewId);
    }

    @Override
    public Map<String, String> addWeighingInformation(String weighingMessage) {
        System.out.println(weighingMessage);
        Map<String,String> map = new HashMap<>();
        try{
            JSONObject jsonObject = JSON.parseObject(weighingMessage);
            Map<String,String> insertMap = new HashMap<>();
            Set<String> keys = jsonObject.keySet();
            Iterator<String> iterator = keys.iterator();
            while (iterator.hasNext()){
                String key = (String) iterator.next();
                String obj = String.valueOf(jsonObject.get(key));
                if ("crewNum".equals(key)){
                    if ("1#".equals(obj) || "2#".equals(obj)){
                        obj = "1#".equals(obj)? "1":"2";
                    }else {
                        obj = "1".equals(obj)? "1":"2";
                    }

                }
                insertMap.put(key,obj);
            }
            System.out.println(insertMap);
            qualityProjectDao.insertWeighingInformation(insertMap);
            Map<String,String> carMap = new HashMap<>();
            carMap = qualityProjectDao.selectCarNumByWeighing(insertMap);
            if (null == carMap ){
                //查询半小时内近似车牌
                List<Map<String,String>> carList = qualityProjectDao.selectCarNumByLeaveFactory(insertMap);
                //查询近似值
                if (carList == null || carList.isEmpty()){

                }else {
                    String carNum = insertMap.get("car_num");
                    for (int i = 0; i < carList.size();i++){
                        String temCarNum = carList.get(i).get("car_num");
                        double similarityRatio = CarDateUtil.getSimilarityRatio(carNum, temCarNum);
                        if (similarityRatio > 80 ){
                            carMap = carList.get(i);
                        }
                    }
                }
            }
            if (carMap == null || carMap.isEmpty()){
                amqpTemplate.convertAndSend("","delay_queue",JSON.toJSONString(insertMap));
            }else {
                int updataNum = qualityProjectDao.updateRealTimeCarNumAndProject(String.valueOf(carMap.get("crew_num")),carMap.get("car_num"),String.valueOf(carMap.get("up_time")),String.valueOf(carMap.get("lastTime")),insertMap.get("project_name"));

                //未更新生产数据的情况
                if (updataNum == 0 ){
                    carMap.put("project_name",insertMap.get("project_name"));
                    amqpTemplate.convertAndSend("","realTime_queue",JSON.toJSONString(carMap));
                }

            }

            map.put("code","200");
            map.put("message","接收成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("code","500");
            map.put("message","解析json失败");
        }
        return map;
    }
}
