package com.jiaoke.controller.oa.archives.material;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaMaterialBidding;
import com.jiaoke.oa.service.OaMaterialBiddingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 物资管理部-砂石料招投标资料
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/materialBidding")
public class OaMaterialBiddingController {

    @Resource
    private OaMaterialBiddingService oaMaterialBiddingService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/material/bidding/index";
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
        List<OaMaterialBidding> oaMaterialBiddingList = oaMaterialBiddingService.selectAll();
        PageInfo<OaMaterialBidding> pageInfo = new PageInfo<>(oaMaterialBiddingList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 筛选
     *
     * @param page page
     * @param file file
     * @return json
     */
    @RequestMapping(value = "/searchFilter")
    @ResponseBody
    public String searchFilter(int page, String file) {
        PageHelper.startPage(page, 15);
        List<OaMaterialBidding> oaMaterialBiddingList = oaMaterialBiddingService.searchFilter(file);
        PageInfo<OaMaterialBidding> pageInfo = new PageInfo<>(oaMaterialBiddingList);
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
        return "oa/archives/material/bidding/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaMaterialBidding oaMaterialBidding) {
        if (oaMaterialBiddingService.insertSelective(oaMaterialBidding) < 1) {
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
        OaMaterialBidding oaMaterialBidding = oaMaterialBiddingService.selectByPrimaryKey(id);
        model.addAttribute("oaMaterialBidding", oaMaterialBidding);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/material/bidding/details";
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
        OaMaterialBidding oaMaterialBidding = oaMaterialBiddingService.selectByPrimaryKey(id);
        model.addAttribute("oaMaterialBidding", oaMaterialBidding);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/material/bidding/edit";
    }

    /**
     * 提交修改
     *
     * @param oaMaterialBidding oaMaterialBidding
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaMaterialBidding oaMaterialBidding) {
        if (oaMaterialBiddingService.updateByPrimaryKeySelective(oaMaterialBidding) < 1) {
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
        if (oaMaterialBiddingService.deleteByPrimaryKey(id) < 1) {
            return "error";
        }
        return "success";
    }
}
