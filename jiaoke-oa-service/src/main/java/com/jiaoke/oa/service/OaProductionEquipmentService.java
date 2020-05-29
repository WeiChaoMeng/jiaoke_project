package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaProductionEquipment;

import java.util.List;

/**
 * 生产管理部-设备档案技术资料
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaProductionEquipmentService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaProductionEquipment> selectAll();

    /**
     * 筛选
     *
     * @param deviceName deviceName
     * @return json
     */
    List<OaProductionEquipment> searchFilter(String deviceName);

    /**
     * 新增
     *
     * @param oaProductionEquipment oaProductionEquipment
     * @return int
     */
    int insertSelective(OaProductionEquipment oaProductionEquipment);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaProductionEquipment selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaProductionEquipment oaProductionEquipment
     * @return int
     */
    int updateByPrimaryKeySelective(OaProductionEquipment oaProductionEquipment);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDelete(String[] ids);
}
