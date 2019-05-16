package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.DingDingPunchDate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 钉钉考勤-打卡日期
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface DingDingPunchDateMapper {

    /**
     * 插入数据
     *
     * @param dingDingPunchDate dingDingPunchDate
     * @return int
     */
    int insert(DingDingPunchDate dingDingPunchDate);

    /**
     * 查询所有数据
     *
     * @return list
     */
    List<DingDingPunchDate> selectAll();
}
