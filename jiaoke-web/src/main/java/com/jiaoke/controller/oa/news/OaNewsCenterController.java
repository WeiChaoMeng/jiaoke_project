package com.jiaoke.controller.oa.news;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaCorporateHonor;
import com.jiaoke.oa.bean.OaNewsCenter;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.OaCorporateHonorService;
import com.jiaoke.oa.service.OaNewsCenterService;
import com.jiaoke.oa.service.UserInfoService;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 新闻中心
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/21 14:43
 */
@Controller
@RequestMapping(value = "/newsCenter")
public class OaNewsCenterController {

    @Resource
    private OaNewsCenterService oaNewsCenterService;

    @Resource
    private OaCorporateHonorService oaCorporateHonorService;

    @Resource
    private UserInfoService userInfoService;

    /**
     * 新闻管理
     *
     * @return oa_schedule_planning.jsp
     */
    @RequestMapping("/toNewsCenter")
    public String toNewsCenter(Model model) {
        List<OaNewsCenter> oaNewsCenterList = oaNewsCenterService.selectLatestData();
        List<OaCorporateHonor> oaCorporateHonorList = oaCorporateHonorService.selectLatestData();
        List<UserInfo> newsList = userInfoService.selectMultipleByPermission("news_administrator");
        List<UserInfo> honourList = userInfoService.selectMultipleByPermission("enterprise_honor_administrator");
        model.addAttribute("newsManagerList", newsList);
        model.addAttribute("honourManagerList", honourList);
        model.addAttribute("oaCorporateHonorList", oaCorporateHonorList);
        model.addAttribute("oaNewsCenterList", oaNewsCenterList);
        return "oa/culture/oa_news_center";
    }

    /**
     * 跳转新闻发布
     *
     * @return jsp
     */
    @RequestMapping(value = "/toNewsRelease")
    public String toNewsRelease(Model model,String jumpFlag) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("jumpFlag", jumpFlag);
        return "oa/culture/oa_news_release";
    }

    /**
     * 添加新闻
     *
     * @param oaNewsCenter oaNewsCenter
     * @return 影响行数
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaNewsCenter oaNewsCenter) {
        if (oaNewsCenterService.insertSelective(oaNewsCenter) != 1) {
            return JsonHelper.toJSONString("error");
        }
        return JsonHelper.toJSONString("success");
    }

    /**
     * 跳转新闻列表
     *
     * @return list
     */
    @RequestMapping(value = "/toNewsList")
    public String toNewsList(Model model, int page) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/culture/news";
    }

    /**
     * 加载新闻列表数据
     *
     * @return list
     */
    @RequestMapping(value = "/newsListData")
    @ResponseBody
    public String newsListData(int page) {
        PageHelper.startPage(page, 12);
        List<OaNewsCenter> oaNewsCenterList = oaNewsCenterService.selectAll();
        PageInfo<OaNewsCenter> pageInfo = new PageInfo<>(oaNewsCenterList);
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
        List<OaNewsCenter> oaNewsCenterList = oaNewsCenterService.titleFilter(title);
        PageInfo<OaNewsCenter> pageInfo = new PageInfo<>(oaNewsCenterList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 新闻详情
     *
     * @param model model
     * @param id    id
     * @return jsp
     */
    @RequestMapping(value = "/newsDetails")
    public String newsDetails(Model model, Integer id) {
        OaNewsCenter oaNewsCenter = oaNewsCenterService.selectByPrimaryKey(id);
        model.addAttribute("oaNewsCenter", oaNewsCenter);
        return "oa/culture/oa_news_details";
    }

    /**
     * 删除新闻
     *
     * @return int
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(Integer id) {
        if (oaNewsCenterService.deleteByPrimaryKey(id) < 0) {
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
    @RequestMapping(value = "/batchDeleteNews")
    @ResponseBody
    public String batchDeleteNews(@RequestParam(value = "ids[]") String[] ids) {
        if (oaNewsCenterService.batchDeleteNews(ids) >= 0) {
            return "success";
        } else {
            return "error";
        }
    }
}
