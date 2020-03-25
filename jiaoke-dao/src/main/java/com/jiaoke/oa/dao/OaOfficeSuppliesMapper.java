package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaOfficeSupplies;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 加班统计表数据表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaOfficeSuppliesMapper extends Mapper<OaOfficeSupplies> {

    /**
     * 批量插入数据
     *
     * @param list OaOfficeSuppliesList
     * @return id
     */
    int batchInsertData(List<OaOfficeSupplies> list);

    /**
     * 根据办公用品id查询
     *
     * @param officeSuppliesId officeSuppliesId
     * @return list
     */
    List<OaOfficeSupplies> selectByOfficeSuppliesId(String officeSuppliesId);

    /**
     * 根据办公用品id删除
     *
     * @param officeSuppliesId officeSuppliesId
     * @return int
     */
    int deleteByOfficeSuppliesId(String officeSuppliesId);
}
