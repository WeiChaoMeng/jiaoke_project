package com.jiaoke.controller.oa.archives.production;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaProductionEquipment;
import com.jiaoke.oa.service.OaProductionEquipmentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 生产管理部-设备档案技术资料
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/productionEquipment")
public class OaProductionEquipmentController {

    @Resource
    private OaProductionEquipmentService oaProductionEquipmentService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/equipment/indexs";
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
        List<OaProductionEquipment> oaProductionEquipmentList = oaProductionEquipmentService.selectAll();
        PageInfo<OaProductionEquipment> pageInfo = new PageInfo<>(oaProductionEquipmentList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 筛选
     *
     * @param page        page
     * @param deviceName deviceName
     * @return json
     */
    @RequestMapping(value = "/searchFilter")
    @ResponseBody
    public String searchFilter(int page, String deviceName) {
        PageHelper.startPage(page, 12);
        List<OaProductionEquipment> oaProductionEquipmentList = oaProductionEquipmentService.searchFilter(deviceName);
        PageInfo<OaProductionEquipment> pageInfo = new PageInfo<>(oaProductionEquipmentList);
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
        return "oa/archives/production/equipment/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaProductionEquipment oaProductionEquipment) {
        if (oaProductionEquipmentService.insertSelective(oaProductionEquipment) < 1) {
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
        OaProductionEquipment oaProductionEquipment = oaProductionEquipmentService.selectByPrimaryKey(id);
        model.addAttribute("oaProductionEquipment", oaProductionEquipment);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/equipment/details";
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
        OaProductionEquipment oaProductionEquipment = oaProductionEquipmentService.selectByPrimaryKey(id);
        model.addAttribute("oaProductionEquipment", oaProductionEquipment);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/equipment/edit";
    }

    /**
     * 提交修改
     *
     * @param oaProductionEquipment oaProductionEquipment
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaProductionEquipment oaProductionEquipment) {
        if (oaProductionEquipmentService.updateByPrimaryKeySelective(oaProductionEquipment) < 1) {
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
        if (oaProductionEquipmentService.deleteByPrimaryKey(id) < 1) {
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
        if (oaProductionEquipmentService.batchDelete(ids) >= 0) {
            return "success";
        } else {
            return "error";
        }
    }
}
