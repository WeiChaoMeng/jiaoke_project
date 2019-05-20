package com.jiaoke.oa.bean;

/**
 * 流程批注
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 11:12
 */
public class Comments {

    /**
     * 消息
     */
    private String userName;

    /**
     * 消息
     */
    private String message;

    /**
     * 时间
     */
    private String timeStr;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTimeStr() {
        return timeStr;
    }

    public void setTimeStr(String timeStr) {
        this.timeStr = timeStr;
    }
}
