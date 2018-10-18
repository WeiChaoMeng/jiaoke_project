package com.jiaoke.controller.oa;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 登录
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/10 1:19
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {

    /**
     * 登录
     *
     * @param username username
     * @param password password
     * @return result
     */
    @RequestMapping(value = "/login.do")
    @ResponseBody
    public String login(String username, String password) {
        if ("".equals(username) && "".equals(password)) {
            return "error";
        } else {
            Subject subject = SecurityUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            try {
                subject.login(token);
            } catch (Exception e) {
                return "error";
            }
            return "success";
        }
    }

    /**
     * 登录成功后进入首页
     *
     * @return main.jsp
     */
    @RequestMapping("/homePage.do")
    public String homePage() {
        return "main";
    }
}
