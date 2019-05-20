package com.jiaoke.controller.oa;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.Department;
import com.jiaoke.oa.bean.Permission;
import com.jiaoke.oa.bean.RoleInfo;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.PermissionService;
import com.jiaoke.oa.service.RoleInfoService;
import com.jiaoke.oa.service.UserInfoService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 后台管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/24 13:55
 */
@Controller
@RequestMapping(value = "/backstageManagement")
public class BackstageManagementController {

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private PermissionService permissionService;

    @Resource
    private RoleInfoService roleInfoService;

    @Resource
    private DepartmentService departmentService;

    /**
     * 加载用户数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/userManager")
    @ResponseBody
    public String userManager(int page) {
        PageHelper.startPage(page, 15);
        List<UserInfo> userInfoList = userInfoService.selectAll();
        PageInfo<UserInfo> pageInfo = new PageInfo<>(userInfoList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 根据名字筛选
     *
     * @param page     page
     * @param username username
     * @return list
     */
    @RequestMapping(value = "/usernameFilter")
    @ResponseBody
    public String usernameFilter(int page, String username) {
        PageHelper.startPage(page, 15);
        List<UserInfo> userInfoList = userInfoService.usernameFilter(username);
        PageInfo<UserInfo> pageInfo = new PageInfo<>(userInfoList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 查询用户是否存在
     *
     * @param username username
     * @return y/n
     */
    @RequestMapping(value = "/checkUsername")
    @ResponseBody
    public String checkUsername(String username) {
        UserInfo userInfo = userInfoService.checkUsername(username);
        if (null == userInfo) {
            return "false";
        } else {
            return "true";
        }
    }

    /**
     * 跳转用户管理页面
     *
     * @return jsp
     */
    @RequestMapping(value = "/toUserManager")
    @RequiresPermissions(value = "userManage/view")
    public String toUserManager(Model model, int page) {
        List<Department> departmentList = departmentService.selectAll();
        List<RoleInfo> roleInfoList = roleInfoService.selectAll();
        model.addAttribute("roleInfoList", roleInfoList);
        model.addAttribute("departmentList", JsonHelper.toJSONString(departmentList));
        //当前页（默认为1）
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/backstage/oa_user_management";
    }

    /**
     * 添加用户
     *
     * @param userInfo userInfo
     * @return success/error
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(UserInfo userInfo) {
        if (userInfoService.insertSelective(userInfo) != 1) {
            return "error";
        }
        return "success";
    }

    /**
     * 跳转修改
     *
     * @param id id
     * @return userInfo
     */
    @RequestMapping(value = "/toEdit")
    @ResponseBody
    public String toEdit(Integer id) {
        UserInfo userInfo = userInfoService.selectByPrimaryKey(id);
        return JsonHelper.toJSONString(userInfo);
    }

    /**
     * 绑定角色
     *
     * @param id id
     * @return userInfo
     */
    @RequestMapping(value = "/toBinding")
    @ResponseBody
    public String toBinding(Integer id) {
        Map<String, Object> map = userInfoService.bindingInfo(id);
        return JsonHelper.toJSONString(map);
    }

    /**
     * 提交绑定角色
     *
     * @param array 角色
     * @return userInfo
     */
    @RequestMapping(value = "/binding")
    @ResponseBody
    public String binding(Integer userId, String[] array) {
        if (userInfoService.updateRolePermission(userId, array) < 0) {
            return "error";
        }
        return "success";
    }

    /**
     * 提交修改用户
     *
     * @param userInfo userInfo
     * @return 影响行数
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(UserInfo userInfo) {
        if (userInfoService.updateUserInfo(userInfo) < 0) {
            return "error";
        }
        return "success";
    }

    /**
     * 删除用户
     *
     * @param id id
     * @return 影响行数
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(Integer id) {
        if (userInfoService.deleteByPrimaryKey(id) != 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**--------------------------角色管理--------------------------------*/
    /**
     * 跳转角色管理页面
     *
     * @return jsp
     */
    @RequestMapping(value = "/toRoleManager")
    public String toRoleManager(Model model, int page) {
        List<Permission> permissionList = permissionService.selectAll();
        //权限列表
        model.addAttribute("permissionList", JsonHelper.toJSONString(permissionList));
        //当前页（默认为1）
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/backstage/oa_role_management";
    }

    /**
     * 加载用户数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/roleManager")
    @ResponseBody
    public String roleManager(int page) {
        PageHelper.startPage(page, 15);
        List<RoleInfo> roleInfoList = roleInfoService.selectAll();
        PageInfo<RoleInfo> pageInfo = new PageInfo<>(roleInfoList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 角色名字筛选
     *
     * @param page page
     * @param name 角色名
     * @return list
     */
    @RequestMapping(value = "/roleNameFilter")
    @ResponseBody
    public String roleNameFilter(int page, String name) {
        PageHelper.startPage(page, 15);
        List<RoleInfo> roleInfoList = roleInfoService.roleNameFilter(name);
        PageInfo<RoleInfo> pageInfo = new PageInfo<>(roleInfoList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 添加角色信息
     *
     * @param roleInfo roleInfo
     * @return s/e
     */
    @RequestMapping(value = "/addRoleInfo")
    @ResponseBody
    public String addRoleInfo(RoleInfo roleInfo) {
        if (roleInfoService.insertSelective(roleInfo) > 0) {
            return "success";
        }
        return "error";
    }

    /**
     * 检查角色名是否被占用
     *
     * @param name name
     * @return t/f
     */
    @RequestMapping(value = "/checkRoleName")
    @ResponseBody
    public String checkRoleName(String name) {
        RoleInfo roleInfo = roleInfoService.checkRoleName(name);
        if (null == roleInfo) {
            return "false";
        } else {
            return "true";
        }
    }

    /**
     * 绑定权限
     *
     * @param id id
     * @return roleInfo
     */
    @RequestMapping(value = "/toBindingPower")
    @ResponseBody
    public String toBindingPower(Integer id) {
        Map<String, Object> map = roleInfoService.bindingInfo(id);
        return JsonHelper.toJSONString(map);
    }

    /**
     * 提交绑定角色
     *
     * @param array 角色
     * @return userInfo
     */
    @RequestMapping(value = "/bindingPower")
    @ResponseBody
    public String bindingPower(Integer roleId, String[] array) {
        if (roleInfoService.updateRolePermission(roleId, array) < 0) {
            return "error";
        }
        return "success";
    }

    /**
     * 删除角色
     *
     * @param id id
     * @return 影响行数
     */
    @RequestMapping(value = "/deleteRole")
    @ResponseBody
    public String deleteRole(Integer id) {
        if (roleInfoService.deleteByPrimaryKey(id) >= 0) {
            return "success";
        }
        return "error";
    }

    /**
     * 修改-获取角色信息
     *
     * @param id id
     * @return userInfo
     */
    @RequestMapping(value = "/toRoleEdit")
    @ResponseBody
    public String toRoleEdit(Integer id) {
        RoleInfo roleInfo = roleInfoService.selectByPrimaryKey(id);
        return JsonHelper.toJSONString(roleInfo);
    }

    /**
     * 更新角色信息及权限
     *
     * @param roleId 角色id
     * @return success/error
     */
    @RequestMapping(value = "/roleEdit")
    @ResponseBody
    public String roleEdit(Integer roleId, String description) {
        if (roleInfoService.updateRole(roleId, description) < 0) {
            return "error";
        }
        return "success";
    }


    /**--------------------------权限管理--------------------------------*/

    /**
     * 跳转权限管理页面
     *
     * @return jsp
     */
    @RequestMapping(value = "/toPermissionManager")
    public String toPermissionManager() {
        return "oa/backstage/oa_permission_management";
    }

    /**
     * 加载权限数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/permissionManager")
    @ResponseBody
    public String permissionManager(int page) {
        PageHelper.startPage(page, 15);
        List<Permission> permissionList = permissionService.selectAll();
        PageInfo<Permission> pageInfo = new PageInfo<>(permissionList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 权限名字筛选
     *
     * @param page           page
     * @param permissionName 权限名
     * @return list
     */
    @RequestMapping(value = "/permissionFilter")
    @ResponseBody
    public String permissionNameFilter(int page, String permissionName) {
        PageHelper.startPage(page, 15);
        List<Permission> permissionList = permissionService.permissionNameFilter(permissionName);
        PageInfo<Permission> pageInfo = new PageInfo<>(permissionList);
        return JsonHelper.toJSONString(pageInfo);
    }
}