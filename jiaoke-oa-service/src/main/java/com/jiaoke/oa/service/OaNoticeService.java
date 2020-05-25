package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaNotice;

import java.util.List;

/**
 * 公告
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
public interface OaNoticeService {

    /**
     * 获取全部
     *
     * @return list
     */
    List<OaNotice> selectAllData();

    /**
     * 搜索
     *
     * @param title 标题
     * @return list
     */
    List<OaNotice> titleFilter(String title);

    /**
     * 选择性插入
     *
     * @param oaNotice oaNotice
     * @return 影响行数
     */
    int insertSelective(OaNotice oaNotice);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return 影响行数
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 详情
     *
     * @param id id
     * @return OaNotice
     */
    OaNotice selectByPrimaryKey(Integer id);

    /**
     * 首页展示数据
     *
     * @return list
     */
    List<OaNotice> homePageData();

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDeleteNotice(String[] ids);
}
