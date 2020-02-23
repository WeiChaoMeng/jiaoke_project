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
     * @return main.jsp
     */
    @RequestMapping(value = "/toReleaseDocument")
    public String toReleaseDocument(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/office/release_document/index";
    }

    /**
     * 公司发文首页
     *
     * @return main.jsp
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
    public String toNewReleaseDocument(int prev, Model model) {
        model.addAttribute("prev", JsonHelper.toJSONString(prev));
        return "oa/archives/office/release_document/add";
    }

    /**
     * 添加公司发文
     *
     * @return add.jsp
     */
    @RequestMapping(value = "/addReleaseDocument", method = RequestMethod.POST)
    @ResponseBody
    public String add(OaReleaseDocument oaReleaseDocument) {
        if (oaReleaseDocumentService.insertSelective(oaReleaseDocument) < 0) {
            return JsonHelper.toJSONString("error");
        }
        return JsonHelper.toJSONString("success");
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
    public String toEdit(Model model, int prev, int id) {
        OaReleaseDocument oaReleaseDocument = oaReleaseDocumentService.selectByPrimaryKey(id);
        model.addAttribute("oaReleaseDocument", oaReleaseDocument);
        model.addAttribute("prev", JsonHelper.toJSONString(prev));
        return "oa/archives/office/release_document/edit";
    }

    /**
     * 提交修改
     *
     * @param oaReleaseDocument oaReleaseDocument
     * @return 影响行数
     */
    @RequestMapping("/edit")
    @ResponseBody
    public String edit(OaReleaseDocument oaReleaseDocument) {
        if (oaReleaseDocumentService.updateByPrimaryKeySelective(oaReleaseDocument) < 0) {
            return JsonHelper.toJSONString("error");
        }
        return JsonHelper.toJSONString("success");
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
     * @return edit.jsp
     */
    @RequestMapping(value = "/toReleaseDocumentDetails")
    public String particulars(int id, int prev, Model model) {
        OaReleaseDocument oaReleaseDocument = oaReleaseDocumentService.selectByPrimaryKey(id);
        model.addAttribute("prev", JsonHelper.toJSONString(prev));
        model.addAttribute("oaReleaseDocument", oaReleaseDocument);
        return "oa/archives/office/release_document/details";
    }
}
