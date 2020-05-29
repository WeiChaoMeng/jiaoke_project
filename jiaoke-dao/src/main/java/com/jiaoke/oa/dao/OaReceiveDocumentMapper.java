package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaReceiveDocument;
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
public interface OaReceiveDocumentMapper extends Mapper<OaReceiveDocument> {

    /**
     * 根据文件名称模糊查询
     *
     * @param documentName 发文名称
     * @return list
     */
    List<OaReceiveDocument> getSelectByName(@Param("documentName") String documentName);

    /**
     * 根据时间查询
     *
     * @param date date
     * @return list
     */
    List<OaReceiveDocument> getSelectByReceiveDate(Date date);

    /**
     * 查询所有数据
     *
     * @return list
     */
    List<OaReceiveDocument> selectAllData();


    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDelete(String[] ids);
}
