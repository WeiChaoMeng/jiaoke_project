package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.UserFiles;
import org.springframework.security.core.userdetails.User;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 员工档案
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
public interface UserFilesMapper extends Mapper<UserFiles> {

    /**
     * 获取所有
     *
     * @return list
     */
    List<UserFiles> getUserFilesData();
}