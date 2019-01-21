package com.jiaoke.controller.oa.news;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 新闻中心
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/21 14:43
 */
@Controller
@RequestMapping(value = "/newsCenter")
public class OaNewsCenterController {

    /**
     * 新闻管理
     *
     * @return oa_schedule_planning.jsp
     */
    @RequestMapping("/toNewsCenter")
    public String toNewsCenter() {
        return "oa/culture/oa_news_center";
    }

    /**
     * 跳转新闻发布
     *
     * @return
     */
    @RequestMapping(value = "/toNewsRelease")
    public String toNewsRelease() {
        return "oa/culture/oa_news_release";
    }
}
