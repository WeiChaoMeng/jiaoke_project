/**
 * FileName: DelayTask
 * author:   Melone
 * Date:     2020/11/19 10:11
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.jiake.utils.CarDateUtil;
import com.jiaoke.quality.dao.QualityProjectDao;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/11/19 10:11
 * @Description:
 */
public class DelayTask implements MessageListener {
    @Resource
    private QualityProjectDao qualityProjectDao;
    @Override
    public void onMessage(Message message) {
        try{
            String receivedMsg = new String(message.getBody(), "UTF-8");
            JSONObject jsonObject = JSONObject.parseObject(receivedMsg);
            Map<String,String> insertMap = JSONObject.parseObject(jsonObject.toString(),new TypeReference<Map<String, String>>(){});
            Map<String,String> carMap = qualityProjectDao.selectCarNumByWeighing(insertMap);
            if (carMap == null || carMap.isEmpty()){
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

            if (carMap != null && carMap.size() > 0){
                int updataNum = qualityProjectDao.updateRealTimeCarNumAndProject(String.valueOf(carMap.get("crew_num")),carMap.get("car_num"),String.valueOf(carMap.get("up_time")),String.valueOf(carMap.get("lastTime")),insertMap.get("project_name"));
            }
            System.out.println("Received : " + receivedMsg);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
