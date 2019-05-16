package com.jiaoke;

import com.jiaoke.controller.SpringHelper;
import com.jiaoke.oa.bean.DingDingPunchTime;
import com.jiaoke.oa.dao.DingDingPunchTimeMapper;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

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
