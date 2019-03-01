package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaEiaMonitor;
import com.jiaoke.oa.dao.OaEiaMonitorMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * oa-综合办公室档案-环评监测报告
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 12:57
 */
@Service
public class OaEiaMonitorServiceImpl implements OaEiaMonitorService {

    @Resource
    private OaEiaMonitorMapper oaEiaMonitorMapper;

    /**
     * 新增
     *
     * @param oaEiaMonitor oaEiaMonitor
     * @return 影响行数
     */
    @Override
    public int insertSelective(OaEiaMonitor oaEiaMonitor) {
        oaEiaMonitor.setTestingDate(DateUtil.stringConvertYYYYMMDD(oaEiaMonitor.getTestingDateStr()));
        oaEiaMonitor.setCreateTime(new Date());
        return oaEiaMonitorMapper.insertSelective(oaEiaMonitor);
    }

    /**
     * 查询全部
     *
     * @return list
     */
    @Override
    public List<OaEiaMonitor> selectAll() {
        List<OaEiaMonitor> oaEiaMonitorList = oaEiaMonitorMapper.selectAll();
        for (OaEiaMonitor oaEiaMonitor: oaEiaMonitorList) {
            oaEiaMonitor.setTestingDateStr(DateUtil.dateConvertYYYYMMDD(oaEiaMonitor.getTestingDate()));
        }
        return oaEiaMonitorList;
    }

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaReleaseDocument
     */
    @Override
    public OaEiaMonitor selectByPrimaryKey(int id) {
        OaEiaMonitor oaEiaMonitor = oaEiaMonitorMapper.selectByPrimaryKey(id);
        oaEiaMonitor.setTestingDateStr(DateUtil.dateConvertYYYYMMDD(oaEiaMonitor.getTestingDate()));
        return oaEiaMonitor;
    }

    /**
     * 根据名称模糊查询
     *
     * @param sampleName sampleName
     * @return list
     */
    @Override
    public List<OaEiaMonitor> getSelectBySampleName(String sampleName) {
        List<OaEiaMonitor> oaEiaMonitorList = oaEiaMonitorMapper.getSelectBySampleName(sampleName);
        for (OaEiaMonitor oaEiaMonitor: oaEiaMonitorList) {
            oaEiaMonitor.setTestingDateStr(DateUtil.dateConvertYYYYMMDD(oaEiaMonitor.getTestingDate()));
        }
        return oaEiaMonitorList;
    }

    /**
     * 根据访问日期查询
     *
     * @param testingDate testingDate
     * @return list
     */
    @Override
    public List<OaEiaMonitor> getSelectByTestingDate(String testingDate) {
        Date newDate = DateUtil.stringConvertYYYYMMDD(testingDate);
        List<OaEiaMonitor> oaEiaMonitorList = oaEiaMonitorMapper.getSelectByTestingDate(newDate);
        for (OaEiaMonitor oaEiaMonitor: oaEiaMonitorList) {
            oaEiaMonitor.setTestingDateStr(DateUtil.dateConvertYYYYMMDD(oaEiaMonitor.getTestingDate()));
        }
        return oaEiaMonitorList;
    }

    /**
     * 选择性更新
     *
     * @param oaEiaMonitor oaEiaMonitor
     * @return 影响行数
     */
    @Override
    public int updateByPrimaryKeySelective(OaEiaMonitor oaEiaMonitor) {
        oaEiaMonitor.setTestingDate(DateUtil.stringConvertYYYYMMDD(oaEiaMonitor.getTestingDateStr()));
        return oaEiaMonitorMapper.updateByPrimaryKeySelective(oaEiaMonitor);
    }

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    @Override
    public int delete(int id) {
        OaEiaMonitor oaEiaMonitor = new OaEiaMonitor();
        oaEiaMonitor.setId(id);
        return oaEiaMonitorMapper.delete(oaEiaMonitor);
    }
}
