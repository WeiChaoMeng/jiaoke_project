package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaOperateLawsuit;
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
public interface OaOperateLawsuitMapper extends Mapper<OaOperateLawsuit> {

    /**
     * 筛选
     *
     * @param projectName projectName
     * @return list
     */
    List<OaOperateLawsuit> searchFilter(String projectName);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaOperateLawsuit> selectAllData();
}
