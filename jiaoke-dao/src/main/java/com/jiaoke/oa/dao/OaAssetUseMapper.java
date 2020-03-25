package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaAssetUse;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * oa-资产领用记录
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaAssetUseMapper extends Mapper<OaAssetUse> {

    /**
     * 批量插入数据
     *
     * @param list list
     * @return id
     */
    int batchInsertData(List<OaAssetUse> list);

    /**
     * 根据名字模糊查询
     *
     * @param usePerson usePerson
     * @return list
     */
    List<OaAssetUse> fuzzyQueryByName(String usePerson);
}
