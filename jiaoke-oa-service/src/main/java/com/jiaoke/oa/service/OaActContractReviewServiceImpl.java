package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActContractReview;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActContractReviewMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 合同评审表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:17
 */
@Service
public class OaActContractReviewServiceImpl implements OaActContractReviewService {

    @Resource
    private OaActContractReviewMapper oaActContractReviewMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActContractReview oaActContractReview, Integer userId, String randomId, Integer state) {
        oaActContractReview.setId(randomId);
        oaActContractReview.setCreateTime(new Date());
        oaActContractReview.setPromoter(userId);
        oaActContractReview.setUrl("contractReview");
        oaActContractReview.setState(0);
        if (oaActContractReviewMapper.insertSelective(oaActContractReview) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActContractReview.getTitle());
            oaCollaboration.setUrl("contractReview");
            oaCollaboration.setTable("oa_act_contract_review");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("合同评审表");
            oaCollaboration.setDataOne("合同名称:" + oaActContractReview.getContractName());
            oaCollaboration.setDataTwo("客户名称:" + oaActContractReview.getCustomerName());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActContractReview oaActContractReview) {
        oaActContractReview.setState(0);
        oaActContractReview.setMaterialPrincipal("");
        oaActContractReview.setMaterialPrincipalDate("");
        oaActContractReview.setMaterialPrincipalContent("");
        oaActContractReview.setFinancePrincipal("");
        oaActContractReview.setFinancePrincipalDate("");
        oaActContractReview.setFinancePrincipalContent("");
        oaActContractReview.setQualityPrincipal("");
        oaActContractReview.setQualityPrincipalDate("");
        oaActContractReview.setQualityPrincipalContent("");
        oaActContractReview.setOperatingPrincipal("");
        oaActContractReview.setOperatingPrincipalDate("");
        oaActContractReview.setOperatingPrincipalContent("");
        oaActContractReview.setLegalAffairs("");
        oaActContractReview.setLegalAffairsDate("");
        oaActContractReview.setLegalAffairsContent("");
        oaActContractReview.setCompanyPrincipal("");
        oaActContractReview.setCompanyPrincipalDate("");
        oaActContractReview.setCompanyPrincipalContent("");
        oaActContractReview.setCreateTime(new Date());
        if (oaActContractReviewMapper.updateByPrimaryKey(oaActContractReview) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActContractReview selectByPrimaryKey(String id) {
        OaActContractReview oaActContractReview = oaActContractReviewMapper.selectByPrimaryKey(id);
        oaActContractReview.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActContractReview.getCreateTime()));
        oaActContractReview.setPromoterStr(userInfoMapper.getNicknameById(oaActContractReview.getPromoter()));
        return oaActContractReview;
    }

    @Override
    public int deleteData(String id) {
        return oaActContractReviewMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActContractReview oaActContractReview) {
        return oaActContractReviewMapper.updateByPrimaryKeySelective(oaActContractReview);
    }
}
