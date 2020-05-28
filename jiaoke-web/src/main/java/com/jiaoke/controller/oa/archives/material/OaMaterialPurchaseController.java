package com.jiaoke.controller.oa.archives.material;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaMaterialPurchase;
import com.jiaoke.oa.service.OaMaterialPurchaseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 物资管理部-原材料采购合同
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/materialPurchase")
public class OaMaterialPurchaseController {

    @Resource
    private OaMaterialPurchaseService oaMaterialPurchaseService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/material/purchase/indexs";
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
        List<OaMaterialPurchase> oaMaterialPurchaseList = oaMaterialPurchaseService.selectAll();
        PageInfo<OaMaterialPurchase> pageInfo = new PageInfo<>(oaMaterialPurchaseList);
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
        PageHelper.startPage(page, 12);
        List<OaMaterialPurchase> oaMaterialPurchaseList = oaMaterialPurchaseService.searchFilter(name);
        PageInfo<OaMaterialPurchase> pageInfo = new PageInfo<>(oaMaterialPurchaseList);
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
        return "oa/archives/material/purchase/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaMaterialPurchase oaMaterialPurchase) {
        if (oaMaterialPurchaseService.insertSelective(oaMaterialPurchase) < 1) {
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
        OaMaterialPurchase oaMaterialPurchase = oaMaterialPurchaseService.selectByPrimaryKey(id);
        model.addAttribute("oaMaterialPurchase", oaMaterialPurchase);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/material/purchase/details";
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
        OaMaterialPurchase oaMaterialPurchase = oaMaterialPurchaseService.selectByPrimaryKey(id);
        model.addAttribute("oaMaterialPurchase", oaMaterialPurchase);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/material/purchase/edit";
    }

    /**
     * 提交修改
     *
     * @param oaMaterialPurchase oaMaterialPurchase
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaMaterialPurchase oaMaterialPurchase) {
        if (oaMaterialPurchaseService.updateByPrimaryKeySelective(oaMaterialPurchase) < 1) {
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
        if (oaMaterialPurchaseService.deleteByPrimaryKey(id) < 1) {
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
        if (oaMaterialPurchaseService.batchDelete(ids) >= 0) {
            return "success";
        } else {
            return "error";
        }
    }
}
