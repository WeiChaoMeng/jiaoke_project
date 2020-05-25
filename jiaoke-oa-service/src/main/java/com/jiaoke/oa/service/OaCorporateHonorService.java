package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaCorporateHonor;
import com.jiaoke.oa.bean.OaNewsCenter;

import java.util.List;

/**
 * oa-企业荣誉
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
public interface OaCorporateHonorService {

    /**
     * 选择性插入
     *
     * @param oaCorporateHonor oaCorporateHonor
     * @return 影响行数
     */
    int insertSelective(OaCorporateHonor oaCorporateHonor);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaCorporateHonor> selectAll();

    /**
     * 搜索
     *
     * @param title 标题
     * @return list
     */
    List<OaCorporateHonor> titleFilter(String title);

    /**
     * 根据id查询
     *
     * @param id id
     * @return OaAssetManagement
     */
    OaCorporateHonor selectByPrimaryKey(Integer id);

    /**
     * 查询最新数据
     *
     * @return list
     */
    List<OaCorporateHonor> selectLatestData();

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
    int batchDeleteHonor(String[] ids);
}
