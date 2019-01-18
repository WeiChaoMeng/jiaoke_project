package com.jiaoke.controller.oa.archives.office;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaReleaseDocument;
import com.jiaoke.oa.service.OaReleaseDocumentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * oa-综合办公室档案-公司发文
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/13 9:21
 */
@Controller
@RequestMapping(value = "/releaseDocument")
public class OaReleaseDocumentController {

    @Resource
    private OaReleaseDocumentService oaReleaseDocumentService;

    /**
     * 跳转公司发文
     *
     * @return index.jsp
     */
    @RequestMapping(value = "/toReleaseDocument")
    public String toReleaseDocument() {
        return "oa/archives/office/release_document/index";
    }

    /**
     * 公司发文首页
     *
     * @return index.jsp
     */
    @RequestMapping(value = "/index")
    @ResponseBody
    public String index(int page) {
        PageHelper.startPage(page, 15);
        List<OaReleaseDocument> oaReleaseDocumentList = oaReleaseDocumentService.selectAll();
        PageInfo<OaReleaseDocument> pageInfo = new PageInfo<>(oaReleaseDocumentList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转新建公司发文
     *
     * @return add.jsp
     */
    @RequestMapping(value = "/toNewReleaseDocument")
    public String toNewReleaseDocument() {
        return "oa/archives/office/release_document/add";
    }

    /**
     * 添加公司发文
     *
     * @return add.jsp
     */
    @RequestMapping(value = "/addReleaseDocument", method = RequestMethod.POST)
    public String add(OaReleaseDocument oaReleaseDocument) {
        int i = oaReleaseDocumentService.insertSelective(oaReleaseDocument);
        return "redirect:/releaseDocument/toReleaseDocument";
    }

    /**
     * 文件类型筛选
     *
     * @param documentType 文件类型
     * @return list
     */
    @RequestMapping(value = "/docTypeFilter")
    @ResponseBody
    public String docTypeFilter(int documentType, int page) {
        PageHelper.startPage(page, 15);
        List<OaReleaseDocument> oaReleaseDocumentList = oaReleaseDocumentService.select(documentType);
        PageInfo<OaReleaseDocument> pageInfo = new PageInfo<>(oaReleaseDocumentList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 根据发文名称搜索
     *
     * @param documentName 发文名称
     * @return list
     */
    @RequestMapping(value = "/documentNameFilter")
    @ResponseBody
    public String documentNameFilter(String documentName, int page) {
        PageHelper.startPage(page, 15);
        List<OaReleaseDocument> oaReleaseDocumentList = oaReleaseDocumentService.getSelectByName(documentName);
        PageInfo<OaReleaseDocument> pageInfo = new PageInfo<>(oaReleaseDocumentList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 根据访问时间查询
     *
     * @param visitDate 访问日期
     * @return list
     */
    @RequestMapping(value = "/visitDateFilter")
    @ResponseBody
    public String visitDateFilter(String visitDate, int page) {
        PageHelper.startPage(page, 15);
        List<OaReleaseDocument> oaReleaseDocumentList = oaReleaseDocumentService.getSelectByVisitDate(visitDate);
        PageInfo<OaReleaseDocument> pageInfo = new PageInfo<>(oaReleaseDocumentList);
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
        OaReleaseDocument oaReleaseDocument = oaReleaseDocumentService.selectByPrimaryKey(id);
        model.addAttribute("oaReleaseDocument", oaReleaseDocument);
        return "oa/archives/office/release_document/edit";
    }

    /**
     * 提交修改
     *
     * @param oaReleaseDocument oaReleaseDocument
     * @return 影响行数
     */
    @RequestMapping("/edit")
    public String edit(OaReleaseDocument oaReleaseDocument) {
        int i = oaReleaseDocumentService.updateByPrimaryKeySelective(oaReleaseDocument);
        return "redirect:/releaseDocument/toReleaseDocument";
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
        if (oaReleaseDocumentService.delete(id) == 1) {
            return "success";
        }
        return "error";
    }

    /**
     * 公司发文详情
     *
     * @param id    id
     * @param model model
     * @return details.jsp
     */
    @RequestMapping(value = "/toReleaseDocumentDetails")
    public String particulars(int id, Model model) {
        OaReleaseDocument oaReleaseDocument = oaReleaseDocumentService.selectByPrimaryKey(id);
        model.addAttribute("oaReleaseDocument", oaReleaseDocument);
        return "oa/archives/office/release_document/details";
    }

    /*--------------------------------------------------公司收文-------------------------------------------------------*/

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
