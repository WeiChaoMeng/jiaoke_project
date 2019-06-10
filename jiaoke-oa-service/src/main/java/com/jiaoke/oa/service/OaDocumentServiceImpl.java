package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaDocument;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.dao.OaDocumentMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * OA-公文
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/15 11:05
 */
@Service
public class OaDocumentServiceImpl implements OaDocumentService {

    @Resource
    private OaDocumentMapper oaDocumentMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    /**
     * 添加
     *
     * @param oaDocument oaDocument
     * @return NumberOfAffectedRows
     */
    @Override
    public int add(OaDocument oaDocument) {

        //创建时间
        oaDocument.setCreateTime(new Date());

        //表单状态：0发送
        if (oaDocument.getFormState() == null) {
            oaDocument.setFormState(1);
        }

        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        oaDocument.setUserInfoId(userInfo.getId().toString());

        return oaDocumentMapper.insertSelective(oaDocument);
    }

    /**
     * 根据表单状态获取列表
     *
     * @param formState formState
     * @return list
     */
    @Override
    public List<OaDocument> getAllByFormState(Integer formState) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        List<OaDocument> oaDocumentList = oaDocumentMapper.getAllByFormState(formState, String.valueOf(userInfo.getId()));
        for (OaDocument oaDocument : oaDocumentList) {
            oaDocument.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaDocument.getCreateTime()));
        }
        return oaDocumentList;
    }

    @Override
    public List<OaDocument> textTitleFilter(String textTitle, int formState) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        List<OaDocument> oaDocumentList = oaDocumentMapper.textTitleFilter(textTitle, formState, String.valueOf(userInfo.getId()));
        for (OaDocument oaDocument : oaDocumentList) {
            oaDocument.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaDocument.getCreateTime()));
        }
        return oaDocumentList;
    }

    /**
     * 根据id获取
     *
     * @param id id
     * @return list
     */
    @Override
    public OaDocument getAllById(Integer id) {
        OaDocument oaDocument = oaDocumentMapper.getAllById(id);
        oaDocument.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaDocument.getCreateTime()));
        return oaDocument;
    }

    /**
     * 根据id获取公文详情
     *
     * @param id id
     * @return OaDocument
     */
    @Override
    public OaDocument getDocumentDetailsById(Integer id) {
        OaDocument oaDocument = oaDocumentMapper.selectByPrimaryKey(id);
        oaDocument.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaDocument.getCreateTime()));
        return oaDocument;
    }

    /**
     * 更新会签
     *
     * @param id id
     * @return NumberOfAffectedRows
     */
    @Override
    public int updateCountersignature(int id, String draftedPerson) {
        Integer bossId = 1006;
        //当前用户id
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        //部门负责人id
        Integer userInfoId = userInfoMapper.getIdByNickName(draftedPerson);
        if (userInfo.getId().equals(bossId)) {
            if (userInfo.getId().equals(userInfoId)) {
                return oaDocumentMapper.updateSignatureIssuanceAndReviewer(userInfo.getNickname(), id);
            } else {
                return oaDocumentMapper.updateSignatureIssuance(userInfo.getNickname(), id);
            }
        } else {
            if (userInfo.getId().equals(userInfoId)) {
                return oaDocumentMapper.updateCountersignatureAndReviewer(userInfo.getNickname(), id);
            } else {
                return oaDocumentMapper.updateCountersignature(userInfo.getNickname(), id);
            }
        }
    }

    @Override
    public List<OaDocument> getListById(List<String> list) {
        List<OaDocument> oaDocumentList = new ArrayList<>();
        for (String s : list) {
            OaDocument oaDocument = oaDocumentMapper.getAllById(Integer.valueOf(s));
            oaDocument.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaDocument.getCreateTime()));
            oaDocumentList.add(oaDocument);
        }
        return oaDocumentList;
    }

    @Override
    public int edit(OaDocument oaDocument) {
        return oaDocumentMapper.updateByPrimaryKeySelective(oaDocument);
    }

    @Override
    public int deleteById(int id) {
        return oaDocumentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updatePendingDocument(OaDocument oaDocument) {
        return oaDocumentMapper.updateByPrimaryKeySelective(oaDocument);
    }

    @Override
    public List<OaDocument> selectByBusinessId(List<Integer> ids, String textTitle) {
        List<OaDocument> oaDocumentList = oaDocumentMapper.selectByBusinessId(ids, textTitle);
        for (OaDocument oaDocument : oaDocumentList) {
            oaDocument.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaDocument.getCreateTime()));
        }
        return oaDocumentList;
    }
}
