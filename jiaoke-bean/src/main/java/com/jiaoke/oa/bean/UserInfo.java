package com.jiaoke.oa.bean;

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
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 姓名
     */
    private String nickname;

    /**
     * 部门编码
     */
    private String department;

    /**
     * 岗位
     */
    private String position;

    /**
     * 性别：0男，1女
     */
    private Integer sex;

    /**
     * 手机号
     */
    private String phone;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 注册时间
     */
    private Date registerTime;

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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public String getDeptPrincipal() {
        return deptPrincipal;
    }

    public void setDeptPrincipal(String deptPrincipal) {
        this.deptPrincipal = deptPrincipal;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }
}