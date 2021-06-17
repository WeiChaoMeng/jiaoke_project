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
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.OaNewsCenterService;
import com.jiaoke.oa.service.OaNoticeService;
import com.jiaoke.oa.service.SecurityService;
import com.jiaoke.quality.service.QualityDynamicInf;
import com.jiaoke.quality.service.QualityIndexInf;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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

    @Resource
    private SecurityService securityService;

    @Resource
    private QualityDynamicInf qualityDynamicInf;

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
//        return "login";
        //新ui框架主页
        //return "new/login";
        //更新的主页
        return "new/newLogin";
    }

    /**
     * 登录成功后跳转
     * @return jsp
     */
    @RequestMapping("/loginJump.do")
    public String loginJump(){
        return "loginJump";
    }

    /**
     * 登录成功后进入首页(普通页面)
     *
     * @return security_index.jsp
     */
    @RequestMapping("/homePage.do")
    public String homePage(Model model) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("userInfo", userInfo);
        return "new/index";
    }

    /**
     * 登录成功后进入首页(驾驶舱)
     *
     * @return security_index.jsp
     */
    @RequestMapping("/cockpitPage.do")
    public String cockpitPage(Model model) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        //获取监控token
        String accessToken = securityService.getAccessToken();
        model.addAttribute("nickname", userInfo.getNickname());
        model.addAttribute("accessToken",accessToken);
        return "cockpit/pages/index1";
    }

    /**
     * 质量管控-领导驾驶舱页面
     *
     * @return jsp
     */
    @RequestMapping("/qualityCockpitPage.do")
    public String qualityCockpitPage(){
        return "cockpit/pages/sszlIndex";
    }

    /**
     * 实验管理-领导驾驶舱页面
     *
     * @return jsp
     */
    @RequestMapping("/summaryCockpitPage.do")
    public String experimentCockpitPage(){
        return "cockpit/pages/summary";
    }

    /**
     * 登录成功后进入首页(管理层) - 未使用
     *
     * @return security_index.jsp
     */
    @RequestMapping("/managePage.do")
    public String managePage(Model model) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("userInfo", userInfo);
        return "new/managePage";
    }

    /**
     * 登录成功后进入首页（基础层）
     *
     * @return security_index.jsp
     */
    @RequestMapping("/basePage.do")
    public String basePage(Model model) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        List<OaNewsCenter> oaNewsCenterList = oaNewsCenterService.homePageData();
        List<OaNotice> oaNoticeList = oaNoticeService.homePageData();
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("oaNewsCenterList", oaNewsCenterList);
        model.addAttribute("oaNoticeList", oaNoticeList);
        return "new/basePage";
    }
    /**
     *
     * 功能描述: <br>
     *  <登陆成功后进入新首页>
     * @param
     * @return
     * @auther Melone
     * @date 2021/6/4 13:55
     */
    @RequestMapping("/newBasePage.do")
    public String newBasePage(Model model, HttpServletRequest request) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        List<OaNewsCenter> oaNewsCenterList = oaNewsCenterService.homePageData();
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("oaNewsCenterList", oaNewsCenterList);
        qualityDynamicInf.getLastWeekToChars(request);
        return "new/newBasePage";
    }

    /**
     *
     * 功能描述: <br>     *  <iframe返回页面>
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
     * @param
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/11 19:13
     */
    @RequestMapping("/qc_index.do")
    public String qcIndex(Model model){

        List<Map<String,String>> list =  qualityIndexInf.getLastProductData();

        if (null == list){
            return null;
        }

        model.addAttribute("list",list);

        return "quality/qc_index";
    }

    /**
     * 跳转人事管理模块
     *
     * @return oa_navigation.jsp
     * @author lihui
     * @date 2018/10/8 12:00
     */
    @RequestMapping("/personnelIndex.do")
    public String toPersonnelIndex() {
        return "personnel/main";
    }

    @RequestMapping("/index.do")
    public String logout() {
        return "permission/index";
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
     * 跳转厂区安全
     * @return security_index.jsp
     */
    @RequestMapping("/security.do")
    public String security(){
        return "security/security_index";
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
     * 跳转环保监控-首页
     * @return main.jsp
     */
    @RequestMapping("/weatherIndex.do")
    public String weatherIndex(){
        return "milieu/index";
    }
}
