/**
 * FileName: PartyBuildingController
 * author:   Melone
 * Date:     2019/8/14 13:27
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
 * @create: 2019/8/14 13:27
 * @Description:
 */
@Controller
public class PartyBuildingController {

    @RequestMapping("/partyIndex.do")
    public String partyIndex(){
        return "party_building/party_index";
    }

}
