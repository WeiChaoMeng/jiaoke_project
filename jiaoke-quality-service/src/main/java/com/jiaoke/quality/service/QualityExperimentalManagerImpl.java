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
import com.alibaba.fastjson.JSONObject;
import com.jiake.utils.QualityDataMontoringUtil;
import com.jiake.utils.QualityGradingUtil;
import com.jiake.utils.RandomUtil;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.dao.QualityDataManagerDao;
import com.jiaoke.quality.dao.QualityDataMontoringDao;
import com.jiaoke.quality.dao.QualityExperimentalManagerDao;
import org.activiti.engine.*;
import org.activiti.engine.runtime.ProcessInstance;
import org.apache.logging.log4j.util.Strings;
import org.apache.shiro.SecurityUtils;
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
public class QualityExperimentalManagerImpl implements  QualityExperimentalManagerInf{

    @Resource
    private QualityExperimentalManagerDao qualityExperimentalManagerDao;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Resource
    private HistoryService historyService;

    @Resource
    private RuntimeService runtimeService;

    @Resource
    private TaskService taskService;

    @Resource
    private QualityDataManagerDao qualityDataManagerDao;

    @Resource
    private QualityDataMontoringDao qualityDataMontoringDao;

    /**
     * 获取当前登录用户信息
     *
     * @return userInfo
     */
    private UserInfo getCurrentUser() {
        return (UserInfo) SecurityUtils.getSubject().getPrincipal();
    }

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

        List<Map<String,String>> materiaList = qualityExperimentalManagerDao.getMaterialList();
        List<Map<String,String>> manufacturersList = qualityExperimentalManagerDao.getManufacturersList();
        List<Map<String,String>> specificationList = qualityExperimentalManagerDao.getSpecificationList();


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
        List<Map<String,String>> list = qualityExperimentalManagerDao.selectAllSamplingPage();
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
        int res = qualityExperimentalManagerDao.delectSampleById(id);

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
        int res = qualityExperimentalManagerDao.insertSample(materials,manufacturers,specification,tunnage,creat_time,remark);

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
        Map<String,String> map = qualityExperimentalManagerDao.selectSampleMessageById(id);

        //生产委托单

        //生产委托单编号
        //生产日期 用于委托单编号
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String result = sdf.format(new Date());

        //查询本年委托单数量
        String[] dateArray = result.split(" ");
        String year = dateArray[0].split("-")[0];

        Map<String,Integer> countMap = qualityExperimentalManagerDao.selectLastOrderTicketByDate(year);

        int count = 0 ;
        if (countMap != null){
            count = countMap.get("counts");
        }

        //生产委托编号
        String number = count >= 9? "00" + String.valueOf(count + 1): "000" + String.valueOf(count + 1);
        String[] date = dateArray[0].split("-");
        String orderTicketNum = date[0] + date[1] + date[2] + number;

        //生产试验编号
        Map<String,Object>  logogramCount = qualityExperimentalManagerDao.selectOrderTicketCountByDateAndLogogramName(year,map.get("logogram_name"));
        int testCount = Integer.parseInt(logogramCount.get("counts").toString());
        String testNumber = testCount >= 9? "00" + String.valueOf(testCount + 1): "000" + String.valueOf(testCount + 1);

        String test_num = map.get("logogram_name") + date[0] + testNumber;

        int res = qualityExperimentalManagerDao.insertOrderTicketBySampleMssage(orderTicketNum,String.valueOf(id),result,String.valueOf(map.get("manufacturers_num")),String.valueOf(map.get("specification_num")),String.valueOf(map.get("tunnage")),test_num);

        //返回map
        Map<String,String> resMap = new HashMap<>();
        if (res > 0){
            int i = qualityExperimentalManagerDao.updateSampleMessageById(id);
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
        List<Map<String,String>> list = qualityExperimentalManagerDao.selectAllexperimental();
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
        Map<String,String> map = qualityExperimentalManagerDao.selectExperimentalMessageById(id);
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
        List<Map<String,String>> list = qualityExperimentalManagerDao.selectExperimentalItemByOrderNum(orderNum);
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
        List<Map<String,String>> list = qualityExperimentalManagerDao.getExperimentalItemById(id);
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
        int i = qualityExperimentalManagerDao.addExperimentalItemByOrderTicketNum(orderTicketNum,ids);
        Map<String,String> res = new HashMap<>();
        if (i > 0){

            Map<String,String> map = qualityExperimentalManagerDao.getOrderTicketByOrderTicketNum(orderTicketNum);

            //修改委托单状态
            int update = qualityExperimentalManagerDao.updateOrderTicketByOrderTicketNum(orderTicketNum);

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
        Map<String,Integer> map = qualityExperimentalManagerDao.selectExperimentalItemCount(orderTicketNum);
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

        int res = qualityExperimentalManagerDao.insertTaskList(map.get("order_ticket_num"),
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
        Map<String,Object> countMap = qualityExperimentalManagerDao.selectLabReportConuntByDateAndMaterials(result,String.valueOf(map.get("materials_num")));

        String countStr;
        String experimentNum;
        int count = 0;

        if (countMap != null ){
            countStr = countMap.get("experiment_num").toString();
            String[] countArray = countStr.split("-");
            countStr = countArray[countArray.length -1];
            count = Integer.parseInt(countStr);
        }

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
        List<Map<String,String>> experimentItme = qualityExperimentalManagerDao.selectExperimentItme(map.get("order_ticket_num"));

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
        int res = qualityExperimentalManagerDao.insertLabReport(
                //随机id
                RandomUtil.randomId(),
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
        List<Map<String,String>> list = qualityExperimentalManagerDao.selectAllExperimentalItem();
        return JSON.toJSONString(list);
    }

    @Override
    public String getExperimentalItemMsgById(String id) {
        Map<String,String> map  = qualityExperimentalManagerDao.selectExperimentalItemMsgById(id);
        map.put("nickname",getCurrentUser().getNickname());
        return JSON.toJSONString(map);
    }

    @Override
    public String getExperimentalItemNumList(String id) {
        List<Map<String,String> > map  = qualityExperimentalManagerDao.selectExperimentalItemNumList(id);
        return JSON.toJSONString(map);
    }

    @Override
    public String addExperimentalMsgAndItem(String fromJson,String firstTest,String coarseTest) {
        //分解json为list
        List<Map<String,String>> listObjectSec = JSONArray.parseObject(fromJson,List.class);
        List<Map<String,String>> firstTestList = JSONArray.parseObject(firstTest,List.class);
        List<Map<String,String>> coarseTestList;
        System.out.println(listObjectSec);
        System.out.println(firstTestList);

        if (coarseTest.isEmpty()){
            coarseTestList = new ArrayList<>();
        }else {
            coarseTestList = JSONArray.parseObject(coarseTest,List.class);
        }



        Map<String,String> insertMap = new HashMap<>();
        //暂存实验数据主键
        String id = "";
        //暂存样品名称、规格，APP审批使用
        String materialsName = "";
        String samplingStandard = "";

        //修改实验报告表
        for(Map<String,String> mapList : listObjectSec){
            String val = mapList.get("value");
            String valName = mapList.get("name");
            if ("Id".equals(valName)){
                id = val;
            }else if("materials_name".equals(valName)){
                materialsName = val;
            }else if("sampling_standard".equals(valName)){
                samplingStandard = val;
            }
            insertMap.put(valName,val);
        }

        int upRes = qualityExperimentalManagerDao.updateLabReport(insertMap);

        System.out.println(upRes);

        /**--------------审批使用s--------------------*/
        if (upRes > 0) {
            //检查数据是否存在，避免重复添加
            if (oaCollaborationMapper.selectOne(id) == null) {
                OaCollaboration collaboration = new OaCollaboration();
                collaboration.setTitle("实验报告");
                collaboration.setPromoter(getCurrentUser().getId());
                collaboration.setTable("quality_test_lab_report");
                collaboration.setCorrelationId(id);
                collaboration.setUrl("ExperimentalItems.do");
                collaboration.setState(0);
                collaboration.setStatusCode("协同");
                collaboration.setCreateTime(new Date());
                collaboration.setName("实验报告");
                collaboration.setDataOne("样品名称:" + materialsName);
                collaboration.setDataTwo("样品规格:" + samplingStandard);

                //添加成功后开启流程
                if (oaCollaborationMapper.insertData(collaboration) > 0) {

                    Map<String, Object> map = new HashMap<>(16);
                    List<Object> experimentReviewerList = new ArrayList<>();
                    List<UserInfo> userInfoList = userInfoMapper.selectMultipleByPermission("experimentReviewer");
                    for (UserInfo userInfo : userInfoList) {
                        experimentReviewerList.add(userInfo.getId());
                    }
//                    UserInfo userInfo = userInfoMapper.selectByPermission("experimentReviewer");
                    map.put("check_person_list", experimentReviewerList);
                    //businessKey格式为 mysql表名：新增数据id
                    ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();
                    processEngine.getIdentityService().setAuthenticatedUserId(getCurrentUser().getId().toString());
                    //开启流程实例
                    processEngine.getRuntimeService().startProcessInstanceByKey("qc_experimental3", "quality_test_lab_report:" + id, map);
                }

            }
        }
        /**--------------审批使用e--------------------*/

        int materialsNum = Integer.parseInt(insertMap.get("materials_num"));
        String experimentNum = insertMap.get("experiment_num");
        System.out.println("权限完成");
        //结果集
        int res = 0;
        //根据材料插入实验
        if (firstTestList.size() != 0 || coarseTestList.size() != 0){
              switch (materialsNum){
                //细集料插入方法
                case 1:
                    if (firstTestList.size() != 0 ){
                        res = qualityExperimentalManagerDao.insertFineAggregate(firstTestList,experimentNum);
                    }
                    if (coarseTestList.size() != 0){
                        res = qualityExperimentalManagerDao.insertFineAggregateSieving(coarseTestList,experimentNum);
                    }
                    break;
                //粗集料插入方法
                case 2:
                    if (firstTestList.size() != 0 ){
                        res = qualityExperimentalManagerDao.insertCoarseAggregate(firstTestList,experimentNum);
                    }
                    if (coarseTestList.size() != 0){
                        res = qualityExperimentalManagerDao.insertCoarseAggregateSieving(coarseTestList,experimentNum);
                    }
                    break;
                    //矿粉
                case 3:
                    if (firstTestList.size() != 0 ){
                        res = qualityExperimentalManagerDao.insertBrzzez(firstTestList,experimentNum);
                    }
                    break;
                    //沥青
                case 4:
                    if (firstTestList.size() != 0 ){
                        res = qualityExperimentalManagerDao.insertAsphalt(firstTestList,experimentNum);
                    }
                    if (coarseTestList.size() != 0){
                        res = qualityExperimentalManagerDao.insertAsphalt(coarseTestList,experimentNum);
                    }
                    break;
                    //粗刨铣料插入方法
                case 5:
                    if (firstTestList.size() != 0 ){
                        res = qualityExperimentalManagerDao.insertCoarseMilling(firstTestList,experimentNum);
                    }
                    if (coarseTestList.size() != 0){
                        res = qualityExperimentalManagerDao.insertCoarseMillingBurn(coarseTestList,experimentNum);
                    }
                    break;
                //岩沥青插入方法
                case 6:
                    if (firstTestList.size() != 0 ){
                        res = qualityExperimentalManagerDao.insertRock(firstTestList,experimentNum);
                    }
                    if (coarseTestList.size() != 0){
                        res = qualityExperimentalManagerDao.insertRockBurn(coarseTestList,experimentNum);
                    }
                    break;
                //纤维插入方法
                case 7:
                    if (firstTestList.size() != 0 ){
                        res = qualityExperimentalManagerDao.insertFibre(firstTestList,experimentNum);
                    }
                    break;
                //乳化沥青插入方法
                case 8:
                    if (firstTestList.size() != 0 ){
                        res = qualityExperimentalManagerDao.insertEmulsified(firstTestList,experimentNum);
                    }
                    break;
                //沥青混合料插入方法
                case 9:
                    if (firstTestList.size() != 0 ){
                        res = qualityExperimentalManagerDao.insertMixture(firstTestList,experimentNum);
                    }
                    if (coarseTestList.size() != 0){
                        res = qualityExperimentalManagerDao.insertMixtureBurn(coarseTestList,experimentNum);
                    }
                    break;
                //细刨铣料插入方法
                case 10:
                    if (firstTestList.size() != 0 ){
                        res = qualityExperimentalManagerDao.insertFineMilling(firstTestList,experimentNum);
                    }
                    if (coarseTestList.size() != 0){
                        res = qualityExperimentalManagerDao.insertFineMillingBurn(coarseTestList,experimentNum);
                    }
                    break;
                default:
                    res = 0;
                    break;
            }
        }
        System.out.println("插入完成");
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
        List<Map<String,String>> res = qualityExperimentalManagerDao.selectExperimentalProjectMessage(id);
        return JSON.toJSONString(res);
    }

    @Override
    public String getExperimentalProjectItem(String tableName, String experiment_num) {
        String[] tables = tableName.split(",");
        Set<String> staffsSet = new HashSet<>(Arrays.asList(tables));

        List<List<Map<String,String>>> res = new ArrayList<>();

        Iterator<String> iterator = staffsSet.iterator();
        while (iterator.hasNext()){
            List<Map<String,String>> list = qualityExperimentalManagerDao.selectExperimentalMsgByTableName(iterator.next(),experiment_num);
            res.add(list);
        }
        res.removeIf(List::isEmpty);

        return JSON.toJSONString(res);
    }

    @Override
    public String removeExperimentalItemById(String id) {
        int res = qualityExperimentalManagerDao.delectExperimentalItemById(id);

        //删除协同表中数据和activiti相关数据
        //查询数据是否开启流程
        OaCollaboration collaboration = oaCollaborationMapper.selectOne(id);
        if (collaboration != null){
            //删除协同表中数据
            oaCollaborationMapper.deleteByCorrelationId(id);

            //根据业务键查询流程实例Id
            String processInstanceId = historyService.createHistoricProcessInstanceQuery().processInstanceBusinessKey("quality_test_lab_report:" + id).singleResult().getId();
            //1.判断流程是否结束
            ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
            //流程已结束
            if (processInstance == null) {
                historyService.deleteHistoricProcessInstance(processInstanceId);
                taskService.deleteComments("", processInstanceId);
            } else {
                //流程未结束
                runtimeService.deleteProcessInstance(processInstanceId, "");
                historyService.deleteHistoricProcessInstance(processInstanceId);
                taskService.deleteComments("", processInstanceId);
            }
        }

        Map<String,String> map = new HashMap<>();
        if (res > 0){
            map.put("message","success");
        }else {
            map.put("message","error");
        }
        return JSON.toJSONString(map);
    }


    @Override
    public String getSevenDayCoarseStandingBook() {
        List<Map<String,String>> coarse = qualityExperimentalManagerDao.selectSevenDayCoarseBook();
        return JSON.toJSONString(coarse);
    }

    @Override
    public String getSevenDayFineStandingBook() {
        List<Map<String,String>> fine = qualityExperimentalManagerDao.selectSevenDayFineStandingBook();
        return JSON.toJSONString(fine);
    }

    @Override
    public String getSevenDayRawMaterialStandingBook() {
        Map<String,List<Map<String,String>>> res = new HashMap<>();
        //普通试验
        List<Map<String,String>> coarse = qualityExperimentalManagerDao.selectCoarseStandingBook();
        List<Map<String,String>> fine = qualityExperimentalManagerDao.selectFineStandingBook();
        List<Map<String,String>> breeze = qualityExperimentalManagerDao.selectBreezeStandingBook();

        //筛分试验
        List<Map<String,String>> coarseSieving = qualityExperimentalManagerDao.selectCoarseSievingStandingBook();
        List<Map<String,String>> fineSieving = qualityExperimentalManagerDao.selectFineievingStandingBook();

        res.put("coarse",coarse);
        res.put("fine",fine);
        res.put("breeze",breeze);
        res.put("coarseSieving",coarseSieving);
        res.put("fineSieving",fineSieving);

        return JSON.toJSONString(res);
    }

    @Override
    public String getRawMaterialStandingBookByDate(String startDate, String endDate) {

        List<Map<String,String>> res = new ArrayList<>();
        startDate = startDate.split(" ")[0];
        endDate = endDate.split(" ")[0];

        //普通试验
        List<Map<String,String>> coarse = qualityExperimentalManagerDao.selectCoarseStandingBookByDate(startDate,endDate);
        List<Map<String,String>> fine = qualityExperimentalManagerDao.selectFineStandingBookByDate(startDate,endDate);
        List<Map<String,String>> breeze = qualityExperimentalManagerDao.selectBreezeStandingBookByDate(startDate,endDate);
        //筛分试验
        List<Map<String,String>> coarseSieving = qualityExperimentalManagerDao.selectCoarseSievingStandingBookByDate(startDate,endDate);
        List<Map<String,String>> fineSieving = qualityExperimentalManagerDao.selectFineievingStandingBookByDate(startDate,endDate);

        res.addAll(coarse);
        res.addAll(fine);
        res.addAll(breeze);
        res.addAll(coarseSieving);
        res.addAll(fineSieving);

        return JSON.toJSONString(res);
    }

    @Override
    public String searchStandingBook(String fromData) {
        List<Map<String,String>> list = JSON.parseObject(fromData,List.class);
        Map<String,String> map = new HashMap<>();
        List<Map<String,String>> tatleArry = new ArrayList<>();
        Map<String,Object> result = new HashMap<>();
        for (int i = 0; i < list.size();i++){
            map.put(list.get(i).get("name"),list.get(i).get("value"));
        }
        List<Map<String,Object>> res = new ArrayList<>();
        switch (map.get("materials")){
            case "1":
                //细集料根据日期查询
                res = qualityExperimentalManagerDao.selectFineAggregateStandingBookByDate(map.get("startDate"),map.get("endDate"),map.get("materials"),map.get("specification"),map.get("manufacturers"));
                break;
            case "2":
                res = qualityExperimentalManagerDao.selectCoarseAggregateStandingBookByDate(map.get("startDate"),map.get("endDate"),map.get("materials"),map.get("specification"),map.get("manufacturers"));
                break;
            case "3":
                res = qualityExperimentalManagerDao.selectBreezeBookByDate(map.get("startDate"),map.get("endDate"),map.get("materials"),map.get("specification"),map.get("manufacturers"));
                break;
            case "4":
                res = qualityExperimentalManagerDao.selectAsphaltStandingByDate(map.get("startDate"),map.get("endDate"),map.get("materials"),map.get("specification"),map.get("manufacturers"));
                 tatleArry = qualityExperimentalManagerDao.getAsphaltStandingBookTatleByDate(map.get("startDate"),map.get("endDate"),map.get("materials"),map.get("specification"),map.get("manufacturers"));
                break;
            case "5":
                res = qualityExperimentalManagerDao.selectCoarseMillingStandingByDate(map.get("startDate"),map.get("endDate"),map.get("materials"),map.get("specification"),map.get("manufacturers"));
                break;
            case "6":
                res = qualityExperimentalManagerDao.selectRockStandingByDate(map.get("startDate"),map.get("endDate"),map.get("materials"),map.get("specification"),map.get("manufacturers"));
                break;
            case "7":
                res = qualityExperimentalManagerDao.selectFibreStandingByDate(map.get("startDate"),map.get("endDate"),map.get("materials"),map.get("specification"),map.get("manufacturers"));
                break;
            case "8":
                res = qualityExperimentalManagerDao.selectEmulsifiedStandingByDate(map.get("startDate"),map.get("endDate"),map.get("materials"),map.get("specification"),map.get("manufacturers"));
                break;
            case "9":
                res = qualityExperimentalManagerDao.selectMixtureStandingByDate(map.get("startDate"),map.get("endDate"),map.get("materials"),map.get("specification"),map.get("manufacturers"));
                break;
            case "10":
                res = qualityExperimentalManagerDao.selectFineMillingStandingByDate(map.get("startDate"),map.get("endDate"),map.get("materials"),map.get("specification"),map.get("manufacturers"));
                break;
                default:
                    break;


        }

        result.put("tatleArry",tatleArry);
        result.put("dalist",res);
        return JSON.toJSONString(result);
    }

    @Override
    public String getAsphaltStandingBook() {
        List<Map<String,String>> asphalt = qualityExperimentalManagerDao.selectAsphaltStandingBook();
        return JSON.toJSONString(asphalt);
    }

    @Override
    public String getAsphaltStandingBookByDate(String startDate, String endDate) {
        List<Map<String,String>> asphalt = qualityExperimentalManagerDao.selectAsphaltStandingBookByDate(startDate,endDate);
        return JSON.toJSONString(asphalt);
    }

    @Override
    public String getSevenDayBreezeStandingBook() {
        List<Map<String,String>> breeze = qualityExperimentalManagerDao.getSevenDayBreezeStandingBook();
        return JSON.toJSONString(breeze);
    }

    @Override
    public String getSevenDayAsphaltStandingBook() {
        Map<String,Object> map = new HashMap<>();
        List<Map<String,String>> asphalt = qualityExperimentalManagerDao.getSevenDayAsphaltStandingBook();
        List<Map<String,String>> tatleArry = qualityExperimentalManagerDao.getSevenDayAsphaltStandingBookTatle();
        map.put("asphaltArry",asphalt);
        map.put("tatleArry",tatleArry);
        return JSON.toJSONString(map);
    }

    /*************************************未完实验End****************************************************/

    @Override
    public int updateExperimentalItemApproval(String id, String chargePerson, String checkPerson, Integer noticeDep, String noticeDepStr) {
        return qualityExperimentalManagerDao.updateExperimentalApproval(id,chargePerson,checkPerson,noticeDep,noticeDepStr);
    }

    @Override
    public int deleteExperimentalItemById(String id) {
        if (qualityExperimentalManagerDao.delectExperimentalItemById(id) < 0) {
            return -1;
        }else {
            if (oaCollaborationMapper.deleteByCorrelationId(id) < 0){
                return -1;
            }else {
                return 1;
            }
        }
    }

    @Override
    public int updateExperimentalItemStateById(String id,Integer state) {
        return qualityExperimentalManagerDao.updateExperimentalItemStateById(id,state);
    }
    /*************************************试验设置End****************************************************/
    @Override
    public String getSpecificationDataAndManufacturersData() {
        List<Map<String,String>> res = qualityExperimentalManagerDao.selectSpecificationDataAndManufacturersData();
        return JSON.toJSONString(res);
    }

    @Override
    public String deleteSpecificationOrManufacturersById(String id, String make) {
        Map<String,String> map = new HashMap<>();
        int res = 0;
        switch (make){
            case "specification":
                res =  qualityExperimentalManagerDao.delectSpecificationById(id);
                break;
            case "manufacturers":
                res =  qualityExperimentalManagerDao.delectManufacturersById(id);
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
        int res  =  qualityExperimentalManagerDao.insertSpecification(specificationName);
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
        int res  =  qualityExperimentalManagerDao.insertManufacturers(manufacturersName);
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
                map =  qualityExperimentalManagerDao.selectSpecificationById(id);
                break;
            case "manufacturers":
                map =  qualityExperimentalManagerDao.selectManufacturersById(id);
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
                res =  qualityExperimentalManagerDao.updateSpecificationById(id,updateName);
                break;
            case "manufacturers":
                res =  qualityExperimentalManagerDao.updateManufacturersById(id,updateName);
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
        Map<String,String> map  =  qualityExperimentalManagerDao.selectSampleStatusById(id);
        Map<String,String> res = new HashMap<>();

        if (map == null || map.isEmpty()){
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
        List<Map<String,String>> list =  qualityExperimentalManagerDao.selectTestStandingBook();
        return JSON.toJSONString(list);
    }

    @Override
    public String getTestStandingBookByDate(String startDate, String endDate) {
        List<Map<String,String>> list =  qualityExperimentalManagerDao.selectTestStandingBookByDate(startDate,endDate);
        return JSON.toJSONString(list);
    }

    @Override
    public String getMobileUnfinishedExperimental() {
        List<Map<String,String>> list = qualityExperimentalManagerDao.selectMobileUnfinishedExperimental();
        return JSON.toJSONString(list);
    }

    @Override
    public String getLastWeekExperimentHistory() {
        List<Map<String,String>> list = qualityExperimentalManagerDao.selectLastWeekExperimentHistory();
        return JSON.toJSONString(list);
    }

    @Override
    public String getMobileExperimentByDate(String startDate) {
        List<Map<String,String>> list = qualityExperimentalManagerDao.selectMobileExperimentByDate(startDate);
        return JSON.toJSONString(list);
    }

    @Override
    public String getMaterialsAndManufacturersMsg() {
        Map<String,String> map = new HashMap<>();
        List<Map<String,String>> materialsList = qualityExperimentalManagerDao.selectMaterials();
        List<Map<String,String>> manufacturersList = qualityExperimentalManagerDao.selectManufacturers();
        map.put("materials",JSON.toJSONString(materialsList));
        map.put("manufacturers",JSON.toJSONString(manufacturersList));
        return JSON.toJSONString(map);
    }

    @Override
    public String addMaterialsAndManufacturers(String fromData) {
        Map<String,String> map = new HashMap<>();
        JSONObject jsonObject = JSONObject.parseObject(fromData);
        HashMap<String, String> maps = JSONObject.parseObject(jsonObject.toString(), HashMap.class);
        List<Map<String,String>> list = new ArrayList<>();
        List<Map<String,String>> manufacturersList = qualityExperimentalManagerDao.selectManufacturers();
        String materialsId = String.valueOf(maps.get("materialsSelect"));
        for (int i = 0; i < manufacturersList.size();i++){
            Map<String,String> map1 = new HashMap<>();
            String check =  String.valueOf(maps.get("check_" + i));
            if ( "null".equals(check) ){
                continue;
            }
            map1.put("materialsId",materialsId);
            map1.put("checkId",check);
            list.add(map1);
        }

        if (list.size() == 0){
            map.put("message","error");
            return JSON.toJSONString(map);
        }

        int res = qualityExperimentalManagerDao.insertMaterialsAndManufacturers(list);
        if (res > 0){
            map.put("message","success");
        }else {
            map.put("message","error");
        }
        return JSON.toJSONString(map);
    }

    @Override
    public String getMaterialsMatchupManufacturers() {
        List<Map<String,String>> list = qualityExperimentalManagerDao.selectMaterialsMatchupManufacturers();
        return JSON.toJSONString(list);
    }

    @Override
    public String deleteMaterialAndManufacturersById(String id) {
        Map<String,String> map = new HashMap<>();
        int res = qualityExperimentalManagerDao.deleteMaterialAndManufacturersById(id);
        if (res > 0){
            map.put("message","success");
        }else {
            map.put("message","error");
        }
        return JSON.toJSONString(map);
    }

    @Override
    public String getManufacturersByMaterials(String id) {
        Map<String,Object> map = new HashMap<>();
        List<Map<String,String>> list = qualityExperimentalManagerDao.selectManufacturersByMaterials(id);
        if (list == null || list.size() == 0){
            map.put("message","error");
        }else {
            map.put("message","success");
            map.put("dataArry",list);
        }
        return JSON.toJSONString(map);
    }
    /*************************************试验设置Start****************************************************/
    @Override
    public String getSpecificationAndManufacturers(String startDate, String endDate, String materials) {
        Map<String,Object> map = new HashMap<>();
        //查询规格
        List<Map<String,String>> specificationList = qualityExperimentalManagerDao.selectSpecification(startDate,endDate,materials);
        //查询厂家
        List<Map<String,String>> manufacturersList = qualityExperimentalManagerDao.selectManufacturersByMaterialsAndDate(startDate,endDate,materials);
        map.put("message","success");
        map.put("specificationList",specificationList);
        map.put("manufacturersList",manufacturersList);
        return JSON.toJSONString(map);
    }

    @Override
    public String selectAllProduct() {
        List<Map<String,String>> list = qualityExperimentalManagerDao.selectAllProductToData();
        return JSON.toJSONString(list);
    }

    @Override
    public String getDataManagerRationByDate(String produceDate, String crewNum) {

        if (Strings.isBlank(produceDate) || Strings.isBlank(crewNum) ) {return null;}

        String crew =  "crew1".equals(crewNum) ? "data1":"data2";
        //返回数组
        Map<String,Object> res = new HashMap<>();
        //当天使用的模板集合
        List<Map<String,String>> ratioNumList  = qualityDataManagerDao.selectRatioNumListByDate(produceDate,crew);
        //获取当天使用模板的模板数据
        List<QualityRatioTemplate> rationMessageList =  qualityDataManagerDao.selectRatioMessageById(crewNum,ratioNumList,produceDate);
        //当天每种模板产品各材料总和
        List<Map<String,String>> list =  new ArrayList<>();
        //获取每种模板下所有产品平均的实际百分比
        List<Map<String,String>> SVGList = new ArrayList<Map<String, String>>();
        //查询当天每种数据平均值(高改为 矿粉 每盘计算)
        List<Map<String,String>> avgList =  new ArrayList<>();
        //查询当日所有生产数据
        List<Map<String,String>> proList = qualityDataManagerDao.selectAllProduceByDate(produceDate,crew);
        List<Map<String,String>> totalList = QualityGradingUtil.returnGradingTotalList(proList);

        for (int i = 0; i < ratioNumList.size();i++){
            String rationNum = String.valueOf(ratioNumList.get(i).get("produce_proportioning_num"));
            //取出各材料总量
            double aggregate10 = 0.00;
            double aggregate9 = 0.00;
            double aggregate8 = 0.00;
            double aggregate7 = 0.00;
            double aggregate6 = 0.00;
            double aggregate5 = 0.00;
            double aggregate4 = 0.00;
            double aggregate3 = 0.00;
            double aggregate2 = 0.00;
            double aggregate1 = 0.00;
            double stone1 = 0.00;
            double stone2 = 0.00;
            double stone3 = 0.00;
            double stone4 = 0.00;
            double asphalt = 0.00;
            double regenerate = 0.00;
            double additive = 0.00;
            double additive1 = 0.00;
            double additive2 = 0.00;
            double additive3 = 0.00;
            double total = 0.00;
            double warehouse1Tem = 0.00;
            double mixtureTem = 0.00;
            double dusterTem = 0.00;
            double asphaltTem = 0.00;
            double aggregateTem = 0.00;
            int count = 0;

            //获取数据
            for (int j = 0; j < totalList.size();j++ ){
                String proRation = totalList.get(j).get("produce_proportioning_num");
                if (rationNum.equals(proRation)){
                    count = Integer.parseInt(totalList.get(j).get("count"));
                    aggregate10 = Double.parseDouble(totalList.get(j).get("material_aggregate_10"));
                    aggregate9 = Double.parseDouble(totalList.get(j).get("material_aggregate_9"));
                    aggregate8 = Double.parseDouble(totalList.get(j).get("material_aggregate_8"));
                    aggregate7 = Double.parseDouble(totalList.get(j).get("material_aggregate_7"));
                    aggregate6 = Double.parseDouble(totalList.get(j).get("material_aggregate_6"));
                    aggregate5 = Double.parseDouble(totalList.get(j).get("material_aggregate_5"));
                    aggregate4 = Double.parseDouble(totalList.get(j).get("material_aggregate_4"));
                    aggregate3 = Double.parseDouble(totalList.get(j).get("material_aggregate_3"));
                    aggregate2 = Double.parseDouble(totalList.get(j).get("material_aggregate_2"));
                    aggregate1 = Double.parseDouble(totalList.get(j).get("material_aggregate_1"));
                    stone1 = Double.parseDouble(totalList.get(j).get("material_stone_1"));
                    stone2 = Double.parseDouble(totalList.get(j).get("material_stone_2"));
                    stone3 = Double.parseDouble(totalList.get(j).get("material_stone_3"));
                    stone4 = Double.parseDouble(totalList.get(j).get("material_stone_4"));
                    asphalt = Double.parseDouble(totalList.get(j).get("material_asphalt"));
                    regenerate = Double.parseDouble(totalList.get(j).get("material_regenerate"));
                    additive = Double.parseDouble(totalList.get(j).get("material_additive"));
                    additive1 = Double.parseDouble(totalList.get(j).get("material_additive_1"));
                    additive2 = Double.parseDouble(totalList.get(j).get("material_additive_2"));
                    additive3 = Double.parseDouble(totalList.get(j).get("material_additive_3"));
                    total = Double.parseDouble(totalList.get(j).get("material_total"));
                    warehouse1Tem = Double.parseDouble(totalList.get(j).get("temperature_warehouse_1"));
                    mixtureTem = Double.parseDouble(totalList.get(j).get("temperature_mixture"));
                    dusterTem = Double.parseDouble(totalList.get(j).get("temperature_duster"));
                    asphaltTem = Double.parseDouble(totalList.get(j).get("temperature_asphalt"));
                    aggregateTem = Double.parseDouble(totalList.get(j).get("temperature_aggregate"));
                }
            }

            //平均占比修改
            Map<String,String> svgRationMap = new HashMap<>();
            svgRationMap.put("rationNum",rationNum);
            svgRationMap.put("aggregate_1", QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate1)));
            svgRationMap.put("aggregate_2",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate2)));
            svgRationMap.put("aggregate_3",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate3)));
            svgRationMap.put("aggregate_4",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate4)));
            svgRationMap.put("aggregate_5",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate5)));
            svgRationMap.put("aggregate_6",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate6)));
            svgRationMap.put("aggregate_7",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate7)));
            svgRationMap.put("aggregate_8",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate8)));
            svgRationMap.put("aggregate_9",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate9)));
            svgRationMap.put("aggregate_10",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate10)));
            svgRationMap.put("stone_1",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(stone1)));
            svgRationMap.put("stone_2",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(stone2)));
            svgRationMap.put("stone_3",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(stone3)));
            svgRationMap.put("stone_4",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(stone4)));
            svgRationMap.put("asphalt",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(asphalt)));
            svgRationMap.put("regenerate",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(regenerate)));
            svgRationMap.put("additive",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(additive)));
            svgRationMap.put("additive1",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(additive1)));
            svgRationMap.put("additive2",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(additive2)));
            svgRationMap.put("additive3",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(additive3)));
            svgRationMap.put("mixture",String.valueOf(QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(mixtureTem))));
            svgRationMap.put("duster",String.valueOf(QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(dusterTem))));
            svgRationMap.put("temAsphalt",String.valueOf(QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(asphaltTem))));
            svgRationMap.put("aggregate",String.valueOf(QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(aggregateTem))));
            SVGList.add(svgRationMap);
            //总量修改
            Map<String,String> totalMap = new HashMap<>();
            totalMap.put("procount",String.valueOf(count));
            totalMap.put("total",String.valueOf(total));
            totalMap.put("rationNum",rationNum);
            totalMap.put("aggregate_10",String.valueOf(aggregate10));
            totalMap.put("aggregate_9",String.valueOf(aggregate9));
            totalMap.put("aggregate_8",String.valueOf(aggregate8));
            totalMap.put("aggregate_7",String.valueOf(aggregate7));
            totalMap.put("aggregate_6",String.valueOf(aggregate6));
            totalMap.put("aggregate_5",String.valueOf(aggregate5));
            totalMap.put("aggregate_4",String.valueOf(aggregate4));
            totalMap.put("aggregate_3",String.valueOf(aggregate3));
            totalMap.put("aggregate_2",String.valueOf(aggregate2));
            totalMap.put("aggregate_1",String.valueOf(aggregate1));
            totalMap.put("stone_1",String.valueOf(stone1));
            totalMap.put("stone_2",String.valueOf(stone2));
            totalMap.put("stone_3",String.valueOf(stone3));
            totalMap.put("stone_4",String.valueOf(stone4));
            totalMap.put("asphalt",String.valueOf(asphalt));
            totalMap.put("regenerate",String.valueOf(regenerate));
            totalMap.put("additive",String.valueOf(additive));
            totalMap.put("additive1",String.valueOf(additive1));
            totalMap.put("additive2",String.valueOf(additive2));
            totalMap.put("additive3",String.valueOf(additive3));

            list.add(totalMap);

            //平均值修改
            Map<String,String> svgMap = new HashMap<>();
            svgMap.put("produce_date",produceDate);
            svgMap.put("crewNum",crewNum);
            svgMap.put("produce_proportioning_num",rationNum);
            svgMap.put("material_aggregate_10",String.valueOf(aggregate10/count));
            svgMap.put("material_aggregate_9",String.valueOf(aggregate9/count));
            svgMap.put("material_aggregate_8",String.valueOf(aggregate8/count));
            svgMap.put("material_aggregate_7",String.valueOf(aggregate7/count));
            svgMap.put("material_aggregate_6",String.valueOf(aggregate6/count));
            svgMap.put("material_aggregate_5",String.valueOf(aggregate5/count));
            svgMap.put("material_aggregate_4",String.valueOf(aggregate4/count));
            svgMap.put("material_aggregate_3",String.valueOf(aggregate3/count));
            svgMap.put("material_aggregate_2",String.valueOf(aggregate2/count));
            svgMap.put("material_aggregate_1",String.valueOf(aggregate1/count));
            svgMap.put("material_stone_1",String.valueOf(stone1/count));
            svgMap.put("material_stone_2",String.valueOf(stone2/count));
            svgMap.put("material_stone_3",String.valueOf(stone3/count));
            svgMap.put("material_stone_4",String.valueOf(stone4/count));
            svgMap.put("material_asphalt",String.valueOf(asphalt/count));
            svgMap.put("material_regenerate",String.valueOf(regenerate/count));
            svgMap.put("material_additive",String.valueOf(additive/count));
            svgMap.put("material_additive_1",String.valueOf(additive1/count));
            svgMap.put("material_additive_2",String.valueOf(additive2/count));
            svgMap.put("material_additive_3",String.valueOf(additive3/count));
            svgMap.put("material_total",String.valueOf(total/count));
            svgMap.put("warehouse1_tem",String.valueOf(warehouse1Tem/count));
            svgMap.put("aggregate_tem",String.valueOf(aggregateTem/count));
            svgMap.put("duster_tem",String.valueOf(dusterTem/count));
            svgMap.put("asphalt_tem",String.valueOf(asphaltTem/count));
            svgMap.put("mixture_tem",String.valueOf(mixtureTem/count));
            svgMap.putAll(ratioNumList.get(i));
            avgList.add(svgMap);
        }

        //返回的结果集 一层Key为机组 二层为模板级配等 三层Key为筛孔
        List<Map<String,Map<String,List<Map<String,String>>>>> result = new ArrayList<>();
        String grading = QualityGradingUtil.getModelGradingResultJson(avgList,qualityDataMontoringDao,result);

        res.put("rationList",rationMessageList);
        res.put("totalList",list);
        res.put("avgRationList",SVGList);
        res.put("avgList",avgList);
        res.put("gradingList",grading);
        return JSON.toJSONString(res);
    }
}
