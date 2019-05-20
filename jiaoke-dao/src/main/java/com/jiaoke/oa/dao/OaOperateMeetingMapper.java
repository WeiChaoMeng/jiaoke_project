package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaOperateMeeting;
import com.jiaoke.oa.bean.OaOperateOffer;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 经营报价档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaOperateMeetingMapper extends Mapper<OaOperateMeeting> {

    /**
     * 筛选
     *
     * @param theme theme
     * @return list
     */
    List<OaOperateMeeting> searchFilter(String theme);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaOperateMeeting> selectAllData();
}
