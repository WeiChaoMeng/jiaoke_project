package com.jiaoke.controller.oa;

import com.jiaoke.oa.bean.Permission;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.UserInfoService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

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

    @Resource
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
            List<Permission> permissionList = userInfoService.getPermissionsByUserInfoId(userInfo.getId());
            for (Permission permission : permissionList) {
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
        //验证账户密码
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        UserInfo userInfo = userInfoService.getUserInfoByUserName(token.getUsername());
        if (userInfo == null){
            return null;
        }else {
            return new SimpleAuthenticationInfo(userInfo, userInfo.getPassword(), this.getClass().getSimpleName());
        }
    }

}
