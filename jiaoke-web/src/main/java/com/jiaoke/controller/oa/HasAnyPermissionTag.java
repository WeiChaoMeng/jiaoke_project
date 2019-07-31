package com.jiaoke.controller.oa;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.tags.PermissionTag;

/**
 * shiro扩展标签,具有列出权限中的任意一个(shiro:hasAnyPermission)
 *
 * @author lihui
 * @version 1.0
 * @date 2019-7-29 21:07
 */
public class HasAnyPermissionTag extends PermissionTag {


    private static final long serialVersionUID = 1L;

    public HasAnyPermissionTag() {
    }

    @Override
    protected boolean showTagBody(String permissions) {
        //分割符
        String separators = ",";

        boolean hasAnyPermissions = false;

        Subject subject = getSubject();

        if (subject != null) {
            for (String role : permissions.split(separators)) {

                if (subject.isPermitted(role.trim())) {
                    hasAnyPermissions = true;
                    break;
                }
            }
        }
        return hasAnyPermissions;
    }

}
