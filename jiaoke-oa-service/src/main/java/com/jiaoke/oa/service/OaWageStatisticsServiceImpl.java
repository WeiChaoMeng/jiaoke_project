package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiake.utils.ExcelUtils;
import com.jiake.utils.RandomUtil;
import com.jiaoke.oa.bean.OaPersonalWages;
import com.jiaoke.oa.bean.OaWageStatistics;
import com.jiaoke.oa.dao.OaPersonalWagesMapper;
import com.jiaoke.oa.dao.OaWageStatisticsMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 工资统计
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/28 2:58
 */
@Service
public class OaWageStatisticsServiceImpl implements OaWageStatisticsService {

    @Resource
    private OaPersonalWagesMapper oaPersonalWagesMapper;

    @Resource
    private OaWageStatisticsMapper oaWageStatisticsMapper;

    @Override
    public int importPersonalWages(MultipartFile file) throws IOException {
        int result = 0;
        //获取工资统计id
        Integer wageStatisticsId = RandomUtil.random();
        List<String[]> list = ExcelUtils.readExcel(file);
        //获取结算日期
        String settlementDate = list.get(0)[list.get(0).length - 1];

        try {
            //批量插入excel
            result = oaPersonalWagesMapper.insertMultiTerm(list, String.valueOf(wageStatisticsId));
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (result > 0) {
            //查询实发总额
            BigDecimal grossActualAmount = oaPersonalWagesMapper.getGrossActualAmount(wageStatisticsId);
            OaWageStatistics oaWageStatistics = new OaWageStatistics();
            oaWageStatistics.setId(wageStatisticsId);
            oaWageStatistics.setName(file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf(".")));
            oaWageStatistics.setGrossActualAmount(grossActualAmount.toString());
            oaWageStatistics.setSettlementDate(settlementDate);
            oaWageStatistics.setOverallNumberPeople(String.valueOf(list.size()));
            oaWageStatistics.setCreateDate(new Date());
            //插入到工资统计
            int i = oaWageStatisticsMapper.insertSelective(oaWageStatistics);
            if (i > 0) {
                return result;
            } else {
                return i;
            }
        } else {
            return result;
        }
    }

    @Override
    public List<OaWageStatistics> getAllRegularEmployee() {
        List<OaWageStatistics> wageStatisticsList = oaWageStatisticsMapper.getAllRegularEmployee();
        for (OaWageStatistics oaWageStatistics : wageStatisticsList) {
            oaWageStatistics.setCreateDateStr(DateUtil.getStringDate(oaWageStatistics.getCreateDate()));
        }
        return wageStatisticsList;
    }

    @Override
    public int sendAll(int wageStatisticsId) {
        return oaPersonalWagesMapper.updateStateByWageStatisticsId(wageStatisticsId,1);
    }

    @Override
    public int getTotalByWageStatisticsId(int wageStatisticsId) {
        return oaPersonalWagesMapper.getTotalByWageStatisticsId(wageStatisticsId);
    }

    @Override
    public List<OaPersonalWages> getPagingByWageStatisticsId(int wageStatisticsId, int page, int rows) {
        int one = 1;
        int start = (page - one) * rows;
        return oaPersonalWagesMapper.getPagingByWageStatisticsId(wageStatisticsId, start, rows);
    }

    @Override
    public OaPersonalWages getPersonalWagesByNickName(String nickName) {
        return oaPersonalWagesMapper.getPersonalWagesByNickName(nickName);
    }
}
