package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaProductionEngineering;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 工程基建类资料
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaProductionEngineeringMapper extends Mapper<OaProductionEngineering> {

    /**
     * 筛选
     *
     * @param projectName projectName
     * @return list
     */
    List<OaProductionEngineering> searchFilter(String projectName);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaProductionEngineering> selectAllData();
}
