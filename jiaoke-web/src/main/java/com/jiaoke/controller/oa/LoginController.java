package com.jiaoke.controller.oa;

import com.alibaba.fastjson.JSON;
import com.jiaoke.oa.bean.UserInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

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
    @RequestMapping(value = "/login.do",method = RequestMethod.POST)
    @ResponseBody
    public String login(String username, String password) {
        Map<String,Object> map = new HashMap<>();
        if ("".equals(username) && "".equals(password)) {
            map.put("messages","error");
            return JSON.toJSONString(map);
        } else {
            Subject subject = SecurityUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            try {
                subject.login(token);
            } catch (Exception e) {
                map.put("messages","error");
                return JSON.toJSONString(map);
            }
            map.put("messages","success");
            return JSON.toJSONString(map);
        }
    }

    /**
     * 登录成功后进入首页
     *
     * @return security_index.jsp
     */
    @RequestMapping("/homePage.do")
    public String homePage(Model model) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("userInfo", userInfo);
        return "main";
    }
}
