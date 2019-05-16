package com.jiaoke.controller.oa.archives.operate;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaOperateMeeting;
import com.jiaoke.oa.bean.OaOperateOffer;
import com.jiaoke.oa.service.OaOperateMeetingService;
import com.jiaoke.oa.service.OaOperateOfferService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 经营会议纪要档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/operateMeeting")
public class OaOperateMeetingController {

    @Resource
    private OaOperateMeetingService oaOperateMeetingService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_meeting/index";
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
        List<OaOperateMeeting> oaOperateMeetingList = oaOperateMeetingService.selectAll();
        PageInfo<OaOperateMeeting> pageInfo = new PageInfo<>(oaOperateMeetingList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 筛选
     *
     * @param page  page
     * @param theme theme
     * @return json
     */
    @RequestMapping(value = "/searchFilter")
    @ResponseBody
    public String searchFilter(int page, String theme) {
        PageHelper.startPage(page, 15);
        List<OaOperateMeeting> oaOperateMeetingList = oaOperateMeetingService.searchFilter(theme);
        PageInfo<OaOperateMeeting> pageInfo = new PageInfo<>(oaOperateMeetingList);
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
        return "oa/archives/operate/operate_meeting/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaOperateMeeting oaOperateMeeting) {
        if (oaOperateMeetingService.insertSelective(oaOperateMeeting) < 1) {
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
        OaOperateMeeting oaOperateMeeting = oaOperateMeetingService.selectByPrimaryKey(id);
        model.addAttribute("oaOperateMeeting", oaOperateMeeting);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_meeting/details";
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
        OaOperateMeeting oaOperateMeeting = oaOperateMeetingService.selectByPrimaryKey(id);
        model.addAttribute("oaOperateMeeting", oaOperateMeeting);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/operate/operate_meeting/edit";
    }

    /**
     * 提交修改
     *
     * @param oaOperateMeeting oaOperateMeeting
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaOperateMeeting oaOperateMeeting) {
        if (oaOperateMeetingService.updateByPrimaryKeySelective(oaOperateMeeting) < 1) {
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
        if (oaOperateMeetingService.deleteByPrimaryKey(id) < 1) {
            return "error";
        }
        return "success";
    }
}
