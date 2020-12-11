package com.jiaoke.controller.qualitytest;

import com.jiake.utils.RandomUtil;
import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.QualityTestLabReport;
import com.jiaoke.qualitytest.bean.QualityTestOrderTicket;
import com.jiaoke.qualitytest.dao.QualityTestLabReportDao;
import com.jiaoke.qualitytest.service.QualityTestLabReportService;
import com.jiaoke.qualitytest.service.QualityTestOrderTicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * QualityTestLabReport的路由接口服务
 *
 * @author
 */
@Controller
@RequestMapping("/QualityTestLabReport")
public class QualityTestLabReportController {

    /**
     * QualityTestLabReportService服务
     */
    @Autowired
    private QualityTestLabReportService qualityTestLabReportService;


    @RequestMapping("/page.do")
    public String page() {
        return "qualitytest/qualitytestlabreport";
    }

    @RequestMapping("/detail.do")
    public String detail(String num) {
        if (num==null ||  num.isEmpty() || num.trim().length() == 0) {
            return null;
        }
        QualityTestLabReport obj = qualityTestLabReportService.findOneByOrderTicketNum(num);
        if (obj == null) {
            QualityTestLabReport value = new QualityTestLabReport();
            value.setOrderTicketNum(num);
            qualityTestLabReportService.saveNotNull(value);

        } else if (obj.getExperimentStatus() != null && obj.getExperimentStatus() != 3) {
            qualityTestLabReportService.updateNotNullById(obj);
        }
        obj = qualityTestLabReportService.findOneByOrderTicketNum(num);
        String strJsp = "qualitytest/qualitytestlabreport_detail1.jsp?view=2&id=" + obj.getId();
        if (obj.getMaterialsNum() == 9) {//沥青混合料
            strJsp = "qualitytest/qualitytestlabreport_detail2.jsp?view=2&id=" + obj.getId();
        }
       // strJsp = "qualitytest/qualitytestlabreport_detail2.jsp?view=2&id=" + obj.getId();
        return strJsp;
    }

    /**
     * 生成试验报告
     *
     * @param num 委托单编号
     * @return
     */
    @RequestMapping("/create.do")
    public String create(String num) {
        return "";
    }

    /**
     * 查询所有QualityTestLabReport数据的方法
     *
     * @param value
     * @return
     */
    @GetMapping(value = "/list", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String find(QualityTestLabReport value) {
        return qualityTestLabReportService.find(value);
    }

    /**
     * 通过id查询QualityTestLabReport数据的方法
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public String findOne(@PathVariable(name = "id") String id) {
        return qualityTestLabReportService.findOne(id);
    }

    /**
     * 通过id查询QualityTestLabReport数据的方法
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/findbyTicketNum/{num}", method = RequestMethod.GET)
    public String findbyTicketNum(@PathVariable(name = "num") String id) {
        return qualityTestLabReportService.findbyTicketNum(id);
    }

    /**
     * 插入QualityTestLabReport属性不为空的数据方法
     *
     * @param id
     * @return
     */
    @PostMapping(value = "/save", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String save(QualityTestLabReport value) {
        return qualityTestLabReportService.saveNotNull(value);
    }

    /**
     * 更新QualityTestLabReport属性不为空的数据方法
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(QualityTestLabReport value) {
        return qualityTestLabReportService.updateNotNullById(value);
    }

    /**
     * 通过id删除QualityTestLabReport数据方法
     *
     * @param id
     * @return
     */
    @DeleteMapping(value = "/QualityTestLabReport/{id}", produces = {"application/json;charset=UTF-8"})
    public String delete(@PathVariable(name = "id") String id) {
        return qualityTestLabReportService.deleteById(id);
    }
}
