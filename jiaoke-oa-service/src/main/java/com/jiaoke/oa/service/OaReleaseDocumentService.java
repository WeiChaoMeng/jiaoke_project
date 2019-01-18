package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaReleaseDocument;

import java.util.List;

/**
 * oa-综合办公室档案-公司发文
 * <p>
 * 发布公文service
 *
 * @author lihui
 */
public interface OaReleaseDocumentService {

    /**
     * 新增公司发文
     *
     * @param oaReleaseDocument oaReleaseDocument
     * @return 影响行数
     */
    int insertSelective(OaReleaseDocument oaReleaseDocument);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaReleaseDocument> selectAll();

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaReleaseDocument
     */
    OaReleaseDocument selectByPrimaryKey(int id);

    /**
     * 根据文件类型筛选
     *
     * @param documentType 文件类型
     * @return list
     */
    List<OaReleaseDocument> select(int documentType);

    /**
     * 根据发文名称模糊查询
     *
     * @param documentName 发文名称
     * @return list
     */
    List<OaReleaseDocument> getSelectByName(String documentName);

    /**
     * 根据访问日期查询
     *
     * @param visitDate 访问日期
     * @return list
     */
    List<OaReleaseDocument> getSelectByVisitDate(String visitDate);

    /**
     * 选择性更新
     *
     * @param oaReleaseDocument oaReleaseDocument
     * @return 影响行数
     */
    int updateByPrimaryKeySelective(OaReleaseDocument oaReleaseDocument);

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    int delete(int id);
}
