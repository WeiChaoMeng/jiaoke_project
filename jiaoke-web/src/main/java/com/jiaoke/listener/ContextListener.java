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


    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext sc = sce.getServletContext();
        String path = getContextPath(sc);

        sc.setAttribute("path","http://localhost:8080" );
//        sc.setAttribute("path","http://47.105.114.70/" );
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ServletContext sc = sce.getServletContext();
        sc.removeAttribute("path");
    }

    private String getContextPath(ServletContext sc) {
        return sc.getContextPath();
    }

}
