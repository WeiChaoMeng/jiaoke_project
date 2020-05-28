package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaProductionOther;
import com.jiaoke.oa.dao.OaProductionOtherMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 生产管理部-其他
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaProductionOtherServiceImpl implements OaProductionOtherService {

    @Resource
    private OaProductionOtherMapper oaProductionOtherMapper;

    @Override
    public List<OaProductionOther> selectAll() {
        List<OaProductionOther> oaProductionOtherList = oaProductionOtherMapper.selectAllData();
        for (OaProductionOther oaProductionOther : oaProductionOtherList) {
            oaProductionOther.setDateStr(DateUtil.dateConvertYYYYMMDD(oaProductionOther.getDate()));
        }
        return oaProductionOtherList;
    }

    @Override
    public List<OaProductionOther> searchFilter(String name) {
        List<OaProductionOther> oaProductionOtherList = oaProductionOtherMapper.searchFilter(name);
        for (OaProductionOther oaProductionOther : oaProductionOtherList) {
            oaProductionOther.setDateStr(DateUtil.dateConvertYYYYMMDD(oaProductionOther.getDate()));
        }
        return oaProductionOtherList;
    }

    @Override
    public int insertSelective(OaProductionOther oaProductionOther) {
        oaProductionOther.setDate(DateUtil.stringConvertYYYYMMDD(oaProductionOther.getDateStr()));
        oaProductionOther.setCreateTime(new Date());
        return oaProductionOtherMapper.insertSelective(oaProductionOther);
    }

    @Override
    public OaProductionOther selectByPrimaryKey(Integer id) {
        OaProductionOther oaProductionOther = oaProductionOtherMapper.selectByPrimaryKey(id);
        oaProductionOther.setDateStr(DateUtil.dateConvertYYYYMMDD(oaProductionOther.getDate()));
        return oaProductionOther;
    }

    @Override
    public int updateByPrimaryKeySelective(OaProductionOther oaProductionOther) {
        oaProductionOther.setDate(DateUtil.stringConvertYYYYMMDD(oaProductionOther.getDateStr()));
        return oaProductionOtherMapper.updateByPrimaryKeySelective(oaProductionOther);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaProductionOtherMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int batchDelete(String[] ids) {
        return oaProductionOtherMapper.batchDelete(ids);
    }
}
