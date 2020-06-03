package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaMainDelivery;
import com.jiaoke.oa.dao.OaMainDeliveryMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 参数管理-发送公文-主送
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
@Service
public class OaMainDeliveryServiceImpl implements OaMainDeliveryService {

    @Resource
    private OaMainDeliveryMapper oaMainDeliveryMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public List<OaMainDelivery> selectAllData() {
        return oaMainDeliveryMapper.selectAll();
    }

    @Override
    public int insertSelective(String name, String description) {
        OaMainDelivery oaMainDelivery = new OaMainDelivery();
        oaMainDelivery.setName(name);
        oaMainDelivery.setDescription(description);
        return oaMainDeliveryMapper.insertSelective(oaMainDelivery);
    }

    @Override
    public OaMainDelivery selectByName(String name) {
        OaMainDelivery oaMainDelivery = new OaMainDelivery();
        oaMainDelivery.setName(name);
        return oaMainDeliveryMapper.selectOne(oaMainDelivery);
    }

    @Override
    public int deleteById(Integer id) {
        OaMainDelivery oaMainDelivery = new OaMainDelivery();
        oaMainDelivery.setId(id);
        if (oaMainDeliveryMapper.deleteByPrimaryKey(oaMainDelivery) < 0){
            return -1;
        }else {
            if (oaMainDeliveryMapper.deleteByMaiId(id.toString()) < 0){
                return -1;
            }else {
                return 1;
            }
        }
    }

    @Override
    public int updateData(Integer id, String description) {
        OaMainDelivery oaMainDelivery = new OaMainDelivery();
        oaMainDelivery.setId(id);
        oaMainDelivery.setDescription(description);
        return oaMainDeliveryMapper.updateByPrimaryKeySelective(oaMainDelivery);
    }

    @Override
    public List<OaMainDelivery> mainDeliveryFilter(String name) {
        return oaMainDeliveryMapper.mainDeliveryFilter(name);
    }

    @Override
    public Map<String, Object> boundInfo(String id) {
        Map<String, Object> map = new HashMap<>(16);
        map.put("boundUserList", oaMainDeliveryMapper.selectBoundUser(id));
        map.put("userInfoList", userInfoMapper.selectIdAndNicknameAndDepartment());
        return map;
    }

    @Override
    public int updateMainUser(String mainId, String[] array) {

        if (array.length > 0) {
            if (oaMainDeliveryMapper.deleteByMaiId(mainId) < 0) {
                return -1;
            } else {
                if (oaMainDeliveryMapper.insertData(mainId, array) < 0) {
                    return -1;
                } else {
                    return 1;
                }
            }
        } else {
            return -1;
        }
    }

    @Override
    public List<String> selectBoundUser(String id) {
        return oaMainDeliveryMapper.selectBoundUser(id);
    }

    @Override
    public int batchDeleteMain(String[] ids) {
        if (oaMainDeliveryMapper.batchDeleteMain(ids) < 0){
            return -1;
        }else {
            if (oaMainDeliveryMapper.batchDeleteRelation(ids) < 0){
                return -1;
            }else {
                return 1;
            }
        }
    }
}
