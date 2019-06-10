package com.jiaoke.controller.oa.news;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaCorporateHonor;
import com.jiaoke.oa.bean.OaNewsCenter;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.OaCorporateHonorService;
import com.jiaoke.oa.service.OaNewsCenterService;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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

    /**
     * 新闻管理
     *
     * @return oa_schedule_planning.jsp
     */
    @RequestMapping("/toNewsCenter")
    public String toNewsCenter(Model model) {
        List<OaNewsCenter> oaNewsCenterList = oaNewsCenterService.selectLatestData();
        List<OaCorporateHonor> oaCorporateHonorList = oaCorporateHonorService.selectLatestData();
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
    public String toNewsRelease(Model model) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("userInfo", userInfo);
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
    public String toNewsList() {
        return "oa/culture/oa_news_list";
    }

    /**
     * 加载新闻列表数据
     *
     * @return list
     */
    @RequestMapping(value = "/newsListData")
    @ResponseBody
    public String newsListData(int page) {
        PageHelper.startPage(page, 15);
        List<OaNewsCenter> oaNewsCenterList = oaNewsCenterService.selectAll();
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

    /**----------------------------------企业荣誉-----------------------------------------*/

    /**
     * 跳转企业荣誉列表
     *
     * @return jsp
     */
    @RequestMapping(value = "/toCorporateHonorList")
    public String toCorporateHonorList() {
        return "oa/culture/oa_corporate_honor_list";
    }

    /**
     * 加载企业荣誉列表数据
     *
     * @return list
     */
    @RequestMapping(value = "/corporateHonorListData")
    @ResponseBody
    public String corporateHonorListData(int page) {
        PageHelper.startPage(page, 15);
        List<OaCorporateHonor> oaCorporateHonorList = oaCorporateHonorService.selectAll();
        PageInfo<OaCorporateHonor> pageInfo = new PageInfo<>(oaCorporateHonorList);
        return JsonHelper.toJSONString(pageInfo);
    }


    /**
     * 跳转企业荣誉发布
     *
     * @return jsp
     */
    @RequestMapping(value = "/toCorporateHonor")
    public String toCorporateHonor(Model model) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("userInfo", userInfo);
        return "oa/culture/oa_corporate_honor_release";
    }

    /**
     * 添加企业荣誉
     *
     * @param oaCorporateHonor oaCorporateHonor
     * @return 影响行数
     */
    @RequestMapping(value = "/addCorporateHonor")
    @ResponseBody
    public String addCorporateHonor(OaCorporateHonor oaCorporateHonor) {
        if (oaCorporateHonorService.insertSelective(oaCorporateHonor) != 1) {
            return JsonHelper.toJSONString("error");
        }
        return JsonHelper.toJSONString("success");
    }


    /**
     * 企业荣誉详情
     *
     * @param model model
     * @param id    id
     * @return jsp
     */
    @RequestMapping(value = "/corporateHonorDetails")
    public String corporateHonorDetails(Model model, Integer id) {
        OaCorporateHonor oaCorporateHonor = oaCorporateHonorService.selectByPrimaryKey(id);
        model.addAttribute("oaCorporateHonor", oaCorporateHonor);
        return "oa/culture/oa_corporate_honor_details";
    }
}
