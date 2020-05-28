package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaFinanceVoucher;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 财务管理部-凭证
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaFinanceVoucherMapper extends Mapper<OaFinanceVoucher> {

    /**
     * 筛选
     *
     * @param remarks remarks
     * @return list
     */
    List<OaFinanceVoucher> searchFilter(String remarks);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaFinanceVoucher> selectAllData();

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDelete(String[] ids);
}
