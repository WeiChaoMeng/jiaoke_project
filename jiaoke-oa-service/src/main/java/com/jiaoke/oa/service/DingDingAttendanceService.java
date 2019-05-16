package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.DingDingAttendance;
import com.jiaoke.oa.bean.DingDingPunchDate;
import com.jiaoke.oa.bean.DingDingPunchTime;

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
     * 批量插入考勤用户信息
     *
     * @param list list
     * @return 影响行数
     */
    int batchInsertion(List<DingDingAttendance> list);

    /**
     * 清空表考勤用户表
     *
     * @return 影响行数
     */
    int emptyTable();

    /**
     * 根据当前登录用户查询考勤用户
     *
     * @param nickName 用户名
     * @return dingDingAttendance
     */
    DingDingAttendance selectByName(String nickName);

    /**
     * 根据考勤id查询
     *
     * @param attendanceId attendanceId
     * @return list
     */
    List<DingDingPunchTime> selectByAttendanceId(String attendanceId);

    /**
     * 插入打卡时间表
     *
     * @param dingDingPunchTime dingDingPunchTime
     * @return int
     */
    int insertPunchTime(DingDingPunchTime dingDingPunchTime);

    /**
     * 查询打卡时间
     *
     * @param attendanceId attendanceId
     * @return list
     */
    List<DingDingPunchTime> selectPunchTime(String attendanceId);

    /**
     * 插入打卡日期表
     *
     * @param dingDingPunchDate dingDingPunchDate
     * @return int
     */
    int insertPunchRecord(DingDingPunchDate dingDingPunchDate);

    /**
     * 查询打卡日期表
     *
     * @return list
     */
    List<DingDingPunchDate> selectPunchDate();
}
