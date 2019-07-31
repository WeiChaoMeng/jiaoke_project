package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActContractSign;

/**
 * 劳务派遣员工合同签订、续订、变更、终止审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActContractSignService {

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
     * @param oaActContractSign oaActContractSign
     * @param userId            userId
     * @param randomId          randomId
     * @param state             state
     * @return int
     */
    int insert(OaActContractSign oaActContractSign, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActContractSign oaActContractSign
     * @return int
     */
    int edit(OaActContractSign oaActContractSign);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActContractSign selectByPrimaryKey(String id);

    /**
     * 更新附件列表
     *
     * @param array array
     * @param id    id
     * @return int
     */
    int updateAnnexes(String[] array, String id);
}
