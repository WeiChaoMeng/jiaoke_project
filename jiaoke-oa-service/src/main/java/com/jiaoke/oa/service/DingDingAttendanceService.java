package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.DingDingAttendance;

import java.util.List;

/**
 * 钉钉考勤-用户信息
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
public interface DingDingAttendanceService {

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
