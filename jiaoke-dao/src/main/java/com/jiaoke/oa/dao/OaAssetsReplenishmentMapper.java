package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaAssetReplenishment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.Date;
import java.util.List;

/**
 * oa-资产补货
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaAssetsReplenishmentMapper extends Mapper<OaAssetReplenishment> {

    /**
     * 根据时间查询
     *
     * @param startTime         开始时间
     * @param endTime           结束时间
     * @param assetManagementId 资产id
     * @return list
     */
    List<OaAssetReplenishment> replenishmentTimeFilter(@Param("startTime") Date startTime,
                                                       @Param("endTime") Date endTime,
                                                       @Param("assetManagementId") Integer assetManagementId);
}
