package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaManagementSystem;
import com.jiaoke.oa.dao.OaManagementSystemMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * oa-综合办公室档案-管理体系相关
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 12:57
 */
@Service
public class OaManagementSystemServiceImpl implements OaManagementSystemService {

    @Resource
    private OaManagementSystemMapper oaManagementSystemMapper;

    /**
     * 新增
     *
     * @param oaManagementSystem oaManagementSystem
     * @return 影响行数
     */
    @Override
    public int insertSelective(OaManagementSystem oaManagementSystem) {
        oaManagementSystem.setDate(DateUtil.stringConvertYYYYMMDD(oaManagementSystem.getDateStr()));
        oaManagementSystem.setCreateTime(new Date());
        return oaManagementSystemMapper.insertSelective(oaManagementSystem);
    }

    /**
     * 查询全部
     *
     * @return list
     */
    @Override
    public List<OaManagementSystem> selectAll() {
        List<OaManagementSystem> managementSystemList = oaManagementSystemMapper.selectAllData();
        for (OaManagementSystem oaManagementSystem : managementSystemList) {
            oaManagementSystem.setDateStr(DateUtil.dateConvertYYYYMMDD(oaManagementSystem.getDate()));
        }
        return managementSystemList;
    }

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaReleaseDocument
     */
    @Override
    public OaManagementSystem selectByPrimaryKey(int id) {
        OaManagementSystem oaManagementSystem = oaManagementSystemMapper.selectByPrimaryKey(id);
        oaManagementSystem.setDateStr(DateUtil.dateConvertYYYYMMDD(oaManagementSystem.getDate()));
        return oaManagementSystem;
    }

    /**
     * 根据名称模糊查询
     *
     * @param fileName fileName
     * @return list
     */
    @Override
    public List<OaManagementSystem> getSelectByName(String fileName) {
        List<OaManagementSystem> oaManagementSystemList = oaManagementSystemMapper.getSelectByFileName(fileName);
        for (OaManagementSystem oaManagementSystem : oaManagementSystemList) {
            oaManagementSystem.setDateStr(DateUtil.dateConvertYYYYMMDD(oaManagementSystem.getDate()));
        }
        return oaManagementSystemList;
    }

    /**
     * 根据访问日期查询
     *
     * @param date date
     * @return list
     */
    @Override
    public List<OaManagementSystem> getSelectByDate(String date) {
        Date newDate = DateUtil.stringConvertYYYYMMDD(date);
        List<OaManagementSystem> managementSystemList = oaManagementSystemMapper.getSelectByDate(newDate);
        for (OaManagementSystem oaManagementSystem : managementSystemList) {
            oaManagementSystem.setDateStr(DateUtil.dateConvertYYYYMMDD(oaManagementSystem.getDate()));
        }
        return managementSystemList;
    }

    /**
     * 选择性更新
     *
     * @param oaManagementSystem oaManagementSystem
     * @return 影响行数
     */
    @Override
    public int updateByPrimaryKeySelective(OaManagementSystem oaManagementSystem) {
        oaManagementSystem.setDate(DateUtil.stringConvertYYYYMMDD(oaManagementSystem.getDateStr()));
        return oaManagementSystemMapper.updateByPrimaryKeySelective(oaManagementSystem);
    }

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    @Override
    public int delete(int id) {
        OaManagementSystem oaManagementSystem = new OaManagementSystem();
        oaManagementSystem.setId(id);
        return oaManagementSystemMapper.delete(oaManagementSystem);
    }
}
