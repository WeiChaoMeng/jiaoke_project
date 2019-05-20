package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaQualityPersonnel;
import com.jiaoke.oa.dao.OaQualityPersonnelMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 质量技术部-人员情况
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaQualityPersonnelServiceImpl implements OaQualityPersonnelService {

    @Resource
    private OaQualityPersonnelMapper oaQualityPersonnelMapper;

    @Override
    public List<OaQualityPersonnel> selectAll() {
        return oaQualityPersonnelMapper.selectAllData();
    }

    @Override
    public List<OaQualityPersonnel> searchFilter(String name) {
        return oaQualityPersonnelMapper.searchFilter(name);
    }

    @Override
    public int insertSelective(OaQualityPersonnel oaQualityPersonnel) {
        oaQualityPersonnel.setCreateDate(new Date());
        return oaQualityPersonnelMapper.insertSelective(oaQualityPersonnel);
    }

    @Override
    public OaQualityPersonnel selectByPrimaryKey(Integer id) {
        return oaQualityPersonnelMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaQualityPersonnel oaQualityPersonnel) {
        return oaQualityPersonnelMapper.updateByPrimaryKeySelective(oaQualityPersonnel);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaQualityPersonnelMapper.deleteByPrimaryKey(id);
    }
}
