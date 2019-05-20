package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaOperateBid;
import com.jiaoke.oa.bean.OaOperateCustomer;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * oa-资产管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaOperateCustomerMapper extends Mapper<OaOperateCustomer> {

    /**
     * 筛选
     *
     * @param projectName projectName
     * @return list
     */
    List<OaOperateCustomer> searchFilter(String projectName);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaOperateCustomer> selectAllData();
}
