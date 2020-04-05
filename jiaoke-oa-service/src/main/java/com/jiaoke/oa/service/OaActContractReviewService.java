package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActContractReview;

/**
 * 合同审查表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:17
 */
public interface OaActContractReviewService {

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
     * @param oaActContractReview oaActContractReview
     * @param userId              userId
     * @param randomId            randomId
     * @param state               state
     * @return int
     */
    int insert(OaActContractReview oaActContractReview, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActContractReview oaActContractReview
     * @return int
     */
    int edit(OaActContractReview oaActContractReview);

    /**
     * 选择性更新
     *
     * @param oaActContractReview oaActContractReview
     * @return int
     */
    int updateByPrimaryKeySelective(OaActContractReview oaActContractReview);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActContractReview selectByPrimaryKey(String id);
}
