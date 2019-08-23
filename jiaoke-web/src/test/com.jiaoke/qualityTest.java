package com.jiaoke;

import com.jiaoke.controller.SpringHelper;
import com.jiaoke.oa.bean.AirQuality;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import com.jiaoke.oa.dao.WeatherReportByCityMapper;
import org.junit.Before;
import org.junit.Test;

import java.util.List;
import java.util.Map;

/**
 * @author lihui
 * @version 1.0
 * @date 2018/12/20 14:04
 */
public class qualityTest {

    //    private RoleInfoMapper roleInfoMapper;
    private WeatherReportByCityMapper weatherReportByCityMapper;
//    private DingDingPunchRecordMapper dingDingPunchRecordMapper;

    @Before
    public void setUp() {
        weatherReportByCityMapper = SpringHelper.getBean("weatherReportByCityMapper");
    }

    @Test
    public void testUser() {

        List<AirQuality> airQualityList = weatherReportByCityMapper.selectLastWeekData();
        for (int i = 0; i < airQualityList.size(); i++) {
            System.out.println(airQualityList.get(i).getFineParticle());
        }
    }
}
