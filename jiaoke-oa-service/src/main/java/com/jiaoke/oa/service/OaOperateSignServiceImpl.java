package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaOperateDevelop;
import com.jiaoke.oa.bean.OaOperateSign;
import com.jiaoke.oa.dao.OaOperateDevelopMapper;
import com.jiaoke.oa.dao.OaOperateSignMapper;
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
public class OaOperateSignServiceImpl implements OaOperateSignService {

    @Resource
    private OaOperateSignMapper oaOperateSignMapper;

    @Override
    public List<OaOperateSign> selectAll() {
        List<OaOperateSign> oaOperateSignList = oaOperateSignMapper.selectAllData();
        for (OaOperateSign oaOperateSign : oaOperateSignList) {
            oaOperateSign.setSigningDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateSign.getSigningDate()));
        }
        return oaOperateSignList;
    }

    @Override
    public List<OaOperateSign> searchFilter(String purchaser) {
        List<OaOperateSign> oaOperateSignList = oaOperateSignMapper.searchFilter(purchaser);
        for (OaOperateSign oaOperateSign : oaOperateSignList) {
            oaOperateSign.setSigningDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateSign.getSigningDate()));
        }
        return oaOperateSignList;
    }

    @Override
    public int insertSelective(OaOperateSign oaOperateSign) {
        oaOperateSign.setSigningDate(DateUtil.stringConvertYYYYMMDD(oaOperateSign.getSigningDateStr()));
        oaOperateSign.setCreateDate(new Date());
        return oaOperateSignMapper.insertSelective(oaOperateSign);
    }

    @Override
    public OaOperateSign selectByPrimaryKey(Integer id) {
        OaOperateSign oaOperateSign = oaOperateSignMapper.selectByPrimaryKey(id);
        oaOperateSign.setSigningDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateSign.getSigningDate()));
        return oaOperateSign;
    }

    @Override
    public int updateByPrimaryKeySelective(OaOperateSign oaOperateSign) {
        oaOperateSign.setSigningDate(DateUtil.stringConvertYYYYMMDD(oaOperateSign.getSigningDateStr()));
        return oaOperateSignMapper.updateByPrimaryKeySelective(oaOperateSign);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaOperateSignMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int batchDelete(String[] ids) {
        return oaOperateSignMapper.batchDelete(ids);
    }
}
