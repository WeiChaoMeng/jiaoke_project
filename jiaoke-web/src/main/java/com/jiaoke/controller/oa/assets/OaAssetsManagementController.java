package com.jiaoke.controller.oa.assets;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaAssetManagement;
import com.jiaoke.oa.bean.OaAssetReplenishment;
import com.jiaoke.oa.service.OaAssetsManagementService;
import com.jiaoke.oa.service.OaAssetsReplenishmentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * oa-资产管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Controller
@RequestMapping(value = "/assetsManagement")
public class OaAssetsManagementController {

    @Resource
    private OaAssetsManagementService oaAssetsManagementService;

    @Resource
    private OaAssetsReplenishmentService oaAssetsReplenishmentService;

    /**
     * 跳转资产入库
     *
     * @return oa_asset_management.jsp
     */
    @RequestMapping("/toAssetsManagement")
    public String toAssetsManagement() {
        return "oa/assets/oa_asset_management";
    }

    /**
     * 根据资产名字查询
     *
     * @param assetsName name
     * @return list ? none（无）
     */
    @RequestMapping(value = "/selectByName")
    @ResponseBody
    public String selectByName(String assetsName) {
        List<OaAssetManagement> oaAssetManagementList = oaAssetsManagementService.selectByName(assetsName);
        if (oaAssetManagementList.size() > 0) {
            return JsonHelper.toJSONString(oaAssetManagementList);
        }
        return JsonHelper.toJSONString("none");
    }

    /**
     * 新增
     *
     * @param oaAssetManagement oaAssetManagement
     * @return 影响行数
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaAssetManagement oaAssetManagement) {
        if (oaAssetsManagementService.insertSelective(oaAssetManagement) == 1) {
            return JsonHelper.toJSONString("success");
        } else {
            return JsonHelper.toJSONString("error");
        }
    }

    /**
     * 跳转资产档案
     *
     * @return oa_assets_archives.jsp
     */
    @RequestMapping("/toAssetsArchives")
    public String toAssetsArchives() {
        return "oa/assets/oa_assets_archives";
    }

    /**
     * 查询全部
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/index")
    @ResponseBody
    public String index(int page) {
        PageHelper.startPage(page, 15);
        List<OaAssetManagement> oaAssetManagementList = oaAssetsManagementService.selectAll();
        PageInfo<OaAssetManagement> pageInfo = new PageInfo<>(oaAssetManagementList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 根据名字筛选
     *
     * @param page       page
     * @param assetsName 资产名称
     * @return list
     */
    @RequestMapping(value = "/assetsNameFilter")
    @ResponseBody
    public String assetsNameFilter(int page, String assetsName) {
        PageHelper.startPage(page, 15);
        List<OaAssetManagement> assetManagementList = oaAssetsManagementService.fuzzyQueryByName(assetsName);
        PageInfo<OaAssetManagement> pageInfo = new PageInfo<>(assetManagementList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 跳转补货页面
     *
     * @param id id
     * @return jsp
     */
    @RequestMapping(value = "/toAssetReplenishmentPage")
    public String toAssetReplenishmentPage(Model model, Integer id) {
        OaAssetManagement oaAssetManagement = oaAssetsManagementService.selectByPrimaryKey(id);
        model.addAttribute("oaAssetManagement", oaAssetManagement);
        return "oa/assets/oa_asset_replenishment";
    }

    /**
     * 提交补货
     *
     * @return 影响行数
     */
    @RequestMapping(value = "/commitAssetReplenishment")
    @ResponseBody
    public String commitAssetReplenishment(OaAssetReplenishment oaAssetReplenishment) {
        if (oaAssetsReplenishmentService.insertSelective(oaAssetReplenishment) != 1) {
            return JsonHelper.toJSONString("error");
        }
        return JsonHelper.toJSONString("success");
    }

    /**
     * 跳转补货记录
     *
     * @param model             model
     * @param assetManagementId 资产id
     * @return jsp
     */
    @RequestMapping(value = "/toAssetReplenishmentRecordPage")
    public String toAssetReplenishmentRecordPage(Model model, Integer assetManagementId) {
        model.addAttribute("assetManagementId", assetManagementId);
        return "oa/assets/oa_assets_replenishment_record";
    }

    /**
     * 补货记录数据
     *
     * @param page              page
     * @param assetManagementId 资产id
     * @return 分页数据
     */
    @RequestMapping(value = "/assetReplenishmentRecord")
    @ResponseBody
    public String assetReplenishmentRecord(int page, Integer assetManagementId) {
        PageHelper.startPage(page, 14);
        List<OaAssetReplenishment> assetReplenishmentList = oaAssetsReplenishmentService.select(assetManagementId);
        PageInfo<OaAssetReplenishment> pageInfo = new PageInfo<>(assetReplenishmentList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 补货时间筛选
     *
     * @param page              page
     * @param createTime        补货时间
     * @param assetManagementId 资产id
     * @return list
     */
    @RequestMapping(value = "/replenishmentTimeFilter")
    @ResponseBody
    public String replenishmentTimeFilter(int page, String createTime, Integer assetManagementId) {
        PageHelper.startPage(page, 14);
        List<OaAssetReplenishment> assetReplenishmentList = oaAssetsReplenishmentService.replenishmentTimeFilter(createTime, assetManagementId);
        PageInfo<OaAssetReplenishment> pageInfo = new PageInfo<>(assetReplenishmentList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 申领记录
     *
     * @return oa_schedule_planning.jsp
     */
    @RequestMapping("/OAReceiveRecord.do")
    public String receiveRecord() {
        return "oa/assets/oa_receive_record";
    }
}
