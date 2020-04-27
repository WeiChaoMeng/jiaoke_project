/**
 * FileName: QualityProjectImpl
 * author:   Melone
 * Date:     2019/11/14 16:59
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSONObject;
import com.jiake.utils.QualityGetProjectByCarNumUtil;
import com.jiaoke.quality.bean.QualityProjectItem;
import com.jiaoke.quality.dao.QualityProjectDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/11/14 16:59
 * @Description:
 */
@Service
public class QualityProjectImpl implements QualityProjectInf {

    @Resource
    private QualityProjectDao qualityProjectDao;

    @Override
    public int addProjectItem(QualityProjectItem fromData) {
        int res = qualityProjectDao.insertProjectItem(fromData);
        return res;
    }

    @Override
    public List<QualityProjectItem> getUserProjectList() {
        List<QualityProjectItem> list = qualityProjectDao.selectUserProjectList();
        return list;
    }

    @Override
    public QualityProjectItem getUserProjectById(String id) {
        QualityProjectItem list = qualityProjectDao.selectUserProjectById(id);
        return list;
    }

    @Override
    public int delectUserProject(String idStr) {
        int res  = qualityProjectDao.delectUserProject(idStr);
        return res;
    }

    @Override
    public int delectUserProjectByIdArray(String[] idArr) {
        int res  = qualityProjectDao.delectUserProjectByIdArray(idArr);
        return res;
    }

    @Override
    public int editProjectItem(QualityProjectItem fromData) {
        int res  = qualityProjectDao.updateProjectItem(fromData);
        return res;
    }

    @Override
    public  void editProductionDataByCarNum(String carNum) throws ExecutionException, InterruptedException,ParseException {
        //获取设备名称
        JSONObject Json = JSONObject.parseObject(carNum);
        //获取识别车牌号
        String license= Json.getJSONObject("AlarmInfoPlate").getJSONObject("result").getJSONObject("PlateResult").getString("license");
        //获取时间
        String recotime= Json.getJSONObject("AlarmInfoPlate").getJSONObject("result").getJSONObject("PlateResult").getString("recotime");
        //获取机组号
        String crewNum = Json.getJSONObject("AlarmInfoPlate").getString("ParkID");
        System.out.println("车号：" + "\n" + carNum);
        //获取监控摄像头拍摄到车牌的时间
        String carDate = recotime.split(" ")[0];
        //获取当前机组最后一条车号数据
        String crewId = "data1".equals(crewNum) ? "1":"2";
        Map<String,Object> lastCarNumMap = qualityProjectDao.selectLastCarNumByCrewNum(crewId);
        //根据时间差值与车号对比确认是否是重复数据
        SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String fromDate = simpleFormat.format(lastCarNumMap.get("upTime"));
        String toDate = simpleFormat.format(simpleFormat.parse(recotime));
        long from = simpleFormat.parse(fromDate).getTime();
        long to = simpleFormat.parse(toDate).getTime();
        int minutes = (int) ((to - from)/(1000 * 60));
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
        String licenseHerd = locenseArry[0];
        String licenseTail = locenseArry[locenseArry.length - 1];
        if (!("京".equals(licenseHerd)) ||  QualityGetProjectByCarNumUtil.isContainChinese(licenseTail)){
            return;
        }

        //存入车牌识别表
        int insertCarId = qualityProjectDao.insertCarNum(license,recotime,crewId);
        //更新对应数据表
        String lastTime = fromDate.split(" ")[1];
        String carTime = toDate.split(" ")[1];
        qualityProjectDao.updateRealTimeDataByCarNum(license,carDate,carTime,lastTime,crewNum);
        //接入erp查询出厂单
        //正常模式
        String res = QualityGetProjectByCarNumUtil.getErpData(license,carDate);
        //多线程模式
//        Future<String> f =  ThreadPoolUtil.getInstance().submit(() ->{
//            String ghqrd = QualityGetProjectByCarNumUtil.getErpData(license,carDate);
//            return ghqrd;
//        });
//        String res = f.get();
        Map<String,String> map = (Map)JSONObject.parse(res);
        //解析ERP传回来的数据
        if (map == null ||!("0".equals(map.get("Result")))){
            return;
        }
        map.put("crewNum",crewId);
        //插入出场单表`quality_leave_factory_history`
        int i = qualityProjectDao.insertLeaveFactory(map);

        //第一条车盘识别数据处理逻辑（lastCarNumMap为NULL时）
        if (lastCarNumMap == null || lastCarNumMap.size()<1){
            //根据机组与日期更新生产数据
//            qualityProjectDao.updateRealtimeDataByCrewAndDate(license,carDate,crewNum);
            //最后一条为Null时打印错误
            System.out.println("最后一条错误");
        }else {
            //更新读取数据
            qualityProjectDao.updateRealtimeDataByDate(license,carDate,carTime,lastTime,crewNum,map.get("gcmc"));
            System.out.println("license = " + license);
            System.out.println("carDate = " + carDate);
            System.out.println("carTime = " + carTime);
            System.out.println("lastTime = " + lastTime);
            System.out.println("crewNum = " + crewNum);
            System.out.println("gcmc = " + map.get("gcmc"));

        }
    }
}
