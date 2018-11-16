package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaDocument;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * OA-公文
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/15 11:00
 */

public interface OaDocumentMapper {
    /**
     * 根据主键删除
     *
     * @param id id
     * @return NumberOfAffectedRows
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 根据主键选择性更新
     *
     * @param record OaDocument
     * @return NumberOfAffectedRows
     */
    int updateByPrimaryKeySelective(OaDocument record);

    /**
     * 根据主键更新
     *
     * @param record OaDocument
     * @return NumberOfAffectedRows
     */
    int updateByPrimaryKey(OaDocument record);

    /**
     * 添加
     *
     * @param record record
     * @return NumberOfAffectedRows
     */
    int insert(OaDocument record);

    /**
     * 选择性添加
     *
     * @param record oaDocument
     * @return NumberOfAffectedRows
     */
    int insertSelective(OaDocument record);

    /**
     * 根据主键获取详情
     *
     * @param id id
     * @return OaDocument
     */
    OaDocument selectByPrimaryKey(Integer id);

    /**
     * 根据表单状态获取总数
     *
     * @param formState formState
     * @return total
     */
    int getTotalByFormState(Integer formState);

    /**
     * 根据表单状态获取列表
     *
     * @param formState formState
     * @return list
     */
    List<OaDocument> getAllByFormState(Integer formState);

    /**
     * 根据id获取列表
     *
     * @param id id
     * @return list
     */
    OaDocument getAllById(Integer id);

    List<OaDocument> getPagingByFormState(@Param("formState") Integer formState, @Param("start") Integer start, @Param("rows") Integer rows);

    /**
     * 更新会签
     *
     * @param nickName 昵称
     * @param id       id
     * @return NumberOfAffectedRows
     */
    int updateCountersignature(@Param("nickName") String nickName, @Param("id") int id);

    /**
     * 更新签发
     *
     * @param nickName 昵称
     * @param id       id
     * @return NumberOfAffectedRows
     */
    int updateSignatureIssuance(@Param("nickName") String nickName, @Param("id") int id);
}