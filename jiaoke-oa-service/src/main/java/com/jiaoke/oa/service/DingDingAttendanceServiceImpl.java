package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.DingDingAttendance;
import com.jiaoke.oa.dao.DingDingAttendanceMapper;
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

    @Override
    public int batchInsertion(List<DingDingAttendance> list) {
        return dingDingAttendanceMapper.batchInsertion(list);
    }

    @Override
    public int emptyTable() {
        return dingDingAttendanceMapper.emptyTable();
    }
}
