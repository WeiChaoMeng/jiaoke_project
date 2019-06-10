package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaActSealsUse;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 印章使用审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaActSealsUseMapper extends Mapper<OaActSealsUse> {

    /**
     * 插入数据并返回主键
     *
     * @param oaActSealsUse oaActSealsUse
     * @return int
     */
    int insertData(OaActSealsUse oaActSealsUse);
}
