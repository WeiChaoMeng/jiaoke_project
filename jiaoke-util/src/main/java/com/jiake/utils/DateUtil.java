package com.jiake.utils;

import com.jiaoke.oa.bean.DingDingPunchDate;

import javax.swing.*;
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
     * date转string（yyyy-MM-dd HH:mm:ss）
     *
     * @param date date
     * @return string
     */
    public static String dateConvertYYYYMMDDHHMMSS(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return formatter.format(date);
    }

    /**
     * date转string（yyyy-MM-dd）
     *
     * @param date date
     * @return string
     */
    public static String dateConvertYYYYMMDD(Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(date);
    }

    /**
     * dateString转date（yyyy-MM-dd）
     *
     * @param dateString dateString
     * @return date
     */
    public static Date stringConvertYYYYMMDD(String dateString) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return simpleDateFormat.parse(dateString);
        } catch (Exception e) {
            return new Date();
        }
    }

    /**
     * dateString转date（yyyy-MM-dd HH:mm:ss）
     *
     * @param dateString dateString
     * @return date
     */
    public static Date stringConvertYYYYMMDDHHMMSS(String dateString) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            return simpleDateFormat.parse(dateString);
        } catch (Exception e) {
            return new Date();
        }
    }

    /**
     * date转string（HH:mm:ss）
     *
     * @param date date
     * @return string
     */
    public static String dateConvertHHMMSS(Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm:ss");
        return simpleDateFormat.format(date);
    }


    /**
     * 获取日期（* / **）
     *
     * @param date date
     * @return string
     */
    public static String getDay(Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("d");
        return simpleDateFormat.format(date);
    }

    /**
     * 获取日期（* / **）
     *
     * @param date date
     * @return string
     */
    public static String getWeek(Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("EEEE");
        String week = simpleDateFormat.format(date);
        return week.substring(simpleDateFormat.format(date).length() - 1);
    }

    /**
     * dateString转date（yyyy）
     *
     * @param dateString dateString
     * @return date
     */
    public static Date stringConvertYYYY(String dateString) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
        try {
            return simpleDateFormat.parse(dateString);
        } catch (Exception e) {
            return new Date();
        }
    }

    /**
     * date转string（yyyy）
     *
     * @param date date
     * @return string
     */
    public static String dateConvertYYYY(Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
        return simpleDateFormat.format(date);
    }

    /**
     * date转string（yyyy-MM-dd HH:mm）
     *
     * @param date date
     * @return string
     */
    public static String dateConvertYYYYMMDDHHMM(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        return formatter.format(date);
    }

    /**
     * dateString转date（yyyy-MM-dd HH:mm）
     *
     * @param dateString dateString
     * @return date
     */
    public static Date stringConvertYYYYMMDDHHMM(String dateString) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        try {
            return simpleDateFormat.parse(dateString);
        } catch (Exception e) {
            return new Date();
        }
    }
}
