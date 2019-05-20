package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaMaterialOther;
import com.jiaoke.oa.dao.OaMaterialOtherMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 物资管理部-其他
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaMaterialOtherServiceImpl implements OaMaterialOtherService {

    @Resource
    private OaMaterialOtherMapper oaMaterialOtherMapper;

    @Override
    public List<OaMaterialOther> selectAll() {
        List<OaMaterialOther> oaMaterialOtherList = oaMaterialOtherMapper.selectAllData();
        for (OaMaterialOther oaMaterialOther : oaMaterialOtherList) {
            oaMaterialOther.setDateStr(DateUtil.dateConvertYYYYMMDD(oaMaterialOther.getDate()));
        }
        return oaMaterialOtherList;
    }

    @Override
    public List<OaMaterialOther> searchFilter(String name) {
        List<OaMaterialOther> oaMaterialOtherList = oaMaterialOtherMapper.searchFilter(name);
        for (OaMaterialOther oaMaterialOther : oaMaterialOtherList) {
            oaMaterialOther.setDateStr(DateUtil.dateConvertYYYYMMDD(oaMaterialOther.getDate()));
        }
        return oaMaterialOtherList;
    }

    @Override
    public int insertSelective(OaMaterialOther oaMaterialOther) {
        oaMaterialOther.setDate(DateUtil.stringConvertYYYYMMDD(oaMaterialOther.getDateStr()));
        oaMaterialOther.setCreateTime(new Date());
        return oaMaterialOtherMapper.insertSelective(oaMaterialOther);
    }

    @Override
    public OaMaterialOther selectByPrimaryKey(Integer id) {
        OaMaterialOther oaMaterialOther = oaMaterialOtherMapper.selectByPrimaryKey(id);
        oaMaterialOther.setDateStr(DateUtil.dateConvertYYYYMMDD(oaMaterialOther.getDate()));
        return oaMaterialOther;
    }

    @Override
    public int updateByPrimaryKeySelective(OaMaterialOther oaMaterialOther) {
        oaMaterialOther.setDate(DateUtil.stringConvertYYYYMMDD(oaMaterialOther.getDateStr()));
        return oaMaterialOtherMapper.updateByPrimaryKeySelective(oaMaterialOther);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaMaterialOtherMapper.deleteByPrimaryKey(id);
    }
}
