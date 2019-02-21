/**
 * FileName: MultiThreadUtil
 * author:   Melone
 * Date:     2019/2/18 9:53
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiake.utils;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 *  <一句话功能描述>
 *  多线程工具类
 * @author: Melone
 * @create: 2019/2/18 09:53
 * @Description:
 */
public class MultiThreadUtil {

    //池中所保存的线程数，包括空闲线程。
    final static int corePoolSize = 5;
    //池中允许的最大线程数。
    final static int maximumPoolSize = 10;
    //当线程数大于核心线程时，此为终止前多余的空闲线程等待新任务的最长时间
    final static long keepAliveTime = 200;
    //执行前用于保持任务的队列，即任务缓存队列
    final static ArrayBlockingQueue<Runnable> workQueue =new ArrayBlockingQueue<Runnable>(5);

    public static ThreadPoolExecutor getThreadPoolExecutor(){

        //构建一个线程池，正常线程数量为5，最大线程数据为10，等待时间200
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(
                corePoolSize, maximumPoolSize, keepAliveTime, TimeUnit.MINUTES, workQueue, (Runnable r) -> new Thread("sendExcel"));

        return threadPoolExecutor;
    }

//    //发送Excel方法
//    public static void  sendExcel(QualityTimelyDataFalse qualityTimelyDataFalse){
//
//    }

}
