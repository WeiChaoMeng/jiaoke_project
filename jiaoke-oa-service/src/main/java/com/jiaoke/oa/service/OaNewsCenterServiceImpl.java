package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaNewsCenter;
import com.jiaoke.oa.dao.OaNewsCenterMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * oa-资产管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Service
public class OaNewsCenterServiceImpl implements OaNewsCenterService {

    @Resource
    private OaNewsCenterMapper oaNewsCenterMapper;

    @Override
    public int insertSelective(OaNewsCenter oaNewsCenter) {
        oaNewsCenter.setReleaseDate(new Date());
        return oaNewsCenterMapper.insertSelective(oaNewsCenter);
    }

    @Override
    public List<OaNewsCenter> selectAll() {
        List<OaNewsCenter> oaNewsCenterList = oaNewsCenterMapper.selectAllData();
        for (OaNewsCenter oaNewsCenter : oaNewsCenterList) {
            oaNewsCenter.setReleaseDateStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaNewsCenter.getReleaseDate()));
        }
        return oaNewsCenterList;
    }

    @Override
    public OaNewsCenter selectByPrimaryKey(Integer id) {
        OaNewsCenter oaNewsCenter = oaNewsCenterMapper.selectByPrimaryKey(id);
        oaNewsCenter.setReleaseDateStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaNewsCenter.getReleaseDate()));
        return oaNewsCenter;
    }

    @Override
    public List<OaNewsCenter> selectLatestData() {
        List<OaNewsCenter> oaNewsCenterList = oaNewsCenterMapper.selectLatestData();
        for (OaNewsCenter oaNewsCenter : oaNewsCenterList) {
            oaNewsCenter.setReleaseDateStr(DateUtil.dateConvertYYYYMMDDHHMM(oaNewsCenter.getReleaseDate()));
        }
        return oaNewsCenterList;
    }

    @Override
    public List<OaNewsCenter> homePageData() {
        List<OaNewsCenter> oaNewsCenterList = oaNewsCenterMapper.homePageData();
        for (OaNewsCenter oaNewsCenter : oaNewsCenterList) {
            oaNewsCenter.setReleaseDateStr(DateUtil.dateConvertYYYYMMDD(oaNewsCenter.getReleaseDate()));
        }
        return oaNewsCenterList;
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaNewsCenterMapper.deleteByPrimaryKey(id);
    }
}
