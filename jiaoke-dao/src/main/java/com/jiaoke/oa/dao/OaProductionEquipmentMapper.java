package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaProductionEquipment;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 生产管理部-设备档案技术资料
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaProductionEquipmentMapper extends Mapper<OaProductionEquipment> {

    /**
     * 筛选
     *
     * @param deviceName deviceName
     * @return list
     */
    List<OaProductionEquipment> searchFilter(String deviceName);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaProductionEquipment> selectAllData();

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDelete(String[] ids);
}
