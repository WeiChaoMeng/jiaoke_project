package com.jiaoke.controller.oa.archives.office;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaEiaMonitor;
import com.jiaoke.oa.service.OaEiaMonitorService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * oa-综合办公室档案-环评监测报告
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/13 9:21
 */
@Controller
@RequestMapping(value = "/eiaMonitor")
public class OaEiaMonitorController {

    @Resource
    private OaEiaMonitorService oaEiaMonitorService;

    /**
     * 跳转首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toEiaMonitor")
    public String toContractAgreement(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/office/eia_monitor/indexs";
    }

    /**
     * 首页数据加载
     *
     * @return main.jsp
     */
    @RequestMapping(value = "/index")
    @ResponseBody
    public String index(int page) {
        PageHelper.startPage(page, 12);
        List<OaEiaMonitor> oaEiaMonitorList = oaEiaMonitorService.selectAll();
        PageInfo<OaEiaMonitor> pageInfo = new PageInfo<>(oaEiaMonitorList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转新建
     *
     * @return add.jsp
     */
    @RequestMapping(value = "/toNewEiaMonitor")
    public String toNewReleaseDocument(int prev, Model model) {
        model.addAttribute("prev", JsonHelper.toJSONString(prev));
        return "oa/archives/office/eia_monitor/add";
    }

    /**
     * 新增
     *
     * @return add.jsp
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String add(OaEiaMonitor oaEiaMonitor) {
        if (oaEiaMonitorService.insertSelective(oaEiaMonitor) < 0) {
            return JsonHelper.toJSONString("error");
        }
        return JsonHelper.toJSONString("success");
    }

    /**
     * 根据名字搜索
     *
     * @param sampleName sampleName
     * @return list
     */
    @RequestMapping(value = "/sampleNameFilter")
    @ResponseBody
    public String documentNameFilter(String sampleName, int page) {
        PageHelper.startPage(page, 12);
        List<OaEiaMonitor> oaEiaMonitorList = oaEiaMonitorService.getSelectBySampleName(sampleName);
        PageInfo<OaEiaMonitor> pageInfo = new PageInfo<>(oaEiaMonitorList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 根据时间查询
     *
     * @param testingDate testingDate
     * @return list
     */
    @RequestMapping(value = "/testingDateFilter")
    @ResponseBody
    public String visitDateFilter(String testingDate, int page) {
        PageHelper.startPage(page, 12);
        List<OaEiaMonitor> oaEiaMonitorList = oaEiaMonitorService.getSelectByTestingDate(testingDate);
        PageInfo<OaEiaMonitor> pageInfo = new PageInfo<>(oaEiaMonitorList);
        return JsonHelper.toJSONString(pageInfo);
    }


    /**
     * 跳转修改页面
     *
     * @param id id
     * @return edit.jsp
     */
    @RequestMapping("/toEdit")
    public String toEdit(Model model, int prev, int id) {
        OaEiaMonitor oaEiaMonitor = oaEiaMonitorService.selectByPrimaryKey(id);
        model.addAttribute("prev", JsonHelper.toJSONString(prev));
        model.addAttribute("oaEiaMonitor", oaEiaMonitor);
        return "oa/archives/office/eia_monitor/edit";
    }

    /**
     * 提交修改
     *
     * @param oaEiaMonitor oaEiaMonitor
     * @return 影响行数
     */
    @RequestMapping("/edit")
    @ResponseBody
    public String edit(OaEiaMonitor oaEiaMonitor) {
        if (oaEiaMonitorService.updateByPrimaryKeySelective(oaEiaMonitor) < 0) {
            return JsonHelper.toJSONString("error");
        }
        return JsonHelper.toJSONString("success");
    }

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(int id) {
        if (oaEiaMonitorService.delete(id) == 1) {
            return "success";
        }
        return "error";
    }

    /**
     * 详情
     *
     * @param id    id
     * @param model model
     * @return edit.jsp
     */
    @RequestMapping(value = "/details")
    public String particulars(int id, int prev, Model model) {
        OaEiaMonitor oaEiaMonitor = oaEiaMonitorService.selectByPrimaryKey(id);
        model.addAttribute("prev", JsonHelper.toJSONString(prev));
        model.addAttribute("oaEiaMonitor", oaEiaMonitor);
        return "oa/archives/office/eia_monitor/details";
    }

    /**
     * 批量删除
     *
     * @param ids ids
     * @return int
     */
    @RequestMapping(value = "/batchDelete")
    @ResponseBody
    public String batchDeleteNotice(@RequestParam(value = "ids[]") String[] ids) {
        if (oaEiaMonitorService.batchDelete(ids) >= 0) {
            return "success";
        } else {
            return "error";
        }
    }
}
