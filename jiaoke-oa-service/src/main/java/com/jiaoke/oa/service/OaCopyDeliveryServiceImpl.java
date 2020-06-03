package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaCopyDelivery;
import com.jiaoke.oa.dao.OaCopyDeliveryMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 参数管理-发送公文-抄送
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
@Service
public class OaCopyDeliveryServiceImpl implements OaCopyDeliveryService {

    @Resource
    private OaCopyDeliveryMapper oaCopyDeliveryMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public List<OaCopyDelivery> selectAllData() {
        return oaCopyDeliveryMapper.selectAll();
    }

    @Override
    public int insertSelective(String name, String description) {
        OaCopyDelivery oaCopyDelivery = new OaCopyDelivery();
        oaCopyDelivery.setName(name);
        oaCopyDelivery.setDescription(description);
        return oaCopyDeliveryMapper.insertSelective(oaCopyDelivery);
    }

    @Override
    public OaCopyDelivery selectByName(String name) {
        OaCopyDelivery oaCopyDelivery = new OaCopyDelivery();
        oaCopyDelivery.setName(name);
        return oaCopyDeliveryMapper.selectOne(oaCopyDelivery);
    }

    @Override
    public int deleteById(Integer id) {
        OaCopyDelivery oaCopyDelivery = new OaCopyDelivery();
        oaCopyDelivery.setId(id);
        if (oaCopyDeliveryMapper.deleteByPrimaryKey(oaCopyDelivery) < 0) {
            return -1;
        } else {
            if (oaCopyDeliveryMapper.deleteByCopyId(id.toString()) < 0) {
                return -1;
            } else {
                return 1;
            }
        }
    }

    @Override
    public int updateData(Integer id, String description) {
        OaCopyDelivery oaCopyDelivery = new OaCopyDelivery();
        oaCopyDelivery.setId(id);
        oaCopyDelivery.setDescription(description);
        return oaCopyDeliveryMapper.updateByPrimaryKeySelective(oaCopyDelivery);
    }

    @Override
    public List<OaCopyDelivery> copyDeliveryFilter(String name) {
        return oaCopyDeliveryMapper.copyDeliveryFilter(name);
    }

    @Override
    public Map<String, Object> boundInfo(String id) {
        Map<String, Object> map = new HashMap<>(16);
        map.put("boundUserList", oaCopyDeliveryMapper.selectBoundUser(id));
        map.put("userInfoList", userInfoMapper.selectIdAndNicknameAndDepartment());
        return map;
    }

    @Override
    public int updateCopyUser(String mainId, String[] array) {

        if (array.length > 0) {
            if (oaCopyDeliveryMapper.deleteByCopyId(mainId) < 0) {
                return -1;
            } else {
                if (oaCopyDeliveryMapper.insertData(mainId, array) < 0) {
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
        return oaCopyDeliveryMapper.selectBoundUser(id);
    }

    @Override
    public int batchDeleteCopy(String[] ids) {
        if (oaCopyDeliveryMapper.batchDeleteCopy(ids) < 0) {
            return -1;
        } else {
            if (oaCopyDeliveryMapper.batchDeleteRelation(ids) < 0) {
                return -1;
            } else {
                return 1;
            }
        }
    }
}
