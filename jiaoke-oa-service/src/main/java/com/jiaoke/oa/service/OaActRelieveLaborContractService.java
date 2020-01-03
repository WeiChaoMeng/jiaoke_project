package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActRelieveLaborContract;

/**
 * 解除劳动合同审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActRelieveLaborContractService {

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
     * @param oaActRelieveLaborContract oaActRelieveLaborContract
     * @param userId                    userId
     * @param randomId                  randomId
     * @param state                     state
     * @return int
     */
    int insert(OaActRelieveLaborContract oaActRelieveLaborContract, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActRelieveLaborContract oaActRelieveLaborContract
     * @return int
     */
    int edit(OaActRelieveLaborContract oaActRelieveLaborContract);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActRelieveLaborContract selectByPrimaryKey(String id);

    /**
     * 选择性更新
     *
     * @param oaActRelieveLaborContract oaActRelieveLaborContract
     * @return int
     */
    int updateByPrimaryKeySelective(OaActRelieveLaborContract oaActRelieveLaborContract);
}
