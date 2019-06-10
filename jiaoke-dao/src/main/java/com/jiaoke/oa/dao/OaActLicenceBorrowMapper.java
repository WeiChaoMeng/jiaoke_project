package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaActLicenceBorrow;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 证照借用审批单（原件）
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaActLicenceBorrowMapper extends Mapper<OaActLicenceBorrow> {

    /**
     * 插入数据并返回主键
     *
     * @param oaActLicenceBorrow oaActLicenceBorrow
     * @return int
     */
    int insertData(OaActLicenceBorrow oaActLicenceBorrow);
}
