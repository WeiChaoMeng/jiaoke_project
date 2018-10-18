package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaContractArchives;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * oa-档案-合同档案
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/18 13:30
 */
@Repository
public interface OaContractArchivesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaContractArchives record);

    /**
     * 选择性添加
     *
     * @param record oaContractArchives
     * @return NumberOfAffectedRows
     */
    int insertSelective(OaContractArchives record);

    /**
     * 根据id获取详情
     *
     * @param id id
     * @return oaContractArchives
     */
    OaContractArchives selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaContractArchives record);

    int updateByPrimaryKey(OaContractArchives record);

    /**
     * 获取所有
     *
     * @return oaContractArchivesList
     */
    List<OaContractArchives> getAll();
}