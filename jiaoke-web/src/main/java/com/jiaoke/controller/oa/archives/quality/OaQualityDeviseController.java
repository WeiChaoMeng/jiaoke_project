package com.jiaoke.controller.oa.archives.quality;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaQualityDevise;
import com.jiaoke.oa.service.OaQualityDeviseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 质量技术部-设计文件
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/qualityDevise")
public class OaQualityDeviseController {

    @Resource
    private OaQualityDeviseService oaQualityDeviseService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/quality/devise/indexs";
    }

    /**
     * 加载数据
     *
     * @return jsp
     */
    @RequestMapping(value = "/loadingData")
    @ResponseBody
    public String operateContract(int page) {
        PageHelper.startPage(page, 12);
        List<OaQualityDevise> oaQualityDeviseList = oaQualityDeviseService.selectAll();
        PageInfo<OaQualityDevise> pageInfo = new PageInfo<>(oaQualityDeviseList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 筛选
     *
     * @param page    page
     * @param name name
     * @return json
     */
    @RequestMapping(value = "/searchFilter")
    @ResponseBody
    public String searchFilter(int page, String name) {
        PageHelper.startPage(page, 12);
        List<OaQualityDevise> oaQualityDeviseList = oaQualityDeviseService.searchFilter(name);
        PageInfo<OaQualityDevise> pageInfo = new PageInfo<>(oaQualityDeviseList);
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
        return "oa/archives/quality/devise/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaQualityDevise oaQualityDevise) {
        if (oaQualityDeviseService.insertSelective(oaQualityDevise) < 1) {
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
        OaQualityDevise oaQualityDevise = oaQualityDeviseService.selectByPrimaryKey(id);
        model.addAttribute("oaQualityDevise", oaQualityDevise);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/quality/devise/details";
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
        OaQualityDevise oaQualityDevise = oaQualityDeviseService.selectByPrimaryKey(id);
        model.addAttribute("oaQualityDevise", oaQualityDevise);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/quality/devise/edit";
    }

    /**
     * 提交修改
     *
     * @param oaQualityDevise oaQualityDevise
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaQualityDevise oaQualityDevise) {
        if (oaQualityDeviseService.updateByPrimaryKeySelective(oaQualityDevise) < 1) {
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
        if (oaQualityDeviseService.deleteByPrimaryKey(id) < 1) {
            return "error";
        }
        return "success";
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
        if (oaQualityDeviseService.batchDelete(ids) >= 0) {
            return "success";
        } else {
            return "error";
        }
    }
}
