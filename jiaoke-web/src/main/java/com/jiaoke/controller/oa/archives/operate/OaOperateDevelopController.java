package com.jiaoke.controller.oa.archives.operate;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaOperateDevelop;
import com.jiaoke.oa.service.OaOperateDevelopService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 经营开发档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/operate")
public class OaOperateDevelopController {

    @Resource
    private OaOperateDevelopService oaOperateDevelopService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toOperateContract")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_contract/index";
    }

    /**
     * 加载数据
     *
     * @return jsp
     */
    @RequestMapping(value = "/operateContract")
    @ResponseBody
    public String operateContract(int page) {
        PageHelper.startPage(page, 15);
        List<OaOperateDevelop> operateDevelopList = oaOperateDevelopService.selectAll();
        PageInfo<OaOperateDevelop> pageInfo = new PageInfo<>(operateDevelopList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 筛选
     *
     * @param page      page
     * @param purchaser purchaser
     * @return json
     */
    @RequestMapping(value = "/searchFilter")
    @ResponseBody
    public String searchFilter(int page, String purchaser) {
        PageHelper.startPage(page, 15);
        List<OaOperateDevelop> oaOperateDevelopList = oaOperateDevelopService.searchFilter(purchaser);
        PageInfo<OaOperateDevelop> pageInfo = new PageInfo<>(oaOperateDevelopList);
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
        return "oa/archives/operate/operate_contract/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaOperateDevelop oaOperateDevelop) {
        if (oaOperateDevelopService.insertSelective(oaOperateDevelop) < 1) {
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
     * @return
     */
    @RequestMapping(value = "/details")
    public String details(Integer id, int page, Model model) {
        OaOperateDevelop oaOperateDevelop = oaOperateDevelopService.selectByPrimaryKey(id);
        model.addAttribute("oaOperateDevelop", oaOperateDevelop);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_contract/details";
    }

    /**
     * 跳转修改
     *
     * @param id    id
     * @param page  page
     * @param model model
     * @return
     */
    @RequestMapping(value = "/toEdit")
    public String toEdit(Integer id, int page, Model model) {
        OaOperateDevelop oaOperateDevelop = oaOperateDevelopService.selectByPrimaryKey(id);
        model.addAttribute("oaOperateDevelop", oaOperateDevelop);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_contract/edit";
    }

    /**
     * 提交修改
     *
     * @param oaOperateDevelop oaOperateDevelop
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaOperateDevelop oaOperateDevelop) {
        if (oaOperateDevelopService.updateByPrimaryKeySelective(oaOperateDevelop) < 1) {
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
        if (oaOperateDevelopService.deleteByPrimaryKey(id) < 1) {
            return "error";
        }
        return "success";
    }


}
