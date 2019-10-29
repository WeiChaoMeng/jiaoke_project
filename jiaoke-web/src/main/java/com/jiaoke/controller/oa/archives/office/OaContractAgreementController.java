package com.jiaoke.controller.oa.archives.office;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaContractAgreement;
import com.jiaoke.oa.service.OaContractAgreementService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * oa-综合办公室档案-合同/协议
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/13 9:21
 */
@Controller
@RequestMapping(value = "/contractAgreement")
public class OaContractAgreementController {

    @Resource
    private OaContractAgreementService oaContractAgreementService;

    /**
     * 跳转合同/协议
     *
     * @return contract_agreement.jsp
     */
    @RequestMapping(value = "/toContractAgreement")
    public String toContractAgreement() {
        return "oa/archives/office/contract_agreement/index";
    }

    /**
     * 合同/协议首页
     *
     * @return main.jsp
     */
    @RequestMapping(value = "/index")
    @ResponseBody
    public String index(int page) {
        PageHelper.startPage(page, 15);
        List<OaContractAgreement> oaContractAgreementList = oaContractAgreementService.selectAll();
        PageInfo<OaContractAgreement> pageInfo = new PageInfo<>(oaContractAgreementList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转新建公司发文
     *
     * @return add.jsp
     */
    @RequestMapping(value = "/toNewContractAgreement")
    public String toNewReleaseDocument() {
        return "oa/archives/office/contract_agreement/add";
    }

    /**
     * 添加公司发文
     *
     * @return add.jsp
     */
    @RequestMapping(value = "/addContractAgreement", method = RequestMethod.POST)
    public String add(OaContractAgreement oaContractAgreement) {
        int i = oaContractAgreementService.insertSelective(oaContractAgreement);
        return "redirect:/contractAgreement/toContractAgreement";
    }

    /**
     * 文件类型筛选
     *
     * @param type 类型
     * @return list
     */
    @RequestMapping(value = "/typeFilter")
    @ResponseBody
    public String docTypeFilter(int type, int page) {
        PageHelper.startPage(page, 15);
        List<OaContractAgreement> oaContractAgreementList = oaContractAgreementService.select(type);
        PageInfo<OaContractAgreement> pageInfo = new PageInfo<>(oaContractAgreementList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 根据发文名称搜索
     *
     * @param contractAgreementName 合同/协议名称
     * @return list
     */
    @RequestMapping(value = "/contractAgreementNameFilter")
    @ResponseBody
    public String documentNameFilter(String contractAgreementName, int page) {
        PageHelper.startPage(page, 15);
        List<OaContractAgreement> oaContractAgreementList = oaContractAgreementService.getSelectByName(contractAgreementName);
        PageInfo<OaContractAgreement> pageInfo = new PageInfo<>(oaContractAgreementList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 根据访问时间查询
     *
     * @param date 日期
     * @return list
     */
    @RequestMapping(value = "/dateFilter")
    @ResponseBody
    public String visitDateFilter(String date, int page) {
        PageHelper.startPage(page, 15);
        List<OaContractAgreement> oaContractAgreementList = oaContractAgreementService.getSelectByDate(date);
        PageInfo<OaContractAgreement> pageInfo = new PageInfo<>(oaContractAgreementList);
        return JsonHelper.toJSONString(pageInfo);
    }


    /**
     * 跳转修改页面
     *
     * @param id id
     * @return edit.jsp
     */
    @RequestMapping("/toEdit")
    public String toEdit(Model model, int id) {
        OaContractAgreement oaContractAgreement = oaContractAgreementService.selectByPrimaryKey(id);
        model.addAttribute("oaContractAgreement", oaContractAgreement);
        return "oa/archives/office/contract_agreement/edit";
    }

    /**
     * 提交修改
     *
     * @param oaContractAgreement oaContractAgreement
     * @return 影响行数
     */
    @RequestMapping("/edit")
    public String edit(OaContractAgreement oaContractAgreement) {
        int i = oaContractAgreementService.updateByPrimaryKeySelective(oaContractAgreement);
        return "redirect:/contractAgreement/toContractAgreement";
    }

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(int id) {
        if (oaContractAgreementService.delete(id) == 1) {
            return "success";
        }
        return "error";
    }

    /**
     * 公司发文详情
     *
     * @param id    id
     * @param model model
     * @return edit.jsp
     */
    @RequestMapping(value = "/toContractAgreementDetails")
    public String particulars(int id, Model model) {
        OaContractAgreement oaContractAgreement = oaContractAgreementService.selectByPrimaryKey(id);
        model.addAttribute("oaContractAgreement", oaContractAgreement);
        return "oa/archives/office/contract_agreement/details";
    }
}
