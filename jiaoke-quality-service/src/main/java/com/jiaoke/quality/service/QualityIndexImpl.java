/**
 * FileName: QualityIndexImpl
 * author:   Melone
 * Date:     2018/10/9 17:52
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.quality.dao.QualityIndexDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/9 17:52
 * @Description:
 */
@Service
public class QualityIndexImpl implements QualityIndexInf {

    @Autowired
    QualityIndexDao qualityIndexDao;

    public String getLastWeekCrewData() {

        List<Map<String, String>> lastWeekCrewData = qualityIndexDao.getLastWeekCrewData();

        if (null == lastWeekCrewData) return null;

        String lastWeekCrewDataJson = JSONArray.parseArray(JSONObject.toJSONString(lastWeekCrewData)).toJSONString();

        return lastWeekCrewDataJson;
    }

    public  List<Map<String,String>> getLastProductData() {

        List<Map<String,String>> list = qualityIndexDao.getLastProductData();

        if(null == list) return null;

        return list;
    }
}
