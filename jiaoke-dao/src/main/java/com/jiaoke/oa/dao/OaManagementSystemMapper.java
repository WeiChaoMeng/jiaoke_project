package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaManagementSystem;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.Date;
import java.util.List;

/**
 * oa-综合办公室档案-管理体系相关
 *
 * @author lihui
 */
@Repository
public interface OaManagementSystemMapper extends Mapper<OaManagementSystem> {

    /**
     * 根据名称模糊查询
     *
     * @param fileName fileName
     * @return list
     */
    List<OaManagementSystem> getSelectByFileName(@Param("fileName") String fileName);

    /**
     * 根据日期查询
     *
     * @param date date
     * @return list
     */
    List<OaManagementSystem> getSelectByDate(Date date);

    /**
     * 查询所有数据
     *
     * @return list
     */
    List<OaManagementSystem> selectAllData();

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDelete(String[] ids);
}
