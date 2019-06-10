package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaActCard;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 饭卡使用审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaActCardMapper extends Mapper<OaActCard> {

    /**
     * 插入数据并返回主键
     *
     * @param oaActCard oaActCard
     * @return int
     */
    int insertData(OaActCard oaActCard);

    /**
     * 更新状态
     *
     * @param id    id
     * @param state state
     * @return int
     */
    int updateStateById(@Param("id") String id, @Param("state") Integer state);
}
