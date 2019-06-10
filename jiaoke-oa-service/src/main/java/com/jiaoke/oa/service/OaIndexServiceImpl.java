package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActTemporary;
import com.jiaoke.oa.dao.OaIndexMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * OA模块首页
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:44
 */
@Service
public class OaIndexServiceImpl implements OaIndexService {

    @Resource
    private OaIndexMapper oaIndexMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public OaActTemporary selectSimpleData(String businessKey) {
        //act中存储格式 abc:1
        String id = businessKey.substring(businessKey.lastIndexOf(":") + 1);
        String tableName = businessKey.substring(0, businessKey.indexOf(":"));
        OaActTemporary oaActTemporary = oaIndexMapper.selectSimpleData(tableName, id);
        oaActTemporary.setPromoter(userInfoMapper.getNicknameById(Integer.valueOf(oaActTemporary.getPromoter())));
        oaActTemporary.setCreateTimeStr(DateUtil.dateConvertYYYYMMDD(oaActTemporary.getCreateTime()));
        return oaActTemporary;
    }

    @Override
    public String getNicknameById(Integer id) {
        return userInfoMapper.getNicknameById(id);
    }
}
