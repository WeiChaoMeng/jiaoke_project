package com.jiaoke.controller.oa.archives.operate;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaOperateOther;
import com.jiaoke.oa.service.OaOperateOtherService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 经营其他档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/operateOther")
public class OaOperateOtherController {

    @Resource
    private OaOperateOtherService oaOperateOtherService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_other/index";
    }

    /**
     * 加载数据
     *
     * @return jsp
     */
    @RequestMapping(value = "/loadingData")
    @ResponseBody
    public String operateContract(int page) {
        PageHelper.startPage(page, 15);
        List<OaOperateOther> oaOperateOtherList = oaOperateOtherService.selectAll();
        PageInfo<OaOperateOther> pageInfo = new PageInfo<>(oaOperateOtherList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 筛选
     *
     * @param page     page
     * @param fileName fileName
     * @return json
     */
    @RequestMapping(value = "/searchFilter")
    @ResponseBody
    public String searchFilter(int page, String fileName) {
        PageHelper.startPage(page, 15);
        List<OaOperateOther> oaOperateOtherList = oaOperateOtherService.searchFilter(fileName);
        PageInfo<OaOperateOther> pageInfo = new PageInfo<>(oaOperateOtherList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/toAdd")
    public String toAdd(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_other/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaOperateOther oaOperateOther) {
        if (oaOperateOtherService.insertSelective(oaOperateOther) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 详情
     *
     * @param id    id
     * @param page  page
     * @param model model
     * @return jsp
     */
    @RequestMapping(value = "/details")
    public String details(Integer id, int page, Model model) {
        OaOperateOther oaOperateOther = oaOperateOtherService.selectByPrimaryKey(id);
        model.addAttribute("oaOperateOther", oaOperateOther);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_other/details";
    }

    /**
     * 跳转修改
     *
     * @param id    id
     * @param page  page
     * @param model model
     * @return jsp
     */
    @RequestMapping(value = "/toEdit")
    public String toEdit(Integer id, int page, Model model) {
        OaOperateOther oaOperateOther = oaOperateOtherService.selectByPrimaryKey(id);
        model.addAttribute("oaOperateOther", oaOperateOther);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_other/edit";
    }

    /**
     * 提交修改
     *
     * @param oaOperateOther oaOperateOther
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaOperateOther oaOperateOther) {
        if (oaOperateOtherService.updateByPrimaryKeySelective(oaOperateOther) < 1) {
            return "error";
        }
        return "success";
    }

    /**
     * 删除
     *
     * @param id id
     * @return s/e
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(Integer id) {
        if (oaOperateOtherService.deleteByPrimaryKey(id) < 1) {
            return "error";
        }
        return "success";
    }
}