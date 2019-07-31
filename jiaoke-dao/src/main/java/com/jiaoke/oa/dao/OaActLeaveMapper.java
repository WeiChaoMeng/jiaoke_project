package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaActLeave;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 请假审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaActLeaveMapper extends Mapper<OaActLeave> {
}
