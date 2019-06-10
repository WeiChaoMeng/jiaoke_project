package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaActTemporary;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * OA模块首页
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaIndexMapper {

    /**
     * 查询基本数据信息
     *
     * @param tableName sql表名
     * @param id        主键
     * @return OaActTemporary
     */
    OaActTemporary selectSimpleData(@Param("tableName") String tableName, @Param("id") String id);

    /**
     * 根据Id和表名修改状态(0,已发 - 1,待发)
     *
     * @param tableName tableName
     * @param id        id
     * @param state     state
     * @return int
     */
    int updateStateByIdAndTableName(@Param("tableName") String tableName, @Param("id") Integer id, @Param("state") Integer state);

    /**
     * 根据Id和表名删除
     *
     * @param tableName 表名
     * @param id        主键
     * @return int
     */
    int deleteByIdAndTableName(@Param("tableName") String tableName, @Param("id") Integer id);
}
