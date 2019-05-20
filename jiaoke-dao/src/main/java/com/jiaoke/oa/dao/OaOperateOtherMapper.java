package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaOperateOther;
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
public interface OaOperateOtherMapper extends Mapper<OaOperateOther> {

    /**
     * 筛选
     *
     * @param fileName fileName
     * @return list
     */
    List<OaOperateOther> searchFilter(String fileName);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaOperateOther> selectAllData();
}
