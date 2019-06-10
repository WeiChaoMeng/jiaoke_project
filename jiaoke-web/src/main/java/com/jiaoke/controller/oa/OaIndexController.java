package com.jiaoke.controller.oa;

import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaActTemporary;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.OaIndexService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.task.Task;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * OA模块首页
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-28 0:46
 */
@Controller
@RequestMapping(value = "/oaHomePage")
public class OaIndexController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaIndexService oaIndexService;

    /**
     * 获取当前登录用户信息
     *
     * @return userInfo
     */
    private UserInfo getCurrentUser() {
        return (UserInfo) SecurityUtils.getSubject().getPrincipal();
    }

    @RequestMapping(value = "/toOaHomePage")
    public String toOaHomePage() {
        return "oa/oa_index";
    }

    /**
     * 加载数据
     *
     * @return json
     */
    @RequestMapping(value = "/loadingData")
    @ResponseBody
    public String loadingData() {
        //待办任务
        HashMap<String, Object> map = new HashMap<>(16);
        List<OaActTemporary> oaActTemporaryList = new ArrayList<>();
        //根据当前登录人id获取taskList
        List<Task> taskList = activitiUtil.getTaskByAssignee(getCurrentUser().getId().toString());
        if (taskList.size() <= 0) {
            map.put("dataNumber", taskList.size());
            map.put("oaActTemporaryList", "empty");
        } else {
            for (int i = 0; i < taskList.size(); i++) {
                if (i < 8) {
                    OaActTemporary oaActTemporary = oaIndexService.selectSimpleData(activitiUtil.getBusinessByTaskId(taskList.get(i).getId()));
                    oaActTemporary.setTaskId(taskList.get(i).getId());
                    oaActTemporaryList.add(oaActTemporary);
                } else {
                    break;
                }
            }
            map.put("dataNumber", taskList.size());
            map.put("oaActTemporaryList", oaActTemporaryList);
        }

        //审批未结束任务追踪
        List<OaActTemporary> alreadyIssuedList = new ArrayList<>();
        List<HistoricProcessInstance> processInstanceList = activitiUtil.getUnfinishedProcessInstance(getCurrentUser().getId().toString());
        if (processInstanceList.size() <= 0) {
            map.put("alreadyIssuedNumber", processInstanceList.size());
            map.put("alreadyIssuedList", "empty");
        } else {
            for (int i = 0; i < processInstanceList.size(); i++) {
                if (i < 8) {
                    OaActTemporary oaActTemporary = oaIndexService.selectSimpleData(processInstanceList.get(i).getBusinessKey());
                    oaActTemporary.setTaskId(processInstanceList.get(i).getId());
                    oaActTemporary.setCurrentExecutor(oaIndexService.getNicknameById(Integer.valueOf(activitiUtil.getCurrentExecutor(processInstanceList.get(i).getId()))));
                    alreadyIssuedList.add(oaActTemporary);
                } else {
                    break;
                }
            }
            map.put("alreadyIssuedNumber", processInstanceList.size());
            map.put("alreadyIssuedList", alreadyIssuedList);
        }

        return JsonHelper.toJSONString(map);
    }
}
