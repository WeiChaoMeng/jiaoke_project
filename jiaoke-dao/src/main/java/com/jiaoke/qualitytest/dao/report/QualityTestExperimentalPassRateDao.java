package com.jiaoke.qualitytest.dao.report;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.QualityTestExperimental;
import com.jiaoke.qualitytest.bean.report.QualityTestExperimentalPassRate;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * QualityTestExperimental的Dao接口
 *
 * @author
 */
public interface QualityTestExperimentalPassRateDao {
    /**
     * 获得QualityTestExperimental数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
     *
     * @param assist
     * @return
     */
    List<QualityTestExperimentalPassRate> selectQualityTestExperimentalPassRate_materials(Assist assist);

    List<QualityTestExperimentalPassRate> selectQualityTestExperimentalPassRate_experimental(Assist assist);
}