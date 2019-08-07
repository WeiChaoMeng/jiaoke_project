package com.jiaoke.controller.oa.archives.operate;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaOperateBid;
import com.jiaoke.oa.service.OaOperateBidService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
@RequestMapping(value = "/operateBid")
public class OaOperateBidController {

    @Resource
    private OaOperateBidService oaOperateBidService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_bid/index";
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
        List<OaOperateBid> oaOperateBidList = oaOperateBidService.selectAll();
        PageInfo<OaOperateBid> pageInfo = new PageInfo<>(oaOperateBidList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 筛选
     *
     * @param page        page
     * @param projectName projectName
     * @return json
     */
    @RequestMapping(value = "/searchFilter")
    @ResponseBody
    public String searchFilter(int page, String projectName) {
        PageHelper.startPage(page, 15);
        List<OaOperateBid> oaOperateBidList = oaOperateBidService.searchFilter(projectName);
        PageInfo<OaOperateBid> pageInfo = new PageInfo<>(oaOperateBidList);
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
        return "oa/archives/operate/operate_bid/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaOperateBid oaOperateBid) {
        if (oaOperateBidService.insertSelective(oaOperateBid) < 1) {
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
        OaOperateBid oaOperateBid = oaOperateBidService.selectByPrimaryKey(id);
        model.addAttribute("oaOperateBid", oaOperateBid);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_bid/details";
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
        OaOperateBid oaOperateBid = oaOperateBidService.selectByPrimaryKey(id);
        model.addAttribute("oaOperateBid", oaOperateBid);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_bid/edit";
    }

    /**
     * 提交修改
     *
     * @param oaOperateBid oaOperateBid
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaOperateBid oaOperateBid) {
        if (oaOperateBidService.updateByPrimaryKeySelective(oaOperateBid) < 1) {
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
        if (oaOperateBidService.deleteByPrimaryKey(id) < 1) {
            return "error";
        }
        return "success";
    }
}