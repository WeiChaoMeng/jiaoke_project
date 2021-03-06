package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActMeals;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActMealsService;
import com.jiaoke.oa.service.OaCollaborationService;
import com.jiaoke.oa.service.UserInfoService;
import org.activiti.engine.task.Task;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 客饭审批
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/meals")
public class OaActMealsController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActMealsService oaActMealsService;

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private OaCollaborationService oaCollaborationService;

    @Resource
    private DepartmentService departmentService;

    /**
     * 获取当前登录用户信息
     *
     * @return userInfo
     */
    private UserInfo getCurrentUser() {
        return (UserInfo) SecurityUtils.getSubject().getPrincipal();
    }

    /**
     * 客饭审批单
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String toMeals(Model model) {
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_meals";
    }

    /**
     * 新增客饭审批单
     *
     * @param oaActMeals oaActMeals
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActMeals oaActMeals) {
        String randomId = RandomUtil.randomId();
        if (oaActMealsService.insert(oaActMeals, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            //获取拥有权限的用户
            UserInfo userInfo = userInfoService.getUserInfoByPermission("mealsApproval");
            //开启流程
            Map<String, Object> map = new HashMap<>(16);
            map.put("approval", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_meals", "oa_act_meals:" + randomId, map, getCurrentUser().getId().toString());
            if (instance != null) {
                return "success";
            }
            return "error";
        }
    }

    /**
     * 审批
     *
     * @param id     id
     * @param taskId taskId
     * @param model  model
     * @return jsp
     */
    @RequestMapping(value = "/approval")
    public String approval(String id, String taskId, Model model) {
        //审批
        OaActMeals oaActMeals = oaActMealsService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(activitiUtil.getTaskByTaskId(taskId).getProcessInstanceId());
        model.addAttribute("oaActMeals", oaActMeals);
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_meals_handle";
    }

    /**
     * 提交
     *
     * @param processingOpinion 处理意见
     * @param taskId            任务Id
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(String processingOpinion, String taskId, Integer flag) {
        //回退标识
        String back = "back";
        //结束标识
        String end = "end";
        //网关标识
        String eg = "eg";
        Task task = activitiUtil.getTaskByTaskId(taskId);
        Map<String, Object> map = new HashMap<>(16);
        if (task == null) {
            return "error";
        } else {
            //下个节点
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //下个节点是否为end直接结束
            if (end.equals(nextNode)) {
                activitiUtil.endProcess(taskId);

                //下个节点为back修改表达状态为2并结束流程
            } else if (back.equals(nextNode)) {
                String businessId = activitiUtil.getBusinessByTaskId(task.getId());
                String correlationId = businessId.substring(businessId.lastIndexOf(":") + 1);
                oaCollaborationService.updateState(correlationId, 3);
                activitiUtil.endProcess(taskId);

            } else if (eg.equals(nextNode)) {
                map.put("result", flag);
                map.put("notify", activitiUtil.getStartUserId(task.getProcessInstanceId()));
                activitiUtil.completeAndAppointNextNode(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), map);
            }
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActMeals oaActMeals
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActMeals oaActMeals) {
        String randomId = RandomUtil.randomId();
        if (oaActMealsService.insert(oaActMeals, getCurrentUser().getId(), randomId, 1) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 跳转编辑
     *
     * @param id    id
     * @param model model
     * @return jsp
     */
    @RequestMapping(value = "/toEdit")
    public String toEdit(String id, Model model) {
        OaActMeals oaActMeals = oaActMealsService.selectByPrimaryKey(id);
        model.addAttribute("oaActMeals", oaActMeals);
        return "oa/act/act_meals_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActMeals oaActMeals
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActMeals oaActMeals) {
        if (oaActMealsService.edit(oaActMeals) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActMeals oaActMeals
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActMeals oaActMeals) {
        //更新数据
        if (oaActMealsService.edit(oaActMeals) < 0) {
            return "error";
        } else {
            //获取拥有权限的用户
            UserInfo userInfo = userInfoService.getUserInfoByPermission("mealsApproval");
            Map<String, Object> map = new HashMap<>(16);
            map.put("mealsApproval", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_meals", "oa_act_meals:" + oaActMeals.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStateByCorrelationId(oaActMeals.getId(), 0, oaActMeals.getTitle());
                return "success";
            } else {
                return "error";
            }
        }
    }

    /**
     * 客饭审批单 - 详情
     *
     * @param id     id
     * @param taskId taskId
     * @param model  model
     * @return jsp
     */
    @RequestMapping(value = "/details")
    public String details(String id, String taskId, Model model) {
        OaActMeals oaActMeals = oaActMealsService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActMeals", oaActMeals);
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("commentsListSize", commentsList.size());
        return "oa/act/act_meals_details";
    }

    /**
     * 删除
     *
     * @param id                id
     * @param processInstanceId processInstanceId
     * @return jsp
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(String id, String processInstanceId) {
        //删除流程
        if (activitiUtil.deleteByProcessInstanceId(processInstanceId) == 1) {
            //执行删除数据
            oaActMealsService.deleteData(id);
            oaCollaborationService.deleteByCorrelationId(id);
            return "success";
        } else {
            return "error";
        }
    }

    /**
     * 撤销流程
     *
     * @param id                id
     * @param processInstanceId processInstanceId
     * @return jsp
     */
    @RequestMapping(value = "/rescind")
    @ResponseBody
    public String rescind(String id, String processInstanceId) {
        int rescind = activitiUtil.rescindByProcessInstanceId(processInstanceId);
        if (rescind < 0) {
            //流程结束无法撤销
            return "end";
        } else if (rescind > 0) {
            //撤销成功后更新state为1待发
            oaCollaborationService.updateState(id, 2);
            return "success";
        } else {
            //错误
            return "error";
        }
    }
}
