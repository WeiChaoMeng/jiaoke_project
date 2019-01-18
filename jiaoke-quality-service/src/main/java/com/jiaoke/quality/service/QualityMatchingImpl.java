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
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.common.bean.PageBean;
import com.jiaoke.quality.bean.QualityRatioModel;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.dao.QualityMatchingDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

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
    @Override
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


    @Override
    public String insetGrading(String jsonData, String crew1Id, String crew2Id) {

        JSONArray jsonArray = JSON.parseArray(jsonData);

        List<Map<String,String>> list = new ArrayList<>();
        Map<String,String> result = new HashMap<>();


        for (Object obj : jsonArray) {
            JSONObject jsonObject = (JSONObject) obj;
            Map<String,String> map = new HashMap<>();
            String arg1 = jsonObject.getString("筛孔");
            map.put("sieve_pore",arg1);
            String arg2 = jsonObject.getString("六仓");
            map.put("six_warehouse",arg2);
            String arg3 = jsonObject.getString("五仓");
            map.put("five_warehouse",arg3);
            String arg4 = jsonObject.getString("四仓");
            map.put("four_warehouse",arg4);
            String arg5 = jsonObject.getString("三仓");
            map.put("three_warehouse",arg5);
            String arg6 = jsonObject.getString("二仓");
            map.put("two_warehouse",arg6);
            String arg7 = jsonObject.getString("一仓");
            map.put("one_warehouse",arg7);
            String arg8 = jsonObject.getString("矿粉");
            map.put("breeze_grading",arg8);
            String arg9 = jsonObject.getString("粗再生料");
            map.put("rough_regenerate",arg9);
            String arg10 = jsonObject.getString("细再生料");
            map.put("thin_regenerate",arg10);
            String arg11 = jsonObject.getString("添加剂矿料");
            map.put("additive_aggregate",arg11);
            String arg12 = jsonObject.getString("合成级配");
            map.put("compound_grading",arg12);
            String arg13 = jsonObject.getString("中值");
            map.put("mid_value",arg13);
            String arg14 = jsonObject.getString("上限");
            map.put("up_value",arg14);
            String arg15 = jsonObject.getString("下限");
            map.put("down_value",arg15);
            map.put("crew1_id",crew1Id);
            map.put("crew2_id",crew2Id);
            list.add(map);
        }

        if (list.size() != 0){
            qualityMatchingDao.insetGrading(list);
            result.put("messages","success");
        }else {
            result.put("messages","error");
        }

        return JSON.toJSONString(result);
    }
}
