package com.jiaoke.controller.oa.news;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaCorporateHonor;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.OaCorporateHonorService;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 企业荣誉
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/21 14:43
 */
@Controller
@RequestMapping(value = "/corporateHonor")
public class OaCorporateHonorController {

    @Resource
    private OaCorporateHonorService oaCorporateHonorService;

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

    /**
     * 删除企业荣誉
     *
     * @return int
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String corporateHonorDelete(Integer id) {
        if (oaCorporateHonorService.deleteByPrimaryKey(id) < 0) {
            return "error";
        }
        return "success";
    }
}
