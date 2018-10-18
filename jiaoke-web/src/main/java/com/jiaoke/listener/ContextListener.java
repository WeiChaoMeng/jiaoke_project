/**
 * FileName: ContextListener
 * author:   Melone
 * Date:     2018/9/29 16:15
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *  <一句话功能描述>
 *  此类用来监听servlet初始化时,创建项目根目录
 * @author: Melone
 * @create: 2018/9/29 16:15
 * @Description:
 * implements ServletContextListener
 */
public class ContextListener implements ServletContextListener {


    public void contextInitialized(ServletContextEvent sce) {
        ServletContext servletContext = sce.getServletContext();
        String contextPath = servletContext.getContextPath();
        System.out.println(contextPath);

    }

    public void contextDestroyed(ServletContextEvent sce) {

    }
}
