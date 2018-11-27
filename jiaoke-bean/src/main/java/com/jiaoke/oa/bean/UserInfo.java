package com.jiaoke.oa.bean;

import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户信息
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/10 11:00
 */

public class UserInfo implements Serializable {
    /**
     * 用户信息id
     */
    private Integer id;

    /**
     * 账号
     */
    private String usename;

    /**
     * 密码
     */
    private String password;

    /**
     * 昵称
     */
    private String nickName;

    /**
     * 手机号
     */
    private String phone;

    /**
     * 性别：0男，1女
     */
    private Integer sex;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 生日
     */
    private Date birthday;

    /**
     * 注册时间
     */
    private Date registerTime;

    /**
     * 部门编码
     */
    private String departmentKey;

    /**
     * 部门负责人
     */
    private String deptPrincipal;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsename() {
        return usename;
    }

    public void setUsename(String usename) {
        this.usename = usename;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public String getDepartmentKey() {
        return departmentKey;
    }

    public void setDepartmentKey(String departmentKey) {
        this.departmentKey = departmentKey;
    }

    public String getDeptPrincipal() {
        return deptPrincipal;
    }

    public void setDeptPrincipal(String deptPrincipal) {
        this.deptPrincipal = deptPrincipal;
    }
}