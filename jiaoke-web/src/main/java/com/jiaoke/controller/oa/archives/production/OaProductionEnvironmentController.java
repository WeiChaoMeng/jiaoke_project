package com.jiaoke.controller.oa.archives.production;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaProductionEnvironment;
import com.jiaoke.oa.service.OaProductionEnvironmentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 生产管理部-环保改造台账
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/productionEnvironment")
public class OaProductionEnvironmentController {

    @Resource
    private OaProductionEnvironmentService oaProductionEnvironmentService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/environment/index";
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
        List<OaProductionEnvironment> oaProductionEnvironmentList = oaProductionEnvironmentService.selectAll();
        PageInfo<OaProductionEnvironment> pageInfo = new PageInfo<>(oaProductionEnvironmentList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 筛选
     *
     * @param page        page
     * @param projectName projectName
     * @return json
     */
    @RequestMapping(value = "/searchFilter")
    @ResponseBody
    public String searchFilter(int page, String projectName) {
        PageHelper.startPage(page, 15);
        List<OaProductionEnvironment> oaProductionEnvironmentList = oaProductionEnvironmentService.searchFilter(projectName);
        PageInfo<OaProductionEnvironment> pageInfo = new PageInfo<>(oaProductionEnvironmentList);
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
        return "oa/archives/production/environment/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaProductionEnvironment oaProductionEnvironment) {
        if (oaProductionEnvironmentService.insertSelective(oaProductionEnvironment) < 1) {
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
        OaProductionEnvironment oaProductionEnvironment = oaProductionEnvironmentService.selectByPrimaryKey(id);
        model.addAttribute("oaProductionEnvironment", oaProductionEnvironment);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/environment/details";
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
        OaProductionEnvironment oaProductionEnvironment = oaProductionEnvironmentService.selectByPrimaryKey(id);
        model.addAttribute("oaProductionEnvironment", oaProductionEnvironment);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/environment/edit";
    }

    /**
     * 提交修改
     *
     * @param oaProductionEnvironment oaProductionEnvironment
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaProductionEnvironment oaProductionEnvironment) {
        if (oaProductionEnvironmentService.updateByPrimaryKeySelective(oaProductionEnvironment) < 1) {
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
        if (oaProductionEnvironmentService.deleteByPrimaryKey(id) < 1) {
            return "error";
        }
        return "success";
    }
}