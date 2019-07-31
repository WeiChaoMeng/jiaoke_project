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
import com.jiake.utils.RandomUtil;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import com.jiaoke.quality.dao.QualityExperimentalManagerDao;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.runtime.ProcessInstance;
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

        //查询当日委托单数量
        String[] dateArray = result.split(" ");

        Map<String,Object>  countMap = qualityExperimentalManagerDao.selectOrderTicketCountByDate(dateArray[0]);

        int count = Integer.parseInt(countMap.get("counts").toString());

        //生产委托编号
        String number = count >= 9? "00" + String.valueOf(count + 1): "000" + String.valueOf(count + 1);
        String[] date = dateArray[0].split("-");
        String orderTicketNum = date[0] + date[1] + date[2] + number;

        //生产试验编号
        String test_num = map.get("logogram_name") + date[0] + number;

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
        if (coarseTest.isEmpty()){
            coarseTestList = new ArrayList<>();
        }else {
            coarseTestList = JSONArray.parseObject(coarseTest,List.class);
        }


        Map<String,String> insertMap = new HashMap<>();
        //暂存实验数据主键
        String id = "";

        //修改实验报告表
        for(Map<String,String> mapList : listObjectSec){
            String val = mapList.get("value");
            String valName = mapList.get("name");
            if ("Id".equals(valName)){
                id = val;
            }
            insertMap.put(valName,val);
        }

        int upRes = qualityExperimentalManagerDao.updateLabReport(insertMap);

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
                collaboration.setCreateTime(new Date());

                //添加成功后开启流程
                if (oaCollaborationMapper.insertData(collaboration) > 0) {
                    //获取拥有查表计数人权限的用户信息
                    UserInfo userInfo = userInfoMapper.selectByPermission("experimentPrincipal");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("experimentPrincipal", userInfo.getId());
                    //businessKey格式为 mysql表名：新增数据id
                    ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();
                    processEngine.getIdentityService().setAuthenticatedUserId(getCurrentUser().getId().toString());
                    processEngine.getRuntimeService().startProcessInstanceByKey("qc_experimental", "quality_test_lab_report:" + id, map);
                }

            }
        }
        /**--------------审批使用e--------------------*/

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
//                        res = qualityExperimentalManagerDao.insertFineAggregate(firstTestList);
                    }
                    if (coarseTestList.size() != 0){
//                        res = qualityExperimentalManagerDao.insertFineAggregateSieving(coarseTestList);
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

    /*************************************未完实验End****************************************************/

    @Override
    public int updateExperimentalItemApproval(String id, String chargePerson, String checkPerson) {
        return qualityExperimentalManagerDao.updateExperimentalApproval(id,chargePerson,checkPerson);
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
}
