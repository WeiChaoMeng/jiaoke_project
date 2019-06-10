package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaActCar;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 用车审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaActCarMapper extends Mapper<OaActCar> {

    /**
     * 插入数据并返回主键
     *
     * @param oaActCar oaActCar
     * @return int
     */
    int insertData(OaActCar oaActCar);

    /**
     * 更新状态
     *
     * @param id    id
     * @param state state
     * @return int
     */
    int updateStateById(@Param("id") String id, @Param("state") Integer state);
}
