package com.jiaoke.quality.dao;

import com.jiaoke.quality.bean.QualityDataManagerDay;
import com.jiaoke.quality.bean.QualityTimelyDataFalse;
import com.jiaoke.quality.bean.QualityWaringDataFalse;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 实时监控数据（假）
 *
 * @author lihui
 * @version 1.0
 * @date 2018-12-25 00:00:00
 */
@Repository
public interface QualityTimelyDataFalseMapper {

    int insertSelective(QualityTimelyDataFalse record);


    List<Map<String,String>> getTimeSurveillanceFalseData();

    int selectHistoryDataToDayCount();

    List<QualityDataManagerDay> selectHistoryDataToDay(@Param("pageFirstNum") int pageFirstNum, @Param("eachPageDataNum")int eachPageDataNum);

    void insertWarningPromessage(List<QualityWaringDataFalse> myWaringDataList);

    List<Map<String, String>> selectFalseDataToChars();

    List<Map<String, String>> selectFalseDataEcharsTemp();

    List<Map<String, String>> selectHistoryByDateAndcrewNum(@Param("producedDate")String producedDate, @Param("crewNum")String crewNum);
}