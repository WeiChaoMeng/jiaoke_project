package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaEiaMonitor;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.Date;
import java.util.List;

/**
 * oa-综合办公室档案-环评监测报告
 *
 * @author lihui
 */
@Repository
public interface OaEiaMonitorMapper extends Mapper<OaEiaMonitor> {

    /**
     * 根据名称模糊查询
     *
     * @param sampleName sampleName
     * @return list
     */
    List<OaEiaMonitor> getSelectBySampleName(@Param("sampleName") String sampleName);

    /**
     * 根据日期查询
     *
     * @param testingDate testingDate
     * @return list
     */
    List<OaEiaMonitor> getSelectByTestingDate(Date testingDate);
}
