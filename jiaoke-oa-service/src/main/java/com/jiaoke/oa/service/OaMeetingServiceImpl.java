package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaMeeting;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.dao.OaMeetingMapper;
import org.activiti.engine.impl.util.Activiti5Util;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 会议
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaMeetingServiceImpl implements OaMeetingService {

    @Resource
    private OaMeetingMapper oaMeetingMapper;

    @Override
    public int insertSelective(OaMeeting oaMeeting) {
        //获取当前登录人
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        oaMeeting.setPromoter(userInfo.getNickname());
        oaMeeting.setStartTime(DateUtil.stringConvertYYYYMMDDHHMM(oaMeeting.getStartTimeStr()));
        oaMeeting.setEndTime(DateUtil.stringConvertYYYYMMDDHHMM(oaMeeting.getEndTimeStr()));
        oaMeeting.setCreateTime(new Date());
        return oaMeetingMapper.insertData(oaMeeting);
    }

    @Override
    public List<OaMeeting> selectByBusinessId(List<Integer> ids) {
        List<OaMeeting> oaMeetingList = oaMeetingMapper.selectByBusinessId(ids);
        for (OaMeeting oaMeeting : oaMeetingList) {
            oaMeeting.setStartTimeStr(DateUtil.dateConvertYYYYMMDDHHMM(oaMeeting.getStartTime()));
            oaMeeting.setEndTimeStr(DateUtil.dateConvertYYYYMMDDHHMM(oaMeeting.getEndTime()));
        }
        return oaMeetingList;
    }

    @Override
    public List<OaMeeting> selectHistoricMeeting(List<Integer> ids, Map<String, String> map) {
        List<OaMeeting> oaMeetingList = oaMeetingMapper.selectByBusinessId(ids);
        for (Map.Entry<String, String> entry : map.entrySet()) {
            for (OaMeeting oaMeeting : oaMeetingList) {
                if (oaMeeting.getId().equals(Integer.parseInt(entry.getKey()))) {
                    oaMeeting.setProcessInstanceId(entry.getValue());
                    oaMeeting.setStartTimeStr(DateUtil.dateConvertYYYYMMDDHHMM(oaMeeting.getStartTime()));
                    oaMeeting.setEndTimeStr(DateUtil.dateConvertYYYYMMDDHHMM(oaMeeting.getEndTime()));
                }
            }
        }
        return oaMeetingList;
    }

    @Override
    public OaMeeting selectByPrimaryKey(Integer id) {
        OaMeeting oaMeeting = oaMeetingMapper.selectByPrimaryKey(id);
        oaMeeting.setStartTimeStr(DateUtil.dateConvertYYYYMMDDHHMM(oaMeeting.getStartTime()));
        oaMeeting.setEndTimeStr(DateUtil.dateConvertYYYYMMDDHHMM(oaMeeting.getEndTime()));
        return oaMeeting;
    }
}
