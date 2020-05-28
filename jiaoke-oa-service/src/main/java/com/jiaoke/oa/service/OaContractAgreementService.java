package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaContractAgreement;
import com.jiaoke.oa.bean.OaReleaseDocument;

import java.util.List;

/**
 * oa-综合办公室档案-公司发文
 * <p>
 * 发布公文service
 *
 * @author lihui
 */
public interface OaContractAgreementService {

    /**
     * 新增公司发文
     *
     * @param oaContractAgreement oaContractAgreement
     * @return 影响行数
     */
    int insertSelective(OaContractAgreement oaContractAgreement);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaContractAgreement> selectAll();

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaReleaseDocument
     */
    OaContractAgreement selectByPrimaryKey(int id);

    /**
     * 根据文件类型筛选
     *
     * @param documentType 文件类型
     * @return list
     */
    List<OaContractAgreement> select(int documentType);

    /**
     * 根据发文名称模糊查询
     *
     * @param contractAgreementName 合同/协议名称
     * @return list
     */
    List<OaContractAgreement> getSelectByName(String contractAgreementName);

    /**
     * 根据访问日期查询
     *
     * @param data 日期
     * @return list
     */
    List<OaContractAgreement> getSelectByDate(String data);

    /**
     * 选择性更新
     *
     * @param oaContractAgreement oaContractAgreement
     * @return 影响行数
     */
    int updateByPrimaryKeySelective(OaContractAgreement oaContractAgreement);

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    int delete(int id);

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDelete(String[] ids);
}
