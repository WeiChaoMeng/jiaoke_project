package com.jiaoke.controller.personnel;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.UserContract;
import com.jiaoke.oa.bean.UserFiles;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.PersonnelManageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

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

    /**
     * 跳转员工基本信息
     *
     * @return jsp
     */
    @RequestMapping(value = "/toBasic")
    public String toIndex(int page, Model model) {
        List<Integer> statistical = personnelManageService.getUserStatistical();
        model.addAttribute("statistical", JsonHelper.toJSONString(statistical));
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "personnel/basic";
    }

    /**
     * 加载用户数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/userBasicInfo")
    @ResponseBody
    public String userManager(int page) {
        PageHelper.startPage(page, 15);
        List<UserInfo> userInfoList = personnelManageService.getUserBasicInfo();
        PageInfo<UserInfo> pageInfo = new PageInfo<>(userInfoList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 根据userId获取用户信息
     *
     * @param userInfoId 用户id
     * @return json
     */
    @RequestMapping(value = "/userDetails")
    @ResponseBody
    public String userDetails(Integer userInfoId) {
        UserInfo userInfo = personnelManageService.getUserInfoByUseId(userInfoId);
        return JsonHelper.toJSONString(userInfo);
    }

    /**
     * 跳转员工档案
     *
     * @return jsp
     */
    @RequestMapping(value = "/toFile")
    public String toFile(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "personnel/file";
    }

    /**
     * 加载员工档案
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/userFiles")
    @ResponseBody
    public String getUserFilesData(int page) {
        PageHelper.startPage(page, 15);
        List<UserFiles> userInfoList = personnelManageService.getUserFilesData();
        PageInfo<UserFiles> pageInfo = new PageInfo<>(userInfoList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转动态管理
     *
     * @return jsp
     */
    @RequestMapping(value = "/toDynamic")
    public String toDynamic(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        model.addAttribute("probation", personnelManageService.getUserNameByNature(3));

        int soonLeave = personnelManageService.getUserNameByNature(5);
        model.addAttribute("soonLeave", soonLeave);

        //预离职数据
        if (soonLeave != 0){
            model.addAttribute("soonLeaveData", personnelManageService.getDataListByNature(5,3));
        }

        int leave = personnelManageService.getUserNameByNature(6);
        model.addAttribute("leave", leave);
        //离职数据
        if (soonLeave != 0){
            model.addAttribute("leaveData", personnelManageService.getDataListByNature(6,5));
        }

        return "personnel/dynamic";
    }

    /**
     * 加载动态管理数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/dynamicData")
    @ResponseBody
    public String userDynamicData(int page) {
        PageHelper.startPage(page, 15);
        List<UserContract> userContractList = personnelManageService.getProbationUser();
        PageInfo<UserContract> pageInfo = new PageInfo<>(userContractList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转员工合同
     *
     * @return jsp
     */
    @RequestMapping(value = "/toContract")
    public String toContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        model.addAttribute("sing", personnelManageService.statisticsFormalUser());
        model.addAttribute("probation", personnelManageService.getUserNameByNature(3));
        return "personnel/contract";
    }

    /**
     * 加载用户合同数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/userContractData")
    @ResponseBody
    public String userContractData(int page) {
        PageHelper.startPage(page, 15);
        List<UserContract> userContractList = personnelManageService.getUserContractData();
        PageInfo<UserContract> pageInfo = new PageInfo<>(userContractList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转员工福利
     *
     * @return jsp
     */
    @RequestMapping(value = "/toWelfare")
    public String toWelfare(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "personnel/welfare";
    }

}
