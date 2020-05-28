package com.jiaoke.controller.oa.archives.production;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaProductionEngineering;
import com.jiaoke.oa.service.OaProductionEngineeringService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 生产管理部-工程基建类资料
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/productionEngineering")
public class OaProductionEngineeringController {

    @Resource
    private OaProductionEngineeringService oaProductionEngineeringService;

    /**
     * 首页
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toOperateContract(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/engineering/indexs";
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
        List<OaProductionEngineering> oaProductionEngineeringList = oaProductionEngineeringService.selectAll();
        PageInfo<OaProductionEngineering> pageInfo = new PageInfo<>(oaProductionEngineeringList);
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
        PageHelper.startPage(page, 12);
        List<OaProductionEngineering> oaProductionEngineeringList = oaProductionEngineeringService.searchFilter(projectName);
        PageInfo<OaProductionEngineering> pageInfo = new PageInfo<>(oaProductionEngineeringList);
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
        return "oa/archives/production/engineering/add";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaProductionEngineering oaProductionEngineering) {
        if (oaProductionEngineeringService.insertSelective(oaProductionEngineering) < 1) {
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
        OaProductionEngineering oaProductionEngineering = oaProductionEngineeringService.selectByPrimaryKey(id);
        model.addAttribute("oaProductionEngineering", oaProductionEngineering);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/engineering/details";
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
        OaProductionEngineering oaProductionEngineering = oaProductionEngineeringService.selectByPrimaryKey(id);
        model.addAttribute("oaProductionEngineering", oaProductionEngineering);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/archives/production/engineering/edit";
    }

    /**
     * 提交修改
     *
     * @param oaProductionEngineering oaProductionEngineering
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaProductionEngineering oaProductionEngineering) {
        if (oaProductionEngineeringService.updateByPrimaryKeySelective(oaProductionEngineering) < 1) {
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
        if (oaProductionEngineeringService.deleteByPrimaryKey(id) < 1) {
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
        if (oaProductionEngineeringService.batchDelete(ids) >= 0) {
            return "success";
        } else {
            return "error";
        }
    }
}
