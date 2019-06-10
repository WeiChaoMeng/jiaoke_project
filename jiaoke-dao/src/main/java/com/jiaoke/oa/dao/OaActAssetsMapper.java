package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaActAssets;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 固定资产投资完成验收单（生产用）
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaActAssetsMapper extends Mapper<OaActAssets> {

    /**
     * 插入数据并返回主键
     *
     * @param oaActAssets oaActAssets
     * @return int
     */
    int insertData(OaActAssets oaActAssets);

    /**
     * 更新状态
     *
     * @param id    id
     * @param state state
     * @return int
     */
    int updateStateById(@Param("id") Integer id, @Param("state") Integer state);
}
