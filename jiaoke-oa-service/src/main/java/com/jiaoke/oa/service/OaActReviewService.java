package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActReview;

import java.util.List;

/**
 * 合同审查表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:17
 */
public interface OaActReviewService {

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
     * @param oaActReview oaActReview
     * @param userId      userId
     * @param randomId    randomId
     * @param state       state
     * @return int
     */
    int insert(OaActReview oaActReview, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActReview oaActReview
     * @return int
     */
    int edit(OaActReview oaActReview);

    /**
     * 选择性更新
     *
     * @param oaActReview oaActReview
     * @return int
     */
    int updateByPrimaryKeySelective(OaActReview oaActReview);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActReview selectByPrimaryKey(String id);

    /**
     * 根据idList查询多条
     *
     * @param idList idList
     * @return list
     */
    List<OaActReview> selectAllByIdList(List<String> idList);
}
