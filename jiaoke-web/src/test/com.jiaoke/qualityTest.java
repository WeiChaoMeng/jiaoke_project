package com.jiaoke;

import com.jiaoke.controller.SpringHelper;
import com.jiaoke.quality.bean.QualityWaringDataFalse;
import com.jiaoke.quality.dao.QualityTimelyDataFalseMapper;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;

/**
 * @author lihui
 * @version 1.0
 * @date 2018/12/20 14:04
 */
public class qualityTest {

    //    private RoleInfoMapper roleInfoMapper;
    private QualityTimelyDataFalseMapper qualityTimelyDataFalseMapper;

    @Before
    public void setUp() {
        qualityTimelyDataFalseMapper = SpringHelper.getBean("qualityTimelyDataFalseMapper");
    }

    @Test
    public void testUser() {
        ArrayList<QualityWaringDataFalse> list = new ArrayList<>();
        QualityWaringDataFalse aFalse = new QualityWaringDataFalse();
        aFalse.setActualRatio(12.3);
        aFalse.setDeviationRatio(32.2);
        aFalse.setMaterialName("啊啊啊");
        aFalse.setMoudleRatio(33.4);
        aFalse.setWarningLevel(12);
        aFalse.setRealtimeDataShamId(21);

        QualityWaringDataFalse aFalses = new QualityWaringDataFalse();
        aFalses.setActualRatio(12.3);
        aFalses.setDeviationRatio(32.2);
        aFalses.setMaterialName("也一样");
        aFalses.setMoudleRatio(33.4);
        aFalses.setWarningLevel(12);
        aFalses.setRealtimeDataShamId(21);
        list.add(aFalse);
        list.add(aFalses);

        qualityTimelyDataFalseMapper.insertWarningPromessage(list);

    }

}
