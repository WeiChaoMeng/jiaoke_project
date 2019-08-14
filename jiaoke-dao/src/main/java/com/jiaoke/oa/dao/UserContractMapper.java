package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.UserContract;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 用户合同
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
public interface UserContractMapper extends Mapper<UserContract> {

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
     * 根据工作性质查询
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
    List<UserContract> getDataListByNature(@Param("natureId") int natureId, @Param("number") int number);
}