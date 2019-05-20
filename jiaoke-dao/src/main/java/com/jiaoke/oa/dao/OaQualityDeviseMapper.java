package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaQualityDevise;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 质量技术部-设计文件
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaQualityDeviseMapper extends Mapper<OaQualityDevise> {

    /**
     * 筛选
     *
     * @param remarks remarks
     * @return list
     */
    List<OaQualityDevise> searchFilter(String remarks);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaQualityDevise> selectAllData();
}
