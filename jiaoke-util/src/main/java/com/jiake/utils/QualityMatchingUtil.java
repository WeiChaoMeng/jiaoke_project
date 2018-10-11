/**
 * FileName: QualityMatchingUtil
 * author:   Melone
 * Date:     2018/10/11 13:12
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiake.utils;

import javax.servlet.http.HttpServletRequest;

/**
 * <一句话功能描述>
 * 配比模板工具类
 *
 * @author: Melone
 * @create: 2018/10/11 13:12
 * @Description:
 */
public class QualityMatchingUtil {

    public static String getUrl(HttpServletRequest request) {
        String c = request.getContextPath();
        String q = request.getQueryString();
        String s = request.getServletPath();
        if (q != null && !q.trim().isEmpty()) {
            if (q.contains("currentPageNum=")) {
                int i = q.indexOf("currentPageNum=");
                q = q.substring(0, i);
            }
        }else {
            q ="";
        }
        String url = s + "?" + q;
        return url;
    }

}
