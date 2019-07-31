/**
 * FileName: QualityExperimentalManagerImpl
 * author:   Melone
 * Date:     2019/6/26 11:55
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.jiaoke.quality.dao.QualityExperimentalManagerForeignDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/6/26 11:55
 * @Description:
 */
@Service
public class QualityExperimentalManagerForeignImpl implements  QualityExperimentalManagerForeignInf{

    @Resource
    private QualityExperimentalManagerForeignDao qualityExperimentalManagerForeignDao;

    /**
     *
     * 功能描述: <br>
     *  <查询取样单表单需要的字典数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/26 14:14
     */
    @Override
    public String getSamplingPageFromData() {

        List<Map<String,String>> materiaList = qualityExperimentalManagerForeignDao.getMaterialList();
        List<Map<String,String>> manufacturersList = qualityExperimentalManagerForeignDao.getManufacturersList();
        List<Map<String,String>> specificationList = qualityExperimentalManagerForeignDao.getSpecificationList();


        Map<String,List<Map<String,String>>> res = new HashMap<>();

        res.put("materials",materiaList);
        res.put("manufacturers",manufacturersList);
        res.put("specification",specificationList);

        return JSON.toJSONString(res);
    }


    /**
     *
     * 功能描述: <br>
     *  <查询所有取样单>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/26 14:15
     */
    @Override
    public String getAllSamplingPage() {
        List<Map<String,String>> list = qualityExperimentalManagerForeignDao.selectAllSamplingPage();
        return JSON.toJSONString(list);
    }

    /**
     *
     * 功能描述: <br>
     *  <根据ID删除取样单>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/26 17:38
     */
    @Override
    public String removeSampleById(String id) {
        int res = qualityExperimentalManagerForeignDao.delectSampleById(id);

        Map<String,String> map = new HashMap<>();
        if (res > 0){
            map.put("message","success");
        }else {
            map.put("message","error");
        }

        return JSON.toJSONString(map);
    }

    /**
     *
     * 功能描述: <br>
     *  <添加新的取样单>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/27 10:19
     */
    @Override
    public String addSample(String materials, String manufacturers, String specification, String tunnage, String creat_time, String remark) {
        int res = qualityExperimentalManagerForeignDao.insertSample(materials,manufacturers,specification,tunnage,creat_time,remark);

        Map<String,String> map = new HashMap<>();

        if (res > 0){
            map.put("message","success");
        }else {
            map.put("message","error");
        }

        return JSON.toJSONString(map);
    }

    /**
     *
     * 功能描述: <br>
     *  <确认完成委托单生产委托单、任务单、实验过程>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/27 12:07
     */
    @Override
    public String confirmCompletedById(String id) {
        //获取取样消息
        Map<String,String> map = qualityExperimentalManagerForeignDao.selectSampleMessageById(id);

        //生产委托单

        //生产委托单编号
        //生产日期 用于委托单编号
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String result = sdf.format(new Date());

        //查询当日委托单数量
        String[] dateArray = result.split(" ");

        Map<String,Object>  countMap = qualityExperimentalManagerForeignDao.selectOrderTicketCountByDate(dateArray[0]);

        int count = Integer.parseInt(countMap.get("counts").toString());

        //生产委托编号
        String number = count >= 9? "00" + String.valueOf(count + 1): "000" + String.valueOf(count + 1);
        String[] date = dateArray[0].split("-");
        String orderTicketNum = date[0] + date[1] + date[2] + number;

        //生产试验编号
        String test_num = map.get("logogram_name") + date[0] + number;

        int res = qualityExperimentalManagerForeignDao.insertOrderTicketBySampleMssage(orderTicketNum,String.valueOf(id),result,String.valueOf(map.get("manufacturers_num")),String.valueOf(map.get("specification_num")),String.valueOf(map.get("tunnage")),test_num);

        //返回map
        Map<String,String> resMap = new HashMap<>();
        if (res > 0){
            int i = qualityExperimentalManagerForeignDao.updateSampleMessageById(id);
            if (i > 0){
                resMap.put("message","success");
            }else {
                resMap.put("message","error");
            }

        }else {
            resMap.put("message","error");
        }
        return JSON.toJSONString(resMap);
    }

    /**
     *
     * 功能描述: <br>
     *  <获取所有委托单>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/27 17:05
     */
    @Override
    public String getAllexperimental() {
        List<Map<String,String>> list = qualityExperimentalManagerForeignDao.selectAllexperimental();
        return JSON.toJSONString(list);
    }


    /**
     *
     * 功能描述: <br>
     *  <根据ID查询委托单信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/28 11:45
     */
    @Override
    public String getExperimentalMessageById(String id) {
        Map<String,String> map = qualityExperimentalManagerForeignDao.selectExperimentalMessageById(id);
        return JSON.toJSONString(map);
    }


    /**
     *
     * 功能描述: <br>
     *  <根据委托单编号查询所有试验项目>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/2 10:28
     */
    @Override
    public String getExperimentalItemByOrderNum(String orderNum) {
        List<Map<String,String>> list = qualityExperimentalManagerForeignDao.selectExperimentalItemByOrderNum(orderNum);
        return JSON.toJSONString(list);
    }

    /**
     *
     * 功能描述: <br>
     *  <根据委托单ID查询实验项目信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/2 12:21
     */
    @Override
    public String getExperimentalItemById(String id) {
        List<Map<String,String>> list = qualityExperimentalManagerForeignDao.getExperimentalItemById(id);
        return JSON.toJSONString(list);
    }

    /**
     *
     * 功能描述: <br>
     *  <根据委托单编号，添加试验项目>
     * @param
     * @return 
     * @auther Melone
     * @date 2019/7/2 15:08
     */
    @Override
    public String addExperimentalItemByOrderTicketNum(String orderTicketNum, String experimentalItemId) {
        String[] ids = experimentalItemId.split(",");
        int i = qualityExperimentalManagerForeignDao.addExperimentalItemByOrderTicketNum(orderTicketNum,ids);
        Map<String,String> res = new HashMap<>();
        if (i > 0){

            Map<String,String> map = qualityExperimentalManagerForeignDao.getOrderTicketByOrderTicketNum(orderTicketNum);

            //修改委托单状态
            int update = qualityExperimentalManagerForeignDao.updateOrderTicketByOrderTicketNum(orderTicketNum);

            /*
                        生产任务单、与试验过程
            */
            //生成任务单
            int insertNum = insertTaskList(map);
            //生产实验过程
            int labInsertNum = insertLabReport(map);

            if (insertNum > 0 && labInsertNum > 0){
                res.put("messages","success");
            }else {
                res.put("messages","error");
            }
        }else {
            res.put("messages","error");
        }

        return JSON.toJSONString(res);
    }

    /**
     *
     * 功能描述: <br>
     *  <查询委托单下试验项目数量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/2 16:16
     */
    @Override
    public String getExperimentalItemCount(String orderTicketNum) {
        Map<String,Integer> map = qualityExperimentalManagerForeignDao.selectExperimentalItemCount(orderTicketNum);
        return JSON.toJSONString(map);
    }

    /*************************************任务单Start****************************************************/
    /**
     *
     * 功能描述: <br>
     *  <插入任务单>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/3 11:11
     */
    public int insertTaskList(Map<String,String> map){


        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String result = sdf.format(new Date());

        int res = qualityExperimentalManagerForeignDao.insertTaskList(map.get("order_ticket_num"),
                map.get("test_num"),
                result,
                map.get("materialName"),
                map.get("specificationName"),
                map.get("remark"));

        return res;
    }

    /*************************************任务单End****************************************************/


    /*************************************实验报告单Start****************************************************/

    public int insertLabReport(Map<String,String> map){

        //生产实验编号
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        String result = sdf.format(new Date());
        Map<String,Object> countMap = qualityExperimentalManagerForeignDao.selectLabReportConuntByDateAndMaterials(result,String.valueOf(map.get("materials_num")));
        int count = Integer.parseInt(String.valueOf(countMap.get("counts")));
        String experimentNum;
        if (count < 10){
            experimentNum = result + "-B" + String.valueOf(map.get("logogram_name")) + "-000" + ++count;
        }else if (count < 100){
            experimentNum = result + "-B" +  String.valueOf(map.get("logogram_name")) + "-00" + ++count;
        }else if(count < 1000){
            experimentNum = result + "-B" +  String.valueOf(map.get("logogram_name")) + "-0" + ++count;
        }else {
            experimentNum = result + "-B" +  String.valueOf(map.get("logogram_name")) + "-" + ++count;
        }


        //生产委托单位、
        String entrustingParty = "北京市政路桥建材集团有限公司路驰分公司";

        //生产实验日期
        SimpleDateFormat sdfs = new SimpleDateFormat("yyyy-MM-dd");
        String creatTime = sdfs.format(new Date());


        //查询实验项目
        List<Map<String,String>> experimentItme = qualityExperimentalManagerForeignDao.selectExperimentItme(map.get("order_ticket_num"));

        StringBuffer str = new StringBuffer();

        for(int i = 0; i < experimentItme.size();i++){
            for(String value : experimentItme.get(i).values()){
                if ("".equals(str.toString())){
                    str.append(value);
                }else {
                    String  tem = "、" + value;
                    str.append(tem);
                }

            }
        }

        //生产取样地点
        String samplingSpot = "生产现场";


        //插入实验过程表
        int res = qualityExperimentalManagerForeignDao.insertLabReport(
                experimentNum,
                map.get("order_ticket_num"),
               String.valueOf(map.get("materials_num")) ,
                entrustingParty,
                map.get("manufacturersName"),
                map.get("samplingTime"),
                creatTime,
                str.toString(),
                map.get("logogram_name"),
                samplingSpot,
                map.get("specificationName")
        );

        return res;
    }


    /*************************************实验报告单Start****************************************************/

    /*************************************未完实验Start****************************************************/
    @Override
    public String getAllExperimentalItem() {
        List<Map<String,String>> list = qualityExperimentalManagerForeignDao.selectAllExperimentalItem();
        return JSON.toJSONString(list);
    }

    @Override
    public String getExperimentalItemMsgById(String id) {
        Map<String,String> map  = qualityExperimentalManagerForeignDao.selectExperimentalItemMsgById(id);
        return JSON.toJSONString(map);
    }

    @Override
    public String getExperimentalItemNumList(String id) {
        List<Map<String,String> > map  = qualityExperimentalManagerForeignDao.selectExperimentalItemNumList(id);
        return JSON.toJSONString(map);
    }

    @Override
    public String addExperimentalMsgAndItem(String fromJson,String firstTest,String coarseTest) {
        //分解json为list
        List<Map<String,String>> listObjectSec = JSONArray.parseObject(fromJson,List.class);
        List<Map<String,String>> firstTestList = JSONArray.parseObject(firstTest,List.class);
        List<Map<String,String>> coarseTestList;
        if (coarseTest.isEmpty()){
            coarseTestList = new ArrayList<>();
        }else {
            coarseTestList = JSONArray.parseObject(coarseTest,List.class);
        }


        Map<String,String> insertMap = new HashMap<>();

        //修改实验报告表
        for(Map<String,String> mapList : listObjectSec){
            String val = mapList.get("value");
            String valName = mapList.get("name");
            insertMap.put(valName,val);
        }

        int upRes = qualityExperimentalManagerForeignDao.updateLabReport(insertMap);

        int materialsNum = Integer.parseInt(insertMap.get("materials_num"));
        String experimentNum = insertMap.get("experiment_num");

        //结果集
        int res = 0;
        //根据材料插入实验
        if (firstTestList.size() != 0 || coarseTestList.size() != 0){
            switch (materialsNum){
                //细集料插入方法
                case 1:
                    if (firstTestList.size() != 0 ){
                        res = qualityExperimentalManagerForeignDao.insertFineAggregate(firstTestList,experimentNum);
                    }
                    if (coarseTestList.size() != 0){
                        res = qualityExperimentalManagerForeignDao.insertFineAggregateSieving(coarseTestList,experimentNum);
                    }
                    break;
                //粗集料插入方法
                case 2:
                    if (firstTestList.size() != 0 ){
                        res = qualityExperimentalManagerForeignDao.insertCoarseAggregate(firstTestList,experimentNum);
                    }
                    if (coarseTestList.size() != 0){
                        res = qualityExperimentalManagerForeignDao.insertCoarseAggregateSieving(coarseTestList,experimentNum);
                    }
                    break;
                    //矿粉
                case 3:
                    if (firstTestList.size() != 0 ){
                        res = qualityExperimentalManagerForeignDao.insertBrzzez(firstTestList,experimentNum);
                    }
                    break;
                    //沥青
                case 4:
                    if (firstTestList.size() != 0 ){
                        res = qualityExperimentalManagerForeignDao.insertAsphalt(firstTestList,experimentNum);
                    }
                    if (coarseTestList.size() != 0){
                        res = qualityExperimentalManagerForeignDao.insertAsphalt(coarseTestList,experimentNum);
                    }
                    break;
                default:
                    res = 0;
                    break;
            }
        }

        //返回结果集
        Map<String,String> map = new HashMap<>();

        if (res > 0){
            map.put("message","success");
        }else {
            map.put("message","error");
        }


        return JSON.toJSONString(map);
    }

    @Override
    public String getExperimentalProjectMessage(String id) {
        List<Map<String,String>> res = qualityExperimentalManagerForeignDao.selectExperimentalProjectMessage(id);
        return JSON.toJSONString(res);
    }

    @Override
    public String getExperimentalProjectItem(String tableName, String experiment_num) {
        String[] tables = tableName.split(",");
        Set<String> staffsSet = new HashSet<>(Arrays.asList(tables));

        List<List<Map<String,String>>> res = new ArrayList<>();

        Iterator<String> iterator = staffsSet.iterator();
        while (iterator.hasNext()){
            List<Map<String,String>> list = qualityExperimentalManagerForeignDao.selectExperimentalMsgByTableName(iterator.next(),experiment_num);
            res.add(list);
        }
        res.removeIf(List::isEmpty);

        return JSON.toJSONString(res);
    }

    @Override
    public String removeExperimentalItemById(String id) {
        int res = qualityExperimentalManagerForeignDao.delectExperimentalItemById(id);
        Map<String,String> map = new HashMap<>();
        if (res > 0){
            map.put("message","success");
        }else {
            map.put("message","error");
        }
        return JSON.toJSONString(map);
    }

    @Override
    public String getSevenDayRawMaterialStandingBook() {
        List<Map<String,String>> res = new ArrayList<>();
        //普通试验
        List<Map<String,String>> coarse = qualityExperimentalManagerForeignDao.selectCoarseStandingBook();
        List<Map<String,String>> fine = qualityExperimentalManagerForeignDao.selectFineStandingBook();
        List<Map<String,String>> breeze = qualityExperimentalManagerForeignDao.selectBreezeStandingBook();

        //筛分试验
        List<Map<String,String>> coarseSieving = qualityExperimentalManagerForeignDao.selectCoarseSievingStandingBook();
        List<Map<String,String>> fineSieving = qualityExperimentalManagerForeignDao.selectFineievingStandingBook();

        res.addAll(coarse);
        res.addAll(fine);
        res.addAll(breeze);
        res.addAll(coarseSieving);
        res.addAll(fineSieving);

        return JSON.toJSONString(res);
    }

    @Override
    public String getRawMaterialStandingBookByDate(String startDate, String endDate) {

        List<Map<String,String>> res = new ArrayList<>();
        startDate = startDate.split(" ")[0];
        endDate = endDate.split(" ")[0];

        //普通试验
        List<Map<String,String>> coarse = qualityExperimentalManagerForeignDao.selectCoarseStandingBookByDate(startDate,endDate);
        List<Map<String,String>> fine = qualityExperimentalManagerForeignDao.selectFineStandingBookByDate(startDate,endDate);
        List<Map<String,String>> breeze = qualityExperimentalManagerForeignDao.selectBreezeStandingBookByDate(startDate,endDate);
        //筛分试验
        List<Map<String,String>> coarseSieving = qualityExperimentalManagerForeignDao.selectCoarseSievingStandingBookByDate(startDate,endDate);
        List<Map<String,String>> fineSieving = qualityExperimentalManagerForeignDao.selectFineievingStandingBookByDate(startDate,endDate);

        res.addAll(coarse);
        res.addAll(fine);
        res.addAll(breeze);
        res.addAll(coarseSieving);
        res.addAll(fineSieving);

        return JSON.toJSONString(res);
    }

    @Override
    public String getAsphaltStandingBook() {
        List<Map<String,String>> asphalt = qualityExperimentalManagerForeignDao.selectAsphaltStandingBook();
        return JSON.toJSONString(asphalt);
    }

    @Override
    public String getAsphaltStandingBookByDate(String startDate, String endDate) {
        List<Map<String,String>> asphalt = qualityExperimentalManagerForeignDao.selectAsphaltStandingBookByDate(startDate,endDate);
        return JSON.toJSONString(asphalt);
    }
    /*************************************未完实验End****************************************************/

    /*************************************试验设置End****************************************************/
    @Override
    public String getSpecificationDataAndManufacturersData() {
        List<Map<String,String>> res = qualityExperimentalManagerForeignDao.selectSpecificationDataAndManufacturersData();
        return JSON.toJSONString(res);
    }

    @Override
    public String deleteSpecificationOrManufacturersById(String id, String make) {
        Map<String,String> map = new HashMap<>();
        int res = 0;
        switch (make){
            case "specification":
                res =  qualityExperimentalManagerForeignDao.delectSpecificationById(id);
                break;
            case "manufacturers":
                res =  qualityExperimentalManagerForeignDao.delectManufacturersById(id);
                break;
                default:
                    map.put("message","fail");
        }

        if (res > 0) {
            map.put("message", "success");
        } else {
            map.put("message", "error");
        }

        return JSON.toJSONString(map);
    }

    @Override
    public String insertSpecificationFrom(String specificationName) {
        Map<String,String> map = new HashMap<>();
        int res  =  qualityExperimentalManagerForeignDao.insertSpecification(specificationName);
        if (res > 0){
            map.put("message","success");
        }else {
            map.put("message","error");
        }
        return JSON.toJSONString(map);
    }

    @Override
    public String insertManufacturersFrom(String manufacturersName) {
        Map<String,String> map = new HashMap<>();
        int res  =  qualityExperimentalManagerForeignDao.insertManufacturers(manufacturersName);
        if (res > 0){
            map.put("message","success");
        }else {
            map.put("message","error");
        }
        return JSON.toJSONString(map);
    }

    @Override
    public String getSpecificationOrManufacturersById(String id, String make) {
        Map<String,String> map = new HashMap<>();
        switch (make){
            case "specification":
                map =  qualityExperimentalManagerForeignDao.selectSpecificationById(id);
                break;
            case "manufacturers":
                map =  qualityExperimentalManagerForeignDao.selectManufacturersById(id);
                break;
            default:
                break;
        }
        return JSON.toJSONString(map);
    }

    @Override
    public String updateSpecificationOrManufacturersById(String id, String make, String updateName) {

        Map<String,String> map = new HashMap<>();
        int res = 0;

        switch (make){
            case "specification":
                res =  qualityExperimentalManagerForeignDao.updateSpecificationById(id,updateName);
                break;
            case "manufacturers":
                res =  qualityExperimentalManagerForeignDao.updateManufacturersById(id,updateName);
                break;
            default:
                break;
        }

        if (res > 0){
            map.put("message","success");
        }else {
            map.put("message","error");
        }
        return JSON.toJSONString(map);
    }

    @Override
    public String getSampleStatusById(String id) {
        Map<String,String> map  =  qualityExperimentalManagerForeignDao.selectSampleStatusById(id);
        Map<String,String> res = new HashMap<>();

        if (map.isEmpty()){
            res.put("message","error");
        }else {
             Object status =(Object)map.get("status") ;

            if ("1".equals(status.toString())){
                res.put("message","exist");
            }else {
                res.put("message","empty");
            }

        }

        return JSON.toJSONString(res);
    }

    @Override
    public String getTestStandingBook() {
        List<Map<String,String>> list =  qualityExperimentalManagerForeignDao.selectTestStandingBook();
        return JSON.toJSONString(list);
    }

    @Override
    public String getTestStandingBookByDate(String startDate, String endDate) {
        List<Map<String,String>> list =  qualityExperimentalManagerForeignDao.selectTestStandingBookByDate(startDate,endDate);
        return JSON.toJSONString(list);
    }

    /*************************************试验设置Start****************************************************/

}
