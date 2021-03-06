package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaActLaborContractRenewal;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 劳动合同签订、续订、变更、终止审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaActLaborContractRenewalMapper extends Mapper<OaActLaborContractRenewal> {
}
