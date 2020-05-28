package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaFinanceVoucher;
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
public class OaFinanceVoucherServiceImpl implements OaFinanceVoucherService {

    @Resource
    private OaFinanceVoucherMapper oaFinanceVoucherMapper;

    @Override
    public List<OaFinanceVoucher> selectAll() {
        List<OaFinanceVoucher> oaFinanceVoucherList = oaFinanceVoucherMapper.selectAllData();
        for (OaFinanceVoucher oaFinanceVoucher : oaFinanceVoucherList) {
            oaFinanceVoucher.setDateStr(DateUtil.dateConvertYYYYMMDD(oaFinanceVoucher.getDate()));
        }
        return oaFinanceVoucherList;
    }

    @Override
    public List<OaFinanceVoucher> searchFilter(String remarks) {
        List<OaFinanceVoucher> oaFinanceVoucherList = oaFinanceVoucherMapper.searchFilter(remarks);
        for (OaFinanceVoucher oaFinanceVoucher : oaFinanceVoucherList) {
            oaFinanceVoucher.setDateStr(DateUtil.dateConvertYYYYMMDD(oaFinanceVoucher.getDate()));
        }
        return oaFinanceVoucherList;
    }

    @Override
    public int insertSelective(OaFinanceVoucher oaFinanceVoucher) {
        oaFinanceVoucher.setDate(DateUtil.stringConvertYYYYMMDD(oaFinanceVoucher.getDateStr()));
        oaFinanceVoucher.setCreateDate(new Date());
        return oaFinanceVoucherMapper.insertSelective(oaFinanceVoucher);
    }

    @Override
    public OaFinanceVoucher selectByPrimaryKey(Integer id) {
        OaFinanceVoucher oaFinanceVoucher = oaFinanceVoucherMapper.selectByPrimaryKey(id);
        oaFinanceVoucher.setDateStr(DateUtil.dateConvertYYYYMMDD(oaFinanceVoucher.getDate()));
        return oaFinanceVoucher;
    }

    @Override
    public int updateByPrimaryKeySelective(OaFinanceVoucher oaFinanceVoucher) {
        oaFinanceVoucher.setDate(DateUtil.stringConvertYYYYMMDD(oaFinanceVoucher.getDateStr()));
        return oaFinanceVoucherMapper.updateByPrimaryKeySelective(oaFinanceVoucher);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaFinanceVoucherMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int batchDelete(String[] ids) {
        return oaFinanceVoucherMapper.batchDelete(ids);
    }
}
