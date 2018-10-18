package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaContractArchives;

import java.util.List;

/**
 * oa-档案-合同档案
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/18 13:30
 */
public interface OaContractArchivesService {

    /**
     * 添加
     *
     * @param oaContractArchives oaContractArchives
     * @return NumberOfAffectedRows
     */
    int add(OaContractArchives oaContractArchives);

    /**
     * 获取所有
     *
     * @return oaContractArchivesList
     */
    List<OaContractArchives> getAll();

    /**
     * 根据id获取详情
     *
     * @param id id
     * @return oaContractArchives
     */
    OaContractArchives getDetailsById(Integer id);
}
