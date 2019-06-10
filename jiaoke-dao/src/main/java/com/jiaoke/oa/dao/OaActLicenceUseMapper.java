package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaActLicenceUse;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 证照使用审批单（复印件）
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaActLicenceUseMapper extends Mapper<OaActLicenceUse> {

    /**
     * 插入数据并返回主键
     *
     * @param oaActLicenceUse oaActLicenceUse
     * @return int
     */
    int insertData(OaActLicenceUse oaActLicenceUse);
}
