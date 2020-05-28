package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaReleaseDocument;
import com.jiaoke.oa.dao.OaReleaseDocumentMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * oa-综合办公室档案-公司发文
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 12:57
 */
@Service
public class OaReleaseDocumentServiceImpl implements OaReleaseDocumentService {

    @Resource
    private OaReleaseDocumentMapper oaReleaseDocumentMapper;

    /**
     * 新增
     *
     * @param oaReleaseDocument oaReleaseDocument
     * @return 影响行数
     */
    @Override
    public int insertSelective(OaReleaseDocument oaReleaseDocument) {
        oaReleaseDocument.setVisitDate(DateUtil.stringConvertYYYYMMDD(oaReleaseDocument.getVisitDateStr()));
        oaReleaseDocument.setCreateTime(new Date());
        return oaReleaseDocumentMapper.insertSelective(oaReleaseDocument);
    }

    /**
     * 查询全部
     *
     * @return list
     */
    @Override
    public List<OaReleaseDocument> selectAll() {
        List<OaReleaseDocument> oaReleaseDocumentList = oaReleaseDocumentMapper.selectAllData();
        for (OaReleaseDocument oaReleaseDocument : oaReleaseDocumentList) {
            oaReleaseDocument.setVisitDateStr(DateUtil.dateConvertYYYYMMDD(oaReleaseDocument.getVisitDate()));
        }
        return oaReleaseDocumentList;
    }

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaReleaseDocument
     */
    @Override
    public OaReleaseDocument selectByPrimaryKey(int id) {
        OaReleaseDocument oaReleaseDocument = oaReleaseDocumentMapper.selectByPrimaryKey(id);
        oaReleaseDocument.setVisitDateStr(DateUtil.dateConvertYYYYMMDD(oaReleaseDocument.getVisitDate()));
        return oaReleaseDocument;
    }

    /**
     * 根据文件类型筛选
     *
     * @param documentType 文件类型
     * @return list
     */
    @Override
    public List<OaReleaseDocument> select(int documentType) {
        //888代表全部
        int all = 888;
        List<OaReleaseDocument> releaseDocumentList;

        if (documentType == all) {
            releaseDocumentList = oaReleaseDocumentMapper.selectAll();
        } else {
            OaReleaseDocument oaReleaseDocument = new OaReleaseDocument();
            oaReleaseDocument.setDocumentType(documentType);
            releaseDocumentList = oaReleaseDocumentMapper.select(oaReleaseDocument);
        }
        for (OaReleaseDocument releaseDocument : releaseDocumentList) {
            releaseDocument.setVisitDateStr(DateUtil.dateConvertYYYYMMDD(releaseDocument.getVisitDate()));
        }
        return releaseDocumentList;
    }

    /**
     * 根据发文名称模糊查询
     *
     * @param documentName 发文名称
     * @return list
     */
    @Override
    public List<OaReleaseDocument> getSelectByName(String documentName) {
        List<OaReleaseDocument> releaseDocumentList = oaReleaseDocumentMapper.getSelectByName(documentName);
        for (OaReleaseDocument oaReleaseDocument : releaseDocumentList) {
            oaReleaseDocument.setVisitDateStr(DateUtil.dateConvertYYYYMMDD(oaReleaseDocument.getVisitDate()));
        }
        return releaseDocumentList;
    }

    /**
     * 根据访问日期查询
     *
     * @param visitDate 访问日期
     * @return list
     */
    @Override
    public List<OaReleaseDocument> getSelectByVisitDate(String visitDate) {
        Date date = DateUtil.stringConvertYYYYMMDD(visitDate);
        List<OaReleaseDocument> oaReleaseDocumentList = oaReleaseDocumentMapper.getSelectByVisitDate(date);
        for (OaReleaseDocument oaReleaseDocument : oaReleaseDocumentList) {
            oaReleaseDocument.setVisitDateStr(DateUtil.dateConvertYYYYMMDD(oaReleaseDocument.getVisitDate()));
        }
        return oaReleaseDocumentList;
    }

    /**
     * 选择性更新
     *
     * @param oaReleaseDocument oaReleaseDocument
     * @return 影响行数
     */
    @Override
    public int updateByPrimaryKeySelective(OaReleaseDocument oaReleaseDocument) {
        oaReleaseDocument.setVisitDate(DateUtil.stringConvertYYYYMMDD(oaReleaseDocument.getVisitDateStr()));
        return oaReleaseDocumentMapper.updateByPrimaryKeySelective(oaReleaseDocument);
    }

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    @Override
    public int delete(int id) {
        OaReleaseDocument oaReleaseDocument = new OaReleaseDocument();
        oaReleaseDocument.setId(id);
        return oaReleaseDocumentMapper.delete(oaReleaseDocument);
    }

    @Override
    public int batchDelete(String[] ids) {
        return oaReleaseDocumentMapper.batchDelete(ids);
    }
}
