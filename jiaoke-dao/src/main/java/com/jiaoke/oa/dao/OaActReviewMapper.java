package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaActReview;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 合同审查表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaActReviewMapper extends Mapper<OaActReview> {

    /**
     * 根据idList查询多条
     *
     * @param idList idList
     * @return list
     */
    List<OaActReview> selectAllByIdList(@Param("idList") List<String> idList);
}
