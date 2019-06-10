package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaNewsCenter;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * oa-资产管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaNewsCenterMapper extends Mapper<OaNewsCenter> {

    /**
     * 查询最新数据
     *
     * @return list
     */
    List<OaNewsCenter> selectLatestData();

    /**
     * 首页展示数据
     *
     * @return list
     */
    List<OaNewsCenter> homePageData();

    /**
     * 查询最新数据
     *
     * @return list
     */
    List<OaNewsCenter> selectAllData();
}
