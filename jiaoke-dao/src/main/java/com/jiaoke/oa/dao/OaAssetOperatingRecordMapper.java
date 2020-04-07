package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaAssetOperatingRecord;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * oa-资产操作记录
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaAssetOperatingRecordMapper extends Mapper<OaAssetOperatingRecord> {

    /**
     * 查询全部数据
     *
     * @return list
     */
    List<OaAssetOperatingRecord> selectAllDate();

    /**
     * 根据操作人查询数据
     *
     * @param operatorPerson operatorPerson
     * @return list
     */
    List<OaAssetOperatingRecord> operatorPersonFilter(String operatorPerson);
}
