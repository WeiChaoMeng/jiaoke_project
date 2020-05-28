package com.jiaoke.controller.oa.archives.office;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaManagementSystem;
import com.jiaoke.oa.service.OaManagementSystemService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * oa-综合办公室档案-管理体系相关
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/13 9:21
 */
@Controller
@RequestMapping(value = "/managementSystem")
public class OaManagementSystemController {

    @Resource
    private OaManagementSystemService oaManagementSystemService;

    /**
     * 跳转首页
     *
     * @return contract_agreement.jsp
     */
    @RequestMapping(value = "/toManagementSystem")
    public String toContractAgreement(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/office/management_system/indexs";
    }

    /**
     * 首页数据加载
     *
     * @return main.jsp
     */
    @RequestMapping(value = "/index")
    @ResponseBody
    public String index(int page) {
        PageHelper.startPage(page, 12);
        List<OaManagementSystem> oaManagementSystemList = oaManagementSystemService.selectAll();
        PageInfo<OaManagementSystem> pageInfo = new PageInfo<>(oaManagementSystemList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转新建
     *
     * @return add.jsp
     */
    @RequestMapping(value = "/toNewManagementSystem")
    public String toNewReleaseDocument(int prev, Model model) {
        model.addAttribute("prev", JsonHelper.toJSONString(prev));
        return "oa/archives/office/management_system/add";
    }

    /**
     * 新增
     *
     * @return add.jsp
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String add(OaManagementSystem oaManagementSystem) {
        if (oaManagementSystemService.insertSelective(oaManagementSystem) < 0) {
            return JsonHelper.toJSONString("error");
        }
        return JsonHelper.toJSONString("success");
    }

    /**
     * 根据名字搜索
     *
     * @param fileName fileName
     * @return list
     */
    @RequestMapping(value = "/fileNameFilter")
    @ResponseBody
    public String documentNameFilter(String fileName, int page) {
        PageHelper.startPage(page, 12);
        List<OaManagementSystem> oaManagementSystemList = oaManagementSystemService.getSelectByName(fileName);
        PageInfo<OaManagementSystem> pageInfo = new PageInfo<>(oaManagementSystemList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 根据时间查询
     *
     * @param date date
     * @return list
     */
    @RequestMapping(value = "/dateFilter")
    @ResponseBody
    public String visitDateFilter(String date, int page) {
        PageHelper.startPage(page, 12);
        List<OaManagementSystem> oaManagementSystemList = oaManagementSystemService.getSelectByDate(date);
        PageInfo<OaManagementSystem> pageInfo = new PageInfo<>(oaManagementSystemList);
        return JsonHelper.toJSONString(pageInfo);
    }


    /**
     * 跳转修改页面
     *
     * @param id id
     * @return edit.jsp
     */
    @RequestMapping("/toEdit")
    public String toEdit(Model model, int prev, int id) {
        OaManagementSystem oaManagementSystem = oaManagementSystemService.selectByPrimaryKey(id);
        model.addAttribute("prev", JsonHelper.toJSONString(prev));
        model.addAttribute("oaManagementSystem", oaManagementSystem);
        return "oa/archives/office/management_system/edit";
    }

    /**
     * 提交修改
     *
     * @param oaManagementSystem oaManagementSystem
     * @return 影响行数
     */
    @RequestMapping("/edit")
    @ResponseBody
    public String edit(OaManagementSystem oaManagementSystem) {
        if (oaManagementSystemService.updateByPrimaryKeySelective(oaManagementSystem) < 0) {
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
        if (oaManagementSystemService.delete(id) == 1) {
            return "success";
        }
        return "error";
    }

    /**
     * 详情
     *
     * @param id    id
     * @param model model
     * @return edit.jsp
     */
    @RequestMapping(value = "/toManagementSystemDetails")
    public String particulars(int id, int prev, Model model) {
        OaManagementSystem oaManagementSystem = oaManagementSystemService.selectByPrimaryKey(id);
        model.addAttribute("prev", JsonHelper.toJSONString(prev));
        model.addAttribute("oaManagementSystem", oaManagementSystem);
        return "oa/archives/office/management_system/details";
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
        if (oaManagementSystemService.batchDelete(ids) >= 0) {
            return "success";
        } else {
            return "error";
        }
    }
}
