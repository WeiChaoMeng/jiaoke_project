package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaReleaseDocument;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.Date;
import java.util.List;

/**
 * oa-综合办公室档案-公司发文
 *
 * @author lihui
 */
@Repository
public interface OaReleaseDocumentMapper extends Mapper<OaReleaseDocument> {

    /**
     * 根据文件名称模糊查询
     *
     * @param documentName 发文名称
     * @return list
     */
    List<OaReleaseDocument> getSelectByName(@Param("documentName") String documentName);

    /**
     * 根据时间查询
     *
     * @param date date
     * @return list
     */
    List<OaReleaseDocument> getSelectByVisitDate(Date date);
}
