package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaFinanceBill;
import com.jiaoke.oa.dao.OaFinanceBillMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 财务管理部-票据
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaFinanceBillServiceImpl implements OaFinanceBillService {

    @Resource
    private OaFinanceBillMapper oaFinanceBillMapper;

    @Override
    public List<OaFinanceBill> selectAll() {
        List<OaFinanceBill> oaFinanceBillList = oaFinanceBillMapper.selectAllData();
        for (OaFinanceBill oaFinanceBill : oaFinanceBillList) {
            oaFinanceBill.setInvoiceDateStr(DateUtil.dateConvertYYYYMMDD(oaFinanceBill.getInvoiceDate()));
        }
        return oaFinanceBillList;
    }

    @Override
    public List<OaFinanceBill> searchFilter(String remarks) {
        List<OaFinanceBill> oaFinanceBillList = oaFinanceBillMapper.searchFilter(remarks);
        for (OaFinanceBill oaFinanceBill : oaFinanceBillList) {
            oaFinanceBill.setInvoiceDateStr(DateUtil.dateConvertYYYYMMDD(oaFinanceBill.getInvoiceDate()));
        }
        return oaFinanceBillList;
    }

    @Override
    public int insertSelective(OaFinanceBill oaFinanceBill) {
        oaFinanceBill.setInvoiceDate(DateUtil.stringConvertYYYYMMDD(oaFinanceBill.getInvoiceDateStr()));
        oaFinanceBill.setCreateDate(new Date());
        return oaFinanceBillMapper.insertSelective(oaFinanceBill);
    }

    @Override
    public OaFinanceBill selectByPrimaryKey(Integer id) {
        OaFinanceBill oaFinanceBill = oaFinanceBillMapper.selectByPrimaryKey(id);
        oaFinanceBill.setInvoiceDateStr(DateUtil.dateConvertYYYYMMDD(oaFinanceBill.getInvoiceDate()));
        return oaFinanceBill;
    }

    @Override
    public int updateByPrimaryKeySelective(OaFinanceBill oaFinanceBill) {
        oaFinanceBill.setInvoiceDate(DateUtil.stringConvertYYYYMMDD(oaFinanceBill.getInvoiceDateStr()));
        return oaFinanceBillMapper.updateByPrimaryKeySelective(oaFinanceBill);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaFinanceBillMapper.deleteByPrimaryKey(id);
    }
}
