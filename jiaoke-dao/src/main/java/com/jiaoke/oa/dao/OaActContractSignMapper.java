package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaActContractSign;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 劳务派遣员工合同签订、续订、变更、终止审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaActContractSignMapper extends Mapper<OaActContractSign> {
}
