package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaReceiptReading;
import com.jiaoke.oa.dao.OaReceiptReadingMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 参数管理-收文阅办单-部门意见
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
@Service
public class OaReceiptReadingServiceImpl implements OaReceiptReadingService {

    @Resource
    private OaReceiptReadingMapper oaReceiptReadingMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public List<OaReceiptReading> selectAllData() {
        return oaReceiptReadingMapper.selectAll();
    }

    @Override
    public int insertSelective(String name, String description) {
        OaReceiptReading oaReceiptReading = new OaReceiptReading();
        oaReceiptReading.setName(name);
        oaReceiptReading.setDescription(description);
        return oaReceiptReadingMapper.insertSelective(oaReceiptReading);
    }

    @Override
    public OaReceiptReading selectByName(String name) {
        OaReceiptReading oaReceiptReading = new OaReceiptReading();
        oaReceiptReading.setName(name);
        return oaReceiptReadingMapper.selectOne(oaReceiptReading);
    }

    @Override
    public int deleteById(Integer id) {
        OaReceiptReading oaReceiptReading = new OaReceiptReading();
        oaReceiptReading.setId(id);
        if (oaReceiptReadingMapper.deleteByPrimaryKey(oaReceiptReading) < 0) {
            return -1;
        } else {
            if (oaReceiptReadingMapper.deleteByReceiptId(id.toString()) < 0) {
                return -1;
            } else {
                return 1;
            }
        }
    }

    @Override
    public int updateData(Integer id, String description) {
        OaReceiptReading oaReceiptReading = new OaReceiptReading();
        oaReceiptReading.setId(id);
        oaReceiptReading.setDescription(description);
        return oaReceiptReadingMapper.updateByPrimaryKeySelective(oaReceiptReading);
    }

    @Override
    public List<OaReceiptReading> nameFilter(String name) {
        return oaReceiptReadingMapper.nameFilter(name);
    }

    @Override
    public Map<String, Object> boundInfo(String id) {
        Map<String, Object> map = new HashMap<>(16);
        map.put("boundUserList", oaReceiptReadingMapper.selectBoundUser(id));
        map.put("userInfoList", userInfoMapper.selectIdAndNicknameAndDepartment());
        return map;
    }

    @Override
    public int updateBinding(String mainId, String[] array) {

        if (array.length > 0) {
            if (oaReceiptReadingMapper.deleteByReceiptId(mainId) < 0) {
                return -1;
            } else {
                if (oaReceiptReadingMapper.insertData(mainId, array) < 0) {
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
        return oaReceiptReadingMapper.selectBoundUser(id);
    }

    @Override
    public int batchDeleteData(String[] ids) {
        if (oaReceiptReadingMapper.batchDeleteData(ids) < 0) {
            return -1;
        } else {
            if (oaReceiptReadingMapper.batchDeleteRelation(ids) < 0) {
                return -1;
            } else {
                return 1;
            }
        }
    }
}
