package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaProductionEngineering;
import com.jiaoke.oa.dao.OaProductionEngineeringMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 经营报价档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaProductionEngineeringServiceImpl implements OaProductionEngineeringService {

    @Resource
    private OaProductionEngineeringMapper oaProductionEngineeringMapper;

    @Override
    public List<OaProductionEngineering> selectAll() {
        List<OaProductionEngineering> oaProductionEngineeringList = oaProductionEngineeringMapper.selectAllData();
        for (OaProductionEngineering oaProductionEngineering : oaProductionEngineeringList) {
            oaProductionEngineering.setCompletionDateStr(DateUtil.dateConvertYYYYMMDD(oaProductionEngineering.getCompletionDate()));
        }
        return oaProductionEngineeringList;
    }

    @Override
    public List<OaProductionEngineering> searchFilter(String projectName) {
        List<OaProductionEngineering> oaProductionEngineeringList = oaProductionEngineeringMapper.searchFilter(projectName);
        for (OaProductionEngineering oaProductionEngineering : oaProductionEngineeringList) {
            oaProductionEngineering.setCompletionDateStr(DateUtil.dateConvertYYYYMMDD(oaProductionEngineering.getCompletionDate()));
        }
        return oaProductionEngineeringList;
    }

    @Override
    public int insertSelective(OaProductionEngineering oaProductionEngineering) {
        oaProductionEngineering.setCompletionDate(DateUtil.stringConvertYYYYMMDD(oaProductionEngineering.getCompletionDateStr()));
        oaProductionEngineering.setCreateDate(new Date());
        return oaProductionEngineeringMapper.insertSelective(oaProductionEngineering);
    }

    @Override
    public OaProductionEngineering selectByPrimaryKey(Integer id) {
        OaProductionEngineering oaProductionEngineering = oaProductionEngineeringMapper.selectByPrimaryKey(id);
        oaProductionEngineering.setCompletionDateStr(DateUtil.dateConvertYYYYMMDD(oaProductionEngineering.getCompletionDate()));
        return oaProductionEngineering;
    }

    @Override
    public int updateByPrimaryKeySelective(OaProductionEngineering oaProductionEngineering) {
        oaProductionEngineering.setCompletionDate(DateUtil.stringConvertYYYYMMDD(oaProductionEngineering.getCompletionDateStr()));
        return oaProductionEngineeringMapper.updateByPrimaryKeySelective(oaProductionEngineering);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaProductionEngineeringMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int batchDelete(String[] ids) {
        return oaProductionEngineeringMapper.batchDelete(ids);
    }
}
