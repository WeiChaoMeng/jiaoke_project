package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaActEngineering;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 工程名称变更记录表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaActEngineeringMapper extends Mapper<OaActEngineering> {

    /**
     * 插入数据
     *
     * @param oaActEngineering oaActEngineering
     * @return int
     */
    int insertData(OaActEngineering oaActEngineering);
}
