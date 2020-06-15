package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActOvertime;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.bean.OaOvertimeStatistics;
import com.jiaoke.oa.dao.OaActOvertimeMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.OaOvertimeStatisticsMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 加班统计表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActOvertimeServiceImpl implements OaActOvertimeService {

    @Resource
    private OaActOvertimeMapper oaActOvertimeMapper;

    @Resource
    private OaOvertimeStatisticsMapper oaOvertimeStatisticsMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActOvertime oaActOvertime, Integer userId, String randomId, Integer state) {

        //加班统计数据表中插入外键id
        for (OaOvertimeStatistics statistics : oaActOvertime.getOaOvertimeStatisticsList()) {
            //加入外键ID
            statistics.setOvertimeId(randomId);
        }

        //批量插入加班统计数据
        if (oaOvertimeStatisticsMapper.batchInsertData(oaActOvertime.getOaOvertimeStatisticsList()) < 0) {
            return -1;
        }

        oaActOvertime.setId(randomId);
        oaActOvertime.setCreateTime(new Date());
        oaActOvertime.setPromoter(userId);
        oaActOvertime.setUrl("overtime");
        oaActOvertime.setState(0);
        if (oaActOvertimeMapper.insertSelective(oaActOvertime) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActOvertime.getTitle());
            oaCollaboration.setUrl("overtime");
            oaCollaboration.setTable("oa_act_overtime");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("加班统计表");
            oaCollaboration.setDataOne("部门:" + oaActOvertime.getDepartment());
            oaCollaboration.setDataTwo("日期:" + oaActOvertime.getStatisticalDate());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActOvertime oaActOvertime) {
        oaActOvertime.setState(0);
        oaActOvertime.setPrincipal("");
        oaActOvertime.setPrincipalDate("");
        oaActOvertime.setSupervisor("");
        oaActOvertime.setSupervisorDate("");
        oaActOvertime.setCreateTime(new Date());
        if (oaActOvertimeMapper.updateByPrimaryKeySelective(oaActOvertime) < 0) {
            return -1;
        } else {
            //删除加班统计表详情表关联数据
            oaOvertimeStatisticsMapper.deleteByOvertimeId(oaActOvertime.getId());
            //重新添加加班统计表详情表关联数据
            List<OaOvertimeStatistics> oaOvertimeStatisticsList = oaActOvertime.getOaOvertimeStatisticsList();
            for (OaOvertimeStatistics oaOvertimeStatistics : oaOvertimeStatisticsList) {
                oaOvertimeStatistics.setOvertimeId(oaActOvertime.getId());
            }
            oaOvertimeStatisticsMapper.batchInsertData(oaOvertimeStatisticsList);
            oaCollaborationMapper.updateStateByCorrelationId(oaActOvertime.getId(), 1, oaActOvertime.getTitle());
            return 1;
        }
    }

    @Override
    public OaActOvertime selectByPrimaryKey(String id) {
        OaActOvertime oaActOvertime = oaActOvertimeMapper.selectByPrimaryKey(id);
        List<OaOvertimeStatistics> oaOvertimeStatisticsList = oaOvertimeStatisticsMapper.selectByOvertimeId(id);
        oaActOvertime.setOaOvertimeStatisticsList(oaOvertimeStatisticsList);
        oaActOvertime.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActOvertime.getCreateTime()));
        oaActOvertime.setPromoterStr(userInfoMapper.getNicknameById(oaActOvertime.getPromoter()));
        return oaActOvertime;
    }


    @Override
    public int deleteData(String id) {
        //删除加班统计表-详情关联数据
        oaOvertimeStatisticsMapper.deleteByOvertimeId(id);
        return oaActOvertimeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActOvertime oaActOvertime) {
        return oaActOvertimeMapper.updateByPrimaryKeySelective(oaActOvertime);
    }
}
