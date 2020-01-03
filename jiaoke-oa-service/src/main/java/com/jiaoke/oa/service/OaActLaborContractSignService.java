package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActLaborContractSign;

/**
 * 劳动合同签订通知书
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActLaborContractSignService {

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
     * @param oaActLaborContractSign oaActLaborContractSign
     * @param userId                 userId
     * @param randomId               randomId
     * @param state                  state
     * @return int
     */
    int insert(OaActLaborContractSign oaActLaborContractSign, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActLaborContractSign oaActLaborContractSign
     * @return int
     */
    int edit(OaActLaborContractSign oaActLaborContractSign);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActLaborContractSign selectByPrimaryKey(String id);

    /**
     * 选择性更新
     *
     * @param oaActLaborContractSign oaActLaborContractSign
     * @return int
     */
    int updateByPrimaryKeySelective(OaActLaborContractSign oaActLaborContractSign);
}
