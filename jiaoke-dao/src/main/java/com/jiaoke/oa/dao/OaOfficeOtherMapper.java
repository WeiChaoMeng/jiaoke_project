package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaManagementSystem;
import com.jiaoke.oa.bean.OaOfficeOther;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.Date;
import java.util.List;

/**
 * oa-综合办公室档案-管理体系相关
 *
 * @author lihui
 */
@Repository
public interface OaOfficeOtherMapper extends Mapper<OaOfficeOther> {

    /**
     * 根据名称模糊查询
     *
     * @param name name
     * @return list
     */
    List<OaOfficeOther> getSelectByFileName(@Param("name") String name);

    /**
     * 根据日期查询
     *
     * @param date date
     * @return list
     */
    List<OaOfficeOther> getSelectByDate(Date date);
}
