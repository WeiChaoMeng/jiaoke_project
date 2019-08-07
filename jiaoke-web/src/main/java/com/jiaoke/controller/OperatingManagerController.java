/**
 * FileName: OperatingManagerController
 * author:   Melone
 * Date:     2019/8/6 18:28
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
 * @create: 2019/8/6 18:28
 * @Description:
 */
@Controller
public class OperatingManagerController {

    @RequestMapping("/operatingManager.do")
    public String operatingManager(){
        return "operating_manager/om_index";
    }
}
