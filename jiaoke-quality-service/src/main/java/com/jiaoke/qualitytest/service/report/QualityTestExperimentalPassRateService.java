package com.jiaoke.qualitytest.service.report;

import com.jiaoke.qualitytest.bean.QualityTestExperimental;

/**
 * QualityTestExperimental的服务接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalPassRateService {
	/**
	 * 获得QualityTestExperimental数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */
	String find(QualityTestExperimental value);

	/**
	 * 试验不合格率
	 * @param value
	 * @return
	 */
	String find_experimental(QualityTestExperimental value);

}
