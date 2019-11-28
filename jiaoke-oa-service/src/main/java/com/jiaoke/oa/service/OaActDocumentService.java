package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActDocument;

/**
 * OA-公文
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/15 11:05
 */
public interface OaActDocumentService {

    /**
     * 新增
     *
     * @param oaActDocument oaDocument
     * @param userId        userId
     * @param randomId      randomId
     * @param state         state
     * @return int
     */
    int insert(OaActDocument oaActDocument, Integer userId, String randomId, Integer state);

    /**
     * 删除
     *
     * @param id id
     * @return int
     */
    int deleteData(String id);

    /**
     * 编辑
     *
     * @param oaActDocument oaActDocument
     * @return int
     */
    int edit(OaActDocument oaActDocument);

    /**
     * 查询
     *
     * @param id id
     * @return OaActSealsUse
     */
    OaActDocument selectByPrimaryKey(String id);

    /**
     * 根据主键选择更新
     *
     * @param oaActDocument oaActDocument
     * @return int
     */
    int updateByPrimaryKeySelective(OaActDocument oaActDocument);
}
