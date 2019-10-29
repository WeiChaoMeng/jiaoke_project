package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.UserContract;
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
     * 根据关联ID删除
     *
     * @param id id
     * @return int
     */
    int deleteByRelevanceId(int id);
}