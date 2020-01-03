package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActLaborContractRenewal;

/**
 * 劳动合同签订、续订、变更、终止审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActLaborContractRenewalService {

    /**
     * 删除
     *
     * @param id id
     * @return int
     */
    int deleteData(String id);

    /**
     * 新增
     *
     * @param oaActLaborContractRenewal oaActLaborContractRenewal
     * @param userId                    userId
     * @param randomId                  randomId
     * @param state                     state
     * @return int
     */
    int insert(OaActLaborContractRenewal oaActLaborContractRenewal, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActLaborContractRenewal oaActLaborContractRenewal
     * @return int
     */
    int edit(OaActLaborContractRenewal oaActLaborContractRenewal);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActLaborContractRenewal selectByPrimaryKey(String id);

    /**
     * 选择性更新
     *
     * @param oaActLaborContractRenewal oaActLaborContractRenewal
     * @return int
     */
    int updateByPrimaryKeySelective(OaActLaborContractRenewal oaActLaborContractRenewal);
}
