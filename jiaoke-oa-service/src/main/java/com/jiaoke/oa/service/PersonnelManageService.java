package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.UserContract;
import com.jiaoke.oa.bean.UserFiles;
import com.jiaoke.oa.bean.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 人事管理
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
public interface PersonnelManageService {

    /**
     * 获取用户信息
     *
     * @return List
     */
    List<UserInfo> getUserBasicInfo();

    /**
     * 根据主键查询
     *
     * @param userInfoId id
     * @return UserInfo
     */
    UserInfo getUserInfoByUseId(Integer userInfoId);

    /**
     * 用户统计
     *
     * @return lit
     */
    List<Integer> getUserStatistical();

    /**
     * 加载用户合同数据
     *
     * @return list
     */
    List<UserContract> getUserContractData();

    /**
     * 正式用户数量
     *
     * @return int
     */
    int statisticsFormalUser();

    /**
     * 试用期用户数量
     *
     * @param id id
     * @return int
     */
    int getUserNameByNature(Integer id);

    /**
     * 获取试用期用户数据
     *
     * @return list
     */
    List<UserContract> getProbationUser();

    /**
     * 根据工作性质查询用户数据
     *
     * @param natureId natureId
     * @param number   number
     * @return list
     */
    List<UserContract> getDataListByNature(int natureId, int number);

    /**
     * 获取所有
     *
     * @return list
     */
    List<UserFiles> getUserFilesData();
}

