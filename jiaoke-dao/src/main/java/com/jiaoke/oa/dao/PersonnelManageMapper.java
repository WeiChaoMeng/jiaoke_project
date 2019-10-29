package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.DataAnalysis;
import com.jiaoke.oa.bean.PersonnelInfo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 人事管理
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
public interface PersonnelManageMapper extends Mapper<PersonnelInfo> {

    /**
     * 获取基本信息
     *
     * @return list
     */
    List<PersonnelInfo> getPersonnelBasicData();

    /**
     * 性别划分
     *
     * @return list
     */
    List<DataAnalysis> getSexCount();

    /**
     * 学历划分
     *
     * @return list
     */
    List<DataAnalysis> getEducationCount();

    /**
     * 技术等级划分
     *
     * @return list
     */
    List<DataAnalysis> getTechnologyCount();

    /**
     * 职称划分
     *
     * @return list
     */
    List<DataAnalysis> getTitleCount();

    /**
     * 户口性质划分
     *
     * @return list
     */
    List<DataAnalysis> getAccountCount();

    /**
     * 职务等级划分
     *
     * @return list
     */
    List<DataAnalysis> getJobCount();

    /**
     * 年龄段划分
     *
     * @return list
     */
    List<Integer> getAllAge();

    /**
     * 工作类型统计
     *
     * @return list
     */
    List<Integer> getWorkType();

    /**
     * 入职管理
     *
     * @return list
     */
    List<PersonnelInfo> entryManage();

    /**
     * 等待离职管理
     *
     * @return list
     */
    List<PersonnelInfo> waitLeave();

    /**
     * 已经离职管理
     *
     * @return list
     */
    List<PersonnelInfo> alreadyLeave();

    /**
     * 退休管理
     *
     * @return list
     */
    List<PersonnelInfo> retireManage();

    /**
     * 职位变动
     *
     * @return list
     */
    List<PersonnelInfo> jobChangeManage();

    /**
     * 更新合同状态（0.未开通，1.已开通）
     *
     * @param id id
     * @return int
     */
    int updateContractState(int id);
}