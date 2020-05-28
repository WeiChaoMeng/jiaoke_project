package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaProductionEnvironment;
import com.jiaoke.oa.dao.OaProductionEnvironmentMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 经营报价档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaProductionEnvironmentServiceImpl implements OaProductionEnvironmentService {

    @Resource
    private OaProductionEnvironmentMapper oaProductionEnvironmentMapper;

    @Override
    public List<OaProductionEnvironment> selectAll() {
        List<OaProductionEnvironment> oaProductionEnvironmentList = oaProductionEnvironmentMapper.selectAllData();
        for (OaProductionEnvironment oaProductionEnvironment : oaProductionEnvironmentList) {
            oaProductionEnvironment.setYearStr(DateUtil.dateConvertYYYY(oaProductionEnvironment.getYear()));
        }
        return oaProductionEnvironmentList;
    }

    @Override
    public List<OaProductionEnvironment> searchFilter(String projectName) {
        List<OaProductionEnvironment> oaProductionEnvironmentList = oaProductionEnvironmentMapper.searchFilter(projectName);
        for (OaProductionEnvironment oaProductionEnvironment : oaProductionEnvironmentList) {
            oaProductionEnvironment.setYearStr(DateUtil.dateConvertYYYY(oaProductionEnvironment.getYear()));
        }
        return oaProductionEnvironmentList;
    }

    @Override
    public int insertSelective(OaProductionEnvironment oaProductionEnvironment) {
        oaProductionEnvironment.setYear(DateUtil.stringConvertYYYY(oaProductionEnvironment.getYearStr()));
        oaProductionEnvironment.setCreateDate(new Date());
        return oaProductionEnvironmentMapper.insertSelective(oaProductionEnvironment);
    }

    @Override
    public OaProductionEnvironment selectByPrimaryKey(Integer id) {
        OaProductionEnvironment oaProductionEnvironment = oaProductionEnvironmentMapper.selectByPrimaryKey(id);
        oaProductionEnvironment.setYearStr(DateUtil.dateConvertYYYY(oaProductionEnvironment.getYear()));
        return oaProductionEnvironment;
    }

    @Override
    public int updateByPrimaryKeySelective(OaProductionEnvironment oaProductionEnvironment) {
        oaProductionEnvironment.setYear(DateUtil.stringConvertYYYYMMDD(oaProductionEnvironment.getYearStr()));
        return oaProductionEnvironmentMapper.updateByPrimaryKeySelective(oaProductionEnvironment);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaProductionEnvironmentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int batchDelete(String[] ids) {
        return oaProductionEnvironmentMapper.batchDelete(ids);
    }
}
