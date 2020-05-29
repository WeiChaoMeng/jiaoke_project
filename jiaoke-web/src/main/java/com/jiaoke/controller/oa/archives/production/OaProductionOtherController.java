package com.jiaoke.controller.oa.archives.production;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaProductionOther;
import com.jiaoke.oa.service.OaProductionOtherService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 生产管理部-其他文件
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/productionOther")
public class OaProductionOtherController {

    @Resource
    private OaProductionOtherService oaProductionOtherService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/other/indexs";
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
        List<OaProductionOther> oaProductionOtherList = oaProductionOtherService.selectAll();
        PageInfo<OaProductionOther> pageInfo = new PageInfo<>(oaProductionOtherList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 筛选
     *
     * @param page        page
     * @param name name
     * @return json
     */
    @RequestMapping(value = "/searchFilter")
    @ResponseBody
    public String searchFilter(int page, String name) {
        PageHelper.startPage(page, 12);
        List<OaProductionOther> oaProductionOtherList = oaProductionOtherService.searchFilter(name);
        PageInfo<OaProductionOther> pageInfo = new PageInfo<>(oaProductionOtherList);
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
        return "oa/archives/production/other/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaProductionOther oaProductionOther) {
        if (oaProductionOtherService.insertSelective(oaProductionOther) < 1) {
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
        OaProductionOther oaProductionOther = oaProductionOtherService.selectByPrimaryKey(id);
        model.addAttribute("oaProductionOther", oaProductionOther);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/other/details";
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
        OaProductionOther oaProductionOther = oaProductionOtherService.selectByPrimaryKey(id);
        model.addAttribute("oaProductionOther", oaProductionOther);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/other/edit";
    }

    /**
     * 提交修改
     *
     * @param oaProductionOther oaProductionOther
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaProductionOther oaProductionOther) {
        if (oaProductionOtherService.updateByPrimaryKeySelective(oaProductionOther) < 1) {
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
        if (oaProductionOtherService.deleteByPrimaryKey(id) < 1) {
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
        if (oaProductionOtherService.batchDelete(ids) >= 0) {
            return "success";
        } else {
            return "error";
        }
    }

}
