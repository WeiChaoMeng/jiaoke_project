package com.jiaoke.controller.oa.archives.operate;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaOperateLawsuit;
import com.jiaoke.oa.service.OaOperateLawsuitService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 经营诉讼档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/operateLawsuit")
public class OaOperateLawsuitController {

    @Resource
    private OaOperateLawsuitService oaOperateLawsuitService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_lawsuit/indexs";
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
        List<OaOperateLawsuit> oaOperateLawsuitList = oaOperateLawsuitService.selectAll();
        PageInfo<OaOperateLawsuit> pageInfo = new PageInfo<>(oaOperateLawsuitList);
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
        PageHelper.startPage(page, 12);
        List<OaOperateLawsuit> oaOperateLawsuitList = oaOperateLawsuitService.searchFilter(projectName);
        PageInfo<OaOperateLawsuit> pageInfo = new PageInfo<>(oaOperateLawsuitList);
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
        return "oa/archives/operate/operate_lawsuit/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaOperateLawsuit oaOperateLawsuit) {
        if (oaOperateLawsuitService.insertSelective(oaOperateLawsuit) < 1) {
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
        OaOperateLawsuit oaOperateLawsuit = oaOperateLawsuitService.selectByPrimaryKey(id);
        model.addAttribute("oaOperateLawsuit", oaOperateLawsuit);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_lawsuit/details";
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
        OaOperateLawsuit oaOperateLawsuit = oaOperateLawsuitService.selectByPrimaryKey(id);
        model.addAttribute("oaOperateLawsuit", oaOperateLawsuit);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_lawsuit/edit";
    }

    /**
     * 提交修改
     *
     * @param oaOperateLawsuit oaOperateLawsuit
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaOperateLawsuit oaOperateLawsuit) {
        if (oaOperateLawsuitService.updateByPrimaryKeySelective(oaOperateLawsuit) < 1) {
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
        if (oaOperateLawsuitService.deleteByPrimaryKey(id) < 1) {
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
        if (oaOperateLawsuitService.batchDelete(ids) >= 0) {
            return "success";
        } else {
            return "error";
        }
    }
}
