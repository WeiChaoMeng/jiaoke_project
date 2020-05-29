package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaOperateOffer;
import com.jiaoke.oa.bean.OaProductionEnergy;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 经营报价档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaProductionEnergyMapper extends Mapper<OaProductionEnergy> {

    /**
     * 筛选
     *
     * @param yearStr yearStr
     * @return list
     */
    List<OaProductionEnergy> searchFilter(String yearStr);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaProductionEnergy> selectAllData();

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDelete(String[] ids);
}
