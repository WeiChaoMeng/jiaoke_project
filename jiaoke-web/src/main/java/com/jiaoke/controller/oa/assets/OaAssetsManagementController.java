package com.jiaoke.controller.oa.assets;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaAssetManagement;
import com.jiaoke.oa.service.OaAssetsManagementService;
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
     * @return 
     */
    @RequestMapping(value = "/commitAssetReplenishment")
    public String commitAssetReplenishment(){

        return "";
    }

    /**
     * 申领资源
     *
     * @return oa_schedule_planning.jsp
     */
    @RequestMapping("/OAResourceApply.do")
    public String resourceApply() {
        return "oa/assets/oa_resource_apply";
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
