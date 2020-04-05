package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaAssetManagement;
import com.jiaoke.oa.bean.OaAssetOperatingRecord;

import java.util.List;

/**
 * oa-资产管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
public interface OaAssetsManagementService {

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaAssetManagement> selectAll();

    /**
     * 更具名字模糊查询
     *
     * @param assetsName 资产名称
     * @return list
     */
    List<OaAssetManagement> fuzzyQueryByName(String assetsName);

    /**
     * 批量新增
     *
     * @param oaAssetManagementList list
     * @return list
     */
    int addAssetsArchives(List<OaAssetManagement> oaAssetManagementList);

    /**
     * 根据id查询
     *
     * @param id id
     * @return oaAssetManagement
     */
    OaAssetManagement selectByPrimaryKey(Integer id);

    /**
     * 编辑
     *
     * @param oaAssetManagement oaAssetManagement
     * @return int
     */
    int edit(OaAssetManagement oaAssetManagement);

    /**
     * 删除
     *
     * @param id           id
     * @param deleteReason 删除原因
     * @return int
     */
    int delete(Integer id, String deleteReason);

    /**
     * 更新状态
     *
     * @param id    id
     * @param state s
     * @return int
     */
    int updateState(Integer id, Integer state);

    /**
     * 查询所有操作记录数据
     *
     * @return list
     */
    List<OaAssetOperatingRecord> selectOperatingRecordAll();

    /**
     * 查询操作记录数据根据操作人
     *
     * @param operatorPerson operatorPerson
     * @return list
     */
    List<OaAssetOperatingRecord> operatorPersonFilter(String operatorPerson);
}
