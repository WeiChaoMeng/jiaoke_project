/**
 * FileName: CommonController
 * author:   Melone
 * Date:     2018/9/29 15:35
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.controller;

import com.jiaoke.quality.service.QualityIndexInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String main(){
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
     * 个人考勤
     *
     * @return  oa_personal_attendance.jsp
     */
    @RequestMapping("/OAPersonalAttendance.do")
    public String personalAttendance() {
        return "oa/personal/oa_personal_attendance";
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
     * 待发事项
     *
     * @return  oa_schedule_planning.jsp
     */
    @RequestMapping("/OANewMatter.do")
    public String newMatter() {
        return "oa/collaboration/oa_new_matter";
    }

    /**
     * 待发事项
     *
     * @return  oa_schedule_planning.jsp
     */
    @RequestMapping("/OAWaitingMatter.do")
    public String waitingMatter() {
        return "oa/collaboration/oa_waiting_matter";
    }

    /**
     * 已发事项
     *
     * @return  oa_schedule_planning.jsp
     */
    @RequestMapping("/OAAlreadyIssuedMatter.do")
    public String alreadyIssuedMatter() {
        return "oa/collaboration/oa_already_issued_matter";
    }

    /**
     * 待办事项
     *
     * @return  oa_schedule_planning.jsp
     */
    @RequestMapping("/OAUpcomingMatter.do")
    public String upcomingMatter() {
        return "oa/collaboration/oa_upcoming_matter";
    }

    /**
     * 已办事项
     *
     * @return  oa_schedule_planning.jsp
     */
    @RequestMapping("/OAManagedMatter.do")
    public String managedMatter() {
        return "oa/collaboration/oa_managed_matter";
    }

    /**
     * 督办事项
     *
     * @return  oa_schedule_planning.jsp
     */
    @RequestMapping("/OASupervisionMatters.do")
    public String supervisionMatters() {
        return "oa/collaboration/oa_supervision_matters";
    }

    /**
     * 会议安排
     *
     * @return  oa_schedule_planning.jsp
     */
    @RequestMapping("/OAMeetingSchedule.do")
    public String meetingSchedule() {
        return "oa/meeting/oa_meeting_schedule";
    }

    /**
     * 会议日历
     *
     * @return  oa_schedule_planning.jsp
     */
    @RequestMapping("/OAConferenceCalendar.do")
    public String conferenceCalendar() {
        return "oa/meeting/oa_conference_calendar";
    }

    /**
     * 待开会议
     *
     * @return  oa_schedule_planning.jsp
     */
    @RequestMapping("/OAPendingMeeting.do")
    public String pendingMeeting() {
        return "oa/meeting/oa_pending_meeting";
    }

    /**
     * 已开会议
     *
     * @return  oa_schedule_planning.jsp
     */
    @RequestMapping("/OAHistoricalConference.do")
    public String historicalConference() {
        return "oa/meeting/oa_historical_conference";
    }

    /**
     * 会议资源
     *
     * @return  oa_schedule_planning.jsp
     */
    @RequestMapping("/OAConferenceResources.do")
    public String conferenceResources() {
        return "oa/meeting/oa_conference_resources";
    }

    /**
     * 公告管理
     *
     * @return  oa_schedule_planning.jsp
     */
    @RequestMapping("/OAAnnouncements.do")
    public String announcements() {
        return "oa/culture/oa_announcements";
    }

    /**
     * 新闻管理
     *
     * @return  oa_schedule_planning.jsp
     */
    @RequestMapping("/OANewsCenter.do")
    public String newsCenter() {
        return "oa/culture/oa_news_center";
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
