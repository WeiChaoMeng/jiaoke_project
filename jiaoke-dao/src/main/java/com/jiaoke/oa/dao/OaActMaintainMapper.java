package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaActMaintain;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 设备维修申请单
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaActMaintainMapper extends Mapper<OaActMaintain> {

    /**
     * 插入数据并返回主键
     *
     * @param oaActMaintain oaActMaintain
     * @return int
     */
    int insertData(OaActMaintain oaActMaintain);
}
