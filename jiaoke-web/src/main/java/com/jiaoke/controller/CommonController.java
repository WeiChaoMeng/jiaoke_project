/**
 * FileName: CommonController
 * author:   Melone
 * Date:     2018/9/29 15:35
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.controller;

import com.jiaoke.quality.service.QualityIndexInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;
/**
 *  <一句话功能描述>
 * 公共跳转相关，如首页访问跳转
 * @author: Melone
 * @create: 2018/9/29 15:35
 * @Description:
 */
@Controller
public class CommonController {

    @Autowired
    QualityIndexInf qualityIndexInf;

    /**
     *
     * 功能描述: <br>
     *  <首页跳转>
     * @param: []
     * @return: java.lang.String
     * @auther:
     * @date: 2018/9/29 18:06
     */
    @RequestMapping("/")
    public String index(){
        return "login";
    }


    /**
     *
     * 功能描述: <br>
     *  <登陆跳转>
     * @param: []
     * @return: java.lang.String
     * @auther:
     * @date: 2018/9/29 18:09
     */
    @RequestMapping("/login.do")
    public String login(String username , String password){
        System.out.println(username);
        //此处编写逻辑
        return "main";
    }

    /**
     *
     * 功能描述: <br>
     *  <iframe返回页面>
     * @param: []
     * @return: java.lang.String
     * @auther:
     * @date: 2018/9/29 18:16
     */
    @RequestMapping("/default.do")
    public String main(){
        return  "default";
    }

    /**
     *
     * 功能描述: <br>
     *  <返回ifreame标签OA首页>
     * @param: []
     * @return: java.lang.String
     * @auther:
     * @date: 2018/9/29 18:31
     */
    @RequestMapping("/oaIndex.do")
    public String go_oaIndex(){

        return "oa/oa_index";
    }

    /**
     *
     * 功能描述: <br>
     *  <返回iframe质量管理首页>
     * @param: []
     * @return: java.lang.String
     * @auther:
     * @date: 2018/9/29 18:33
     */
    @RequestMapping("/qualityIndex.do")
    public  String go_qualityIndex(){
        return "quality/qc_heard";
    }

    /**
     *
     * 功能描述: <br>
     *  <>
     * @param [model]
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/11 19:13
     */
    @RequestMapping("/qc_index.do")
    public String qc_index(Model model){

        List<Map<String,String>> list =  qualityIndexInf.getLastProductData();

        if (null == list) return null;

        model.addAttribute("list",list);

        return "quality/qc_index";
    }

    /**
     *
     * 功能描述: <br>
     *  <返回iframe标签oa日期页面>
     * @param: []
     * @return: java.lang.String
     * @auther:
     * @date: 2018/9/29 18:50
     */
    @RequestMapping("/calendar_index.do")
    public String calendar_index(){
        return "oa/calendar/calendar_index";
    }
}
