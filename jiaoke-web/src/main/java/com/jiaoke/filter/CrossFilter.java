/**
 * FileName: CrossFilter
 * author:   Melone
 * Date:     2018/11/8 20:24
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/11/8 20:24
 * @Description:
 */
public class CrossFilter  {


    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletResponse response= (HttpServletResponse) servletResponse;
        String origin= servletRequest.getRemoteHost()+":"+servletRequest.getRemotePort();
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Headers", "Authentication");
        filterChain.doFilter(servletRequest,servletResponse);

    }


    public void init(FilterConfig filterConfig) throws ServletException {

    }


    public void destroy() {

    }
}
