package com.jiaoke.controller.oa;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaReceiptReading;
import com.jiaoke.oa.service.OaReceiptReadingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 参数管理-收文阅办单-部门意见
 *
 * @author lihui
 * @version 1.0
 * @date 2020-6-2 0:18
 */
@Controller
@RequestMapping(value = "/receiptReading")
public class OaReceiptReadingController {

    @Resource
    private OaReceiptReadingService oaReceiptReadingService;

    /**
     * 跳转主页面
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toUserManager(Model model, int page) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/backstage/receipt_reading";
    }

    /**
     * 加载全部数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/getAllData")
    @ResponseBody
    public String userManager(int page) {
        PageHelper.startPage(page, 12);
        List<OaReceiptReading> oaReceiptReadingList = oaReceiptReadingService.selectAllData();
        PageInfo<OaReceiptReading> pageInfo = new PageInfo<>(oaReceiptReadingList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 新增
     *
     * @param name name
     * @return success/error
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(String name, String description) {
        if (oaReceiptReadingService.insertSelective(name, description) != 1) {
            return "error";
        }
        return "success";
    }

    /**
     * 检查是否被占用
     *
     * @param name name
     * @return t/f
     */
    @RequestMapping(value = "/checkName")
    @ResponseBody
    public String checkDepartmentName(String name) {
        OaReceiptReading receiptReading = oaReceiptReadingService.selectByName(name);
        if (null == receiptReading) {
            return "false";
        } else {
            return "true";
        }
    }

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(Integer id) {
        if (oaReceiptReadingService.deleteById(id) != 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑
     *
     * @param id id
     * @return success/error
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(Integer id, String description) {
        if (oaReceiptReadingService.updateData(id, description) < 0) {
            return "error";
        }
        return "success";
    }

    /**
     * 根据名字筛选
     *
     * @param page page
     * @param name name
     * @return list
     */
    @RequestMapping(value = "/nameFilter")
    @ResponseBody
    public String nameFilter(int page, String name) {
        PageHelper.startPage(page, 12);
        List<OaReceiptReading> receiptReadingList = oaReceiptReadingService.nameFilter(name);
        PageInfo<OaReceiptReading> pageInfo = new PageInfo<>(receiptReadingList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 绑定
     *
     * @param id id
     * @return userInfo
     */
    @RequestMapping(value = "/toBinding")
    @ResponseBody
    public String toBinding(String id) {
        Map<String, Object> map = oaReceiptReadingService.boundInfo(id);
        return JsonHelper.toJSONString(map);
    }

    /**
     * 提交绑定
     *
     * @param id    id
     * @param array array
     * @return userInfo
     */
    @RequestMapping(value = "/binding")
    @ResponseBody
    public String binding(String id, String[] array) {
        if (oaReceiptReadingService.updateBinding(id, array) < 0) {
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
    @RequestMapping(value = "/batchDeleteData")
    @ResponseBody
    public String batchDeleteData(@RequestParam(value = "ids[]") String[] ids) {
        if (oaReceiptReadingService.batchDeleteData(ids) >= 0) {
            return "success";
        } else {
            return "error";
        }
    }
}
