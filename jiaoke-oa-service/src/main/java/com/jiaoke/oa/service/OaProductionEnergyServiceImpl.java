package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaProductionEnergy;
import com.jiaoke.oa.dao.OaProductionEnergyMapper;
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
public class OaProductionEnergyServiceImpl implements OaProductionEnergyService {

    @Resource
    private OaProductionEnergyMapper oaProductionEnergyMapper;

    @Override
    public List<OaProductionEnergy> selectAll() {
        List<OaProductionEnergy> oaProductionEnergyList = oaProductionEnergyMapper.selectAllData();
        for (OaProductionEnergy oaProductionEnergy : oaProductionEnergyList) {
            oaProductionEnergy.setYearStr(DateUtil.dateConvertYYYY(oaProductionEnergy.getYear()));
        }
        return oaProductionEnergyList;
    }

    @Override
    public List<OaProductionEnergy> searchFilter(String yearStr) {
        List<OaProductionEnergy> oaProductionEnergyList = oaProductionEnergyMapper.searchFilter(yearStr);
        for (OaProductionEnergy oaProductionEnergy : oaProductionEnergyList) {
            oaProductionEnergy.setYearStr(DateUtil.dateConvertYYYY(oaProductionEnergy.getYear()));
        }
        return oaProductionEnergyList;
    }

    @Override
    public int insertSelective(OaProductionEnergy oaProductionEnergy) {
        oaProductionEnergy.setYear(DateUtil.stringConvertYYYY(oaProductionEnergy.getYearStr()));
        oaProductionEnergy.setCreateDate(new Date());
        return oaProductionEnergyMapper.insertSelective(oaProductionEnergy);
    }

    @Override
    public OaProductionEnergy selectByPrimaryKey(Integer id) {
        OaProductionEnergy oaProductionEnergy = oaProductionEnergyMapper.selectByPrimaryKey(id);
        oaProductionEnergy.setYearStr(DateUtil.dateConvertYYYY(oaProductionEnergy.getYear()));
        return oaProductionEnergy;
    }

    @Override
    public int updateByPrimaryKeySelective(OaProductionEnergy oaProductionEnergy) {
        oaProductionEnergy.setYear(DateUtil.stringConvertYYYY(oaProductionEnergy.getYearStr()));
        return oaProductionEnergyMapper.updateByPrimaryKeySelective(oaProductionEnergy);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaProductionEnergyMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int batchDelete(String[] ids) {
        return oaProductionEnergyMapper.batchDelete(ids);
    }
}
