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
    public String getOldRation() {
        Map<String,String> map = new HashMap<>();
        //查询除去今年，一共有几个年份有模板
        List<Map<String,String>> years =  qualityMatchingDao.selectRationYear();
        //查询历史模板
        List<QualityRatioModel> rationArr = qualityMatchingDao.selectAllRation();

        if (rationArr == null || rationArr.size() == 0){
            map.put("message","error");
            return JSON.toJSONString(map);
        }
        map.put("message","success");
        map.put("rationYear",JSON.toJSONString(years));
        map.put("rationList",JSON.toJSONString(rationArr));
        return JSON.toJSONString(map);
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
    public boolean insetRatioTemplate(Map<String, Object>  map) {


        //获取创建时间
        Date now = new Date();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        String format = sdf.format(now);

        QualityRatioTemplate qualityRatioTemplate = new QualityRatioTemplate();
        qualityRatioTemplate.setProName(map.get("proName").toString());
        qualityRatioTemplate.setCreatTime(format);
        qualityRatioTemplate.setRepertoryOne(Float.parseFloat(map.get("repertoryOne").toString()));
        qualityRatioTemplate.setRepertoryTwo(Float.parseFloat(map.get("repertoryTwo").toString()));
        qualityRatioTemplate.setRepertoryThree(Float.parseFloat(map.get("repertoryThree").toString()));
        qualityRatioTemplate.setRepertoryFour(Float.parseFloat(map.get("repertoryFour").toString()));
        qualityRatioTemplate.setRepertoryFive(Float.parseFloat(map.get("repertoryFive").toString()));
        qualityRatioTemplate.setRepertorySix(Float.parseFloat(map.get("repertorySix").toString()));
        qualityRatioTemplate.setRepertorySeven(Float.parseFloat(map.get("repertorySeven").toString()));
        qualityRatioTemplate.setRepertoryEight(Float.parseFloat(map.get("repertoryEight").toString()));
        qualityRatioTemplate.setRepertoryNine(Float.parseFloat(map.get("repertoryNine").toString()));
        qualityRatioTemplate.setRepertoryTen(Float.parseFloat(map.get("repertoryTen").toString()));
        qualityRatioTemplate.setBreeze(Float.parseFloat(map.get("breeze").toString()));
        qualityRatioTemplate.setBreezeTwo(Float.parseFloat(map.get("breeze2").toString()));
        qualityRatioTemplate.setBreezeThree(Float.parseFloat(map.get("breeze3").toString()));
        qualityRatioTemplate.setBreezeFour(Float.parseFloat(map.get("breeze4").toString()));
        qualityRatioTemplate.setRatioStone(Float.parseFloat(map.get("ratioStone").toString()));
        qualityRatioTemplate.setRatioRegenerate1(Float.parseFloat(map.get("ratioRegenerate1").toString()));
        qualityRatioTemplate.setRatioRegenerate2(Float.parseFloat(map.get("ratioRegenerate2").toString()));
        qualityRatioTemplate.setRatioRegenerate3(Float.parseFloat(map.get("ratioRegenerate3").toString()));
        qualityRatioTemplate.setRatioAdditive(Float.parseFloat(map.get("ratioAdditive").toString()));
        qualityRatioTemplate.setRatioAdditiveTwo(Float.parseFloat(map.get("ratioAdditiveTwo").toString()));
        qualityRatioTemplate.setRatioAdditiveThree(Float.parseFloat(map.get("ratioAdditiveThree").toString()));
        qualityRatioTemplate.setRatioAdditiveFour(Float.parseFloat(map.get("ratioAdditiveFour").toString()));
        qualityRatioTemplate.setTemperatureAsphalt(Integer.parseInt(map.get("temperatureAsphalt").toString()));
        qualityRatioTemplate.setTemperatureAsphaltUp(Integer.parseInt(map.get("temperatureAsphaltUp").toString()));
        qualityRatioTemplate.setTemperatureAggregate(Integer.parseInt(map.get("temperatureAggregate").toString()));
        qualityRatioTemplate.setTemperatureAggregateUp(Integer.parseInt(map.get("temperatureAggregateUp").toString()));
        qualityRatioTemplate.setTemperatureMixture(Integer.parseInt(map.get("temperatureMixture").toString()));
        qualityRatioTemplate.setTemperatureMixtureUp(Integer.parseInt(map.get("temperatureMixtureUp").toString()));
        qualityRatioTemplate.setTemperatureMilling(Integer.parseInt(map.get("temperatureMilling").toString()));
        qualityRatioTemplate.setTemperatureMillingUp(Integer.parseInt(map.get("temperatureMillingUp").toString()));
        qualityRatioTemplate.setCrew1ModeleId(Integer.parseInt(map.get("crew1ModeleId").toString()));
        qualityRatioTemplate.setCrew2ModeleId(Integer.parseInt(map.get("crew2ModeleId").toString()));

        qualityMatchingDao.insetRatioTemplate(qualityRatioTemplate);
        int id = qualityRatioTemplate.getId();
        int rows = qualityMatchingDao.insetWarningTemplateByRationId(map,id);

        boolean bo = id > 0? true:false;

        System.out.println(id);

        if (bo){
            Map<String,String> mapModel = new HashMap<String, String>();
            mapModel.put("messageId",String.valueOf(id));
            mapModel.put("modelName",qualityRatioTemplate.getProName());
            mapModel.put("createTime",format);
            mapModel.put("remaker",map.get("remark").toString());
            mapModel.put("createUser",map.get("upUser").toString());
            int reId = qualityMatchingDao.insertRationCreateMessage(mapModel);
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
     * @param
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/26 13:24
     */
    @Override
    public String selectRationById(String idStr) {

        if(idStr == null || idStr == "") return null;

       Map<String,String> map = qualityMatchingDao.selectRationById(idStr);

        String jsonStr = JSON.toJSONString(map);

        return jsonStr;
    }


    @Override
    public String insetGrading(String jsonData, String crew1Id, String crew2Id,String gradingName,String upUser,String gradingRemaker) {

        JSONArray jsonArray = JSON.parseArray(jsonData);

        List<Map<String,String>> list = new ArrayList<>();
        Map<String,String> result = new HashMap<>();

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = df.format(new Date());

        Map<String,Object> gradingMap = new HashMap<>();
        gradingMap.put("gradingName",gradingName);
        gradingMap.put("upUser",upUser);
        gradingMap.put("gradingRemaker",gradingRemaker);
        gradingMap.put("date",date);
        qualityMatchingDao.insetGradingModel(gradingMap);
        String id = gradingMap.get("id").toString();

        for (Object obj : jsonArray) {
            JSONObject jsonObject = (JSONObject) obj;
            Map<String,String> map = new HashMap<>();
            String sieve = jsonObject.getString("筛孔");
            map.put("sieve_pore",sieve);
            String ten = jsonObject.getString("十仓");
            map.put("ten_warehouse",ten);
            String nine = jsonObject.getString("九仓");
            map.put("nine_warehouse",nine);
            String eight = jsonObject.getString("八仓");
            map.put("eight_warehouse",eight);
            String seven = jsonObject.getString("七仓");
            map.put("seven_warehouse",seven);
            String six = jsonObject.getString("六仓");
            map.put("six_warehouse",six);
            String five = jsonObject.getString("五仓");
            map.put("five_warehouse",five);
            String four = jsonObject.getString("四仓");
            map.put("four_warehouse",four);
            String three = jsonObject.getString("三仓");
            map.put("three_warehouse",three);
            String two = jsonObject.getString("二仓");
            map.put("two_warehouse",two);
            String one = jsonObject.getString("一仓");
            map.put("one_warehouse",one);
            String breeze1 = jsonObject.getString("矿粉1");
            map.put("breeze1_grading",breeze1);
            String breeze2 = jsonObject.getString("矿粉2");
            map.put("breeze2_grading",breeze2);
            String breeze3 = jsonObject.getString("矿粉3");
            map.put("breeze3_grading",breeze3);
            String breeze4 = jsonObject.getString("矿粉4");
            map.put("breeze4_grading",breeze4);
            String arg9 = jsonObject.getString("粗再生料");
            map.put("rough_regenerate",arg9);
            String arg16 = jsonObject.getString("中再生料");
            map.put("middle_regenerate",arg16);
            String arg10 = jsonObject.getString("细再生料");
            map.put("thin_regenerate",arg10);
            String additive1 = jsonObject.getString("添加剂1");
            map.put("additive1_aggregate",additive1);
            String additive2 = jsonObject.getString("添加剂2");
            map.put("additive2_aggregate",additive2);
            String additive3 = jsonObject.getString("添加剂3");
            map.put("additive3_aggregate",additive3);
            String additive4 = jsonObject.getString("添加剂4");
            map.put("additive4_aggregate",additive4);
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
            qualityMatchingDao.insetGrading(list,id);
            result.put("messages","success");
        }else {
            result.put("messages","error");
        }

        return JSON.toJSONString(result);
    }

    @Override
    public Boolean EditRationById(Map<String, Object> qualityRatioTemplate) {
        Map<String,String> map = new HashMap<>();
        if ( null == qualityRatioTemplate){
            map.put("res","error");
            return false;
        }

        qualityMatchingDao.updateRatioById(qualityRatioTemplate);
        map.put("res","success");
        return true;
    }

    @Override
    public String getOldGrading() {
        Map<String,String> map = new HashMap<>();
        //查询除去今年，一共有几个年份有模板
        List<Map<String,String>> years =  qualityMatchingDao.selectGradingYear();
        //查询历史模板
        List<QualityRatioModel> rationArr = qualityMatchingDao.selectAllGrading();

        if (rationArr == null || rationArr.size() == 0){
            map.put("message","error");
            return JSON.toJSONString(map);
        }
        map.put("message","success");
        map.put("rationYear",JSON.toJSONString(years));
        map.put("rationList",JSON.toJSONString(rationArr));
        return JSON.toJSONString(map);
    }
}
