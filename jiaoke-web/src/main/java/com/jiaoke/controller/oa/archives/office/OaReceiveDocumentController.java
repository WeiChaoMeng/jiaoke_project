package com.jiaoke.controller.oa.archives.office;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaReceiveDocument;
import com.jiaoke.oa.service.OaReceiveDocumentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * oa-综合办公室档案-公司收文
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/14 17:33
 */
@Controller
@RequestMapping(value = "/receiveDocument")
public class OaReceiveDocumentController {

    @Resource
    private OaReceiveDocumentService oaReceiveDocumentService;

    /**
     * 跳转公司收文
     *
     * @return receive_document.jsp
     */
    @RequestMapping(value = "/toReceiveDocument")
    public String toReceiveDocument(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/office/receive_document/indexs";
    }

    /**
     * 公司发文首页
     *
     * @return main.jsp
     */
    @RequestMapping(value = "/index")
    @ResponseBody
    public String index(int page) {
        PageHelper.startPage(page, 12);
        List<OaReceiveDocument> oaReceiveDocumentList = oaReceiveDocumentService.selectAll();
        PageInfo<OaReceiveDocument> pageInfo = new PageInfo<>(oaReceiveDocumentList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转新建公司发文
     *
     * @return add.jsp
     */
    @RequestMapping(value = "/toNewReceiveDocument")
    public String toNewReleaseDocument(int prev, Model model) {
        model.addAttribute("prev", JsonHelper.toJSONString(prev));
        return "oa/archives/office/receive_document/add";
    }

    /**
     * 添加公司发文
     *
     * @return add.jsp
     */
    @RequestMapping(value = "/addReceiveDocument", method = RequestMethod.POST)
    @ResponseBody
    public String add(OaReceiveDocument oaReceiveDocument) {
        if (oaReceiveDocumentService.insertSelective(oaReceiveDocument) < 0) {
            return JsonHelper.toJSONString("error");
        }
        return JsonHelper.toJSONString("success");
    }

    /**
     * 文件类型筛选
     *
     * @param publishingDepartment 发文部室
     * @return list
     */
    @RequestMapping(value = "/docTypeFilter")
    @ResponseBody
    public String docTypeFilter(int publishingDepartment, int page) {
        PageHelper.startPage(page, 12);
        List<OaReceiveDocument> oaReceiveDocumentList = oaReceiveDocumentService.select(publishingDepartment);
        PageInfo<OaReceiveDocument> pageInfo = new PageInfo<>(oaReceiveDocumentList);
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
        PageHelper.startPage(page, 12);
        List<OaReceiveDocument> oaReceiveDocumentList = oaReceiveDocumentService.getSelectByName(documentName);
        PageInfo<OaReceiveDocument> pageInfo = new PageInfo<>(oaReceiveDocumentList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 根据访问时间查询
     *
     * @param receiveDate 收文时间
     * @return list
     */
    @RequestMapping(value = "/receiveDateFilter")
    @ResponseBody
    public String receiveDateFilter(String receiveDate, int page) {
        PageHelper.startPage(page, 12);
        List<OaReceiveDocument> oaReceiveDocumentList = oaReceiveDocumentService.getSelectByReceiveDate(receiveDate);
        PageInfo<OaReceiveDocument> pageInfo = new PageInfo<>(oaReceiveDocumentList);
        return JsonHelper.toJSONString(pageInfo);
    }


    /**
     * 跳转修改页面
     *
     * @param id id
     * @return edit.jsp
     */
    @RequestMapping("/toEdit")
    public String toEdit(Model model, int id, int prev) {
        OaReceiveDocument oaReceiveDocument = oaReceiveDocumentService.selectByPrimaryKey(id);
        model.addAttribute("oaReceiveDocument", oaReceiveDocument);
        model.addAttribute("prev", JsonHelper.toJSONString(prev));
        return "oa/archives/office/receive_document/edit";
    }

    /**
     * 提交修改
     *
     * @param oaReceiveDocument oaReceiveDocument
     * @return 影响行数
     */
    @RequestMapping("/edit")
    @ResponseBody
    public String edit(OaReceiveDocument oaReceiveDocument) {
        if (oaReceiveDocumentService.updateByPrimaryKeySelective(oaReceiveDocument) < 0) {
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
        if (oaReceiveDocumentService.delete(id) == 1) {
            return "success";
        }
        return "error";
    }

    /**
     * 公司收文详情
     *
     * @param id    id
     * @param model model
     * @return edit.jsp
     */
    @RequestMapping(value = "/toReceiveDocumentDetails")
    public String particulars(int id, int prev, Model model) {
        OaReceiveDocument oaReceiveDocument = oaReceiveDocumentService.selectByPrimaryKey(id);
        model.addAttribute("oaReceiveDocument", oaReceiveDocument);
        model.addAttribute("prev", JsonHelper.toJSONString(prev));
        return "oa/archives/office/receive_document/details";
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
        if (oaReceiveDocumentService.batchDelete(ids) >= 0) {
            return "success";
        } else {
            return "error";
        }
    }
}
