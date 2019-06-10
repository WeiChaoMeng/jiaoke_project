package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaActReview;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 饭卡使用审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaActReviewMapper extends Mapper<OaActReview> {

    /**
     * 插入数据并返回主键
     *
     * @param oaActReview oaActReview
     * @return int
     */
    int insertData(OaActReview oaActReview);
}
