package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaMaterialOther;
import com.jiaoke.oa.bean.OaProductionOther;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 生产管理部-其他
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaProductionOtherMapper extends Mapper<OaProductionOther> {

    /**
     * 筛选
     *
     * @param name name
     * @return list
     */
    List<OaProductionOther> searchFilter(String name);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaProductionOther> selectAllData();
}
