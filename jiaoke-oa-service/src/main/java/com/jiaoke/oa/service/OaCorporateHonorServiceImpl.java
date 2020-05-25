package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaCorporateHonor;
import com.jiaoke.oa.dao.OaCorporateHonorMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * oa-企业荣誉
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Service
public class OaCorporateHonorServiceImpl implements OaCorporateHonorService {

    @Resource
    private OaCorporateHonorMapper oaCorporateHonorMapper;

    @Override
    public int insertSelective(OaCorporateHonor oaCorporateHonor) {
        oaCorporateHonor.setReleaseDate(new Date());
        return oaCorporateHonorMapper.insertSelective(oaCorporateHonor);
    }

    @Override
    public List<OaCorporateHonor> selectAll() {
        List<OaCorporateHonor> oaCorporateHonorList = oaCorporateHonorMapper.selectAllData();
        for (OaCorporateHonor oaCorporateHonor : oaCorporateHonorList) {
            oaCorporateHonor.setReleaseDateStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaCorporateHonor.getReleaseDate()));
        }
        return oaCorporateHonorList;
    }

    @Override
    public List<OaCorporateHonor> titleFilter(String title) {
        List<OaCorporateHonor> oaCorporateHonorList = oaCorporateHonorMapper.titleFilter(title);
        for (OaCorporateHonor oaCorporateHonor : oaCorporateHonorList) {
            oaCorporateHonor.setReleaseDateStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaCorporateHonor.getReleaseDate()));
        }
        return oaCorporateHonorList;
    }

    @Override
    public OaCorporateHonor selectByPrimaryKey(Integer id) {
        OaCorporateHonor oaCorporateHonor = oaCorporateHonorMapper.selectByPrimaryKey(id);
        oaCorporateHonor.setReleaseDateStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaCorporateHonor.getReleaseDate()));
        return oaCorporateHonor;
    }

    @Override
    public List<OaCorporateHonor> selectLatestData() {
        List<OaCorporateHonor> oaCorporateHonorList = oaCorporateHonorMapper.selectLatestData();
        for (OaCorporateHonor oaCorporateHonor : oaCorporateHonorList) {
            oaCorporateHonor.setReleaseDateStr(DateUtil.dateConvertYYYYMMDDHHMM(oaCorporateHonor.getReleaseDate()));
        }
        return oaCorporateHonorList;
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaCorporateHonorMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int batchDeleteHonor(String[] ids) {
        return oaCorporateHonorMapper.batchDeleteHonor(ids);
    }
}
