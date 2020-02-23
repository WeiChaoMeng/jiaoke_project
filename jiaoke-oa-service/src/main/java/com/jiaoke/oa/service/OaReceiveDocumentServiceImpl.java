package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaReceiveDocument;
import com.jiaoke.oa.bean.OaReleaseDocument;
import com.jiaoke.oa.dao.OaReceiveDocumentMapper;
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
public class OaReceiveDocumentServiceImpl implements OaReceiveDocumentService {

    @Resource
    private OaReceiveDocumentMapper oaReceiveDocumentMapper;

    /**
     * 新增
     *
     * @param oaReceiveDocument oaReceiveDocument
     * @return 影响行数
     */
    @Override
    public int insertSelective(OaReceiveDocument oaReceiveDocument) {
        oaReceiveDocument.setReceiveDate(DateUtil.stringConvertYYYYMMDD(oaReceiveDocument.getReceiveDateStr()));
        oaReceiveDocument.setCreateTime(new Date());
        return oaReceiveDocumentMapper.insertSelective(oaReceiveDocument);
    }

    /**
     * 查询全部
     *
     * @return list
     */
    @Override
    public List<OaReceiveDocument> selectAll() {
        List<OaReceiveDocument> oaReceiveDocumentList = oaReceiveDocumentMapper.selectAllData();
        for (OaReceiveDocument oaReceiveDocument : oaReceiveDocumentList) {
            oaReceiveDocument.setReceiveDateStr(DateUtil.dateConvertYYYYMMDD(oaReceiveDocument.getReceiveDate()));
        }
        return oaReceiveDocumentList;
    }

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaReleaseDocument
     */
    @Override
    public OaReceiveDocument selectByPrimaryKey(int id) {
        OaReceiveDocument oaReceiveDocument = oaReceiveDocumentMapper.selectByPrimaryKey(id);
        oaReceiveDocument.setReceiveDateStr(DateUtil.dateConvertYYYYMMDD(oaReceiveDocument.getReceiveDate()));
        return oaReceiveDocument;
    }

    /**
     * 根据文件类型筛选
     *
     * @param publishingDepartment 发文部室
     * @return list
     */
    @Override
    public List<OaReceiveDocument> select(int publishingDepartment) {
        //888代表全部
        int all = 888;
        List<OaReceiveDocument> receiveDocumentList;

        if (publishingDepartment == all) {
            receiveDocumentList = oaReceiveDocumentMapper.selectAll();
        } else {
            OaReceiveDocument oaReceiveDocument = new OaReceiveDocument();
            oaReceiveDocument.setPublishingDepartment(publishingDepartment);
            receiveDocumentList = oaReceiveDocumentMapper.select(oaReceiveDocument);
        }
        for (OaReceiveDocument oaReceiveDocument : receiveDocumentList) {
            oaReceiveDocument.setReceiveDateStr(DateUtil.dateConvertYYYYMMDD(oaReceiveDocument.getReceiveDate()));
        }
        return receiveDocumentList;
    }

    /**
     * 根据发文名称模糊查询
     *
     * @param documentName 发文名称
     * @return list
     */
    @Override
    public List<OaReceiveDocument> getSelectByName(String documentName) {
        List<OaReceiveDocument> oaReceiveDocumentList = oaReceiveDocumentMapper.getSelectByName(documentName);
        for (OaReceiveDocument oaReceiveDocument : oaReceiveDocumentList) {
            oaReceiveDocument.setReceiveDateStr(DateUtil.dateConvertYYYYMMDD(oaReceiveDocument.getReceiveDate()));
        }
        return oaReceiveDocumentList;
    }

    /**
     * 根据访问日期查询
     *
     * @param receiveDate 收文日期
     * @return list
     */
    @Override
    public List<OaReceiveDocument> getSelectByReceiveDate(String receiveDate) {
        Date date = DateUtil.stringConvertYYYYMMDD(receiveDate);
        List<OaReceiveDocument> oaReceiveDocumentList = oaReceiveDocumentMapper.getSelectByReceiveDate(date);
        for (OaReceiveDocument oaReceiveDocument : oaReceiveDocumentList) {
            oaReceiveDocument.setReceiveDateStr(DateUtil.dateConvertYYYYMMDD(oaReceiveDocument.getReceiveDate()));
        }
        return oaReceiveDocumentList;
    }

    /**
     * 选择性更新
     *
     * @param oaReceiveDocument oaReceiveDocument
     * @return 影响行数
     */
    @Override
    public int updateByPrimaryKeySelective(OaReceiveDocument oaReceiveDocument) {
        oaReceiveDocument.setReceiveDate(DateUtil.stringConvertYYYYMMDD(oaReceiveDocument.getReceiveDateStr()));
        return oaReceiveDocumentMapper.updateByPrimaryKeySelective(oaReceiveDocument);
    }

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    @Override
    public int delete(int id) {
        OaReceiveDocument oaReceiveDocument = new OaReceiveDocument();
        oaReceiveDocument.setId(id);
        return oaReceiveDocumentMapper.delete(oaReceiveDocument);
    }
}
