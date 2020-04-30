package com.jiaoke.controller.oa;

import com.alibaba.fastjson.JSON;
import com.jiaoke.oa.bean.Permission;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.UserInfoService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
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

    @Resource
    private UserInfoService userInfoService;

    /**
     * 登录
     *
     * @param username userInfo
     * @return result
     */
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    @ResponseBody
    public String login(String username, String password) {
//    public String login(@RequestBody UserInfo userInfo) {
        Map<String,Object> map = new HashMap<>();
//        if ("".equals(userInfo.getUsername()) && "".equals(userInfo.getPassword())) {
        if ("".equals(username) && "".equals(password)) {
            map.put("messages","error");
            return JSON.toJSONString(map);
        } else {
            Subject subject = SecurityUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
//            UsernamePasswordToken token = new UsernamePasswordToken(userInfo.getUsername(),userInfo.getPassword());
            try {
                subject.login(token);
            } catch (Exception e) {
                map.put("messages","error");
                return JSON.toJSONString(map);
            }
            map.put("messages","success");
            map.put("userInfo",(UserInfo) SecurityUtils.getSubject().getPrincipal());
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

    /**
     *
     * 功能描述: <br>
     *  <app端登陆后查询用户权限>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/5 16:34
     */
    @ResponseBody
    @RequestMapping(value = "/getUserAuthorityByUserInfo.do",method = RequestMethod.POST)
    public String getUserAuthorityByUserInfo(String userInfo){
        UserInfo userInfoMsg = JSON.toJavaObject(JSON.parseObject(userInfo), UserInfo.class);
        Map<String,Object> res = new HashMap<>();
        if (userInfoMsg != null) {
            List<Permission> permissionList = userInfoService.getPermissionsByUserInfoId(userInfoMsg.getId());
            res.put("message","success");
            res.put("authority",JSON.toJSONString(permissionList));
        }else {
            res.put("message","error");
        }
        return JSON.toJSONString(res);
    }
}
