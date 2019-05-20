package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.DingDingPunchTime;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 钉钉考勤-打卡时间
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface DingDingPunchTimeMapper {

    /**
     * 插入数据
     *
     * @param dingDingPunchTime dingDingPunchTime
     * @return int
     */
    int insert(DingDingPunchTime dingDingPunchTime);

    /**
     * 根据考勤id查询
     *
     * @param attendanceId attendanceId
     * @return list
     */
    List<DingDingPunchTime> selectByAttendanceId(String attendanceId);

    /**
     * 查询所有
     *
     * @param attendanceId attendanceId
     * @return list
     */
    List<DingDingPunchTime> selectAllByAttendanceId(String attendanceId);
}
