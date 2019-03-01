package com.jiaoke.controller.oa.archives.office;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaManagementSystem;
import com.jiaoke.oa.service.OaManagementSystemService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * oa-综合办公室档案-管理体系相关
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/13 9:21
 */
@Controller
@RequestMapping(value = "/managementSystem")
public class OaManagementSystemController {

    @Resource
    private OaManagementSystemService oaManagementSystemService;

    /**
     * 跳转首页
     *
     * @return contract_agreement.jsp
     */
    @RequestMapping(value = "/toManagementSystem")
    public String toContractAgreement() {
        return "oa/archives/office/management_system/index";
    }

    /**
     * 首页数据加载
     *
     * @return index.jsp
     */
    @RequestMapping(value = "/index")
    @ResponseBody
    public String index(int page) {
        PageHelper.startPage(page, 15);
        List<OaManagementSystem> oaManagementSystemList = oaManagementSystemService.selectAll();
        PageInfo<OaManagementSystem> pageInfo = new PageInfo<>(oaManagementSystemList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转新建
     *
     * @return add.jsp
     */
    @RequestMapping(value = "/toNewManagementSystem")
    public String toNewReleaseDocument() {
        return "oa/archives/office/management_system/add";
    }

    /**
     * 新增
     *
     * @return add.jsp
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(OaManagementSystem oaManagementSystem) {
        int i = oaManagementSystemService.insertSelective(oaManagementSystem);
        return "redirect:/managementSystem/toManagementSystem";
    }

    /**
     * 根据名字搜索
     *
     * @param fileName fileName
     * @return list
     */
    @RequestMapping(value = "/fileNameFilter")
    @ResponseBody
    public String documentNameFilter(String fileName, int page) {
        PageHelper.startPage(page, 15);
        List<OaManagementSystem> oaManagementSystemList = oaManagementSystemService.getSelectByName(fileName);
        PageInfo<OaManagementSystem> pageInfo = new PageInfo<>(oaManagementSystemList);
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
        PageHelper.startPage(page, 15);
        List<OaManagementSystem> oaManagementSystemList = oaManagementSystemService.getSelectByDate(date);
        PageInfo<OaManagementSystem> pageInfo = new PageInfo<>(oaManagementSystemList);
        return JsonHelper.toJSONString(pageInfo);
    }


    /**
     * 跳转修改页面
     *
     * @param id id
     * @return edit.jsp
     */
    @RequestMapping("/toEdit")
    public String toEdit(Model model, int id) {
        OaManagementSystem oaManagementSystem = oaManagementSystemService.selectByPrimaryKey(id);
        model.addAttribute("oaManagementSystem", oaManagementSystem);
        return "oa/archives/office/management_system/edit";
    }

    /**
     * 提交修改
     *
     * @param oaManagementSystem oaManagementSystem
     * @return 影响行数
     */
    @RequestMapping("/edit")
    public String edit(OaManagementSystem oaManagementSystem) {
        int i = oaManagementSystemService.updateByPrimaryKeySelective(oaManagementSystem);
        return "redirect:/managementSystem/toManagementSystem";
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
        if (oaManagementSystemService.delete(id) == 1) {
            return "success";
        }
        return "error";
    }

    /**
     * 详情
     *
     * @param id    id
     * @param model model
     * @return details.jsp
     */
    @RequestMapping(value = "/toManagementSystemDetails")
    public String particulars(int id, Model model) {
        OaManagementSystem oaManagementSystem = oaManagementSystemService.selectByPrimaryKey(id);
        model.addAttribute("oaManagementSystem", oaManagementSystem);
        return "oa/archives/office/management_system/details";
    }
}