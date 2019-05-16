package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaOperateMeeting;
import com.jiaoke.oa.dao.OaOperateMeetingMapper;
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
public class OaOperateMeetingServiceImpl implements OaOperateMeetingService {

    @Resource
    private OaOperateMeetingMapper oaOperateMeetingMapper;

    @Override
    public List<OaOperateMeeting> selectAll() {
        List<OaOperateMeeting> oaOperateMeetingList = oaOperateMeetingMapper.selectAllData();
        for (OaOperateMeeting oaOperateMeeting : oaOperateMeetingList) {
            oaOperateMeeting.setMeetingDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateMeeting.getMeetingDate()));
        }
        return oaOperateMeetingList;
    }

    @Override
    public List<OaOperateMeeting> searchFilter(String theme) {
        List<OaOperateMeeting> oaOperateMeetingList = oaOperateMeetingMapper.searchFilter(theme);
        for (OaOperateMeeting oaOperateMeeting : oaOperateMeetingList) {
            oaOperateMeeting.setMeetingDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateMeeting.getMeetingDate()));
        }
        return oaOperateMeetingList;
    }

    @Override
    public int insertSelective(OaOperateMeeting oaOperateMeeting) {
        oaOperateMeeting.setMeetingDate(DateUtil.stringConvertYYYYMMDD(oaOperateMeeting.getMeetingDateStr()));
        oaOperateMeeting.setCreateDate(new Date());
        return oaOperateMeetingMapper.insertSelective(oaOperateMeeting);
    }

    @Override
    public OaOperateMeeting selectByPrimaryKey(Integer id) {
        OaOperateMeeting oaOperateMeeting = oaOperateMeetingMapper.selectByPrimaryKey(id);
        oaOperateMeeting.setMeetingDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateMeeting.getMeetingDate()));
        return oaOperateMeeting;
    }

    @Override
    public int updateByPrimaryKeySelective(OaOperateMeeting oaOperateMeeting) {
        oaOperateMeeting.setMeetingDate(DateUtil.stringConvertYYYYMMDD(oaOperateMeeting.getMeetingDateStr()));
        return oaOperateMeetingMapper.updateByPrimaryKeySelective(oaOperateMeeting);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaOperateMeetingMapper.deleteByPrimaryKey(id);
    }
}
