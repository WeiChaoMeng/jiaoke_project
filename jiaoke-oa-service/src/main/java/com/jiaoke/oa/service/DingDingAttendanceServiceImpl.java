package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.DingDingAttendance;
import com.jiaoke.oa.bean.DingDingPunchDate;
import com.jiaoke.oa.bean.DingDingPunchTime;
import com.jiaoke.oa.dao.DingDingAttendanceMapper;
import com.jiaoke.oa.dao.DingDingPunchDateMapper;
import com.jiaoke.oa.dao.DingDingPunchTimeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 钉钉考勤-用户信息
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
@Service
public class DingDingAttendanceServiceImpl implements DingDingAttendanceService {

    @Resource
    private DingDingAttendanceMapper dingDingAttendanceMapper;

    @Resource
    private DingDingPunchTimeMapper dingDingPunchTimeMapper;

    @Resource
    private DingDingPunchDateMapper dingDingPunchDateMapper;

    @Override
    public int batchInsertion(List<DingDingAttendance> list) {
        return dingDingAttendanceMapper.batchInsertion(list);
    }

    @Override
    public int emptyTable() {
        return dingDingAttendanceMapper.emptyTable();
    }

    @Override
    public DingDingAttendance selectByName(String nickName) {
        return dingDingAttendanceMapper.selectByName(nickName);
    }

    @Override
    public List<DingDingPunchTime> selectByAttendanceId(String attendanceId) {
        return dingDingPunchTimeMapper.selectByAttendanceId(attendanceId);
    }

    @Override
    public int insertPunchTime(DingDingPunchTime dingDingPunchTime) {
        return dingDingPunchTimeMapper.insert(dingDingPunchTime);
    }

    @Override
    public List<DingDingPunchTime> selectPunchTime(String attendanceId) {
        List<DingDingPunchTime> punchTimeList = dingDingPunchTimeMapper.selectAllByAttendanceId(attendanceId);
        for (DingDingPunchTime dingDingPunchTime : punchTimeList) {
            dingDingPunchTime.setCreateTimeStr(DateUtil.dateConvertYYYYMMDD(dingDingPunchTime.getCreateTime()));
        }
        return punchTimeList;
    }

    @Override
    public int insertPunchRecord(DingDingPunchDate dingDingPunchDate) {
        return dingDingPunchDateMapper.insert(dingDingPunchDate);
    }

    @Override
    public List<DingDingPunchDate> selectPunchDate() {
        List<DingDingPunchDate> punchRecordList = dingDingPunchDateMapper.selectAll();
        for (DingDingPunchDate dingDingPunchDate : punchRecordList) {
            dingDingPunchDate.setCreateTimeStr(DateUtil.dateConvertYYYYMMDD(dingDingPunchDate.getCreateTime()));
        }
        return punchRecordList;
    }
}
