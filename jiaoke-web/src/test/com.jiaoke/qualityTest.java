package com.jiaoke;

import com.jiaoke.controller.SpringHelper;
<<<<<<< HEAD
import com.jiaoke.quality.bean.QualityWaringDataFalse;
import com.jiaoke.quality.dao.QualityTimelyDataFalseMapper;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
=======
import com.jiaoke.oa.bean.DingDingPunchTime;
import com.jiaoke.oa.dao.DingDingPunchTimeMapper;
import org.junit.Before;
import org.junit.Test;

import java.util.List;
>>>>>>> 11ada14399558a7fef64c82284ee6e997e702f64

/**
 * @author lihui
 * @version 1.0
 * @date 2018/12/20 14:04
 */
public class qualityTest {

    //    private RoleInfoMapper roleInfoMapper;
    private DingDingPunchTimeMapper dingDingPunchTimeMapper;
//    private DingDingPunchRecordMapper dingDingPunchRecordMapper;

    @Before
    public void setUp() {
        dingDingPunchTimeMapper = SpringHelper.getBean("dingDingPunchTimeMapper");
    }

    @Test
    public void testUser() {
        List<DingDingPunchTime> punchTimeList = dingDingPunchTimeMapper.selectAllByAttendanceId("0221276640856571");
        for (DingDingPunchTime dingDingPunchTime : punchTimeList) {
            System.out.println(dingDingPunchTime.getTime());
        }
    }

}
