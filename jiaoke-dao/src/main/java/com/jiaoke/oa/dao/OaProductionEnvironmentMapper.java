package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaProductionEnvironment;
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
public interface OaProductionEnvironmentMapper extends Mapper<OaProductionEnvironment> {

    /**
     * 筛选
     *
     * @param projectName projectName
     * @return list
     */
    List<OaProductionEnvironment> searchFilter(String projectName);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaProductionEnvironment> selectAllData();
}
