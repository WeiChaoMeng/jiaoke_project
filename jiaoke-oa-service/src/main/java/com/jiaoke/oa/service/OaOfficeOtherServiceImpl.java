package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaManagementSystem;
import com.jiaoke.oa.bean.OaOfficeOther;
import com.jiaoke.oa.dao.OaManagementSystemMapper;
import com.jiaoke.oa.dao.OaOfficeOtherMapper;
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
public class OaOfficeOtherServiceImpl implements OaOfficeOtherService {

    @Resource
    private OaOfficeOtherMapper oaOfficeOtherMapper;

    /**
     * 新增
     *
     * @param oaOfficeOther oaOfficeOther
     * @return 影响行数
     */
    @Override
    public int insertSelective(OaOfficeOther oaOfficeOther) {
        oaOfficeOther.setDate(DateUtil.stringConvertYYYYMMDD(oaOfficeOther.getDateStr()));
        oaOfficeOther.setCreateTime(new Date());
        return oaOfficeOtherMapper.insertSelective(oaOfficeOther);
    }

    /**
     * 查询全部
     *
     * @return list
     */
    @Override
    public List<OaOfficeOther> selectAll() {
        List<OaOfficeOther> oaOfficeOtherList = oaOfficeOtherMapper.selectAllData();
        for (OaOfficeOther oaOfficeOther : oaOfficeOtherList) {
            oaOfficeOther.setDateStr(DateUtil.dateConvertYYYYMMDD(oaOfficeOther.getDate()));
        }
        return oaOfficeOtherList;
    }

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaReleaseDocument
     */
    @Override
    public OaOfficeOther selectByPrimaryKey(int id) {
        OaOfficeOther oaOfficeOther = oaOfficeOtherMapper.selectByPrimaryKey(id);
        oaOfficeOther.setDateStr(DateUtil.dateConvertYYYYMMDD(oaOfficeOther.getDate()));
        return oaOfficeOther;
    }

    /**
     * 根据名称模糊查询
     *
     * @param fileName fileName
     * @return list
     */
    @Override
    public List<OaOfficeOther> getSelectByName(String fileName) {
        List<OaOfficeOther> oaOfficeOtherList = oaOfficeOtherMapper.getSelectByFileName(fileName);
        for (OaOfficeOther oaOfficeOther : oaOfficeOtherList) {
            oaOfficeOther.setDateStr(DateUtil.dateConvertYYYYMMDD(oaOfficeOther.getDate()));
        }
        return oaOfficeOtherList;
    }

    /**
     * 根据访问日期查询
     *
     * @param date date
     * @return list
     */
    @Override
    public List<OaOfficeOther> getSelectByDate(String date) {
        Date newDate = DateUtil.stringConvertYYYYMMDD(date);
        List<OaOfficeOther> oaOfficeOtherList = oaOfficeOtherMapper.getSelectByDate(newDate);
        for (OaOfficeOther oaOfficeOther : oaOfficeOtherList) {
            oaOfficeOther.setDateStr(DateUtil.dateConvertYYYYMMDD(oaOfficeOther.getDate()));
        }
        return oaOfficeOtherList;
    }

    /**
     * 选择性更新
     *
     * @param oaOfficeOther oaOfficeOther
     * @return 影响行数
     */
    @Override
    public int updateByPrimaryKeySelective(OaOfficeOther oaOfficeOther) {
        oaOfficeOther.setDate(DateUtil.stringConvertYYYYMMDD(oaOfficeOther.getDateStr()));
        return oaOfficeOtherMapper.updateByPrimaryKeySelective(oaOfficeOther);
    }

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    @Override
    public int delete(int id) {
        OaOfficeOther oaOfficeOther = new OaOfficeOther();
        oaOfficeOther.setId(id);
        return oaOfficeOtherMapper.delete(oaOfficeOther);
    }

    @Override
    public int batchDelete(String[] ids) {
        return oaOfficeOtherMapper.batchDelete(ids);
    }
}
