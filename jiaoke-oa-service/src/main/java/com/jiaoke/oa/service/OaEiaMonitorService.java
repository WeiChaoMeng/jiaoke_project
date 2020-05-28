package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaEiaMonitor;

import java.util.List;

/**
 * oa-综合办公室档案-环评监测报告
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 12:57
 */
public interface OaEiaMonitorService {

    /**
     * 新增
     *
     * @param oaEiaMonitor oaEiaMonitor
     * @return 影响行数
     */
    int insertSelective(OaEiaMonitor oaEiaMonitor);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaEiaMonitor> selectAll();

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaReleaseDocument
     */
    OaEiaMonitor selectByPrimaryKey(int id);

    /**
     * 根据名称模糊查询
     *
     * @param sampleName sampleName
     * @return list
     */
    List<OaEiaMonitor> getSelectBySampleName(String sampleName);

    /**
     * 根据日期查询
     *
     * @param testingDate testingDate
     * @return list
     */
    List<OaEiaMonitor> getSelectByTestingDate(String testingDate);

    /**
     * 选择性更新
     *
     * @param oaEiaMonitor oaEiaMonitor
     * @return 影响行数
     */
    int updateByPrimaryKeySelective(OaEiaMonitor oaEiaMonitor);

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    int delete(int id);

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDelete(String[] ids);
}
