package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaUnitPrice;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 单价审批单-详情表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaUnitPriceMapper extends Mapper<OaUnitPrice> {

    /**
     * 批量插入数据
     *
     * @param list list
     * @return id
     */
    int batchInsertData(List<OaUnitPrice> list);

    /**
     * 根据主表id查询
     *
     * @param unitPriceId unitPriceId
     * @return list
     */
    List<OaUnitPrice> selectByUnitPriceId(String unitPriceId);

    /**
     * 根据主表id删除
     *
     * @param unitPriceId unitPriceId
     * @return int
     */
    int deleteByUnitPriceId(String unitPriceId);
}
