package com.jiaoke.controller.oa;

import com.jiaoke.oa.bean.OaDocument;
import com.jiaoke.oa.service.OaDocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 公文管理
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/15 1:28
 */
@Controller
@RequestMapping(value = "/document")
public class OaDocumentController {

    @Autowired
    private OaDocumentService oaDocumentService;

    /**
     * 待办公文跳转
     *
     * @return oa_pending_document.jsp
     */
    @RequestMapping(value = "/pendingDocument.do")
    public String pendingDocument(Model model) {
        List<OaDocument> oaDocumentList = oaDocumentService.getAllByFormState(3);
        model.addAttribute("oaDocumentList", oaDocumentList);
        return "oa/document/oa_pending_document";
    }

    /**
     * 发布公文跳转
     *
     * @return oa_release_document.jsp
     */
    @RequestMapping(value = "/releaseDocument.do")
    public String releaseDocument() {
        return "oa/document/oa_release_document";
    }

    /**
     * 添加公文
     *
     * @param oaDocument oaDocument
     * @return oa_release_document.jsp
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(OaDocument oaDocument) {
        if (oaDocumentService.add(oaDocument) == 1) {
            return "oa/document/oa_issued_document";
        } else {
            return null;
        }
    }

    /**
     * 保存待发
     *
     * @param oaDocument oaDocument
     * @return oa_primed_document.jsp
     */
    @RequestMapping(value = "/preservationPending")
    @ResponseBody
    public String preservationPending(OaDocument oaDocument) {
        if (oaDocumentService.add(oaDocument) == 1) {
            return "success";
        } else {
            return "error";
        }
    }


    /**
     * 已办公文跳转
     *
     * @param model model
     * @return oa_done_document.jsp
     */
    @RequestMapping(value = "/doneDocument.do")
    public String doneDocument(Model model) {
        List<OaDocument> oaDocumentList = oaDocumentService.getAllByFormState(2);
        model.addAttribute("oaDocumentList", oaDocumentList);
        return "oa/document/oa_done_document";
    }

    /**
     * 待发公文跳转
     *
     * @param model model
     * @return oa_primed_document.jsp
     */
    @RequestMapping(value = "/primedDocument.do")
    public String primedDocument(Model model) {
        int total = oaDocumentService.getTotalByFormState(1);
        model.addAttribute("total", total);
        return "oa/document/oa_primed_document";
    }


    /**
     * 已发公文跳转
     *
     * @param model model
     * @return oa_issued_document.jsp
     */
    @RequestMapping(value = "/issuedDocument.do")
    public String issuedDocument(Model model) {
        int total = oaDocumentService.getTotalByFormState(0);
        model.addAttribute("total", total);
        return "oa/document/oa_issued_document";
    }

    /**
     * 根据id获取公文详情
     *
     * @param id    id
     * @param model model
     * @return oa_details_document.jsp
     */
    @RequestMapping(value = "/documentDetails")
    public String details(Integer id, Model model) {
        OaDocument oaDocument = oaDocumentService.getDocumentDetailsById(id);
        model.addAttribute("oaDocument", oaDocument);
        return "oa/document/oa_details_document";
    }

    @RequestMapping(value = "/pagingList")
    @ResponseBody
    public Object getPagingByFormState(Integer formState, Integer page, Integer rows) {
        List<OaDocument> oaDocumentList = oaDocumentService.getPagingByFormState(formState, page, rows);
        if (oaDocumentList != null) {
            return oaDocumentList;
        } else {
            return "error";
        }
    }
}
