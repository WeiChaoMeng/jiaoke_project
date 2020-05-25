package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaAssetManagement;
import com.jiaoke.oa.bean.OaAssetOperatingRecord;
import com.jiaoke.oa.bean.OaAssetReplenishment;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.dao.OaAssetOperatingRecordMapper;
import com.jiaoke.oa.dao.OaAssetsManagementMapper;
import com.jiaoke.oa.dao.OaAssetsReplenishmentMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * oa-资产管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Service
public class OaAssetsManagementServiceImpl implements OaAssetsManagementService {

    @Resource
    private OaAssetsManagementMapper oaAssetsManagementMapper;

    @Resource
    private OaAssetsReplenishmentMapper oaAssetsReplenishmentMapper;

    @Resource
    private OaAssetOperatingRecordMapper oaAssetOperatingRecordMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    /**
     * 获取当前登录用户信息
     *
     * @return userInfo
     */
    private UserInfo getCurrentUser() {
        return (UserInfo) SecurityUtils.getSubject().getPrincipal();
    }

    @Override
    public List<OaAssetManagement> selectAll() {
        return oaAssetsManagementMapper.selectAllDate();
    }

    @Override
    public List<OaAssetManagement> fuzzyQueryByName(String assetsName) {
        return oaAssetsManagementMapper.fuzzyQueryByName(assetsName);
    }

    @Override
    public int addAssetsArchives(List<OaAssetManagement> oaAssetManagementList) {
        for (OaAssetManagement oaAssetManagement : oaAssetManagementList) {
            //根据名称查询是否存在
            OaAssetManagement assetManagement = oaAssetsManagementMapper.selectByAssetsName(oaAssetManagement.getAssetsName());
            //资产保管人员
            UserInfo userInfo = userInfoMapper.selectByPermission("office_supplies_custodian");
            //不存在
            if (assetManagement == null){
                //资产档案
                oaAssetManagement.setStorageLocation("综合办公室");
                oaAssetManagement.setEntryPerson(getCurrentUser().getNickname());
                oaAssetManagement.setCustodian(userInfo.getNickname());
                oaAssetManagement.setCreateTime(DateUtil.stringConvertYYYYMMDDHHMM(oaAssetManagement.getCreateTimeStr()));

                //插入并返回id
                oaAssetsManagementMapper.insertReturnId(oaAssetManagement);

                //资产补货
                OaAssetReplenishment assetReplenishment = new OaAssetReplenishment();
                assetReplenishment.setAssetsName(oaAssetManagement.getAssetsName());
                assetReplenishment.setAssetsCustodian(userInfo.getNickname());
                assetReplenishment.setReplenishmentBeforeQuantity(0);
                assetReplenishment.setReplenishmentQuantity(oaAssetManagement.getProductQuantity());
                assetReplenishment.setReplenishmentPerson(getCurrentUser().getNickname());
                assetReplenishment.setReplenishmentStorageLocation("综合办公室");
                assetReplenishment.setReplenishmentRemarks(oaAssetManagement.getRemarks());
                assetReplenishment.setCreateTime(DateUtil.stringConvertYYYYMMDDHHMMSS(oaAssetManagement.getCreateTimeStr()));
                assetReplenishment.setAssetManagementId(oaAssetManagement.getId());
                oaAssetsReplenishmentMapper.insertSelective(assetReplenishment);
            }else {
                //存在-更新
                oaAssetsManagementMapper.updateProductQuantityById(assetManagement.getId(),oaAssetManagement.getProductQuantity() + assetManagement.getProductQuantity());
                //资产补货
                OaAssetReplenishment assetReplenishment = new OaAssetReplenishment();
                assetReplenishment.setAssetsName(oaAssetManagement.getAssetsName());
                assetReplenishment.setAssetsCustodian(userInfo.getNickname());
                assetReplenishment.setReplenishmentBeforeQuantity(assetManagement.getProductQuantity());
                assetReplenishment.setReplenishmentQuantity(oaAssetManagement.getProductQuantity());
                assetReplenishment.setReplenishmentPerson(getCurrentUser().getNickname());
                assetReplenishment.setReplenishmentStorageLocation("综合办公室");
                assetReplenishment.setReplenishmentRemarks(oaAssetManagement.getRemarks());
                assetReplenishment.setCreateTime(DateUtil.stringConvertYYYYMMDDHHMMSS(oaAssetManagement.getCreateTimeStr()));
                assetReplenishment.setAssetManagementId(assetManagement.getId());
                oaAssetsReplenishmentMapper.insertSelective(assetReplenishment);
            }
        }

        return 1;
    }

    @Override
    public OaAssetManagement selectByPrimaryKey(Integer id) {
        return oaAssetsManagementMapper.selectByPrimaryKey(id);
    }

    @Override
    public int edit(OaAssetManagement oaAssetManagement) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        OaAssetOperatingRecord operatingRecord = new OaAssetOperatingRecord();
        OaAssetManagement assetManagement = oaAssetsManagementMapper.selectByPrimaryKey(oaAssetManagement.getId());
        operatingRecord.setBeforeAssetsName(assetManagement.getAssetsName());
        operatingRecord.setAfterAssetsName(oaAssetManagement.getAssetsName());
        operatingRecord.setBeforeAssetsNumber(assetManagement.getProductQuantity().toString());
        if (oaAssetManagement.getProductQuantity().equals(0)) {
            operatingRecord.setAfterAssetsNumber("0");
        }
        operatingRecord.setAfterAssetsNumber(oaAssetManagement.getProductQuantity().toString());
        operatingRecord.setOperatorType("编辑");
        operatingRecord.setOperatorDescription(oaAssetManagement.getEditExplain());
        operatingRecord.setOperatorPerson(userInfo.getNickname());
        operatingRecord.setOperatorTime(new Date());
        oaAssetOperatingRecordMapper.insertSelective(operatingRecord);
        return oaAssetsManagementMapper.updateByPrimaryKeySelective(oaAssetManagement);
    }

    @Override
    public int delete(Integer id, String deleteReason) {
        OaAssetOperatingRecord operatingRecord = new OaAssetOperatingRecord();
        OaAssetManagement assetManagement = oaAssetsManagementMapper.selectByPrimaryKey(id);
        operatingRecord.setBeforeAssetsName(assetManagement.getAssetsName());
        operatingRecord.setAfterAssetsName("");
        operatingRecord.setBeforeAssetsNumber(assetManagement.getProductQuantity().toString());
        operatingRecord.setAfterAssetsNumber("0");
        operatingRecord.setOperatorType("删除");
        operatingRecord.setOperatorDescription(deleteReason);
        operatingRecord.setOperatorPerson(getCurrentUser().getNickname());
        operatingRecord.setOperatorTime(new Date());
        oaAssetOperatingRecordMapper.insertSelective(operatingRecord);
        return oaAssetsManagementMapper.updateStateById(id,1);
    }

    @Override
    public int updateState(Integer id, Integer state) {
        OaAssetOperatingRecord operatingRecord = new OaAssetOperatingRecord();
        OaAssetManagement assetManagement = oaAssetsManagementMapper.selectByPrimaryKey(id);
        operatingRecord.setBeforeAssetsName(assetManagement.getAssetsName());
        operatingRecord.setAfterAssetsName(assetManagement.getAssetsName());
        operatingRecord.setBeforeAssetsNumber(assetManagement.getProductQuantity().toString());
        operatingRecord.setAfterAssetsNumber(assetManagement.getProductQuantity().toString());
        if (state == 0){
            operatingRecord.setOperatorType("开启");
        }else{
            operatingRecord.setOperatorType("关闭");
        }
        operatingRecord.setOperatorDescription("无");
        operatingRecord.setOperatorPerson(getCurrentUser().getNickname());
        operatingRecord.setOperatorTime(new Date());
        oaAssetOperatingRecordMapper.insertSelective(operatingRecord);
        return oaAssetsManagementMapper.updateStateById(id,state);
    }

    @Override
    public List<OaAssetOperatingRecord> selectOperatingRecordAll() {
        return oaAssetOperatingRecordMapper.selectAllDate();
    }

    @Override
    public List<OaAssetOperatingRecord> operatorPersonFilter(String operatorPerson) {
        return oaAssetOperatingRecordMapper.operatorPersonFilter(operatorPerson);
    }
}
