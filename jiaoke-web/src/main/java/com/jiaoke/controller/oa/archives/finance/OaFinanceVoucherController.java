package com.jiaoke.controller.oa.archives.finance;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaFinanceVoucher;
import com.jiaoke.oa.bean.OaOperateOffer;
import com.jiaoke.oa.service.OaFinanceVoucherService;
import com.jiaoke.oa.service.OaOperateOfferService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 财务管理部-凭证
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/financeVoucher")
public class OaFinanceVoucherController {

    @Resource
    private OaFinanceVoucherService oaFinanceVoucherService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/finance/voucher/index";
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
        List<OaFinanceVoucher> oaFinanceVoucherList = oaFinanceVoucherService.selectAll();
        PageInfo<OaFinanceVoucher> pageInfo = new PageInfo<>(oaFinanceVoucherList);
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
        List<OaFinanceVoucher> oaFinanceVoucherList = oaFinanceVoucherService.searchFilter(remarks);
        PageInfo<OaFinanceVoucher> pageInfo = new PageInfo<>(oaFinanceVoucherList);
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
        return "oa/archives/finance/voucher/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaFinanceVoucher oaFinanceVoucher) {
        if (oaFinanceVoucherService.insertSelective(oaFinanceVoucher) < 1) {
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
        OaFinanceVoucher oaFinanceVoucher = oaFinanceVoucherService.selectByPrimaryKey(id);
        model.addAttribute("oaFinanceVoucher", oaFinanceVoucher);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/finance/voucher/details";
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
        OaFinanceVoucher oaFinanceVoucher = oaFinanceVoucherService.selectByPrimaryKey(id);
        model.addAttribute("oaFinanceVoucher", oaFinanceVoucher);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/finance/voucher/edit";
    }

    /**
     * 提交修改
     *
     * @param oaFinanceVoucher oaFinanceVoucher
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaFinanceVoucher oaFinanceVoucher) {
        if (oaFinanceVoucherService.updateByPrimaryKeySelective(oaFinanceVoucher) < 1) {
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
        if (oaFinanceVoucherService.deleteByPrimaryKey(id) < 1) {
            return "error";
        }
        return "success";
    }
}
