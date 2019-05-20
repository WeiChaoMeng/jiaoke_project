package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaFinanceBill;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 财务管理部-票据
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaFinanceBillMapper extends Mapper<OaFinanceBill> {

    /**
     * 筛选
     *
     * @param numberSegment numberSegment
     * @return list
     */
    List<OaFinanceBill> searchFilter(String numberSegment);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaFinanceBill> selectAllData();
}
