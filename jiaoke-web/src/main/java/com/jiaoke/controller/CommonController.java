/**
 * FileName: CommonController
 * author:   Melone
 * Date:     2018/9/29 15:35
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.controller;

import com.jiaoke.oa.bean.OaNewsCenter;
import com.jiaoke.oa.bean.OaNotice;
import com.jiaoke.oa.service.OaNewsCenterService;
import com.jiaoke.oa.service.OaNoticeService;
import com.jiaoke.quality.service.QualityIndexInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
/**
 *  <一句话功能描述>
 * 公共跳转相关，如首页访问跳转
 * @author: Melone
 * @create: 2018/9/29 15:35
 * @Description:
 */
@Controller
public class CommonController {

    @Autowired
    QualityIndexInf qualityIndexInf;

    @Resource
    private OaNewsCenterService oaNewsCenterService;

    @Resource
    private OaNoticeService oaNoticeService;

    /**
     *
     * 功能描述: <br>
     *  <首页跳转>
     * @param: []
     * @return: java.lang.String
     * @auther:
     * @date: 2018/9/29 18:06
     */
    @RequestMapping("/")
    public String index(){
        return "login";
    }

    /**
     *
     * 功能描述: <br>
     *  <iframe返回页面>
     * @param: []
     * @return: java.lang.String
     * @auther:
     * @date: 2018/9/29 18:16
     */
    @RequestMapping("/default.do")
    public String main(Model model){
        List<OaNewsCenter> oaNewsCenterList = oaNewsCenterService.homePageData();
        List<OaNotice> oaNoticeList = oaNoticeService.homePageData();
        model.addAttribute("oaNewsCenterList", oaNewsCenterList);
        model.addAttribute("oaNoticeList", oaNoticeList);
        return  "default";
    }

    /**
     *
     * 功能描述: <br>
     *  <返回ifreame标签OA首页>
     * @param: []
     * @return: java.lang.String
     * @auther:
     * @date: 2018/9/29 18:31
     */
    @RequestMapping("/oaIndex.do")
    public String go_oaIndex(){

        return "oa/oa_index";
    }

    /**
     *
     * 功能描述: <br>
     *  <返回iframe质量管理首页>
     * @param: []
     * @return: java.lang.String
     * @auther:
     * @date: 2018/9/29 18:33
     */
    @RequestMapping("/qualityIndex.do")
    public  String go_qualityIndex(){
        return "quality/qc_heard";
    }

    /**
     *
     * 功能描述: <br>
     *  <>
     * @param [model]
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/11 19:13
     */
    @RequestMapping("/qc_index.do")
    public String qc_index(Model model){

        List<Map<String,String>> list =  qualityIndexInf.getLastProductData();

        if (null == list){
            return null;
        }

        model.addAttribute("list",list);

        return "quality/qc_index";
    }

    /**
     *
     * 功能描述: <br>
     *  <返回iframe标签oa日期页面>
     * @param: []
     * @return: java.lang.String
     * @auther:
     * @date: 2018/9/29 18:50
     */
    @RequestMapping("/calendar_index.do")
    public String calendar_index(){
        return "oa/calendar/calendar_index";
    }

    /**
     * 跳转oa_navigation.jsp
     *
     * @return oa_navigation.jsp
     * @author lihui
     * @date 2018/10/8 12:00
     */
    @RequestMapping("/oaNavigation.do")
    public String toOANavigation() {
        return "oa/oa_navigation";
    }

    /**
     * 跳转oa_wage_statistics_inner.jsp
     *
     * @return oa_wage_statistics.jsp
     * @author lihui
     * @date 2018/10/9 18:34
     */
    @RequestMapping("/OAWageStatisticsInner.do")
    public String toOAWageStatisticsInner() {
        return "oa/personal/oa_wage_statistics";
    }

    @RequestMapping("/index.do")
    public String logout() {
        return "permission/index";
    }

    /**
     * 日程计划
     *
     * @return  oa_schedule_planning.jsp
     */
    @RequestMapping("/OASchedulePlanning.do")
    public String schedulePlanning() {
        return "oa/personal/oa_schedule_planning";
    }

    /**
     * 待办记事
     *
     * @return  oa_schedule_planning.jsp
     */
    @RequestMapping("/OANotepad.do")
    public String notepad() {
        return "oa/personal/oa_notepad";
    }

    /**
     *  跳转正在建设提示页面
     *
     * @return construction.jsp
     */
    @RequestMapping("/construction.do")
    public String construction(){
        return "construction/construction";
    }

    /**
     * 跳转人事管理
     * @return jsp
     */
    @RequestMapping("/personnel.do")
    public String personnel(){
        return "personnel/index";
    }

    /**
     * 跳转厂区安全
     * @return security_index.jsp
     */
    @RequestMapping("/security.do")
    public String security(){
        return "security/security_index";
    }

    /**
     * 跳转环保监控
     * @return milieu_index.jsp
     */
    @RequestMapping("/milieuIndex.do")
    public String milieuIndex(){
        return "milieu/milieu_index";
    }
 /**
     * 跳转环保监控-实时数据
     * @return real_time_data.jsp
     */
    @RequestMapping("/realTimeData.do")
    public String realTimeData(){
        return "milieu/real_time_data";
    }
 /**
     * 跳转环保监控-环境监测
     * @return circumstance.jsp
     */
    @RequestMapping("/circumstance.do")
    public String circumstance(){
        return "milieu/circumstance";
    }
 /**
     * 跳转环保监控-首页
     * @return index.jsp
     */
    @RequestMapping("/weatherIndex.do")
    public String weatherIndex(){
        return "milieu/index";
    }
}
