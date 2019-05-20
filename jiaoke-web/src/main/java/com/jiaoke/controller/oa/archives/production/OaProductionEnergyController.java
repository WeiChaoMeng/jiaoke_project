package com.jiaoke.controller.oa.archives.production;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaProductionEnergy;
import com.jiaoke.oa.service.OaProductionEnergyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 生产管理部-能源、碳排放统计
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/productionEnergy")
public class OaProductionEnergyController {

    @Resource
    private OaProductionEnergyService oaProductionEnergyService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/energy/index";
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
        List<OaProductionEnergy> oaProductionEnergyList = oaProductionEnergyService.selectAll();
        PageInfo<OaProductionEnergy> pageInfo = new PageInfo<>(oaProductionEnergyList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 筛选
     *
     * @param page        page
     * @param yearStr yearStr
     * @return json
     */
    @RequestMapping(value = "/searchFilter")
    @ResponseBody
    public String searchFilter(int page, String yearStr) {
        PageHelper.startPage(page, 15);
        List<OaProductionEnergy> oaProductionEnergyList = oaProductionEnergyService.searchFilter(yearStr);
        PageInfo<OaProductionEnergy> pageInfo = new PageInfo<>(oaProductionEnergyList);
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
        return "oa/archives/production/energy/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaProductionEnergy oaProductionEnergy) {
        if (oaProductionEnergyService.insertSelective(oaProductionEnergy) < 1) {
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
        OaProductionEnergy oaProductionEnergy = oaProductionEnergyService.selectByPrimaryKey(id);
        model.addAttribute("oaProductionEnergy", oaProductionEnergy);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/energy/details";
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
        OaProductionEnergy oaProductionEnergy = oaProductionEnergyService.selectByPrimaryKey(id);
        model.addAttribute("oaProductionEnergy", oaProductionEnergy);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/energy/edit";
    }

    /**
     * 提交修改
     *
     * @param oaProductionEnergy oaProductionEnergy
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaProductionEnergy oaProductionEnergy) {
        if (oaProductionEnergyService.updateByPrimaryKeySelective(oaProductionEnergy) < 1) {
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
        if (oaProductionEnergyService.deleteByPrimaryKey(id) < 1) {
            return "error";
        }
        return "success";
    }
}
