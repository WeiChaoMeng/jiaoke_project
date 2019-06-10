package com.jiake.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 随机数
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/12 13:27
 */
public class RandomUtil {

    /**
     * 随机数
     * @return
     */
    public static Integer random() {
        int end = 2;
        SimpleDateFormat sdf = new SimpleDateFormat("HHmmss");
        String newDate = sdf.format(new Date());
        String result = "";
        Random random = new Random();
        for (int i = 0; i < end; i++) {
            result += random.nextInt(10);
        }
        return Integer.valueOf(newDate + result);
    }

    /**
     * 随机数的（22位 - 格式：年月日时分秒毫秒+5位随机数）
     * @return String
     */
    public static String randomId() {
        int end = 5;
        String date = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < end; i++) {
            sb.append(random.nextInt(10));
        }
        return date + sb;
    }

}
