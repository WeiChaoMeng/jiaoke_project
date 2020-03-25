package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaActOfficeSupplies;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 办公用品需求计划
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaActOfficeSuppliesMapper extends Mapper<OaActOfficeSupplies> {

    /**
     * 根据idList查询
     *
     * @param list list
     * @return list
     */
    List<OaActOfficeSupplies> selectMultipleData(@Param("list") List<String> list);

    /**
     * 根据id查询title
     *
     * @param id id
     * @return title
     */
    String selectTitleById(String id);
}
