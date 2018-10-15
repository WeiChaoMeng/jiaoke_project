/**
 * FileName: QualityRealTimeWarningImpl
 * author:   Melone
 * Date:     2018/10/15 19:57
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.quality.dao.QualityRealTimeWarningDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/15 19:57
 * @Description:
 */
@Service
public class QualityRealTimeWarningImpl implements  QualityRealTimeWarningInf {

    @Resource
    QualityRealTimeWarningDao qualityRealTimeWarningDao;

    @Override
    public String selectLastWarningData() {

        List<Map<String,String>> list = qualityRealTimeWarningDao.selectLastWarningData();
        String str = "";
        if (list != null){
             str = JSONArray.parseArray(JSONObject.toJSONString(list)).toString();
        }

        return str;
    }
}
