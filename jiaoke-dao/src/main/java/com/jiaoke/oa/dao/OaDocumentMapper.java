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
    int deleteByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaDocument record);

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

    List<OaDocument> getPagingByFormState(@Param("formState") Integer formState, @Param("start") Integer start, @Param("rows") Integer rows);
}