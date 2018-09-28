/**
 * FileName: TestController
 * author:   Melone
 * Date:     2018/9/27 19:03
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/9/27 19:03
 * @Description:
 */
@Controller
public class TestController {


    @RequestMapping("/")
    public String index() {
        return "main";
    }
}
