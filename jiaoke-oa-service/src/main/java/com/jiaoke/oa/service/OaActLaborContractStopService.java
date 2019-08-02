package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActLaborContractStop;

/**
 * 劳动合同终止通知书
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActLaborContractStopService {

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
     * @param oaActLaborContractStop oaActLaborContractStop
     * @param userId                 userId
     * @param randomId               randomId
     * @param state                  state
     * @return int
     */
    int insert(OaActLaborContractStop oaActLaborContractStop, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActLaborContractStop oaActLaborContractStop
     * @return int
     */
    int edit(OaActLaborContractStop oaActLaborContractStop);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActLaborContractStop selectByPrimaryKey(String id);

    /**
     * 更新附件列表
     *
     * @param array array
     * @param id    id
     * @return int
     */
    int updateAnnexes(String[] array, String id);
}
