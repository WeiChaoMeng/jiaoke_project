package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActDocument;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActDocumentMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * OA-公文
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/15 11:05
 */
@Service
public class OaActDocumentServiceImpl implements OaActDocumentService {

    @Resource
    private OaActDocumentMapper oaActDocumentMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Override
    public int insert(OaActDocument oaActDocument, Integer userId, String randomId, Integer state) {
        oaActDocument.setId(randomId);
        oaActDocument.setPromoter(userId);
        oaActDocument.setUrl("document");
        oaActDocument.setCreateTime(new Date());
        if (oaActDocumentMapper.insertSelective(oaActDocument) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActDocument.getTitle());
            oaCollaboration.setUrl("document");
            oaCollaboration.setTable("oa_act_document");
            oaCollaboration.setName("公文审批");
            oaCollaboration.setDataOne("标题:" + oaActDocument.getTitle());
            if (oaActDocument.getDocType() == 0) {
                oaCollaboration.setDataTwo("公文类型:公文");
            } else if (oaActDocument.getDocType() == 1) {
                oaCollaboration.setDataTwo("公文类型:会议纪要");
            } else if (oaActDocument.getDocType() == 2) {
                oaCollaboration.setDataTwo("公文类型:请示");
            } else if (oaActDocument.getDocType() == 3) {
                oaCollaboration.setDataTwo("公文类型:通知");
            } else if (oaActDocument.getDocType() == 4) {
                oaCollaboration.setDataTwo("公文类型:通告");
            } else {
                oaCollaboration.setDataOne("公文类型:函");
            }

            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActDocument oaActDocument) {
        oaActDocument.setCreateTime(new Date());
        if (oaActDocumentMapper.updateByPrimaryKey(oaActDocument) < 1) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActDocument.getId(), 1, oaActDocument.getTitle());
            return 1;
        }
    }

    @Override
    public OaActDocument selectByPrimaryKey(String id) {
        OaActDocument oaActDocument = oaActDocumentMapper.selectByPrimaryKey(id);
        oaActDocument.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActDocument.getCreateTime()));
        return oaActDocument;
    }

    @Override
    public int deleteData(String id) {
        return oaActDocumentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActDocument oaActDocument) {
        return oaActDocumentMapper.updateByPrimaryKeySelective(oaActDocument);
    }
}
