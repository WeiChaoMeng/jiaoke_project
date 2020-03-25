package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaOfficeSuppliesUse;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 办公用品领用-详情
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaOfficeSuppliesUseMapper extends Mapper<OaOfficeSuppliesUse> {

    /**
     * 批量插入数据
     *
     * @param list OaOfficeSuppliesUseList
     * @return id
     */
    int batchInsertData(List<OaOfficeSuppliesUse> list);

    /**
     * 根据办公用品id查询
     *
     * @param officeSuppliesUseId officeSuppliesUseId
     * @return list
     */
    List<OaOfficeSuppliesUse> selectByOfficeSuppliesUseId(String officeSuppliesUseId);

    /**
     * 根据办公用品id删除
     *
     * @param officeSuppliesUseId officeSuppliesUseId
     * @return int
     */
    int deleteByOfficeSuppliesUseId(String officeSuppliesUseId);
}
