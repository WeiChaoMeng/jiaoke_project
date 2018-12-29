package com.jiaoke.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 加载spring配置并从中获取bean
 *
 * @author : JiaoNingbo
 * @createTime : 2017/11/17 17:49
 */
public class SpringHelper {

    private static Logger logger = LoggerFactory.getLogger(SpringHelper.class);

    private static ClassPathXmlApplicationContext cx = null;

    @SuppressWarnings("unchecked")
    public static <T> T getBean(String beanId) {
        if (cx == null) {
            cx = new ClassPathXmlApplicationContext("conf/applicationContext.xml");
        }
        return (T) cx.getBean(beanId);
    }

    public synchronized static void init() {
        if (cx == null) {
            cx = new ClassPathXmlApplicationContext("conf/applicationContext.xml");
            logger.info("Spring config success!,ApplicationContext set a object");
        }
    }

    public synchronized static void init(String[] paths) {
        if (cx == null) {
            cx = new ClassPathXmlApplicationContext(paths);
            logger.info("Spring config success!,ApplicationContext set a object");
        }
    }

    public synchronized static void init(String path) {
        init(new String[]{path});
    }

}
