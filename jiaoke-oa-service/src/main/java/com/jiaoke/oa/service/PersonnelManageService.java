package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.DataAnalysis;
import com.jiaoke.oa.bean.PersonnelInfo;
import com.jiaoke.oa.bean.UserContract;
import com.jiaoke.oa.bean.UserInfo;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

/**
 * 人事管理
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
public interface PersonnelManageService {

    /**
     * 添加人员信息
     *
     * @param personnelInfo personnelInfo
     * @return int
     */
    int addPersonnelInfo(PersonnelInfo personnelInfo);

    /**
     * 获取基本信息
     *
     * @return list
     */
    List<PersonnelInfo> getPersonnelBasicData();

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return UserInfo
     */
    PersonnelInfo selectByPrimaryKey(Integer id);

    /**
     * 根据主键选择性更新
     *
     * @param personnelInfo personnelInfo
     * @return int
     */
    int updateByPrimaryKeySelective(PersonnelInfo personnelInfo);

    /**
     * 添加合同
     *
     * @param id id
     * @return int
     */
    int appendContract(int id);

    /**
     * 获取主页数据
     *
     * @return list
     */
    Map<String, Integer> getHomePageData();

    /**
     * 入职人员管理
     *
     * @return list
     * @throws ParseException pe
     */
    List<PersonnelInfo> entryManage() throws ParseException;

    /**
     * 等待离职
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
     * 获取合同总数
     *
     * @return int
     */
    int getContractTotal();

    /**
     * 获取合同台账
     *
     * @return list
     */
    List<UserContract> contractList();

    /**
     * 根据id查询
     *
     * @param id id
     * @return userContract
     */
    UserContract getByPrimaryKey(int id);

    /**
     * 根据主键选择性更新
     *
     * @param userContract userContract
     * @return int
     */
    int updateUserContract(UserContract userContract);
}

