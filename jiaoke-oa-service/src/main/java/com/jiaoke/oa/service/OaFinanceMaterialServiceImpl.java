package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaFinanceMaterial;
import com.jiaoke.oa.bean.OaFinanceVoucher;
import com.jiaoke.oa.dao.OaFinanceMaterialMapper;
import com.jiaoke.oa.dao.OaFinanceVoucherMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 财务管理部-凭证
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaFinanceMaterialServiceImpl implements OaFinanceMaterialService {

    @Resource
    private OaFinanceMaterialMapper oaFinanceMaterialMapper;

    @Override
    public List<OaFinanceMaterial> selectAll() {
        List<OaFinanceMaterial> oaFinanceMaterialList = oaFinanceMaterialMapper.selectAllData();
        for (OaFinanceMaterial oaFinanceMaterial : oaFinanceMaterialList) {
            oaFinanceMaterial.setDateStr(DateUtil.dateConvertYYYYMMDD(oaFinanceMaterial.getDate()));
        }
        return oaFinanceMaterialList;
    }

    @Override
    public List<OaFinanceMaterial> searchFilter(String remarks) {
        List<OaFinanceMaterial> oaFinanceMaterialList = oaFinanceMaterialMapper.searchFilter(remarks);
        for (OaFinanceMaterial oaFinanceMaterial : oaFinanceMaterialList) {
            oaFinanceMaterial.setDateStr(DateUtil.dateConvertYYYYMMDD(oaFinanceMaterial.getDate()));
        }
        return oaFinanceMaterialList;
    }

    @Override
    public int insertSelective(OaFinanceMaterial oaFinanceMaterial) {
        oaFinanceMaterial.setDate(DateUtil.stringConvertYYYYMMDD(oaFinanceMaterial.getDateStr()));
        oaFinanceMaterial.setCreateDate(new Date());
        return oaFinanceMaterialMapper.insertSelective(oaFinanceMaterial);
    }

    @Override
    public OaFinanceMaterial selectByPrimaryKey(Integer id) {
        OaFinanceMaterial oaFinanceMaterial = oaFinanceMaterialMapper.selectByPrimaryKey(id);
        oaFinanceMaterial.setDateStr(DateUtil.dateConvertYYYYMMDD(oaFinanceMaterial.getDate()));
        return oaFinanceMaterial;
    }

    @Override
    public int updateByPrimaryKeySelective(OaFinanceMaterial oaFinanceMaterial) {
        oaFinanceMaterial.setDate(DateUtil.stringConvertYYYYMMDD(oaFinanceMaterial.getDateStr()));
        return oaFinanceMaterialMapper.updateByPrimaryKeySelective(oaFinanceMaterial);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaFinanceMaterialMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int batchDelete(String[] ids) {
        return oaFinanceMaterialMapper.batchDelete(ids);
    }
}
