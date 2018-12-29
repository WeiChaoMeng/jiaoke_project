package com.jiaoke;

import com.jiaoke.controller.SpringHelper;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.dao.QualityWarningDao;
import org.junit.Before;
import org.junit.Test;

import java.lang.reflect.Field;

/**
 * @author lihui
 * @version 1.0
 * @date 2018/12/20 14:04
 */
public class qualityTest {

    private QualityWarningDao qualityWarningDao;

    @Before
    public void setUp() {
        qualityWarningDao = SpringHelper.getBean("qualityWarningDao");
    }

    @Test
    public void testUser() {
        QualityRatioTemplate qualityRatioTemplate = qualityWarningDao.getQualityRatioTemplateById(1);

    }
}
