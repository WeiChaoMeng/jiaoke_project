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

    /**
     * 搜索
     *
     * @param title 标题
     * @return list
     */
    List<OaNewsCenter> titleFilter(String title);

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDeleteNews(String[] ids);
}
