package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaOperateBid;
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
public interface OaOperateBidMapper extends Mapper<OaOperateBid> {

    /**
     * 筛选
     *
     * @param projectName projectName
     * @return list
     */
    List<OaOperateBid> searchFilter(String projectName);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaOperateBid> selectAllData();

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDelete(String[] ids);

}
