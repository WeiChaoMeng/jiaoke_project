package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaOperateOther;
import com.jiaoke.oa.dao.OaOperateOtherMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 经营报价档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaOperateOtherServiceImpl implements OaOperateOtherService {

    @Resource
    private OaOperateOtherMapper oaOperateOtherMapper;

    @Override
    public List<OaOperateOther> selectAll() {
        List<OaOperateOther> oaOperateOtherList = oaOperateOtherMapper.selectAllData();
        for (OaOperateOther oaOperateOther : oaOperateOtherList) {
            oaOperateOther.setReleaseDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateOther.getReleaseDate()));
        }
        return oaOperateOtherList;
    }

    @Override
    public List<OaOperateOther> searchFilter(String fileName) {
        List<OaOperateOther> oaOperateOtherList = oaOperateOtherMapper.searchFilter(fileName);
        for (OaOperateOther oaOperateOther : oaOperateOtherList) {
            oaOperateOther.setReleaseDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateOther.getReleaseDate()));
        }
        return oaOperateOtherList;
    }

    @Override
    public int insertSelective(OaOperateOther oaOperateOther) {
        oaOperateOther.setReleaseDate(DateUtil.stringConvertYYYYMMDD(oaOperateOther.getReleaseDateStr()));
        oaOperateOther.setCreateDate(new Date());
        return oaOperateOtherMapper.insertSelective(oaOperateOther);
    }

    @Override
    public OaOperateOther selectByPrimaryKey(Integer id) {
        OaOperateOther oaOperateOther = oaOperateOtherMapper.selectByPrimaryKey(id);
        oaOperateOther.setReleaseDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateOther.getReleaseDate()));
        return oaOperateOther;
    }

    @Override
    public int updateByPrimaryKeySelective(OaOperateOther oaOperateOther) {
        oaOperateOther.setReleaseDate(DateUtil.stringConvertYYYYMMDD(oaOperateOther.getReleaseDateStr()));
        return oaOperateOtherMapper.updateByPrimaryKeySelective(oaOperateOther);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaOperateOtherMapper.deleteByPrimaryKey(id);
    }
}
