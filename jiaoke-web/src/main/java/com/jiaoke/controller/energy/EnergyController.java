/**
 * FileName: EnergyController
 * author:   Melone
 * Date:     2020/9/8 9:12
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.controller.energy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/9/8 09:12
 * @Description:
 */
@Controller
public class EnergyController {

    @RequestMapping("/energyManager.do")
    public String energyPage(){
        return "construction/construction";
    }
}
