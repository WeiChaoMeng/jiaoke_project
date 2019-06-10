package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaNotice;
import com.jiaoke.oa.dao.OaNoticeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 公告
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
@Service
public class OaNoticeServiceImpl implements OaNoticeService {

    @Resource
    private OaNoticeMapper oaNoticeMapper;

    @Override
    public List<OaNotice> selectAllData() {
        List<OaNotice> oaNoticeList = oaNoticeMapper.selectAll();
        for (OaNotice oaNotice : oaNoticeList) {
            oaNotice.setReleaseDateStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaNotice.getReleaseDate()));
        }
        return oaNoticeList;
    }

    @Override
    public List<OaNotice> titleFilter(String title) {
        List<OaNotice> oaNoticeList = oaNoticeMapper.titleFilter(title);
        for (OaNotice oaNotice : oaNoticeList) {
            oaNotice.setReleaseDateStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaNotice.getReleaseDate()));
        }
        return oaNoticeList;
    }

    @Override
    public int insertSelective(OaNotice oaNotice) {
        oaNotice.setCreateTime(new Date());
        oaNotice.setReleaseDate(DateUtil.stringConvertYYYYMMDDHHMMSS(oaNotice.getReleaseDateStr()));
        return oaNoticeMapper.insertSelective(oaNotice);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaNoticeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public OaNotice selectByPrimaryKey(Integer id) {
        OaNotice oaNotice = oaNoticeMapper.selectByPrimaryKey(id);
        oaNotice.setReleaseDateStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaNotice.getReleaseDate()));
        return oaNotice;
    }

    @Override
    public List<OaNotice> homePageData() {
        List<OaNotice> oaNoticeList = oaNoticeMapper.homePageData();
        for (OaNotice oaNotice : oaNoticeList) {
            oaNotice.setReleaseDateStr(DateUtil.dateConvertYYYYMMDD(oaNotice.getReleaseDate()));
        }
        return oaNoticeList;
    }
}
