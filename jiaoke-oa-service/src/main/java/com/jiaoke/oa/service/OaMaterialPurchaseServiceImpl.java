package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaMaterialPurchase;
import com.jiaoke.oa.dao.OaMaterialPurchaseMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 物资管理部-原材料采购合同
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaMaterialPurchaseServiceImpl implements OaMaterialPurchaseService {

    @Resource
    private OaMaterialPurchaseMapper oaMaterialPurchaseMapper;

    @Override
    public List<OaMaterialPurchase> selectAll() {
        List<OaMaterialPurchase> oaMaterialPurchaseList = oaMaterialPurchaseMapper.selectAllData();
        for (OaMaterialPurchase oaMaterialPurchase : oaMaterialPurchaseList) {
            oaMaterialPurchase.setSigningDateStr(DateUtil.dateConvertYYYYMMDD(oaMaterialPurchase.getSigningDate()));
        }
        return oaMaterialPurchaseList;
    }

    @Override
    public List<OaMaterialPurchase> searchFilter(String name) {
        List<OaMaterialPurchase> oaMaterialPurchaseList = oaMaterialPurchaseMapper.searchFilter(name);
        for (OaMaterialPurchase oaMaterialPurchase : oaMaterialPurchaseList) {
            oaMaterialPurchase.setSigningDateStr(DateUtil.dateConvertYYYYMMDD(oaMaterialPurchase.getSigningDate()));
        }
        return oaMaterialPurchaseList;
    }

    @Override
    public int insertSelective(OaMaterialPurchase oaMaterialPurchase) {
        oaMaterialPurchase.setSigningDate(DateUtil.stringConvertYYYYMMDD(oaMaterialPurchase.getSigningDateStr()));
        oaMaterialPurchase.setCreateDate(new Date());
        return oaMaterialPurchaseMapper.insertSelective(oaMaterialPurchase);
    }

    @Override
    public OaMaterialPurchase selectByPrimaryKey(Integer id) {
        OaMaterialPurchase oaMaterialPurchase = oaMaterialPurchaseMapper.selectByPrimaryKey(id);
        oaMaterialPurchase.setSigningDateStr(DateUtil.dateConvertYYYYMMDD(oaMaterialPurchase.getSigningDate()));
        return oaMaterialPurchase;
    }

    @Override
    public int updateByPrimaryKeySelective(OaMaterialPurchase oaMaterialPurchase) {
        oaMaterialPurchase.setSigningDate(DateUtil.stringConvertYYYYMMDD(oaMaterialPurchase.getSigningDateStr()));
        return oaMaterialPurchaseMapper.updateByPrimaryKeySelective(oaMaterialPurchase);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaMaterialPurchaseMapper.deleteByPrimaryKey(id);
    }
}
