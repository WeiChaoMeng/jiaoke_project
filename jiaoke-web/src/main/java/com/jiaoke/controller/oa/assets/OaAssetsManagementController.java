package com.jiaoke.controller.oa.assets;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaAssetManagement;
import com.jiaoke.oa.bean.OaAssetReplenishment;
import com.jiaoke.oa.bean.OaAssetUse;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.OaAssetUseService;
import com.jiaoke.oa.service.OaAssetsManagementService;
import com.jiaoke.oa.service.OaAssetsReplenishmentService;
import org.apache.shiro.SecurityUtils;
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

    @Resource
    private OaAssetUseService oaAssetUseService;

    /**
     * 获取当前登录用户信息
     *
     * @return userInfo
     */
    private UserInfo getCurrentUser() {
        return (UserInfo) SecurityUtils.getSubject().getPrincipal();
    }

    /**
     * 跳转资产档案
     *
     * @return oa_assets_archives.jsp
     */
    @RequestMapping("/toAssetsArchives")
    public String toAssetsArchives(Model model, int page) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
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
     * 跳转补货记录
     *
     * @param model             model
     * @param assetManagementId 资产id
     * @return jsp
     */
    @RequestMapping(value = "/toAssetReplenishmentRecordPage")
    public String toAssetReplenishmentRecordPage(Model model, Integer assetManagementId, int archivesPage) {
        model.addAttribute("assetManagementId", assetManagementId);
        model.addAttribute("archivesPage", JsonHelper.toJSONString(archivesPage));
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
    @RequestMapping("/toAssetUse")
    public String toAssetUse(Model model, int page) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/assets/oa_resources_use";
    }

    /**
     * 加载申请记录表数据
     *
     * @param page page
     * @return 分页数据
     */
    @RequestMapping(value = "/assetUse")
    @ResponseBody
    public String assetUse(int page) {
        PageHelper.startPage(page, 15);
        List<OaAssetUse> oaAssetUseList = oaAssetUseService.selectAll();
        PageInfo<OaAssetUse> pageInfo = new PageInfo<>(oaAssetUseList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 根据名字筛选
     *
     * @param page      page
     * @param assetName assetName
     * @return list
     */
    @RequestMapping(value = "/assetNameFilter")
    @ResponseBody
    public String usernameFilter(int page, String assetName) {
        PageHelper.startPage(page, 15);
        List<OaAssetUse> oaAssetUseList = oaAssetUseService.fuzzyQueryByName(assetName);
        PageInfo<OaAssetUse> pageInfo = new PageInfo<>(oaAssetUseList);
        return JsonHelper.toJSONString(pageInfo);
    }
}
