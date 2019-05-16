package com.jiaoke.controller.oa.archives.material;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaMaterialOther;
import com.jiaoke.oa.service.OaMaterialOtherService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 物资管理部-其他
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/materialOther")
public class OaMaterialOtherController {

    @Resource
    private OaMaterialOtherService oaMaterialOtherService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/material/other/index";
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
        List<OaMaterialOther> oaMaterialOtherList = oaMaterialOtherService.selectAll();
        PageInfo<OaMaterialOther> pageInfo = new PageInfo<>(oaMaterialOtherList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 筛选
     *
     * @param page page
     * @param name name
     * @return json
     */
    @RequestMapping(value = "/searchFilter")
    @ResponseBody
    public String searchFilter(int page, String name) {
        PageHelper.startPage(page, 15);
        List<OaMaterialOther> oaMaterialOtherList = oaMaterialOtherService.searchFilter(name);
        PageInfo<OaMaterialOther> pageInfo = new PageInfo<>(oaMaterialOtherList);
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
        return "oa/archives/material/other/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaMaterialOther oaMaterialOther) {
        if (oaMaterialOtherService.insertSelective(oaMaterialOther) < 1) {
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
        OaMaterialOther oaMaterialOther = oaMaterialOtherService.selectByPrimaryKey(id);
        model.addAttribute("oaMaterialOther", oaMaterialOther);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/material/other/details";
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
        OaMaterialOther oaMaterialOther = oaMaterialOtherService.selectByPrimaryKey(id);
        model.addAttribute("oaMaterialOther", oaMaterialOther);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/material/other/edit";
    }

    /**
     * 提交修改
     *
     * @param oaMaterialOther oaMaterialOther
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaMaterialOther oaMaterialOther) {
        if (oaMaterialOtherService.updateByPrimaryKeySelective(oaMaterialOther) < 1) {
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
        if (oaMaterialOtherService.deleteByPrimaryKey(id) < 1) {
            return "error";
        }
        return "success";
    }
}
