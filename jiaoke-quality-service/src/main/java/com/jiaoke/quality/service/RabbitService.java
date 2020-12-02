/**
 * FileName: RabbitService
 * author:   Melone
 * Date:     2020/5/5 14:41
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSONObject;
import com.jiake.utils.CarDateUtil;
import com.jiake.utils.QualityGetProjectByCarNumUtil;
import com.jiaoke.quality.dao.QualityProjectDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/5/5 14:41
 * @Description:
 */
@Service
public class RabbitService implements MessageListener {
    @Resource
    private QualityProjectDao qualityProjectDao;
    @Override
    public void onMessage(Message message) {
        try {
            String carNum=new String(message.getBody(),"UTF-8");
            //获取设备名称
            JSONObject Json = JSONObject.parseObject(carNum);
            //获取识别车牌号
            String license= Json.getJSONObject("AlarmInfoPlate").getJSONObject("result").getJSONObject("PlateResult").getString("license");
            //固定车牌不用读取
            if ("京A30910".equals(license)){
                return;
            }
            //获取时间
            String recotime= Json.getJSONObject("AlarmInfoPlate").getJSONObject("result").getJSONObject("PlateResult").getString("recotime");
            //获取机组号
            String crewNum = Json.getJSONObject("AlarmInfoPlate").getString("ParkID");
            System.out.println("车号：" + "\n" + Json);
            //获取监控摄像头拍摄到车牌的时间
            String carDate = recotime.split(" ")[0];
            //获取当前机组最后一条车号数据
            String crewId = "data1".equals(crewNum) ? "1":"2";
            //直接查询第一条数据
//            Map<String,Object> lastCarNumMap = qualityProjectDao.selectLastCarNumByCrewNum(crewId);
            //查询距离此时间最近的时间的车号
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
//            qualityProjectDao.insertCarNum(license,recotime,crewId);
            //更新对应数据表(第一步更新，如果第二步更新没查到工程，还可以尝试车号查询工程)
//            qualityProjectDao.updateRealTimeDataByCarNum(license,recotime,fromDate,crewNum);

            Map<String,String> map = QualityGetProjectByCarNumUtil.getErpData(license,carDate);

            //解析ERP传回来的数据
            if (map == null ||!("0".equals(map.get("Result")))){
                qualityProjectDao.insertErrorCarNum(license,recotime);
                return;
            }
            map.put("crewNum",crewId);
            //查看当前该条数据是否已经存入,存入就退出
            Map<String,String> bol = qualityProjectDao.selectLeaveFactory(map);
            if (!bol.isEmpty()){
                return;
            }
            //插入出场单表`quality_leave_factory_history`
            int i = qualityProjectDao.insertLeaveFactory(map);
            //更新读取数据（实时数据）
            qualityProjectDao.updateRealtimeDataByDate(license,recotime,fromDate,crewNum,map.get("gcmc"));
            //更新预警数据(quality_warning_promessage_crew)
            qualityProjectDao.updateWarningDataByDate(license,recotime,fromDate,crewNum,map.get("gcmc"));
            System.out.println("license = " + license);
            System.out.println("carDate = " + carDate);
            System.out.println("carTime = " + recotime);
            System.out.println("lastTime = " + fromDate);
            System.out.println("crewNum = " + crewNum);
            System.out.println("gcmc = " + map.get("gcmc"));
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
