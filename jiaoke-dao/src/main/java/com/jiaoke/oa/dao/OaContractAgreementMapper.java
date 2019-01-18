package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaContractAgreement;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.Date;
import java.util.List;

/**
 * oa-综合办公室档案-公司发文
 *
 * @author lihui
 */
@Repository
public interface OaContractAgreementMapper extends Mapper<OaContractAgreement> {

    /**
     * 根据文件名称模糊查询
     *
     * @param contractAgreementName 合同/协议名称
     * @return list
     */
    List<OaContractAgreement> getSelectByContractAgreementName(@Param("contractAgreementName") String contractAgreementName);

    /**
     * 根据日期查询
     *
     * @param date date
     * @return list
     */
    List<OaContractAgreement> getSelectByDate(Date date);
}
