package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaFinanceOther;
import com.jiaoke.oa.dao.OaFinanceOtherMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 财务管理部-其它文件
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaFinanceOtherServiceImpl implements OaFinanceOtherService {

    @Resource
    private OaFinanceOtherMapper oaFinanceOtherMapper;

    @Override
    public List<OaFinanceOther> selectAll() {
        List<OaFinanceOther> oaFinanceOtherList = oaFinanceOtherMapper.selectAllData();
        for (OaFinanceOther oaFinanceOther : oaFinanceOtherList) {
            oaFinanceOther.setReleaseDateStr(DateUtil.dateConvertYYYYMMDD(oaFinanceOther.getReleaseDate()));
        }
        return oaFinanceOtherList;
    }

    @Override
    public List<OaFinanceOther> searchFilter(String name) {
        List<OaFinanceOther> oaFinanceOtherList = oaFinanceOtherMapper.searchFilter(name);
        for (OaFinanceOther oaFinanceOther : oaFinanceOtherList) {
            oaFinanceOther.setReleaseDateStr(DateUtil.dateConvertYYYYMMDD(oaFinanceOther.getReleaseDate()));
        }
        return oaFinanceOtherList;
    }

    @Override
    public int insertSelective(OaFinanceOther oaFinanceOther) {
        oaFinanceOther.setReleaseDate(DateUtil.stringConvertYYYYMMDD(oaFinanceOther.getReleaseDateStr()));
        oaFinanceOther.setCreateDate(new Date());
        return oaFinanceOtherMapper.insertSelective(oaFinanceOther);
    }

    @Override
    public OaFinanceOther selectByPrimaryKey(Integer id) {
        OaFinanceOther oaFinanceOther = oaFinanceOtherMapper.selectByPrimaryKey(id);
        oaFinanceOther.setReleaseDateStr(DateUtil.dateConvertYYYYMMDD(oaFinanceOther.getReleaseDate()));
        return oaFinanceOther;
    }

    @Override
    public int updateByPrimaryKeySelective(OaFinanceOther oaFinanceOther) {
        oaFinanceOther.setReleaseDate(DateUtil.stringConvertYYYYMMDD(oaFinanceOther.getReleaseDateStr()));
        return oaFinanceOtherMapper.updateByPrimaryKeySelective(oaFinanceOther);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaFinanceOtherMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int batchDelete(String[] ids) {
        return oaFinanceOtherMapper.batchDelete(ids);
    }
}
