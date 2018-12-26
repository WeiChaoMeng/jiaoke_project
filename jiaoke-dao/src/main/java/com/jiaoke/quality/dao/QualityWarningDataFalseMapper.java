package com.jiaoke.quality.dao;

import com.jiaoke.quality.bean.QualityWarningDataFalse;
import org.springframework.stereotype.Repository;

/**
 * 质量预警数据（假）
 *
 * @author lihui
 * @version 1.0
 * @date 2018-12-25 00:00:00
 */
@Repository
public interface QualityWarningDataFalseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QualityWarningDataFalse record);

    int insertSelective(QualityWarningDataFalse record);

    QualityWarningDataFalse selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QualityWarningDataFalse record);

    int updateByPrimaryKey(QualityWarningDataFalse record);
}