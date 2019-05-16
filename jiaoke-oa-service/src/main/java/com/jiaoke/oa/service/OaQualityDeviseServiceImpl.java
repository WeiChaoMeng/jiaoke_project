package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaQualityDevise;
import com.jiaoke.oa.dao.OaQualityDeviseMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 质量技术部-设计文件
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaQualityDeviseServiceImpl implements OaQualityDeviseService {

    @Resource
    private OaQualityDeviseMapper oaQualityDeviseMapper;

    @Override
    public List<OaQualityDevise> selectAll() {
        List<OaQualityDevise> oaQualityDeviseList = oaQualityDeviseMapper.selectAllData();
        for (OaQualityDevise oaQualityDevise : oaQualityDeviseList) {
            oaQualityDevise.setVersionDateStr(DateUtil.dateConvertYYYYMMDD(oaQualityDevise.getVersionDate()));
        }
        return oaQualityDeviseList;
    }

    @Override
    public List<OaQualityDevise> searchFilter(String remarks) {
        List<OaQualityDevise> oaQualityDeviseList = oaQualityDeviseMapper.searchFilter(remarks);
        for (OaQualityDevise oaQualityDevise : oaQualityDeviseList) {
            oaQualityDevise.setVersionDateStr(DateUtil.dateConvertYYYYMMDD(oaQualityDevise.getVersionDate()));
        }
        return oaQualityDeviseList;
    }

    @Override
    public int insertSelective(OaQualityDevise oaQualityDevise) {
        oaQualityDevise.setVersionDate(DateUtil.stringConvertYYYYMMDD(oaQualityDevise.getVersionDateStr()));
        oaQualityDevise.setCreateDate(new Date());
        return oaQualityDeviseMapper.insertSelective(oaQualityDevise);
    }

    @Override
    public OaQualityDevise selectByPrimaryKey(Integer id) {
        OaQualityDevise oaQualityDevise = oaQualityDeviseMapper.selectByPrimaryKey(id);
        oaQualityDevise.setVersionDateStr(DateUtil.dateConvertYYYYMMDD(oaQualityDevise.getVersionDate()));
        return oaQualityDevise;
    }

    @Override
    public int updateByPrimaryKeySelective(OaQualityDevise oaQualityDevise) {
        oaQualityDevise.setVersionDate(DateUtil.stringConvertYYYYMMDD(oaQualityDevise.getVersionDateStr()));
        return oaQualityDeviseMapper.updateByPrimaryKeySelective(oaQualityDevise);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaQualityDeviseMapper.deleteByPrimaryKey(id);
    }
}
