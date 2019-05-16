package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaProductionContract;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 经营报价档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaProductionContractMapper extends Mapper<OaProductionContract> {

    /**
     * 筛选
     *
     * @param projectName projectName
     * @return list
     */
    List<OaProductionContract> searchFilter(String projectName);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaProductionContract> selectAllData();
}
