package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActExamination;

/**
 * 职称（技术等级）考试申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActExaminationService {

    /**
     * 删除
     *
     * @param id id
     * @return int
     */
    int deleteData(String id);

    /**
     * 新增
     *
     * @param oaActExamination oaActExamination
     * @param userId           userId
     * @param randomId         randomId
     * @param state            state
     * @return int
     */
    int insert(OaActExamination oaActExamination, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActExamination oaActExamination
     * @return int
     */
    int edit(OaActExamination oaActExamination);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActExamination selectByPrimaryKey(String id);

    /**
     * 根据主键更新数据
     *
     * @param oaActExamination oaActExamination
     * @return int
     */
    int updateByPrimaryKeySelective(OaActExamination oaActExamination);
}
