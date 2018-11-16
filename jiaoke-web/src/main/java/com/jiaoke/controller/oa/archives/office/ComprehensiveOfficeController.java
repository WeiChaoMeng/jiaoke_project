package com.jiaoke.controller.oa.archives.office;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 综合办公室档案-公司发文
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/13 9:21
 */
@Controller
@RequestMapping(value = "/comprehensiveOffice")
public class ComprehensiveOfficeController {

    /**
     * 跳转公司发文
     *
     * @return release_document.jsp
     */
    @RequestMapping(value = "/officeReleaseDocument")
    public String toReleaseDocument() {
        return "oa/archives/office/release_document";
    }

    /**
     * 跳转新建公司发文
     *
     * @return new_company_writing.jsp
     */
    @RequestMapping(value = "/newCompanyWriting")
    public String toNewCompanyWriting() {
        return "/oa/archives/office/new_company_writing";
    }

    /**
     * 添加公司发文
     *
     * @return new_company_writing.jsp
     */
    @RequestMapping(value = "/addCompanyWriting")
    public String add() {
        return "redirect:/office/companyWriting";
    }

    /**
     * 详情公司发文
     *
     * @return company_writing_details.jsp
     */
    @RequestMapping(value = "/particularsCompanyWriting")
    public String particulars() {
        return "/oa/archives/office/company_writing_details";
    }

    /**
     * 跳转公司收文
     *
     * @return receive_document.jsp
     */
    @RequestMapping(value = "/officeReceiveDocument")
    public String toReceiveDocument() {
        return "oa/archives/office/receive_document";
    }

    /**
     * 跳转会议纪要
     *
     * @return receive_document.jsp
     */
    @RequestMapping(value = "/officeMeetingSummary")
    public String toMeetingSummary() {
        return "oa/archives/office/meeting_summary";
    }

    /**
     * 跳转管理体系相关
     *
     * @return management_system.jsp
     */
    @RequestMapping(value = "/officeManagementSystem")
    public String toManagementSystem() {
        return "oa/archives/office/management_system";
    }

    /**
     * 跳转合同、协议
     *
     * @return contract_agreement.jsp
     */
    @RequestMapping(value = "/officeContractAgreement")
    public String toContractAgreement() {
        return "oa/archives/office/contract_agreement";
    }

    /**
     * 跳转环评监测报告
     *
     * @return eia_monitor.jsp
     */
    @RequestMapping(value = "/officeEiaMonitor")
    public String toEiaMonitor() {
        return "oa/archives/office/eia_monitor";
    }

    /**
     * 跳转其他文件
     *
     * @return other_document.jsp
     */
    @RequestMapping(value = "/officeOtherDocuments")
    public String toOtherDocuments() {
        return "oa/archives/office/other_document";
    }

}
