package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaOperateSign;
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
public interface OaOperateSignMapper extends Mapper<OaOperateSign> {

    /**
     * 筛选
     *
     * @param purchaser purchaser
     * @return list
     */
    List<OaOperateSign> searchFilter(String purchaser);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaOperateSign> selectAllData();

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDelete(String[] ids);
}
