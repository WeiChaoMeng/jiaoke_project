package com.jiaoke.controller.oa.archives.office;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaOfficeOther;
import com.jiaoke.oa.service.OaOfficeOtherService;
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
@RequestMapping(value = "/officeOther")
public class OaOfficeOtherController {

    @Resource
    private OaOfficeOtherService oaOfficeOtherService;

    /**
     * 跳转首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toOfficeOther")
    public String toContractAgreement(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/office/office_other/indexs";
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
        List<OaOfficeOther> officeOtherList = oaOfficeOtherService.selectAll();
        PageInfo<OaOfficeOther> pageInfo = new PageInfo<>(officeOtherList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转新建
     *
     * @return add.jsp
     */
    @RequestMapping(value = "/toNewOfficeOther")
    public String toNewReleaseDocument(int prev, Model model) {
        model.addAttribute("prev", JsonHelper.toJSONString(prev));
        return "oa/archives/office/office_other/add";
    }

    /**
     * 新增
     *
     * @return add.jsp
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String add(OaOfficeOther oaOfficeOther) {
        if (oaOfficeOtherService.insertSelective(oaOfficeOther) < 0) {
            return JsonHelper.toJSONString("error");
        }
        return JsonHelper.toJSONString("success");
    }

    /**
     * 根据名字搜索
     *
     * @param name name
     * @return list
     */
    @RequestMapping(value = "/fileNameFilter")
    @ResponseBody
    public String documentNameFilter(String name, int page) {
        PageHelper.startPage(page, 12);
        List<OaOfficeOther> oaOfficeOtherList = oaOfficeOtherService.getSelectByName(name);
        PageInfo<OaOfficeOther> pageInfo = new PageInfo<>(oaOfficeOtherList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 根据时间查询
     *
     * @param date date
     * @return list
     */
    @RequestMapping(value = "/dateFilter")
    @ResponseBody
    public String visitDateFilter(String date, int page) {
        PageHelper.startPage(page, 12);
        List<OaOfficeOther> oaOfficeOtherList = oaOfficeOtherService.getSelectByDate(date);
        PageInfo<OaOfficeOther> pageInfo = new PageInfo<>(oaOfficeOtherList);
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
        OaOfficeOther oaOfficeOther = oaOfficeOtherService.selectByPrimaryKey(id);
        model.addAttribute("prev", JsonHelper.toJSONString(prev));
        model.addAttribute("oaOfficeOther", oaOfficeOther);
        return "oa/archives/office/office_other/edit";
    }

    /**
     * 提交修改
     *
     * @param oaOfficeOther oaOfficeOther
     * @return 影响行数
     */
    @RequestMapping("/edit")
    @ResponseBody
    public String edit(OaOfficeOther oaOfficeOther) {
        if (oaOfficeOtherService.updateByPrimaryKeySelective(oaOfficeOther) < 0) {
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
        if (oaOfficeOtherService.delete(id) == 1) {
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
        OaOfficeOther oaOfficeOther = oaOfficeOtherService.selectByPrimaryKey(id);
        model.addAttribute("prev", JsonHelper.toJSONString(prev));
        model.addAttribute("oaOfficeOther", oaOfficeOther);
        return "oa/archives/office/office_other/details";
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
        if (oaOfficeOtherService.batchDelete(ids) >= 0) {
            return "success";
        } else {
            return "error";
        }
    }
}
