package com.jiaoke.controller.oa;

import com.jiaoke.oa.bean.Permission;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.UserInfoService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.List;

/**
 * 权限管理
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/8 17:44
 */

public class ShiroSecurityRealm extends AuthorizingRealm {

    @Autowired
    private UserInfoService userInfoService;

    /**
     * 权限认证
     *
     * @param principalCollection principalCollection
     * @return null
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        UserInfo userInfo = (UserInfo) principalCollection.getPrimaryPrincipal();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        if (userInfo != null) {
            System.out.println("当前用户id：" + userInfo.getId());
            List<Permission> permissionList = userInfoService.getPermissionsByUserInfoId(userInfo.getId());
            for (Permission permission : permissionList) {
                System.out.println("权限：" + permission.getUrl());
                info.addStringPermission(permission.getUrl());
            }
            return info;

        }

        return null;
    }

    /**
     * 登录认证
     *
     * @param authenticationToken authenticationToken
     * @return null
     * @throws AuthenticationException e
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("进入验证");
        //验证账户密码
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        System.out.println("账户:" + token.getUsername());
        UserInfo userInfo = userInfoService.getUserInfoByUserName(token.getUsername());
        System.out.println(userInfo);
        if (userInfo == null){
            System.out.println("是个空的");
            return null;
        }else {
            System.out.println("不是空的");
            return new SimpleAuthenticationInfo(userInfo, userInfo.getPassword(), this.getClass().getSimpleName());
        }
    }

}
