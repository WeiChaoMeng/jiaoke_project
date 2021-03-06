/**
 * FileName: CarDateUtil
 * author:   Melone
 * Date:     2020/4/27 23:48
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiake.utils;

import lombok.experimental.var;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/4/27 23:48
 * @Description:
 */
public class CarDateUtil {

    /** 锁对象 */
    private static final Object lockObj = new Object();

    /** 存放不同的日期模板格式的sdf的Map */
    private static Map<String, ThreadLocal<SimpleDateFormat>> sdfMap = new HashMap<String, ThreadLocal<SimpleDateFormat>>();

    /**
     * 返回一个ThreadLocal的sdf,每个线程只会new一次sdf
     *
     * @param pattern
     * @return
     */
    private static SimpleDateFormat getSdf(final String pattern) {
        ThreadLocal<SimpleDateFormat> tl = sdfMap.get(pattern);

        // 此处的双重判断和同步是为了防止sdfMap这个单例被多次put重复的sdf
        if (tl == null) {
            synchronized (lockObj) {
                tl = sdfMap.get(pattern);
                if (tl == null) {
                    // 只有Map中还没有这个pattern的sdf才会生成新的sdf并放入map
                    System.out.println("put new sdf of pattern " + pattern + " to map");

                    // 这里是关键,使用ThreadLocal<SimpleDateFormat>替代原来直接new SimpleDateFormat
                    tl = new ThreadLocal<SimpleDateFormat>() {
                        @Override
                        protected SimpleDateFormat initialValue() {
                            System.out.println("thread: " + Thread.currentThread() + " init pattern: " + pattern);
                            return new SimpleDateFormat(pattern);
                        }
                    };
                    sdfMap.put(pattern, tl);
                }
            }
        }

        return tl.get();
    }

    /**
     * 是用ThreadLocal<SimpleDateFormat>来获取SimpleDateFormat,这样每个线程只会有一个SimpleDateFormat
     *
     * @param date
     * @param pattern
     * @return
     */
    public static String format(Date date, String pattern) {
        return getSdf(pattern).format(date);
    }

    public static Date parse(String dateStr, String pattern) throws ParseException {
        return getSdf(pattern).parse(dateStr);
    }

    /**
     *
     * 功能描述: <br>
     *  <计算两个时间差值>
     * @param [fromDate, toDate, pattern]
     * @return int
     * @auther Melone
     * @date 2020/4/28 0:03
     */
    public static int twoTimeDifference(String fromDate,String toDate,String pattern) throws ParseException {
        long from = parse(fromDate,pattern).getTime();
        long to = parse(toDate,pattern).getTime();
        return (int) ((to - from)/(1000 * 60));
    }

    /**
     *
     * 功能描述: <br>
     *  <对比两个车号相似度>
     * @param
     * @return
     * @auther Melone
     * @date 2020/11/30 16:57
     */
    public static double getSimilarityRatio (String str,String target){
        double res = 0.0;
        if (str.length() == 0) {
            return res;
        }
        int strLength = str.length();
        int targetLength = target.length();
        double rationOne = 100/strLength;
        for (int i = 0; i < strLength;i++){
            char strChar = str.charAt(i);
            char tarGetChar = ' ';
            if (i < targetLength){
                tarGetChar = target.charAt(i);
            } ;
            if (strChar == tarGetChar){
                res += rationOne;
            }
        }

        return res;
    }

}
