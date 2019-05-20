package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaMaterialBidding;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 物资管理部-砂石料招投标资料
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaMaterialBiddingMapper extends Mapper<OaMaterialBidding> {

    /**
     * 筛选
     *
     * @param file file
     * @return list
     */
    List<OaMaterialBidding> searchFilter(String file);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaMaterialBidding> selectAllData();
}
