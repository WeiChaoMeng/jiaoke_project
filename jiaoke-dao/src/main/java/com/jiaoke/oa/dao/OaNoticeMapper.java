package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaNotice;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * oa-公告
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaNoticeMapper extends Mapper<OaNotice> {

    /**
     * 查询全部数据
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
     * 首页展示数据
     *
     * @return list
     */
    List<OaNotice> homePageData();
}
