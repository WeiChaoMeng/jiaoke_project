package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaActMeals;
import com.jiaoke.oa.bean.OaActRegularization;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 转正申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaActRegularizationMapper extends Mapper<OaActRegularization> {

    /**
     * 插入数据并返回主键
     *
     * @param oaActRegularization oaActRegularization
     * @return int
     */
    int insertData(OaActRegularization oaActRegularization);
}
