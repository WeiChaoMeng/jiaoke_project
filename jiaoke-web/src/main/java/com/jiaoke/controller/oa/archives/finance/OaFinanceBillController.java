package com.jiaoke.controller.oa.archives.finance;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaFinanceBill;
import com.jiaoke.oa.service.OaFinanceBillService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 财务管理部-票据
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/financeBil")
public class OaFinanceBillController {

    @Resource
    private OaFinanceBillService oaFinanceBillService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/finance/bill/index";
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
        List<OaFinanceBill> oaFinanceBillList = oaFinanceBillService.selectAll();
        PageInfo<OaFinanceBill> pageInfo = new PageInfo<>(oaFinanceBillList);
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
        PageHelper.startPage(page, 15);
        List<OaFinanceBill> oaFinanceBillList = oaFinanceBillService.searchFilter(remarks);
        PageInfo<OaFinanceBill> pageInfo = new PageInfo<>(oaFinanceBillList);
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
        return "oa/archives/finance/bill/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaFinanceBill oaFinanceBill) {
        if (oaFinanceBillService.insertSelective(oaFinanceBill) < 1) {
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
        OaFinanceBill oaFinanceBill = oaFinanceBillService.selectByPrimaryKey(id);
        model.addAttribute("oaFinanceBill", oaFinanceBill);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/finance/bill/details";
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
        OaFinanceBill oaFinanceBill = oaFinanceBillService.selectByPrimaryKey(id);
        model.addAttribute("oaFinanceBill", oaFinanceBill);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/finance/bill/edit";
    }

    /**
     * 提交修改
     *
     * @param oaFinanceBill oaFinanceBill
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaFinanceBill oaFinanceBill) {
        if (oaFinanceBillService.updateByPrimaryKeySelective(oaFinanceBill) < 1) {
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
        if (oaFinanceBillService.deleteByPrimaryKey(id) < 1) {
            return "error";
        }
        return "success";
    }
}
