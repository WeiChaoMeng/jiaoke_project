package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaReceiveDocument;
import com.jiaoke.oa.bean.OaReleaseDocument;

import java.util.List;

/**
 * oa-综合办公室档案-公司发文
 * <p>
 * 发布公文service
 *
 * @author lihui
 */
public interface OaReceiveDocumentService {

    /**
     * 新增公司发文
     *
     * @param oaReceiveDocument oaReceiveDocument
     * @return 影响行数
     */
    int insertSelective(OaReceiveDocument oaReceiveDocument);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaReceiveDocument> selectAll();

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaReceiveDocument
     */
    OaReceiveDocument selectByPrimaryKey(int id);

    /**
     * 根据文件类型筛选
     *
     * @param publishingDepartment 发文部室
     * @return list
     */
    List<OaReceiveDocument> select(int publishingDepartment);

    /**
     * 根据发文名称模糊查询
     *
     * @param documentName 发文名称
     * @return list
     */
    List<OaReceiveDocument> getSelectByName(String documentName);

    /**
     * 根据访问日期查询
     *
     * @param receiveDate 收文时间
     * @return list
     */
    List<OaReceiveDocument> getSelectByReceiveDate(String receiveDate);

    /**
     * 选择性更新
     *
     * @param oaReceiveDocument oaReceiveDocument
     * @return 影响行数
     */
    int updateByPrimaryKeySelective(OaReceiveDocument oaReceiveDocument);

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    int delete(int id);
}
