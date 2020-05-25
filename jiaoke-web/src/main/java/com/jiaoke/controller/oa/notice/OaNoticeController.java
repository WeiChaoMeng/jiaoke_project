package com.jiaoke.controller.oa.notice;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaNotice;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.OaNoticeService;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 公告
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-27 1:40
 */
@Controller
@RequestMapping(value = "/notice")
public class OaNoticeController {

    @Resource
    private OaNoticeService oaNoticeService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String announcements(Model model, int page) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/culture/notice";
    }

    /**
     * 加载首页数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/loadingData")
    @ResponseBody
    public String loadingData(int page) {
        PageHelper.startPage(page, 12);
        List<OaNotice> oaNoticeList = oaNoticeService.selectAllData();
        PageInfo<OaNotice> pageInfo = new PageInfo<>(oaNoticeList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 根据名字筛选
     *
     * @param page  page
     * @param title title
     * @return list
     */
    @RequestMapping(value = "/titleFilter")
    @ResponseBody
    public String titleFilter(int page, String title) {
        PageHelper.startPage(page, 12);
        List<OaNotice> oaNoticeList = oaNoticeService.titleFilter(title);
        PageInfo<OaNotice> pageInfo = new PageInfo<>(oaNoticeList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/toAdd")
    public String toNewsRelease(Model model, int page) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/culture/oa_notice_add";
    }

    /**
     * 添加用户
     *
     * @param oaNotice oaNotice
     * @return success/error
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaNotice oaNotice) {
        if (oaNoticeService.insertSelective(oaNotice) < 1) {
            return JsonHelper.toJSONString("error");
        }
        return JsonHelper.toJSONString("success");
    }

    /**
     * 删除用户
     *
     * @param id id
     * @return 影响行数
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(Integer id) {
        if (oaNoticeService.deleteByPrimaryKey(id) != 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 详情
     *
     * @param model model
     * @param id    id
     * @return jsp
     */
    @RequestMapping(value = "/details")
    public String newsDetails(Model model, Integer id, int page) {
        OaNotice oaNotice = oaNoticeService.selectByPrimaryKey(id);
        model.addAttribute("oaNotice", oaNotice);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/culture/oa_notice_details";
    }

    /**
     * 主页数据详情
     *
     * @param model model
     * @param id    id
     * @return jsp
     */
    @RequestMapping(value = "/homePageDetails")
    public String homePageDetails(Model model, Integer id) {
        OaNotice oaNotice = oaNoticeService.selectByPrimaryKey(id);
        model.addAttribute("oaNotice", oaNotice);
        return "oa/culture/oa_notice_home_details";
    }

    /**
     * 批量删除
     *
     * @param ids ids
     * @return int
     */
    @RequestMapping(value = "/batchDeleteNotice")
    @ResponseBody
    public String batchDeleteNotice(@RequestParam(value = "ids[]") String[] ids) {
        if (oaNoticeService.batchDeleteNotice(ids) >= 0) {
            return "success";
        } else {
            return "error";
        }
    }
}
