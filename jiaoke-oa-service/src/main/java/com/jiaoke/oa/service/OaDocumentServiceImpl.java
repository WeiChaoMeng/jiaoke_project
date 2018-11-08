package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaDocument;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.dao.OaDocumentMapper;
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

    /**
     * 添加
     *
     * @param oaDocument oaDocument
     * @return NumberOfAffectedRows
     */
    public int add(OaDocument oaDocument) {

        //创建时间
        oaDocument.setCreateTime(new Date());

        //表单状态：0发送
        if (oaDocument.getFormState() == null) {
            oaDocument.setFormState(0);
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
    public List<OaDocument> getAllByFormState(Integer formState) {
        List<OaDocument> oaDocumentList = oaDocumentMapper.getAllByFormState(formState);
        for (OaDocument oaDocument : oaDocumentList) {
            oaDocument.setCreateTimeStr(getStringDate(oaDocument.getCreateTime()));
        }
        return oaDocumentList;
    }

    /**
     * 根据id获取列表
     *
     * @param id id
     * @return list
     */
    public OaDocument getAllById(Integer id) {
        OaDocument oaDocument = oaDocumentMapper.getAllById(id);
        oaDocument.setCreateTimeStr(getStringDate(oaDocument.getCreateTime()));
        return oaDocument;
    }

    /**
     * 根据表单状态获取总数
     *
     * @param formState formState
     * @return total
     */
    public int getTotalByFormState(Integer formState) {
        return oaDocumentMapper.getTotalByFormState(formState);
    }

    /**
     * 根据id获取公文详情
     *
     * @param id id
     * @return OaDocument
     */
    public OaDocument getDocumentDetailsById(Integer id) {
        OaDocument oaDocument = oaDocumentMapper.selectByPrimaryKey(id);
        oaDocument.setCreateTimeStr(getStringDate(oaDocument.getCreateTime()));
        return oaDocument;
    }

    /**
     * 根据表单状态分页查询
     *
     * @param formState 表单状态
     * @param page      页
     * @param rows      条数
     * @return OaDocumentList
     */
    public List<OaDocument> getPagingByFormState(Integer formState, Integer page, Integer rows) {
        Integer one = 1;
        Integer start = (page - one) * rows;
        List<OaDocument> oaDocumentList = oaDocumentMapper.getPagingByFormState(formState, start, rows);
        for (OaDocument oaDocument : oaDocumentList) {
            oaDocument.setCreateTimeStr(getStringDate(oaDocument.getCreateTime()));
        }
        return oaDocumentList;
    }

    /**
     * 更新会签
     *
     * @param id id
     * @return NumberOfAffectedRows
     */
    @Override
    public int updateCountersignature(int id) {
        Integer bossId = 1006;
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        if (bossId.equals(userInfo.getId())) {
            return oaDocumentMapper.updateSignatureIssuance(userInfo.getNickName(), id);
        } else {
            return oaDocumentMapper.updateCountersignature(userInfo.getNickName(), id);
        }
    }

    @Override
    public List<OaDocument> getListById(List<String> list) {
        List<OaDocument> oaDocumentList = new ArrayList<>();
        for (String s : list) {
            OaDocument oaDocument = oaDocumentMapper.getAllById(Integer.valueOf(s));
            oaDocument.setCreateTimeStr(getStringDate(oaDocument.getCreateTime()));
            oaDocumentList.add(oaDocument);
        }
        return oaDocumentList;
    }

    /**
     * 时间转换 date > string
     *
     * @param date date
     * @return string
     */
    private static String getStringDate(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return formatter.format(date);
    }
}
