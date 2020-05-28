package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaMaterialPurchase;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 物资管理部-原材料采购合同
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaMaterialPurchaseMapper extends Mapper<OaMaterialPurchase> {

    /**
     * 筛选
     *
     * @param name name
     * @return list
     */
    List<OaMaterialPurchase> searchFilter(String name);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaMaterialPurchase> selectAllData();


    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDelete(String[] ids);
}
