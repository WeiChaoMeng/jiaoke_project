package com.jiaoke.controller.personnel;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.DateUtil;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.Department;
import com.jiaoke.oa.bean.PersonnelInfo;
import com.jiaoke.oa.bean.UserContract;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.PersonnelManageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 人事管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019-8-6 15:39
 */
@Controller
@RequestMapping(value = "/personnel")
public class PersonnelManageController {

    @Resource
    private PersonnelManageService personnelManageService;

    @Resource
    private DepartmentService departmentService;

    /**
     * 跳转人事管理首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toPersonnelIndex() {
        return "personnel/main";
    }

    /**
     * 加载首页数据
     *
     * @return jsp
     */
    @RequestMapping(value = "/toHomePage")
    public String toHomePage(Model model) {
        Map<String, Integer> map = personnelManageService.getHomePageData();
        model.addAttribute("map", map);
        return "personnel/index";
    }

    /**--------------基本信息--------------*/
    /**
     * 跳转员工基本信息
     *
     * @return jsp
     */
    @RequestMapping(value = "/toBasic")
    public String toBasic(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "personnel/basic";
    }

    /**
     * 加载员工基本信息数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/userBasicInfo")
    @ResponseBody
    public String userManager(int page) {
        PageHelper.startPage(page, 15);
        List<PersonnelInfo> personnelBasicDataList = personnelManageService.getPersonnelBasicData();
        PageInfo<PersonnelInfo> pageInfo = new PageInfo<>(personnelBasicDataList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转添加员工信息
     *
     * @return jsp
     */
    @RequestMapping(value = "/toAddPersonnel")
    public String toAddPersonnel(Model model) {
        List<Department> departmentList = departmentService.selectAll();
        model.addAttribute("departmentList", departmentList);
        return "personnel/add";
    }

    /**
     * 添加员工信息
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String addPersonnelInfo(PersonnelInfo personnelInfo) {
        if (personnelManageService.addPersonnelInfo(personnelInfo) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 身份证校验
     *
     * @param idCard 身份证号
     * @return json
     */
    @RequestMapping(value = "/idCardCheck")
    @ResponseBody
    public String idCardCheck(String idCard) {
        Map<String, Object> map = new HashMap<>();
        String n = idCard.substring(6, 10);
        String y = idCard.substring(10, 12);
        String r = idCard.substring(12, 14);
        int age = DateUtil.getAge(DateUtil.stringConvertYYYYMMDD(n + "-" + y + "-" + r));
        map.put("age", age);
        map.put("birthday", n + "-" + y + "-" + r);
        return JsonHelper.toJSONString(map);
    }

    /**
     * 工作年限计算
     *
     * @param joinWorkDate 参加工作时间
     * @return json
     */
    @RequestMapping(value = "/workingYears")
    @ResponseBody
    public String workingYears(String joinWorkDate) {
        Map<String, Object> map = new HashMap<>();
        int workingYears = DateUtil.getAge(DateUtil.stringConvertYYYYMM(joinWorkDate));
        map.put("workingYears", workingYears);
        return JsonHelper.toJSONString(map);
    }

    /**
     * 根据id删除
     *
     * @param id id
     * @return s/e
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(Integer id) {
        if (personnelManageService.deleteByPrimaryKey(id) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 根据Id获取用户信息
     *
     * @param id id
     * @return json
     */
    @RequestMapping(value = "/personnelDetails")
    @ResponseBody
    public String personnelDetails(Integer id) {
        PersonnelInfo personnelInfo = personnelManageService.selectByPrimaryKey(id);
        return JsonHelper.toJSONString(personnelInfo);
    }

    /**
     * 跳转人员信息编辑
     *
     * @param id    id
     * @param model model
     * @return jsp
     */
    @RequestMapping("/toEdit")
    public String toEdit(Integer id, Model model) {
        List<Department> departmentList = departmentService.selectAll();
        PersonnelInfo personnelInfo = personnelManageService.selectByPrimaryKey(id);
        model.addAttribute("departmentList", departmentList);
        model.addAttribute("personnelInfo", personnelInfo);
        return "personnel/edit";
    }

    /**
     * 根据主键更新人员信息
     *
     * @param personnelInfo personnelInfo
     * @return s/e
     */
    @RequestMapping("/edit")
    @ResponseBody
    public String edit(PersonnelInfo personnelInfo) {
        if (personnelManageService.updateByPrimaryKeySelective(personnelInfo) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 添加合同信息
     *
     * @param id id
     * @return s/e
     */
    @RequestMapping("/appendContract")
    @ResponseBody
    public String appendContract(int id) {
        if (personnelManageService.appendContract(id) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**--------------人员管理--------------*/
    /**
     * 跳转入职管理
     *
     * @return jsp
     */
    @RequestMapping(value = "/toEntry")
    public String toDynamic(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "personnel/entry";
    }

    /**
     * 加载入职管理数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/entryManage")
    @ResponseBody
    public String entryManage(int page) throws ParseException {
        PageHelper.startPage(page, 15);
        List<PersonnelInfo> personnelInfoList = personnelManageService.entryManage();
        PageInfo<PersonnelInfo> pageInfo = new PageInfo<>(personnelInfoList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转等待离职
     *
     * @return jsp
     */
    @RequestMapping(value = "/toWaitLeave")
    public String toDeparture(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "personnel/wait_leave";
    }

    /**
     * 加载等待离职数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/waitLeave")
    @ResponseBody
    public String waitLeave(int page) {
        PageHelper.startPage(page, 15);
        List<PersonnelInfo> personnelInfoList = personnelManageService.waitLeave();
        PageInfo<PersonnelInfo> pageInfo = new PageInfo<>(personnelInfoList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转已经离职
     *
     * @return jsp
     */
    @RequestMapping(value = "/toAlreadyLeave")
    public String toAlreadyLeave(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "personnel/already_leave";
    }

    /**
     * 加载已经离职数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/alreadyLeave")
    @ResponseBody
    public String alreadyLeave(int page) {
        PageHelper.startPage(page, 15);
        List<PersonnelInfo> personnelInfoList = personnelManageService.alreadyLeave();
        PageInfo<PersonnelInfo> pageInfo = new PageInfo<>(personnelInfoList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转退休管理
     *
     * @return jsp
     */
    @RequestMapping(value = "/toRetireManage")
    public String toRetireManage(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "personnel/retire_manage";
    }

    /**
     * 加载退休管理数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/retireManage")
    @ResponseBody
    public String retireManage(int page) {
        PageHelper.startPage(page, 15);
        List<PersonnelInfo> personnelInfoList = personnelManageService.retireManage();
        PageInfo<PersonnelInfo> pageInfo = new PageInfo<>(personnelInfoList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转职位变动管理
     *
     * @return jsp
     */
    @RequestMapping(value = "/toJobChange")
    public String toJobChange(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "personnel/job_change";
    }

    /**
     * 加载职位变动管理数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/jobChange")
    @ResponseBody
    public String jobChange(int page) {
        PageHelper.startPage(page, 15);
        List<PersonnelInfo> personnelInfoList = personnelManageService.jobChangeManage();
        PageInfo<PersonnelInfo> pageInfo = new PageInfo<>(personnelInfoList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**-------------合同管理------------*/
    /**
     * 跳转合同台账
     *
     * @return jsp
     */
    @RequestMapping(value = "/toContract")
    public String toContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        model.addAttribute("total",personnelManageService.getContractTotal());
        return "personnel/contract";
    }

    /**
     * 加载合同台账数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/contractList")
    @ResponseBody
    public String contractList(int page) {
        PageHelper.startPage(page, 15);
        List<UserContract> userContractList = personnelManageService.contractList();
        PageInfo<UserContract> pageInfo = new PageInfo<>(userContractList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转合同台账编辑页面
     *
     * @param id id
     * @return jsp
     */
    @RequestMapping(value = "/toContractEdit")
    public String toContractEdit(int id, Model model) {
        UserContract userContract = personnelManageService.getByPrimaryKey(id);
        model.addAttribute("userContract", userContract);
        return "personnel/contract_edit";
    }

    /**
     * 编辑合同台账
     *
     * @param userContract userContract
     * @return s/e
     */
    @RequestMapping("/contractEdit")
    @ResponseBody
    public String contractEdit(UserContract userContract) {
        if (personnelManageService.updateUserContract(userContract) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 跳转合同台账详情
     *
     * @param id id
     * @return jsp
     */
    @RequestMapping(value = "/contractDetails")
    @ResponseBody
    public String contractDetails(int id) {
        UserContract userContract = personnelManageService.getByPrimaryKey(id);
        return JsonHelper.toJSONString(userContract);
    }
}
