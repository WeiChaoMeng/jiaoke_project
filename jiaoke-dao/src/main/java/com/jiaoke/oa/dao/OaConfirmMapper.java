package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaConfirm;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 确认单审批单-详情表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaConfirmMapper extends Mapper<OaConfirm> {

    /**
     * 批量插入数据
     *
     * @param list list
     * @return id
     */
    int batchInsertData(List<OaConfirm> list);

    /**
     * 根据主表id查询
     *
     * @param confirmId confirmId
     * @return list
     */
    List<OaConfirm> selectByConfirmId(String confirmId);

    /**
     * 根据主表id删除
     *
     * @param confirmId confirmId
     * @return int
     */
    int deleteByConfirmId(String confirmId);
}
