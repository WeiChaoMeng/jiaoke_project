package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.DingDingAttendance;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 钉钉考勤-用户信息
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface DingDingAttendanceMapper {

    /**
     * 批量插入
     *
     * @param list list
     * @return 影响行数
     */
    int batchInsertion(List<DingDingAttendance> list);

    /**
     * 清空表
     *
     * @return 影响行数
     */
    int emptyTable();
}
