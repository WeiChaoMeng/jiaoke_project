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
import com.jiaoke.quality.service.ReceiveDataInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *  <一句话功能描述>
 *  质量管理相关跳转Controller
 * @author: Melone
 * @create: 2018/10/8 10:11
 * @Description:
 */
@Controller
public class QualityController {

    @Autowired
    ReceiveDataInf receiveDataInf;


    /**
     *
     * 功能描述: <br>
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


    @RequestMapping("/getLastWeekCrewData.do")
    public String getLastWeekCrewData(){
        return "";
    }

}
