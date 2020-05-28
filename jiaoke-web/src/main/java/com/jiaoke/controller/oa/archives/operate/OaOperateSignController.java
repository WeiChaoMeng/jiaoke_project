package com.jiaoke.controller.oa.archives.operate;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaOperateDevelop;
import com.jiaoke.oa.bean.OaOperateSign;
import com.jiaoke.oa.service.OaOperateDevelopService;
import com.jiaoke.oa.service.OaOperateSignService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 经营签发档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/operateSign")
public class OaOperateSignController {

    @Resource
    private OaOperateSignService oaOperateSignService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_sign/indexs";
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
        List<OaOperateSign> oaOperateSignList = oaOperateSignService.selectAll();
        PageInfo<OaOperateSign> pageInfo = new PageInfo<>(oaOperateSignList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 筛选
     *
     * @param page      page
     * @param purchaser purchaser
     * @return json
     */
    @RequestMapping(value = "/searchFilter")
    @ResponseBody
    public String searchFilter(int page, String purchaser) {
        PageHelper.startPage(page, 12);
        List<OaOperateSign> oaOperateSignList = oaOperateSignService.searchFilter(purchaser);
        PageInfo<OaOperateSign> pageInfo = new PageInfo<>(oaOperateSignList);
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
        return "oa/archives/operate/operate_sign/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaOperateSign oaOperateSign) {
        if (oaOperateSignService.insertSelective(oaOperateSign) < 1) {
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
        OaOperateSign oaOperateSign = oaOperateSignService.selectByPrimaryKey(id);
        model.addAttribute("oaOperateSign", oaOperateSign);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_sign/details";
    }

    /**
     * 跳转修改
     *
     * @param id    id
     * @param page  page
     * @param model model
     * @return
     */
    @RequestMapping(value = "/toEdit")
    public String toEdit(Integer id, int page, Model model) {
        OaOperateSign oaOperateSign = oaOperateSignService.selectByPrimaryKey(id);
        model.addAttribute("oaOperateSign", oaOperateSign);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_sign/edit";
    }

    /**
     * 提交修改
     *
     * @param oaOperateSign oaOperateSign
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaOperateSign oaOperateSign) {
        if (oaOperateSignService.updateByPrimaryKeySelective(oaOperateSign) < 1) {
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
        if (oaOperateSignService.deleteByPrimaryKey(id) < 1) {
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
        if (oaOperateSignService.batchDelete(ids) >= 0) {
            return "success";
        } else {
            return "error";
        }
    }
}
