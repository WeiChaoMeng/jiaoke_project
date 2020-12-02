/**
 * FileName: ProductTask
 * author:   Melone
 * Date:     2020/12/2 9:38
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.jiaoke.quality.dao.QualityProjectDao;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;

import javax.annotation.Resource;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/12/2 09:38
 * @Description:
 */
public class ProductTask implements MessageListener {

    @Resource
    private QualityProjectDao qualityProjectDao;
    @Resource
    private AmqpTemplate amqpTemplate;

    @Override
    public void onMessage(Message message) {
        try{
            String receivedMsg = new String(message.getBody(), "UTF-8");
            JSONObject jsonObject = JSONObject.parseObject(receivedMsg);
            Map<String,String> carMap = JSONObject.parseObject(jsonObject.toString(),new TypeReference<Map<String, String>>(){});
            int updataNum = qualityProjectDao.updateRealTimeCarNumAndProject(String.valueOf(carMap.get("crew_num")),carMap.get("car_num"),String.valueOf(carMap.get("up_time")),String.valueOf(carMap.get("lastTime")),carMap.get("project_name"));
            if (updataNum == 0){
                amqpTemplate.convertAndSend("","realTime_queue", JSON.toJSONString(carMap));
            }
            System.out.println("Received : " + receivedMsg);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
