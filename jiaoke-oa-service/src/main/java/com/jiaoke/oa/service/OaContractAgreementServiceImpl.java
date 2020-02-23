package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaContractAgreement;
import com.jiaoke.oa.dao.OaContractAgreementMapper;
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
public class OaContractAgreementServiceImpl implements OaContractAgreementService {

    @Resource
    private OaContractAgreementMapper oaContractAgreementMapper;

    /**
     * 新增
     *
     * @param oaContractAgreement oaContractAgreement
     * @return 影响行数
     */
    @Override
    public int insertSelective(OaContractAgreement oaContractAgreement) {
        oaContractAgreement.setDate(DateUtil.stringConvertYYYYMMDD(oaContractAgreement.getDateStr()));
        oaContractAgreement.setCreateTime(new Date());
        return oaContractAgreementMapper.insertSelective(oaContractAgreement);
    }

    /**
     * 查询全部
     *
     * @return list
     */
    @Override
    public List<OaContractAgreement> selectAll() {
        List<OaContractAgreement> oaContractAgreementList = oaContractAgreementMapper.selectAllData();
        for (OaContractAgreement oaContractAgreement : oaContractAgreementList) {
            oaContractAgreement.setDateStr(DateUtil.dateConvertYYYYMMDD(oaContractAgreement.getDate()));
        }
        return oaContractAgreementList;
    }

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaReleaseDocument
     */
    @Override
    public OaContractAgreement selectByPrimaryKey(int id) {
        OaContractAgreement oaContractAgreement = oaContractAgreementMapper.selectByPrimaryKey(id);
        oaContractAgreement.setDateStr(DateUtil.dateConvertYYYYMMDD(oaContractAgreement.getDate()));
        return oaContractAgreement;
    }

    /**
     * 根据文件类型筛选
     *
     * @param type 文件类型
     * @return list
     */
    @Override
    public List<OaContractAgreement> select(int type) {
        //888代表全部
        int all = 888;
        List<OaContractAgreement> oaContractAgreementList;

        if (type == all) {
            oaContractAgreementList = oaContractAgreementMapper.selectAll();
        } else {
            OaContractAgreement oaContractAgreement = new OaContractAgreement();
            oaContractAgreement.setType(null);
            oaContractAgreementList = oaContractAgreementMapper.select(oaContractAgreement);
        }
        for (OaContractAgreement oaContractAgreement : oaContractAgreementList) {
            oaContractAgreement.setDateStr(DateUtil.dateConvertYYYYMMDD(oaContractAgreement.getDate()));
        }
        return oaContractAgreementList;
    }

    /**
     * 根据发文名称模糊查询
     *
     * @param contractAgreementName 合同/协议名称
     * @return list
     */
    @Override
    public List<OaContractAgreement> getSelectByName(String contractAgreementName) {
        List<OaContractAgreement> oaContractAgreementList = oaContractAgreementMapper.getSelectByContractAgreementName(contractAgreementName);
        for (OaContractAgreement oaContractAgreement : oaContractAgreementList) {
            oaContractAgreement.setDateStr(DateUtil.dateConvertYYYYMMDD(oaContractAgreement.getDate()));
        }
        return oaContractAgreementList;
    }

    /**
     * 根据访问日期查询
     *
     * @param date 日期
     * @return list
     */
    @Override
    public List<OaContractAgreement> getSelectByDate(String date) {
        Date newDate = DateUtil.stringConvertYYYYMMDD(date);
        List<OaContractAgreement> oaContractAgreementList = oaContractAgreementMapper.getSelectByDate(newDate);
        for (OaContractAgreement oaContractAgreement : oaContractAgreementList) {
            oaContractAgreement.setDateStr(DateUtil.dateConvertYYYYMMDD(oaContractAgreement.getDate()));
        }
        return oaContractAgreementList;
    }

    /**
     * 选择性更新
     *
     * @param oaContractAgreement oaContractAgreement
     * @return 影响行数
     */
    @Override
    public int updateByPrimaryKeySelective(OaContractAgreement oaContractAgreement) {
        oaContractAgreement.setDate(DateUtil.stringConvertYYYYMMDD(oaContractAgreement.getDateStr()));
        return oaContractAgreementMapper.updateByPrimaryKeySelective(oaContractAgreement);
    }

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    @Override
    public int delete(int id) {
        OaContractAgreement oaContractAgreement = new OaContractAgreement();
        oaContractAgreement.setId(id);
        return oaContractAgreementMapper.delete(oaContractAgreement);
    }
}
