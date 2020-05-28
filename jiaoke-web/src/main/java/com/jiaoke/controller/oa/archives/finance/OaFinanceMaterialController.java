package com.jiaoke.controller.oa.archives.finance;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaFinanceMaterial;
import com.jiaoke.oa.service.OaFinanceMaterialService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 财务管理部-报表及材料
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/financeMaterial")
public class OaFinanceMaterialController {

    @Resource
    private OaFinanceMaterialService oaFinanceMaterialService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/finance/material/indexs";
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
        List<OaFinanceMaterial> oaFinanceMaterialList = oaFinanceMaterialService.selectAll();
        PageInfo<OaFinanceMaterial> pageInfo = new PageInfo<>(oaFinanceMaterialList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 筛选
     *
     * @param page    page
     * @param remarks remarks
     * @return json
     */
    @RequestMapping(value = "/searchFilter")
    @ResponseBody
    public String searchFilter(int page, String remarks) {
        PageHelper.startPage(page, 12);
        List<OaFinanceMaterial> oaFinanceMaterialList = oaFinanceMaterialService.searchFilter(remarks);
        PageInfo<OaFinanceMaterial> pageInfo = new PageInfo<>(oaFinanceMaterialList);
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
        return "oa/archives/finance/material/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaFinanceMaterial oaFinanceMaterial) {
        if (oaFinanceMaterialService.insertSelective(oaFinanceMaterial) < 1) {
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
        OaFinanceMaterial oaFinanceMaterial = oaFinanceMaterialService.selectByPrimaryKey(id);
        model.addAttribute("oaFinanceMaterial", oaFinanceMaterial);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/finance/material/details";
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
        OaFinanceMaterial oaFinanceMaterial = oaFinanceMaterialService.selectByPrimaryKey(id);
        model.addAttribute("oaFinanceMaterial", oaFinanceMaterial);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/finance/material/edit";
    }

    /**
     * 提交修改
     *
     * @param oaFinanceMaterial oaFinanceMaterial
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaFinanceMaterial oaFinanceMaterial) {
        if (oaFinanceMaterialService.updateByPrimaryKeySelective(oaFinanceMaterial) < 1) {
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
        if (oaFinanceMaterialService.deleteByPrimaryKey(id) < 1) {
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
        if (oaFinanceMaterialService.batchDelete(ids) >= 0) {
            return "success";
        } else {
            return "error";
        }
    }
}
