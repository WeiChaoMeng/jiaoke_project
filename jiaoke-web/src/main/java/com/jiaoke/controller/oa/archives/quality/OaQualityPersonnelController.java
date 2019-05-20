package com.jiaoke.controller.oa.archives.quality;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaFinanceOther;
import com.jiaoke.oa.bean.OaQualityPersonnel;
import com.jiaoke.oa.service.OaFinanceOtherService;
import com.jiaoke.oa.service.OaQualityPersonnelService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 质量技术部-人员情况
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/qualityPersonnel")
public class OaQualityPersonnelController {

    @Resource
    private OaQualityPersonnelService oaQualityPersonnelService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/quality/personnel/index";
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
        List<OaQualityPersonnel> oaQualityPersonnelList = oaQualityPersonnelService.selectAll();
        PageInfo<OaQualityPersonnel> pageInfo = new PageInfo<>(oaQualityPersonnelList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 筛选
     *
     * @param page page
     * @param name name
     * @return json
     */
    @RequestMapping(value = "/searchFilter")
    @ResponseBody
    public String searchFilter(int page, String name) {
        PageHelper.startPage(page, 15);
        List<OaQualityPersonnel> oaQualityPersonnelList = oaQualityPersonnelService.searchFilter(name);
        PageInfo<OaQualityPersonnel> pageInfo = new PageInfo<>(oaQualityPersonnelList);
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
        return "oa/archives/quality/personnel/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaQualityPersonnel oaQualityPersonnel) {
        if (oaQualityPersonnelService.insertSelective(oaQualityPersonnel) < 1) {
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
        OaQualityPersonnel oaQualityPersonnel = oaQualityPersonnelService.selectByPrimaryKey(id);
        model.addAttribute("oaQualityPersonnel", oaQualityPersonnel);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/quality/personnel/details";
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
        OaQualityPersonnel oaQualityPersonnel = oaQualityPersonnelService.selectByPrimaryKey(id);
        model.addAttribute("oaQualityPersonnel", oaQualityPersonnel);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/quality/personnel/edit";
    }

    /**
     * 提交修改
     *
     * @param oaQualityPersonnel oaQualityPersonnel
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaQualityPersonnel oaQualityPersonnel) {
        if (oaQualityPersonnelService.updateByPrimaryKeySelective(oaQualityPersonnel) < 1) {
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
        if (oaQualityPersonnelService.deleteByPrimaryKey(id) < 1) {
            return "error";
        }
        return "success";
    }
}
