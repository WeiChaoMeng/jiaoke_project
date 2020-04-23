package com.jiaoke.listener;

import org.quartz.Scheduler;
import org.quartz.impl.StdSchedulerFactory;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 解决quartz不能正常关闭的监听器
 *
 * @author lihui
 * @version 1.0
 * @date 2020-4-20 11:07
 */
public class ShutDownQuartz implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {

    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        try {
            Scheduler defaultScheduler = StdSchedulerFactory.getDefaultScheduler();
            defaultScheduler.shutdown(true);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
