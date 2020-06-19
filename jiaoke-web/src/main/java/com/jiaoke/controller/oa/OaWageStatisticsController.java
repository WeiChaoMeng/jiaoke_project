package com.jiaoke.controller.oa;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.service.OaWageStatisticsService;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;

/**
 * 工资统计
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/28 2:56
 */
@Controller
@RequestMapping(value = "/wageStatistics")
public class OaWageStatisticsController {

    @Resource
    private OaWageStatisticsService oaWageStatisticsService;

    /**
     * 跳转正式员工统计页面
     *
     * @return oa_outsourced_staff.jsp
     */
    @RequestMapping(value = "/toRegularStaff")
    public String toRegularStaff(Model model, int page) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/personal/regular_staff";
    }

    /**
     * 加载正式员工首页数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/loadingRegularStaffData")
    @ResponseBody
    public String loadingRegularStaffData(int page) {
        PageHelper.startPage(page, 12);
        List<OaWageStatistics> oaWageStatisticsList = oaWageStatisticsService.getAllRegularEmployee();
        PageInfo<OaWageStatistics> pageInfo = new PageInfo<>(oaWageStatisticsList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 根据正式员工结算月份筛选
     *
     * @param page  page
     * @param settlementDate settlementDate
     * @return list
     */
    @RequestMapping(value = "/settlementMonthRegularStaffFilter")
    @ResponseBody
    public String settlementMonthRegularStaffFilter(int page, String settlementDate) {
        PageHelper.startPage(page, 12);
        List<OaWageStatistics> oaWageStatisticsList = oaWageStatisticsService.settlementMonthRegularStaffFilter(settlementDate);
        PageInfo<OaWageStatistics> pageInfo = new PageInfo<>(oaWageStatisticsList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 正式职工工资导入
     * @param file file
     * @return s/e
     * @throws IOException ice
     */
    @RequestMapping(value = "/importPersonalWages")
    @ResponseBody
    public String importPersonalWages(@RequestParam(value = "file", required = false) MultipartFile file) throws IOException {
        if (oaWageStatisticsService.importPersonalWages(file) > 0) {
            return "success";
        }
        return "error";
    }

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    @RequestMapping(value = "/deleteRegularStaff")
    @ResponseBody
    public String deleteRegularStaff(Integer id) {
        if (oaWageStatisticsService.deleteRegularStaffByPrimaryKey(id) != 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 批量删除
     *
     * @param ids ids
     * @return int
     */
    @RequestMapping(value = "/batchDeleteRegularStaff")
    @ResponseBody
    public String batchDeleteRegularStaff(@RequestParam(value = "ids[]") String[] ids) {
        for (String id : ids) {
            if (oaWageStatisticsService.deleteRegularStaffByPrimaryKey(Integer.valueOf(id)) != 1){
                return "error";
            }
        }
        return "success";
    }

    /**
     * 正式职工工资详情
     * @param wageStatisticsId wageStatisticsId
     * @param model model
     * @return jsp
     */
    @RequestMapping(value = "/toRegularEmployeeDetails")
    public String toRegularEmployeeDetails(int wageStatisticsId, Model model) {
        List<OaPersonalWages> oaPersonalWagesList = oaWageStatisticsService.selectRegularStaffByWageStatisticsId(wageStatisticsId);
        model.addAttribute("oaPersonalWagesList",JsonHelper.toJSONString(oaPersonalWagesList));
        return "oa/personal/oa_regular _staff_details";
    }

    /**
     * 个人工资
     *
     * @return oa_schedule_planning.jsp
     */
    @RequestMapping("/toPersonalSalary")
    public String personalSalary(Model model) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        OaPersonalWages personalWages = oaWageStatisticsService.getPersonalWagesByNickName(userInfo.getNickname());
        model.addAttribute("personalWages", personalWages);
        return "oa/personal/oa_personal_salary";
    }

    /**-----------------外包职工-------------------*/

    /**
     * 跳转外包员工统计页面
     *
     * @return oa_outsourced_staff.jsp
     */
    @RequestMapping(value = "/toOutsourcingStaff")
    public String toOutsourcingStaff(Model model, int page) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/personal/outsourcing_staff";
    }

    /**
     * 加载外包员工数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/loadingData")
    @ResponseBody
    public String loadingData(int page) {
        PageHelper.startPage(page, 12);
        List<OaOutsourcedStatistics> outsourcedStatisticsList = oaWageStatisticsService.getAllOutsourcedStatistics();
        PageInfo<OaOutsourcedStatistics> pageInfo = new PageInfo<>(outsourcedStatisticsList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 根据外包员工结算月份筛选
     *
     * @param page  page
     * @param settlementMonth settlementMonth
     * @return list
     */
    @RequestMapping(value = "/settlementMonthFilter")
    @ResponseBody
    public String settlementMonthFilter(int page, String settlementMonth) {
        PageHelper.startPage(page, 12);
        List<OaOutsourcedStaff> oaOutsourcedStaffs = oaWageStatisticsService.settlementMonthFilter(settlementMonth);
        PageInfo<OaOutsourcedStaff> pageInfo = new PageInfo<>(oaOutsourcedStaffs);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    @RequestMapping(value = "/deleteOutsourcingStaff")
    @ResponseBody
    public String delete(Integer id) {
        if (oaWageStatisticsService.deleteByPrimaryKey(id) != 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 批量删除
     *
     * @param ids ids
     * @return int
     */
    @RequestMapping(value = "/batchDeleteOutsourcingStaff")
    @ResponseBody
    public String batchDeleteNotice(@RequestParam(value = "ids[]") String[] ids) {
        for (String id : ids) {
            if (oaWageStatisticsService.deleteByPrimaryKey(Integer.valueOf(id)) != 1){
                return "error";
            }
        }
        return "success";
    }

    /**
     * 导入外包职工工资
     *
     * @param file file
     * @return s/e
     * @throws IOException i
     */
    @RequestMapping(value = "/importOutsourcedStaffWages")
    @ResponseBody
    public String importOutsourcedStaffWages(@RequestParam(value = "file", required = false) MultipartFile file) throws IOException {
        if (oaWageStatisticsService.importOutsourcedStaffWages(file) > 0) {
            return "success";
        }
        return "error";
    }

    /**
     * 查询外包员工工资详情
     *
     * @param wageStatisticsId wageStatisticsId
     * @param model            model
     * @return jsp
     */
    @RequestMapping(value = "/toOutsourcedDetails")
    public String toOutsourcedDetails(int wageStatisticsId, Model model) {
        List<OaOutsourcedStaff> outsourcedStaffList = oaWageStatisticsService.selectOutsourcedStaffByWageStatisticsId(wageStatisticsId);
        model.addAttribute("outsourcedStaffListJson", JsonHelper.toJSONString(outsourcedStaffList));
        return "oa/personal/oa_outsourced_details";
    }
}
