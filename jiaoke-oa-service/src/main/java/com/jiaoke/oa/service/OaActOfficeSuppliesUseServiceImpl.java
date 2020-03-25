package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.dao.*;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 办公用品领用
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:29
 */
@Service
public class OaActOfficeSuppliesUseServiceImpl implements OaActOfficeSuppliesUseService {

    @Resource
    private OaActOfficeSuppliesUseMapper oaActOfficeSuppliesUseMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Resource
    private OaOfficeSuppliesUseMapper oaOfficeSuppliesUseMapper;

    @Resource
    private OaAssetsManagementMapper oaAssetsManagementMapper;

    @Resource
    private OaAssetUseMapper oaAssetUseMapper;

    @Override
    public int deleteData(String id) {
        //删除详情关联数据
        oaOfficeSuppliesUseMapper.deleteByOfficeSuppliesUseId(id);
        return oaActOfficeSuppliesUseMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(OaActOfficeSuppliesUse oaActOfficeSuppliesUse, Integer userId, String randomId, Integer state) {

        ArrayList<OaAssetUse> assetUseArrayList = new ArrayList<>();
        ArrayList<OaOfficeSuppliesUse> officeSuppliesUseArrayList = new ArrayList<>();

        //办公用品详情表-添加办公用品id
        for (OaOfficeSuppliesUse officeSuppliesUse : oaActOfficeSuppliesUse.getOaOfficeSuppliesUseList()) {
            //申请数量为0的跳过
            if (Integer.valueOf(officeSuppliesUse.getNumber()) == 0){
                continue;
            }

            officeSuppliesUse.setOfficeSuppliesUseId(randomId);
            officeSuppliesUseArrayList.add(officeSuppliesUse);

            //根据资产id查询资产信息
            OaAssetManagement assetManagement = oaAssetsManagementMapper.selectByPrimaryKey(officeSuppliesUse.getAssetId());
            //如果领用的数量大于库存数量
            if (Integer.valueOf(officeSuppliesUse.getNumber()) > assetManagement.getProductQuantity()){
                return -1;
            }else {
                //更新资产管理表资产数量
                oaAssetsManagementMapper.updateProductQuantityById(assetManagement.getId(),assetManagement.getProductQuantity()- Integer.valueOf(officeSuppliesUse.getNumber()));

                //封装到资产领用记录表
                OaAssetUse assetUse = new OaAssetUse();
                assetUse.setAssetName(officeSuppliesUse.getName());
                assetUse.setUseBeforeNumber(assetManagement.getProductQuantity().toString());
                assetUse.setUseNumber(officeSuppliesUse.getNumber());
                assetUse.setUseAfterNumber(String.valueOf(assetManagement.getProductQuantity() - Integer.valueOf(officeSuppliesUse.getNumber())));
                assetUse.setUseDepartment(oaActOfficeSuppliesUse.getRecipientsDepartment());
                assetUse.setUsePerson(oaActOfficeSuppliesUse.getRecipientsPreparer());
                assetUse.setUsePerson(oaActOfficeSuppliesUse.getRecipientsPreparer());
                assetUse.setUseDate(oaActOfficeSuppliesUse.getRecipientsDate());
                assetUse.setCustodian(assetManagement.getCustodian());
                assetUseArrayList.add(assetUse);
            }
        }

        //办公用品详情表-批量插入
        if (oaOfficeSuppliesUseMapper.batchInsertData(officeSuppliesUseArrayList) < 0) {
            return -1;
        }

        //办公用品表-插入
        oaActOfficeSuppliesUse.setCreateTime(new Date());
        oaActOfficeSuppliesUse.setId(randomId);
        oaActOfficeSuppliesUse.setPromoter(userId);
        oaActOfficeSuppliesUse.setUrl("officeSuppliesUse");
        if (oaActOfficeSuppliesUseMapper.insertSelective(oaActOfficeSuppliesUse) < 0) {
            return -1;
        } else {
            //协同工作-插入
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActOfficeSuppliesUse.getTitle());
            oaCollaboration.setUrl("officeSuppliesUse");
            oaCollaboration.setTable("oa_act_office_supplies_use");
            oaCollaboration.setName("办公用品领用");
            oaCollaboration.setDataOne("领用人:" + oaActOfficeSuppliesUse.getRecipientsPreparer());
            oaCollaboration.setDataTwo("领用日期:" + oaActOfficeSuppliesUse.getRecipientsDate());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);

            //资产领用记录-插入
            oaAssetUseMapper.batchInsertData(assetUseArrayList);
            return 1;
        }
    }

    @Override
    public OaActOfficeSuppliesUse selectByPrimaryKey(String id) {
        OaActOfficeSuppliesUse oaActOfficeSuppliesUse = oaActOfficeSuppliesUseMapper.selectByPrimaryKey(id);
        List<OaOfficeSuppliesUse> oaOfficeSuppliesUses = oaOfficeSuppliesUseMapper.selectByOfficeSuppliesUseId(id);
        oaActOfficeSuppliesUse.setOaOfficeSuppliesUseList(oaOfficeSuppliesUses);
        oaActOfficeSuppliesUse.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActOfficeSuppliesUse.getCreateTime()));
        oaActOfficeSuppliesUse.setPromoterStr(userInfoMapper.getNicknameById(oaActOfficeSuppliesUse.getPromoter()));
        return oaActOfficeSuppliesUse;
    }

    @Override
    public int updateByPrimaryKeySelective(OaActOfficeSuppliesUse oaActOfficeSuppliesUse) {
        return oaActOfficeSuppliesUseMapper.updateByPrimaryKeySelective(oaActOfficeSuppliesUse);
    }

    @Override
    public List<OaAssetManagement> inventoryInfo() {
        return oaAssetsManagementMapper.selectNameAndNumber();
    }
}
