/**
 * FileName: QualityMatchingImpl
 * author:   Melone
 * Date:     2018/10/11 12:34
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSON;
import com.jiaoke.common.bean.PageBean;
import com.jiaoke.quality.bean.QualityRatioModel;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.dao.QualityMatchingDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/11 12:34
 * @Description:
 */
@Service
public class QualityMatchingImpl implements QualityMatchingInf{

    @Resource
    QualityMatchingDao qualityMatchingDao;

    @Override
    public PageBean<QualityRatioModel> selectMatchingMoudelByLimte(int currentPageNum,String url) {

        if ( 0 == currentPageNum ) return null;

        int count = qualityMatchingDao.selectMatchingMoudelDataCount();

        PageBean<QualityRatioModel> pageBean = new PageBean<QualityRatioModel>();
        pageBean.setCurrentPageNum(currentPageNum);
        pageBean.setEachPageDataNum(15);
        pageBean.setDataCountNum(count);
        pageBean.setPageCount(pageBean.getEachPageDataNum(),pageBean.getDataCountNum());
        pageBean.setPageFirstNum(pageBean.getEachPageDataNum(),currentPageNum);
        pageBean.setPageData(qualityMatchingDao.selectMatchingMoudelByLimte(pageBean.getPageFirstNum(),pageBean.getEachPageDataNum()));
        pageBean.setUrl(url);

        return pageBean;
    }
    @Override
    public List<Map<String, String>> selectAdditiveTypeList() {
        List<Map<String, String>> list = qualityMatchingDao.selectAdditiveTypeList();
        return list;
    }
    @Override
    public List<Map<String, String>> selectRegenerateTypeList() {
        List<Map<String, String>> list = qualityMatchingDao.selectRegenerateTypeList();
        return list;
    }



    @Override
    public boolean insetRatioTemplate(QualityRatioTemplate qualityRatioTemplate) {


        //获取创建时间
        Date now = new Date();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        String format = sdf.format(now);


        int id = qualityMatchingDao.insetRatioTemplate(qualityRatioTemplate);

        boolean bo = id > 0? true:false;

        System.out.println(id);

        if (bo){
            Map<String,String> map = new HashMap<String, String>();
            map.put("messageId",String.valueOf(qualityRatioTemplate.getId()));
            map.put("modelName",qualityRatioTemplate.getProName());
            map.put("createTime",format);
            map.put("remaker",qualityRatioTemplate.getRemark());
            map.put("createUser",qualityRatioTemplate.getUpUser());
            int reId = qualityMatchingDao.insertRationCreateMessage(map);
            bo =  reId > 0? true:false;
        }

        return bo;
    }


    /**
     * 根据id传入待删除的配比模板id
     * @param idStr
     * @return
     */
    public String delectRation(String idStr) {

        if(idStr == null || idStr == "") return null;

        String[] strArray =  idStr.split(",");

        int count = qualityMatchingDao.delectRation(strArray);

        String str = count > 0? "success":"fail";

        Map<String,String> map = new HashMap<String, String>();

        map.put("messages",str);

        String reStr = JSON.toJSONString(map);

        return reStr;
    }

    /**
     *
     * 功能描述: <br>
     *  <根据ID返回json字符串>
     * @param [idStr]
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/26 13:24
     */
    @Override
    public String selectRationById(String idStr) {

        if(idStr == null || idStr == "") return null;

        QualityRatioTemplate qualityRatioTemplate = qualityMatchingDao.selectRationById(idStr);

        String jsonStr = JSON.toJSONString(qualityRatioTemplate);

        return jsonStr;
    }
}
