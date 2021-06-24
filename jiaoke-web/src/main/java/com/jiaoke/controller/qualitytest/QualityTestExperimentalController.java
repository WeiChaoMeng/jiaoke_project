package com.jiaoke.controller.qualitytest;

import com.jiaoke.qualitytest.bean.QualityTestExperimental;
import com.jiaoke.qualitytest.dao.QualityTestExperimentalDao;
import com.jiaoke.qualitytest.service.QualityTestExperimentalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * QualityTestExperimental试验管理的路由接口服务
 *
 * @author
 */
@Controller
@RequestMapping("/QualityTestExperimental")
public class QualityTestExperimentalController {

    /**
     * QualityTestExperimentalService服务
     */
    @Autowired
    private QualityTestExperimentalService qualityTestExperimentalService;
    @Autowired
    private QualityTestExperimentalDao qualityTestExperimentalDao;
    @RequestMapping("/page.do")
    public String page() {
        return "qualitytest/qualitytestexperimental";
    }

    /*	@RequestMapping("/detail.do")
        public String detail(Integer id){
            return "qualitytest/qualitytestexperimental_detail.jsp?id="+id;
        }*/
    @RequestMapping("/detail.do")
    public String detail(Integer id) {
        String strJsp = "qualitytest/qualitytestexperimental_detail.jsp?id=" + id;
        QualityTestExperimental obj = qualityTestExperimentalDao.selectQualityTestExperimentalById(id);
        if (obj!=null) {
            if (obj.getExperimentalId()!=null && obj.getExperimentalId() == 17135370) {//粗集料筛分
                strJsp = "qualitytest/experimental/qualitytestexperimental_cjl_sf_detail.jsp?id=" + id;
            }else if (obj.getExperimentalId()!=null && obj.getExperimentalId() ==17132508) {//粗集料筛分
                strJsp = "qualitytest/experimental/qualitytestexperimental_cjl_sf_detail2.jsp?id=" + id;
            } else if (obj.getExperimentalId()!=null && obj.getExperimentalId() == 17072218) {//细集料筛分
                strJsp = "qualitytest/experimental/qualitytestexperimental_xjl_sf_detail.jsp?id=" + id;
            } else if (obj.getExperimentalId()!=null && obj.getExperimentalId() == 21) {//矿粉筛分
                strJsp = "qualitytest/experimental/qualitytestexperimental_kf_sf_detail.jsp?id=" + id;
            }else if (obj.getExperimentalId()!=null && (obj.getExperimentalId() == 17195257||obj.getExperimentalId() == 17204742)) {//沥青混合料马氏
                strJsp = "qualitytest/experimental/qualitytestexperimental_lqhhl_ms_detail.jsp?id=" + id;
            }else if (obj.getExperimentalId()!=null &&
                    (obj.getExperimentalId() == 17280350 || obj.getExperimentalId() ==8353589 ||
                     obj.getExperimentalId() ==8361037 || obj.getExperimentalId() ==9031216)) {//沥青混合料矿料级配检验
                strJsp = "qualitytest/experimental/qualitytestexperimental_lqhhl_kljp_detail.jsp?id=" + id;
            }
        }
        return strJsp;
    }

    /**
     * 试验台账
     *
     * @return
     */
    @RequestMapping("/reports.do")
    public String report() {
        return "qualitytest/reports/qualitytestexperimental_reports";
    }

    /**
     * 查询所有QualityTestExperimental数据的方法
     *
     * @param value
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String find(QualityTestExperimental value) {
        return qualityTestExperimentalService.find(value);
    }

    /**
     * 通过id查询QualityTestExperimental数据的方法
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    public String findOne(@PathVariable(name = "id") Integer id) {
        return qualityTestExperimentalService.findOne(id);
    }

    /**
     * 插入QualityTestExperimental属性不为空的数据方法
     *
     * @param value
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(QualityTestExperimental value) {
        return qualityTestExperimentalService.saveNotNull(value);
    }

    /**
     * 更新QualityTestExperimental属性不为空的数据方法
     *
     * @param value
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(QualityTestExperimental value) {
        return qualityTestExperimentalService.updateNotNullById(value);
    }

    /**
     * 通过id删除QualityTestExperimental数据方法
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    public String delete(@PathVariable(name = "id") Integer id) {
        return qualityTestExperimentalService.deleteById(id);
    }
}
