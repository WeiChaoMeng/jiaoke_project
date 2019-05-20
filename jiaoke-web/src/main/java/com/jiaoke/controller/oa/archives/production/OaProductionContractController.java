package com.jiaoke.controller.oa.archives.production;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaProductionContract;
import com.jiaoke.oa.service.OaProductionContractService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 生产管理部-合同
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/productionContract")
public class OaProductionContractController {

    @Resource
    private OaProductionContractService oaProductionContractService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/contract/index";
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
        List<OaProductionContract> oaProductionContractList = oaProductionContractService.selectAll();
        PageInfo<OaProductionContract> pageInfo = new PageInfo<>(oaProductionContractList);
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
        List<OaProductionContract> oaProductionContractList = oaProductionContractService.searchFilter(projectName);
        PageInfo<OaProductionContract> pageInfo = new PageInfo<>(oaProductionContractList);
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
        return "oa/archives/production/contract/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaProductionContract oaProductionContract) {
        if (oaProductionContractService.insertSelective(oaProductionContract) < 1) {
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
        OaProductionContract oaProductionContract = oaProductionContractService.selectByPrimaryKey(id);
        model.addAttribute("oaProductionContract", oaProductionContract);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/contract/details";
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
        OaProductionContract oaProductionContract = oaProductionContractService.selectByPrimaryKey(id);
        model.addAttribute("oaProductionContract", oaProductionContract);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/contract/edit";
    }

    /**
     * 提交修改
     *
     * @param oaProductionContract oaProductionContract
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaProductionContract oaProductionContract) {
        if (oaProductionContractService.updateByPrimaryKeySelective(oaProductionContract) < 1) {
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
        if (oaProductionContractService.deleteByPrimaryKey(id) < 1) {
            return "error";
        }
        return "success";
    }
}
