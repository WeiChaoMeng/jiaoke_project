package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaAcceptanceWarehousing;
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
public interface OaAcceptanceWarehousingMapper extends Mapper<OaAcceptanceWarehousing> {

    /**
     * 批量插入数据
     *
     * @param list OaAcceptanceWarehousingList
     * @return id
     */
    int batchInsertData(List<OaAcceptanceWarehousing> list);

    /**
     * 根据验收入库id查询
     *
     * @param acceptanceWarehousingId acceptanceWarehousingId
     * @return list
     */
    List<OaAcceptanceWarehousing> selectByAcceptanceWarehousingId(String acceptanceWarehousingId);

    /**
     * 根据验收入库id删除
     *
     * @param acceptanceWarehousingId acceptanceWarehousingId
     * @return int
     */
    int deleteByAcceptanceWarehousingId(String acceptanceWarehousingId);
}
