package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaFinanceConfirm;
import com.jiaoke.oa.dao.OaFinanceConfirmMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 财务管理部-确认
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaFinanceConfirmServiceImpl implements OaFinanceConfirmService {

    @Resource
    private OaFinanceConfirmMapper oaFinanceConfirmMapper;

    @Override
    public List<OaFinanceConfirm> selectAll() {
        return oaFinanceConfirmMapper.selectAllData();
    }

    @Override
    public List<OaFinanceConfirm> searchFilter(String name) {
        return oaFinanceConfirmMapper.searchFilter(name);
    }

    @Override
    public int insertSelective(OaFinanceConfirm oaFinanceConfirm) {
        oaFinanceConfirm.setCreateDate(new Date());
        return oaFinanceConfirmMapper.insertSelective(oaFinanceConfirm);
    }

    @Override
    public OaFinanceConfirm selectByPrimaryKey(Integer id) {
        return oaFinanceConfirmMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaFinanceConfirm oaFinanceConfirm) {
        return oaFinanceConfirmMapper.updateByPrimaryKeySelective(oaFinanceConfirm);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaFinanceConfirmMapper.deleteByPrimaryKey(id);
    }
}
