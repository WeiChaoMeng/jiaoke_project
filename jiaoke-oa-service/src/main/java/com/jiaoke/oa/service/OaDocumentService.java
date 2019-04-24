package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaDocument;

import java.util.List;

/**
 * OA-公文
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/15 11:05
 */
public interface OaDocumentService {

    /**
     * 添加
     *
     * @param oaDocument oaDocument
     * @return NumberOfAffectedRows
     */
    int add(OaDocument oaDocument);

    /**
     * 根据表单状态获取列表
     *
     * @param formState formState
     * @return list
     */
    List<OaDocument> getAllByFormState(Integer formState);

    /**
     * 搜索
     *
     * @param textTitle 标题
     * @param formState 表单状态
     * @return list
     */
    List<OaDocument> textTitleFilter(String textTitle, int formState);

    /**
     * 根据id获取列表
     *
     * @param id id
     * @return list
     */
    OaDocument getAllById(Integer id);

    /**
     * 根据BusinessId获取
     *
     * @param ids       businessIdList
     * @param textTitle textTitle
     * @return list
     */
    List<OaDocument> selectByBusinessId(List<Integer> ids, String textTitle);

    /**
     * 根据id获取公文详情
     *
     * @param id id
     * @return OaDocument
     */
    OaDocument getDocumentDetailsById(Integer id);

    /**
     * 更新会签
     *
     * @param id            id
     * @param draftedPerson 拟稿人
     * @return NumberOfAffectedRows
     */
    int updateCountersignature(int id, String draftedPerson);

    /**
     * 根据id获取list
     *
     * @param list id
     * @return list
     */
    List<OaDocument> getListById(List<String> list);

    /**
     * 保存编辑公文
     *
     * @param oaDocument oaDocument
     * @return NumberOfAffectedRows
     */
    int edit(OaDocument oaDocument);

    /**
     * 根据主键删除
     *
     * @param id 主键
     * @return
     */
    int deleteById(int id);

    /**
     * 更新待发文档
     *
     * @param oaDocument oaDocument
     * @return int
     */
    int updatePendingDocument(OaDocument oaDocument);
}
