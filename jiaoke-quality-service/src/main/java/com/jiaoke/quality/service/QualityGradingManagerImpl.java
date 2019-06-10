/**
 * FileName: QualityGradingManagerImpl
 * author:   Melone
 * Date:     2019/5/29 17:09
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSON;
import com.jiaoke.quality.dao.QualityGradingManagerDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/5/29 17:09
 * @Description:
 */
@Service
public class QualityGradingManagerImpl implements QualityGradingManagerInf {

    @Resource
    private QualityGradingManagerDao qualityGradingManagerDao;

    @Override
    public String getGradingModelList() {
        List<Map<String,String>> list = qualityGradingManagerDao.selectGradingModelList();
        return JSON.toJSONString(list);
    }

    @Override
    public String delectGrading(String idStr) {
        if(idStr == null || idStr == "") return null;

        String[] strArray =  idStr.split(",");

        int count = qualityGradingManagerDao.delectGrading(strArray);

        String str = count > 0? "success":"fail";

        Map<String,String> map = new HashMap<String, String>();

        map.put("messages",str);

        String reStr = JSON.toJSONString(map);

        return reStr;
    }

    @Override
    public String getGrading(String id) {

        List<Map<String,String>> list = qualityGradingManagerDao.selectGradingByModelId(id);
        return JSON.toJSONString(list);
    }
}
