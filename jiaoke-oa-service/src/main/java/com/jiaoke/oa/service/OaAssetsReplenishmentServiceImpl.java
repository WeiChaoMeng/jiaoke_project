package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaAssetManagement;
import com.jiaoke.oa.bean.OaAssetReplenishment;
import com.jiaoke.oa.dao.OaAssetsManagementMapper;
import com.jiaoke.oa.dao.OaAssetsReplenishmentMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * oa-资产补货
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Service
public class OaAssetsReplenishmentServiceImpl implements OaAssetsReplenishmentService {

    @Resource
    private OaAssetsReplenishmentMapper oaAssetsReplenishmentMapper;

    @Resource
    private OaAssetsManagementMapper oaAssetsManagementMapper;

    @Override
    public int insertSelective(OaAssetReplenishment oaAssetReplenishment) {
        //根据id查询资产剩余数量
        OaAssetManagement assetManagement = oaAssetsManagementMapper.selectByPrimaryKey(oaAssetReplenishment.getAssetManagementId());
        //更新资产数量
        OaAssetManagement oaAssetManagement = new OaAssetManagement();
        oaAssetManagement.setId(oaAssetReplenishment.getAssetManagementId());
        oaAssetManagement.setProductQuantity(assetManagement.getProductQuantity() + oaAssetReplenishment.getReplenishmentQuantity());
        oaAssetsManagementMapper.updateByPrimaryKeySelective(oaAssetManagement);
        //保存补货数据
        oaAssetReplenishment.setReplenishmentBeforeQuantity(assetManagement.getProductQuantity());
        oaAssetReplenishment.setCreateTime(new Date());
        return oaAssetsReplenishmentMapper.insertSelective(oaAssetReplenishment);
    }

    @Override
    public List<OaAssetReplenishment> select(Integer assetManagementId) {
        OaAssetReplenishment assetReplenishment = new OaAssetReplenishment();
        assetReplenishment.setAssetManagementId(assetManagementId);
        List<OaAssetReplenishment> assetReplenishmentList = oaAssetsReplenishmentMapper.select(assetReplenishment);
        for (OaAssetReplenishment oaAssetReplenishment : assetReplenishmentList) {
            oaAssetReplenishment.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaAssetReplenishment.getCreateTime()));
        }
        return assetReplenishmentList;
    }

    @Override
    public List<OaAssetReplenishment> replenishmentTimeFilter(String createTime, Integer assetManagementId) {
        String startTimeStr = createTime + " 00:00:00";
        String endTimeStr = createTime + " 23:59:59";
        Date startTime = DateUtil.stringConvertYYYYMMDDHHMMSS(startTimeStr);
        Date endTime = DateUtil.stringConvertYYYYMMDDHHMMSS(endTimeStr);
        List<OaAssetReplenishment> oaAssetReplenishmentList = oaAssetsReplenishmentMapper.replenishmentTimeFilter(startTime, endTime, assetManagementId);
        for (OaAssetReplenishment oaAssetReplenishment : oaAssetReplenishmentList) {
            oaAssetReplenishment.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaAssetReplenishment.getCreateTime()));
        }
        return oaAssetReplenishmentList;
    }
}
