package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaActSealsBorrow;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * 印章借用审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaActSealsBorrowMapper extends Mapper<OaActSealsBorrow> {

    /**
     * 插入数据并返回主键
     *
     * @param oaActSealsBorrow oaActSealsBorrow
     * @return int
     */
    int insertData(OaActSealsBorrow oaActSealsBorrow);
}
