package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.dao.*;
import io.swagger.models.auth.In;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 验收入库
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:29
 */
@Service
public class OaActAcceptanceWarehousingServiceImpl implements OaActAcceptanceWarehousingService {

    @Resource
    private OaActAcceptanceWarehousingMapper oaActAcceptanceWarehousingMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Resource
    private OaAcceptanceWarehousingMapper oaAcceptanceWarehousingMapper;

    @Resource
    private OaActOfficeSuppliesMapper oaActOfficeSuppliesMapper;

    @Resource
    private OaAssetsManagementMapper oaAssetsManagementMapper;

    @Resource
    private OaAssetsReplenishmentMapper oaAssetsReplenishmentMapper;

    @Override
    public int deleteData(String id) {
        //删除详情关联数据
        oaAcceptanceWarehousingMapper.deleteByAcceptanceWarehousingId(id);
        return oaActAcceptanceWarehousingMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(OaActAcceptanceWarehousing oaActAcceptanceWarehousing, Integer userId, String randomId, Integer state) {

        for (OaAcceptanceWarehousing oaAcceptanceWarehousing : oaActAcceptanceWarehousing.getOaAcceptanceWarehousingList()) {
            oaAcceptanceWarehousing.setAcceptanceWarehousingId(randomId);
        }

        //批量插入
        if (oaAcceptanceWarehousingMapper.batchInsertData(oaActAcceptanceWarehousing.getOaAcceptanceWarehousingList()) < 0) {
            return -1;
        }

        oaActAcceptanceWarehousing.setCreateTime(new Date());
        oaActAcceptanceWarehousing.setId(randomId);
        oaActAcceptanceWarehousing.setPromoter(userId);
        oaActAcceptanceWarehousing.setUrl("acceptanceWarehousing");
        oaActAcceptanceWarehousing.setState(0);
        if (oaActAcceptanceWarehousingMapper.insertSelective(oaActAcceptanceWarehousing) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActAcceptanceWarehousing.getTitle());
            oaCollaboration.setUrl("acceptanceWarehousing");
            oaCollaboration.setTable("oa_act_acceptance_warehousing");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("验收入库");
            oaCollaboration.setDataOne("购买人:" + oaActAcceptanceWarehousing.getPurchaser());
            oaCollaboration.setDataTwo("填写时间:" + oaActAcceptanceWarehousing.getPurchaserDate());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActAcceptanceWarehousing oaActAcceptanceWarehousing) {
        oaActAcceptanceWarehousing.setState(0);
        oaActAcceptanceWarehousing.setAcceptor("");
        oaActAcceptanceWarehousing.setAcceptorDate("");
        oaActAcceptanceWarehousing.setCreateTime(new Date());
        if (oaActAcceptanceWarehousingMapper.updateByPrimaryKey(oaActAcceptanceWarehousing) < 0) {
            return -1;
        } else {
            //删除详情表关联数据
            oaAcceptanceWarehousingMapper.deleteByAcceptanceWarehousingId(oaActAcceptanceWarehousing.getId());
            //重新添加详情表关联数据
            List<OaAcceptanceWarehousing> oaAcceptanceWarehousingList = oaActAcceptanceWarehousing.getOaAcceptanceWarehousingList();
            for (OaAcceptanceWarehousing oaOfficeSuppliesList : oaAcceptanceWarehousingList) {
                oaOfficeSuppliesList.setAcceptanceWarehousingId(oaActAcceptanceWarehousing.getId());
            }
            oaAcceptanceWarehousingMapper.batchInsertData(oaAcceptanceWarehousingList);
            oaCollaborationMapper.updateStateByCorrelationId(oaActAcceptanceWarehousing.getId(), 1, oaActAcceptanceWarehousing.getTitle());
            return 1;
        }
    }

    @Override
    public OaActAcceptanceWarehousing selectByPrimaryKey(String id) {
        OaActAcceptanceWarehousing oaActAcceptanceWarehousing = oaActAcceptanceWarehousingMapper.selectByPrimaryKey(id);
        List<OaAcceptanceWarehousing> oaAcceptanceWarehousingList = oaAcceptanceWarehousingMapper.selectByAcceptanceWarehousingId(id);
        oaActAcceptanceWarehousing.setOaAcceptanceWarehousingList(oaAcceptanceWarehousingList);
        oaActAcceptanceWarehousing.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActAcceptanceWarehousing.getCreateTime()));
        oaActAcceptanceWarehousing.setPromoterStr(userInfoMapper.getNicknameById(oaActAcceptanceWarehousing.getPromoter()));
        oaActAcceptanceWarehousing.setAssociatedName(oaActOfficeSuppliesMapper.selectTitleById(oaActAcceptanceWarehousing.getAssociatedId()));
        return oaActAcceptanceWarehousing;
    }

    @Override
    public int updateByPrimaryKeySelective(OaActAcceptanceWarehousing oaActAcceptanceWarehousing) {
        return oaActAcceptanceWarehousingMapper.updateByPrimaryKeySelective(oaActAcceptanceWarehousing);
    }

    @Override
    public List<OaActOfficeSupplies> selectMultipleData(List<String> list) {
        return oaActOfficeSuppliesMapper.selectMultipleData(list);
    }

    @Override
    public int enteringWarehouse(OaActAcceptanceWarehousing oaActAcceptanceWarehousing) {

        //更新验收入库表
        if (oaActAcceptanceWarehousingMapper.updateByPrimaryKeySelective(oaActAcceptanceWarehousing) < 0){
            return -1;
        }

        //根据验收入库id查询验收入库详情
        List<OaAcceptanceWarehousing> oaAcceptanceWarehousingList = oaAcceptanceWarehousingMapper.selectByAcceptanceWarehousingId(oaActAcceptanceWarehousing.getId());
        //根据id查询验收入库详情信息
        OaActAcceptanceWarehousing actAcceptanceWarehousing = oaActAcceptanceWarehousingMapper.selectByPrimaryKey(oaActAcceptanceWarehousing.getId());

        for (OaAcceptanceWarehousing acceptanceWarehousing : oaAcceptanceWarehousingList) {
            //根据验收入库产品名称查询是否存在与资产档案表中
            OaAssetManagement oaAssetManagement = oaAssetsManagementMapper.selectByAssetsName(acceptanceWarehousing.getName());

            //不存在-创建
            if (oaAssetManagement == null){

                //资产档案
                OaAssetManagement assetManagement = new OaAssetManagement();
                assetManagement.setAssetsName(acceptanceWarehousing.getName());
                assetManagement.setProductQuantity(Integer.valueOf(acceptanceWarehousing.getNumber()));
                assetManagement.setStorageLocation("办公室");
                assetManagement.setEntryPerson(actAcceptanceWarehousing.getPurchaser());
                assetManagement.setCustodian(actAcceptanceWarehousing.getPurchaser());
                assetManagement.setRemarks("无");
                assetManagement.setCreateTime(DateUtil.stringConvertYYYYMMDDHHMMSS(acceptanceWarehousing.getDate()));

                //插入并返回id
                oaAssetsManagementMapper.insertReturnId(assetManagement);

                //资产补货
                OaAssetReplenishment assetReplenishment = new OaAssetReplenishment();
                assetReplenishment.setAssetsName(acceptanceWarehousing.getName());
                assetReplenishment.setAssetsCustodian(actAcceptanceWarehousing.getPurchaser());
                assetReplenishment.setReplenishmentBeforeQuantity(0);
                assetReplenishment.setReplenishmentQuantity(Integer.valueOf(acceptanceWarehousing.getNumber()));
                assetReplenishment.setReplenishmentPerson(actAcceptanceWarehousing.getPurchaser());
                assetReplenishment.setReplenishmentStorageLocation("办公室");
                assetReplenishment.setReplenishmentRemarks("无");
                assetReplenishment.setCreateTime(DateUtil.stringConvertYYYYMMDDHHMMSS(acceptanceWarehousing.getDate()));
                assetReplenishment.setAssetManagementId(assetManagement.getId());
                oaAssetsReplenishmentMapper.insertSelective(assetReplenishment);
            }else {
                //存在-更新
                oaAssetsManagementMapper.updateProductQuantityById(oaAssetManagement.getId(),oaAssetManagement.getProductQuantity() + Integer.valueOf(acceptanceWarehousing.getNumber()));
                //资产补货
                OaAssetReplenishment assetReplenishment = new OaAssetReplenishment();
                assetReplenishment.setAssetsName(acceptanceWarehousing.getName());
                assetReplenishment.setAssetsCustodian(actAcceptanceWarehousing.getPurchaser());
                assetReplenishment.setReplenishmentBeforeQuantity(oaAssetManagement.getProductQuantity());
                assetReplenishment.setReplenishmentQuantity(Integer.valueOf(acceptanceWarehousing.getNumber()));
                assetReplenishment.setReplenishmentPerson(actAcceptanceWarehousing.getPurchaser());
                assetReplenishment.setReplenishmentStorageLocation("办公室");
                assetReplenishment.setReplenishmentRemarks("无");
                assetReplenishment.setCreateTime(DateUtil.stringConvertYYYYMMDDHHMMSS(acceptanceWarehousing.getDate()));
                assetReplenishment.setAssetManagementId(oaAssetManagement.getId());
                oaAssetsReplenishmentMapper.insertSelective(assetReplenishment);
            }
        }
        return 1;
    }
}
