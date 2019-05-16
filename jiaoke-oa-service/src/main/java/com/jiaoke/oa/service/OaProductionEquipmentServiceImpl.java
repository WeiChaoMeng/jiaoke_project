package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaProductionEquipment;
import com.jiaoke.oa.dao.OaProductionEquipmentMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 生产管理部-设备档案技术资料
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaProductionEquipmentServiceImpl implements OaProductionEquipmentService {

    @Resource
    private OaProductionEquipmentMapper oaProductionEquipmentMapper;

    @Override
    public List<OaProductionEquipment> selectAll() {
        List<OaProductionEquipment> oaProductionEquipmentList = oaProductionEquipmentMapper.selectAllData();
        for (OaProductionEquipment oaProductionEquipment : oaProductionEquipmentList) {
            oaProductionEquipment.setYearStr(DateUtil.dateConvertYYYY(oaProductionEquipment.getYear()));
            oaProductionEquipment.setBuyDateStr(DateUtil.dateConvertYYYYMMDD(oaProductionEquipment.getBuyDate()));
        }
        return oaProductionEquipmentList;
    }

    @Override
    public List<OaProductionEquipment> searchFilter(String deviceName) {
        List<OaProductionEquipment> oaProductionEquipmentList = oaProductionEquipmentMapper.searchFilter(deviceName);
        for (OaProductionEquipment oaProductionEquipment : oaProductionEquipmentList) {
            oaProductionEquipment.setYearStr(DateUtil.dateConvertYYYY(oaProductionEquipment.getYear()));
            oaProductionEquipment.setBuyDateStr(DateUtil.dateConvertYYYYMMDD(oaProductionEquipment.getBuyDate()));
        }
        return oaProductionEquipmentList;
    }

    @Override
    public int insertSelective(OaProductionEquipment oaProductionEquipment) {
        oaProductionEquipment.setYear(DateUtil.stringConvertYYYY(oaProductionEquipment.getYearStr()));
        oaProductionEquipment.setBuyDate(DateUtil.stringConvertYYYYMMDD(oaProductionEquipment.getBuyDateStr()));
        oaProductionEquipment.setCreateDate(new Date());
        return oaProductionEquipmentMapper.insertSelective(oaProductionEquipment);
    }

    @Override
    public OaProductionEquipment selectByPrimaryKey(Integer id) {
        OaProductionEquipment oaProductionEquipment = oaProductionEquipmentMapper.selectByPrimaryKey(id);
        oaProductionEquipment.setYearStr(DateUtil.dateConvertYYYY(oaProductionEquipment.getYear()));
        oaProductionEquipment.setBuyDateStr(DateUtil.dateConvertYYYYMMDD(oaProductionEquipment.getBuyDate()));
        return oaProductionEquipment;
    }

    @Override
    public int updateByPrimaryKeySelective(OaProductionEquipment oaProductionEquipment) {
        oaProductionEquipment.setYear(DateUtil.stringConvertYYYY(oaProductionEquipment.getYearStr()));
        oaProductionEquipment.setBuyDate(DateUtil.stringConvertYYYYMMDD(oaProductionEquipment.getBuyDateStr()));
        return oaProductionEquipmentMapper.updateByPrimaryKeySelective(oaProductionEquipment);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaProductionEquipmentMapper.deleteByPrimaryKey(id);
    }
}
