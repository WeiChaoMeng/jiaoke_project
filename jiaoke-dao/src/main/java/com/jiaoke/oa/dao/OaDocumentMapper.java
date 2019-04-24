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
     * 搜索
     *
     * @param textTitle  标题
     * @param formState  表单状态
     * @param userInfoId 当前登录用户id
     * @return list
     */
    List<OaDocument> textTitleFilter(@Param("textTitle") String textTitle, @Param("formState") int formState, @Param("userInfoId") String userInfoId);

    /**
     * 根据id获取列表
     *
     * @param id id
     * @return list
     */
    OaDocument getAllById(Integer id);

    /**
     * 根据表单状态获取列表
     *
     * @param formState  formState
     * @param userInfoId userInfoId
     * @return list
     */
    List<OaDocument> getAllByFormState(@Param("formState") Integer formState, @Param("userInfoId") String userInfoId);

    /**
     * 更新会签
     *
     * @param nickName 昵称
     * @param id       id
     * @return NumberOfAffectedRows
     */
    int updateCountersignature(@Param("nickName") String nickName, @Param("id") int id);

    /**
     * 更新核稿人
     *
     * @param nickName 昵称
     * @param id       id
     * @return NumberOfAffectedRows
     */
    int updateReviewer(@Param("nickName") String nickName, @Param("id") int id);

    /**
     * 更新签发
     *
     * @param nickName 昵称
     * @param id       id
     * @return NumberOfAffectedRows
     */
    int updateSignatureIssuance(@Param("nickName") String nickName, @Param("id") int id);

    /**
     * 更新签发和核稿人
     *
     * @param nickName 昵称
     * @param id       id
     * @return NumberOfAffectedRows
     */
    int updateSignatureIssuanceAndReviewer(@Param("nickName") String nickName, @Param("id") int id);

    /**
     * 更新会签和核稿人
     *
     * @param nickName 昵称
     * @param id       id
     * @return NumberOfAffectedRows
     */
    int updateCountersignatureAndReviewer(@Param("nickName") String nickName, @Param("id") int id);

    /**
     * 根据BusinessId获取
     *
     * @param ids       businessIdList
     * @param textTitle textTitle
     * @return list
     */
    List<OaDocument> selectByBusinessId(@Param("ids") List<Integer> ids, @Param("textTitle") String textTitle);
}