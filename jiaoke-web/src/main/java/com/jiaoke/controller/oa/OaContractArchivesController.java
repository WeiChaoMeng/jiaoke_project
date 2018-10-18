package com.jiaoke.controller.oa;

import com.jiaoke.oa.bean.OaContractArchives;
import com.jiaoke.oa.service.OaContractArchivesService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 合同档案
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/12 12:02
 */
@Controller
@RequestMapping(value = "/contractArchives")
public class OaContractArchivesController {

    @Resource
    private OaContractArchivesService oaContractArchivesService;

    /**
     * 跳转合同档案
     *
     * @return oa_new_contract.jsp
     */
    @RequestMapping("/OAContractArchives.do")
    public String contractArchives(Model model) {
        List<OaContractArchives> oaContractArchivesList = oaContractArchivesService.getAll();
        model.addAttribute("oaContractArchivesList", oaContractArchivesList);
        return "oa/archives/oa_contract_archives";
    }

    /**
     * 跳转添加合同页面
     *
     * @return oa_new_contract.jsp
     */
    @RequestMapping(value = "/OANewContract.do")
    public String to() {
        return "oa/archives/oa_new_contract";
    }

    /**
     * 添加合同
     *
     * @param oaContractArchives oaContractArchives
     * @return oa_contract_archives.jsp
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(OaContractArchives oaContractArchives) {
        if (oaContractArchivesService.add(oaContractArchives) == 1) {
            return "redirect:/contractArchives/OAContractArchives.do";
        } else {
            return "redirect:/contractArchives/OAContractArchives.do";
        }
    }

    /**
     * 合同详情
     * @param id id
     * @return oa_archives_details.jsp
     */
    @RequestMapping(value = "/details")
    public String details(Integer id,Model model){
        OaContractArchives oaContractArchives = oaContractArchivesService.getDetailsById(id);
        model.addAttribute("oaContractArchives",oaContractArchives);
        return "oa/archives/oa_archives_details";
    }
}
