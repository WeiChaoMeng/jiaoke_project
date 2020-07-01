package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiake.utils.ExcelUtils;
import com.jiake.utils.RandomUtil;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.dao.OaOutsourcedStaffMapper;
import com.jiaoke.oa.dao.OaOutsourcedStatisticsMapper;
import com.jiaoke.oa.dao.OaPersonalWagesMapper;
import com.jiaoke.oa.dao.OaWageStatisticsMapper;
import org.apache.shiro.SecurityUtils;
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

    @Resource
    private OaOutsourcedStaffMapper oaOutsourcedStaffMapper;

    @Resource
    private OaOutsourcedStatisticsMapper oaOutsourcedStatisticsMapper;

    /**
     * 获取当前登录用户信息
     *
     * @return userInfo
     */
    private UserInfo getCurrentUser() {
        return (UserInfo) SecurityUtils.getSubject().getPrincipal();
    }

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
            oaWageStatistics.setCreateDate(DateUtil.dateConvertYYYYMMDDHHMMSS(new Date()));
            oaWageStatistics.setUploadUsers(getCurrentUser().getNickname());
            oaWageStatistics.setState(0);
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
    public int deleteRegularStaffByPrimaryKey(Integer id) {
        if (oaWageStatisticsMapper.deleteByPrimaryKey(id) < 0){
            return -1;
        }else{
            if (oaPersonalWagesMapper.deleteByWageStatisticsId(id) < 0){
                return -1;
            }else{
                return 1;
            }
        }
    }

    @Override
    public OaPersonalWages selectRegularStaffById(int id) {
        return oaPersonalWagesMapper.selectRegularStaffById(id);
    }

    @Override
    public int updatePersonalWagesState(Integer id, Integer state) {
        if (oaWageStatisticsMapper.updateState(id,state) < 0){
            return -1;
        }else{
            if (oaPersonalWagesMapper.updateStateByWageStatisticsId(id,state) < 0){
                return -1;
            }
            return 0;
        }
    }

    @Override
    public List<OaWageStatistics> settlementMonthRegularStaffFilter(String settlementDate) {
        return oaWageStatisticsMapper.settlementMonthRegularStaffFilter(settlementDate);
    }

    @Override
    public List<OaPersonalWages> selectRegularStaffByWageStatisticsId(int wageStatisticsId) {
        return oaPersonalWagesMapper.selectRegularStaffByWageStatisticsId(wageStatisticsId);
    }

    @Override
    public List<OaWageStatistics> getAllRegularEmployee() {
        return oaWageStatisticsMapper.getAllRegularEmployee();
    }

    @Override
    public int importOutsourcedStaffWages(MultipartFile file) throws IOException {
        int result = 0;
        //获取工资统计id
        Integer wageStatisticsId = RandomUtil.random();
        List<String[]> list = ExcelUtils.readExcel(file);
        //获取结算日期
        String settlementDate = list.get(0)[list.get(0).length - 1];

        try {
            //批量插入excel
            result = oaOutsourcedStaffMapper.bulkInsertOutsourcedStaff(list, String.valueOf(wageStatisticsId));
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (result > 0) {
            //查询实发总额
            BigDecimal grossActualAmount = oaOutsourcedStaffMapper.getGrossActualAmount(wageStatisticsId);
            OaOutsourcedStatistics outsourcedStatistics = new OaOutsourcedStatistics();
            outsourcedStatistics.setId(wageStatisticsId);
            outsourcedStatistics.setName(file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf(".")));
            outsourcedStatistics.setTotalAmount(grossActualAmount.toString());
            outsourcedStatistics.setSettlementMonth(settlementDate);
            outsourcedStatistics.setTotal(String.valueOf(list.size()));
            outsourcedStatistics.setCreateDate(DateUtil.dateConvertYYYYMMDDHHMMSS(new Date()));
            outsourcedStatistics.setUploadUsers(getCurrentUser().getNickname());
            outsourcedStatistics.setState(0);
            //插入到工资统计
            int i = oaOutsourcedStatisticsMapper.insertSelective(outsourcedStatistics);
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
    public List<OaOutsourcedStatistics> getAllOutsourcedStatistics() {
        return oaOutsourcedStatisticsMapper.selectAll();
    }

    @Override
    public List<OaOutsourcedStaff> selectOutsourcedStaffByWageStatisticsId(int wageStatisticsId) {
        return oaOutsourcedStaffMapper.selectOutsourcedStaffByWageStatisticsId(wageStatisticsId);
    }

    @Override
    public OaOutsourcedStaff selectOutsourcedStaffById(int id) {
        return oaOutsourcedStaffMapper.selectOutsourcedStaffById(id);
    }

    @Override
    public int updateOutsourcingStaffState(Integer id, Integer state) {
        if (oaOutsourcedStatisticsMapper.updateState(id,state) < 0){
            return -1;
        }else{
            if (oaOutsourcedStaffMapper.updateStateByWageStatisticsId(id,state) < 0){
                return -1;
            }
            return 0;
        }
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        if (oaOutsourcedStatisticsMapper.deleteByPrimaryKey(id) < 0){
            return -1;
        }else{
            if (oaOutsourcedStaffMapper.deleteByWageStatisticsId(id) < 0){
                return -1;
            }else{
                return 1;
            }
        }
    }

    @Override
    public List<OaOutsourcedStaff> settlementMonthFilter(String settlementMonth) {
        return oaOutsourcedStatisticsMapper.settlementMonthFilter(settlementMonth);
    }

    @Override
    public List<OaOutsourcedStaff> getOutsourcingStaffByNickName(String nickName) {
        return oaOutsourcedStaffMapper.getOutsourcingStaffByNickName(nickName);
    }

    @Override
    public List<OaPersonalWages> getPersonalWagesByNickName(String nickName) {
        return oaPersonalWagesMapper.getPersonalWagesByNickName(nickName);
    }
}
