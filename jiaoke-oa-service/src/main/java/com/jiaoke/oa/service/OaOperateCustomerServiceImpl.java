package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaOperateCustomer;
import com.jiaoke.oa.dao.OaOperateCustomerMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 经营开发档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaOperateCustomerServiceImpl implements OaOperateCustomerService {

    @Resource
    private OaOperateCustomerMapper oaOperateCustomerMapper;

    @Override
    public List<OaOperateCustomer> selectAll() {
        List<OaOperateCustomer> oaOperateCustomerList = oaOperateCustomerMapper.selectAllData();
        for (OaOperateCustomer oaOperateCustomer : oaOperateCustomerList) {
            oaOperateCustomer.setYearStr(DateUtil.dateConvertYYYY(oaOperateCustomer.getYear()));
        }
        return oaOperateCustomerList;
    }

    @Override
    public List<OaOperateCustomer> searchFilter(String projectName) {
        List<OaOperateCustomer> oaOperateCustomerList = oaOperateCustomerMapper.searchFilter(projectName);
        for (OaOperateCustomer oaOperateCustomer : oaOperateCustomerList) {
            oaOperateCustomer.setYearStr(DateUtil.dateConvertYYYY(oaOperateCustomer.getYear()));
        }
        return oaOperateCustomerList;
    }

    @Override
    public int insertSelective(OaOperateCustomer oaOperateCustomer) {
        oaOperateCustomer.setYear(DateUtil.stringConvertYYYY(oaOperateCustomer.getYearStr()));
        oaOperateCustomer.setCreateDate(new Date());
        return oaOperateCustomerMapper.insertSelective(oaOperateCustomer);
    }

    @Override
    public OaOperateCustomer selectByPrimaryKey(Integer id) {
        OaOperateCustomer oaOperateCustomer = oaOperateCustomerMapper.selectByPrimaryKey(id);
        oaOperateCustomer.setYearStr(DateUtil.dateConvertYYYY(oaOperateCustomer.getYear()));
        return oaOperateCustomer;
    }

    @Override
    public int updateByPrimaryKeySelective(OaOperateCustomer oaOperateCustomer) {
        oaOperateCustomer.setYear(DateUtil.stringConvertYYYY(oaOperateCustomer.getYearStr()));
        return oaOperateCustomerMapper.updateByPrimaryKeySelective(oaOperateCustomer);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaOperateCustomerMapper.deleteByPrimaryKey(id);
    }
}
