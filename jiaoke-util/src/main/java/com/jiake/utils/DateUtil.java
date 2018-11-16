package com.jiake.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期转换工具
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/12 14:12
 */
public class DateUtil {

    /**
     * 时间转换 date > string
     *
     * @param date date
     * @return string
     */
    public static String getStringDate(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return formatter.format(date);
    }
}
