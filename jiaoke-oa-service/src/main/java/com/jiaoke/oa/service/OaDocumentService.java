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
     * 根据表单状态获取总数
     *
     * @param formState formState
     * @return total
     */
    int getTotalByFormState(Integer formState);

    /**
     * 根据id获取公文详情
     *
     * @param id id
     * @return OaDocument
     */
    OaDocument getDocumentDetailsById(Integer id);

    /**
     * 根据表单状态分页查询
     *
     * @param formState 表单状态
     * @param page      页
     * @param rows      条数
     * @return OaDocumentList
     */
    List<OaDocument> getPagingByFormState(Integer formState, Integer page, Integer rows);
}
