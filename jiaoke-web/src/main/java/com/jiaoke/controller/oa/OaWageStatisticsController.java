package com.jiaoke.controller.oa;

import com.jiaoke.oa.bean.OaPersonalWages;
import com.jiaoke.oa.bean.OaWageStatistics;
import com.jiaoke.oa.bean.UserInfo;
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

    @RequestMapping(value = "/importPersonalWages")
    @ResponseBody
    public String importPersonalWages(@RequestParam(value = "file", required = false) MultipartFile file) throws IOException {
        if (oaWageStatisticsService.importPersonalWages(file) > 0) {
            return "success";
        }
        return "error";
    }

    /**
     * 跳转正式员工tab页面
     *
     * @return oa_regular_employee.jsp
     */
    @RequestMapping(value = "/toRegularEmployee")
    public String toRegularEmployee(Model model) {
        List<OaWageStatistics> oaWageStatisticsList = oaWageStatisticsService.getAllRegularEmployee();
        model.addAttribute("oaWageStatisticsList", oaWageStatisticsList);
        return "oa/personal/oa_regular_employee";
    }

    /**
     * 根据工资统计id跳转到正式员工列表
     *
     * @param wageStatisticsId 工资统计id
     * @return oa_regular_details.jsp
     */
    @RequestMapping(value = "/sendAll")
    @ResponseBody
    public String sendAll(int wageStatisticsId) {
        if (oaWageStatisticsService.sendAll(wageStatisticsId) > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    /**
     * 跳转外包员工页面
     *
     * @return oa_outsourced_staff.jsp
     */
    @RequestMapping(value = "/toOutsourcedStaff")
    public String toOutsourcedStaff() {
        return "oa/personal/oa_outsourced_staff";
    }

    @RequestMapping(value = "/toRegularEmployeeDetails")
    public String toRegularEmployeeDetails(int wageStatisticsId, Model model) {
        int total = oaWageStatisticsService.getTotalByWageStatisticsId(wageStatisticsId);
        model.addAttribute("wageStatisticsId", wageStatisticsId);
        model.addAttribute("total", total);
        return "oa/personal/oa_regular_details";
    }

    @RequestMapping(value = "/pagingList")
    @ResponseBody
    public Object getPagingByWageStatisticsId(int wageStatisticsId, int page, int rows) {
        List<OaPersonalWages> personalWagesList = oaWageStatisticsService.getPagingByWageStatisticsId(wageStatisticsId, page, rows);
        if (personalWagesList != null) {
            return personalWagesList;
        }
        return "error";
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
        model.addAttribute("personalWages",personalWages);
        return "oa/personal/oa_personal_salary";
    }
}
