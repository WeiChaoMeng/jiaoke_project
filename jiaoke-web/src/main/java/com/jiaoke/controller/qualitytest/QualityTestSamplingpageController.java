package com.jiaoke.controller.qualitytest;

import com.jiaoke.qualitytest.bean.QualityTestOrderTicket;
import com.jiaoke.qualitytest.bean.QualityTestSamplingpage;
import com.jiaoke.qualitytest.service.QualityTestSamplingpageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * 取样单
 * QualityTestSamplingpage的路由接口服务
 *
 * @author
 */

@Controller
@RequestMapping("/QualityTestSamplingpage")
public class QualityTestSamplingpageController {
    /**
     * QualityTestSamplingpageService服务
     */
    @Autowired
    private QualityTestSamplingpageService qualityTestSamplingpageService;

    @RequestMapping("/page.do")
    public String page(){
        return "qualitytest/qualitytestsamplingpage";
    }

    @RequestMapping("/add.do")
    public String add(){
        return "qualitytest/qualitytestsamplingpage_add";
    }

    /**
     * 查询所有QualityTestSamplingpage数据的方法
     * @param value
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String find(QualityTestSamplingpage value) {
        return qualityTestSamplingpageService.find(value);
    }
    /**
     * 通过id查询QualityTestSamplingpage数据的方法
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/find/{id}",method = RequestMethod.GET)
    public String findOne(@PathVariable(name="id") Integer id) {
        return qualityTestSamplingpageService.findOne(id);
    }

    /**
     * 插入QualityTestSamplingpage属性不为空的数据方法
     * @param value
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String save(QualityTestSamplingpage value) {
        return qualityTestSamplingpageService.saveNotNull(value);
    }
    /**
     * 更新QualityTestSamplingpage属性不为空的数据方法
     * @param value
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String update(QualityTestSamplingpage value) {
        return qualityTestSamplingpageService.updateNotNullById(value);
    }

    /**
     * 通过id删除QualityTestSamplingpage数据方法
     */
    @ResponseBody
    @RequestMapping(value = "/delete/{id}",method = RequestMethod.POST)
    public String delete(@PathVariable(name="id") Integer id) {
        return qualityTestSamplingpageService.deleteById(id);
    }

    /**
     * 通过id确认取号单数据方法
     * @param id
     * @return
     */
    //@PostMapping(value = "/confirm", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    @RequestMapping(value = "/confirm/{id}",method = RequestMethod.POST)
    public String confirm(@PathVariable(name="id") Integer id) {
        return qualityTestSamplingpageService.confirmById(id);
    }

}
