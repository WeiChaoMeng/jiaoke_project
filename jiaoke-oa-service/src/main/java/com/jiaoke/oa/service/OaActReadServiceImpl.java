package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActRead;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActReadMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 收文阅办审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 3:36
 */
@Service
public class OaActReadServiceImpl implements OaActReadService {

    @Resource
    private OaActReadMapper oaActReadMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Override
    public int insert(OaActRead oaActRead, Integer userId, String randomId, Integer state) {
        oaActRead.setReceiptTime(DateUtil.stringConvertYYYYMMDD(oaActRead.getReceiptTimeStr()));
        oaActRead.setId(randomId);
        oaActRead.setCreateTime(new Date());
        oaActRead.setPromoter(userId);
        oaActRead.setUrl("read");
        if (oaActReadMapper.insertData(oaActRead) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActRead.getTitle());
            oaCollaboration.setUrl("read");
            oaCollaboration.setTable("oa_act_read");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActRead oaActRead) {
        oaActRead.setReceiptTime(DateUtil.stringConvertYYYYMMDD(oaActRead.getReceiptTimeStr()));
        oaActRead.setCreateTime(new Date());
        if (oaActReadMapper.updateByPrimaryKey(oaActRead) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActRead.getId(), 1, oaActRead.getTitle());
            return 1;
        }
    }

    @Override
    public OaActRead selectByPrimaryKey(String id) {
        OaActRead oaActRead = oaActReadMapper.selectByPrimaryKey(id);
        oaActRead.setReceiptTimeStr(DateUtil.dateConvertYYYYMMDD(oaActRead.getReceiptTime()));
        oaActRead.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActRead.getCreateTime()));
        return oaActRead;
    }

    @Override
    public int deleteData(String id) {
        return oaActReadMapper.deleteByPrimaryKey(id);
    }
}
