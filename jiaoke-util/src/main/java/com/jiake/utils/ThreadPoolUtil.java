/**
 * FileName: ThreadPoolUtil
 * author:   Melone
 * Date:     2020/4/19 15:00
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiake.utils;

import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/4/19 15:00
 * @Description:
 */
public class ThreadPoolUtil<T> {

    /**
     * 根据cpu的数量动态的配置核心线程数和最大线程数
     */
    private static final int CPU_COUNT            = Runtime.getRuntime().availableProcessors();
    /**
     * 核心线程数 = CPU核心数 + 1
     */
    private static final int CORE_POOL_SIZE      = CPU_COUNT + 1;
    /**
     * 线程池最大线程数 = CPU核心数 * 2 + 1
     */
    private static final int MAXIMUM_POOL_SIZE    = CPU_COUNT * 2 + 1;

    /**
     *  非核心线程超时时间1s
     */
    private static final int KEEP_ALIVE            = 1;
    /**
     * 线程池对象
     */
    private ThreadPoolExecutor executor;

    /**
     * 要确保该类只有一个实例对象，避免产生过多对象消费资源，所以采用单例模式
     */
    private ThreadPoolUtil(){

    }

    private static ThreadPoolUtil sInstance;

    public   synchronized  static ThreadPoolUtil getInstance(){
        if (sInstance == null) {
            sInstance = new ThreadPoolUtil();
        }
        return sInstance;
    }

    /**
     *
     * 功能描述: <br>
     *  <开启一个无返回结果的线程>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/19 15:26
     */

    public void  execute(Runnable r){
        if (executor == null){
            /**
             * corePoolSize:核心线程数
             * maximumPoolSize：线程池所容纳最大线程数(workQueue队列满了之后才开启)
             * keepAliveTime：非核心线程闲置时间超时时长
             * unit：keepAliveTime的单位
             * workQueue：等待队列，存储还未执行的任务
             * threadFactory：线程创建的工厂
             * handler：异常处理机制
             */
            executor = new ThreadPoolExecutor(CORE_POOL_SIZE, MAXIMUM_POOL_SIZE,
                    KEEP_ALIVE, TimeUnit.SECONDS, new ArrayBlockingQueue<Runnable>(20),
                    Executors.defaultThreadFactory(), new ThreadPoolExecutor.AbortPolicy());
        }
        // 把一个任务丢到了线程池中
        executor.execute(r);
    }


    /**
     *
     * 功能描述: <br>
     *  <带返回值的线程>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/19 15:43
     */

    public Future<T> submit(Callable<T> r){

        if (executor == null) {
            /**
             * corePoolSize:核心线程数
             * maximumPoolSize：线程池所容纳最大线程数(workQueue队列满了之后才开启)
             * keepAliveTime：非核心线程闲置时间超时时长
             * unit：keepAliveTime的单位
             * workQueue：等待队列，存储还未执行的任务
             * threadFactory：线程创建的工厂
             * handler：异常处理机制
             *
             */
            executor = new ThreadPoolExecutor(CORE_POOL_SIZE, MAXIMUM_POOL_SIZE,
                    KEEP_ALIVE, TimeUnit.SECONDS, new LinkedBlockingQueue<Runnable>(),
                    new NameTreadFactory(), new ThreadPoolExecutor.DiscardOldestPolicy());
        }
        // 把一个任务丢到了线程池中
        return executor.submit(r);
    }

    static class NameTreadFactory implements ThreadFactory {

        private final AtomicInteger mThreadNum = new AtomicInteger(1);

        @Override
        public Thread newThread(Runnable r) {
            Thread t = new Thread(r, "my-thread-" + mThreadNum.getAndIncrement());
            System.out.println(t.getName() + "线程被创建");
            return t;
        }
    }
    /**
     * 把任务移除等待队列
     * @param r
     */
    public void cancel(Runnable r) {
        if (r != null) {
            executor.getQueue().remove(r);
        }
    }

}
