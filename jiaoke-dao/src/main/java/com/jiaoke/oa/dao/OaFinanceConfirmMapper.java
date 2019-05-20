package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaFinanceConfirm;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 财务管理部-确认
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaFinanceConfirmMapper extends Mapper<OaFinanceConfirm> {

    /**
     * 筛选
     *
     * @param name name
     * @return list
     */
    List<OaFinanceConfirm> searchFilter(String name);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaFinanceConfirm> selectAllData();
}
