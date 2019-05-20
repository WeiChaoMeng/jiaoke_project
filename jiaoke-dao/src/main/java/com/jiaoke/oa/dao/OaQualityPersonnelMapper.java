package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaQualityPersonnel;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 质量技术部-人员情况
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaQualityPersonnelMapper extends Mapper<OaQualityPersonnel> {

    /**
     * 筛选
     *
     * @param name name
     * @return list
     */
    List<OaQualityPersonnel> searchFilter(String name);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaQualityPersonnel> selectAllData();
}
