package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.PersonnelInfo;
import com.jiaoke.oa.bean.UserContract;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.dao.PersonnelManageMapper;
import com.jiaoke.oa.dao.UserContractMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;

/**
 * 人事管理
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41 转正
 */
@Service
public class PersonnelManageServiceImpl implements PersonnelManageService {

    @Resource
    private UserInfoMapper userInfoMapper;

    @Resource
    private UserContractMapper userContractMapper;

    @Resource
    private PersonnelManageMapper personnelManageMapper;

    @Override
    public List<UserInfo> getUserBasicInfo() {
        List<UserInfo> userBasicInfo = userInfoMapper.getUserBasicInfo();
        for (UserInfo userInfo : userBasicInfo) {
            //入职日期
            if (userInfo.getEntryDate() != null) {
                userInfo.setEntryDateStr(DateUtil.dateConvertYYYYMMDD(userInfo.getEntryDate()));
            }

            //生日
            if (userInfo.getBirthday() != null) {
                userInfo.setBirthdayStr(DateUtil.dateConvertMMDD(userInfo.getBirthday()));
            }

            //年龄
            if (userInfo.getBirthday() != null) {
                userInfo.setAge(DateUtil.getAge(userInfo.getBirthday()));
            }
        }
        return userBasicInfo;
    }

    @Override
    public UserInfo getUserInfoByUseId(Integer userInfoId) {
        UserInfo userInfo = userInfoMapper.getUserInfoByUseId(userInfoId);
        //生日
        if (userInfo.getBirthday() != null) {
            userInfo.setBirthdayStr(DateUtil.dateConvertMMDD(userInfo.getBirthday()));
        }

        //年龄
        if (userInfo.getBirthday() != null) {
            userInfo.setAge(DateUtil.getAge(userInfo.getBirthday()));
        }
        return userInfo;
    }

    @Override
    public List<Integer> getUserStatistical() {
        return userInfoMapper.getUserStatistical();
    }

    @Override
    public List<UserContract> getUserContractData() {
        List<UserContract> userContractList = userContractMapper.getUserContractData();
        for (UserContract contract : userContractList) {
            if (contract.getEntryDate() != null) {
                contract.setEntryDateStr(DateUtil.dateConvertYYYYMMDD(contract.getEntryDate()));
            }

            if (contract.getSingDate() != null) {
                contract.setSingDateStr(DateUtil.dateConvertYYYYMMDD(contract.getSingDate()));
            }

            if (contract.getStartDate() != null) {
                contract.setStartDateStr(DateUtil.dateConvertYYYYMMDD(contract.getStartDate()));
            }

            if (contract.getEndDate() != null) {
                contract.setEndDateStr(DateUtil.dateConvertYYYYMMDD(contract.getEndDate()));

                if (calculateTimeDifferenceByChronoUnit(contract.getEndDate(), 30) == 1) {
                    contract.setExpire(1);
                }
            }
        }
        return userContractList;
    }

    @Override
    public List<UserContract> getProbationUser() {
        List<UserContract> userContractList = userContractMapper.getProbationUser();
        for (UserContract contract : userContractList) {

            if (contract.getPositiveDate() != null) {
                contract.setPositiveDateStr(DateUtil.dateConvertYYYYMMDD(contract.getPositiveDate()));

                if (calculateTimeDifferenceByChronoUnit(contract.getPositiveDate(), 7) == 1) {
                    contract.setExpire(1);
                }
            }

            if (contract.getEndDate() != null) {
                contract.setEndDateStr(DateUtil.dateConvertYYYYMMDD(contract.getEndDate()));
            }
        }
        return userContractList;
    }

    @Override
    public List<UserContract> getDataListByNature(int natureId, int number) {
        List<UserContract> userContractList = userContractMapper.getDataListByNature(natureId, number);
        for (UserContract contract : userContractList) {

            if (contract.getEntryDate() != null) {
                contract.setEntryDateStr(DateUtil.dateConvertYYYYMMDD(contract.getEntryDate()));
            }

            if (contract.getSoonLeaveDate() != null) {
                contract.setSoonLeaveDateStr(DateUtil.dateConvertYYYYMMDD(contract.getSoonLeaveDate()));
            }

            if (contract.getLeaveDate() != null) {
                contract.setLeaveDateStr(DateUtil.dateConvertYYYYMMDD(contract.getLeaveDate()));
            }
        }
        return userContractList;
    }

    @Override
    public int statisticsFormalUser() {
        return userContractMapper.statisticsFormalUser();
    }

    @Override
    public int getUserNameByNature(Integer id) {
        return userContractMapper.getUserNameByNature(id);
    }

    @Override
    public int addPersonnelInfo(PersonnelInfo personnelInfo) {
        personnelInfo.setBirthday(DateUtil.stringConvertYYYYMMDD(personnelInfo.getBirthdayStr()));
        personnelInfo.setJoinPartyDate(DateUtil.stringConvertYYYYMMDD(personnelInfo.getJoinPartyDateStr()));
        personnelInfo.setJoinWorkDate(DateUtil.stringConvertYYYYMMDD(personnelInfo.getJoinWorkDateStr()));
        personnelInfo.setOriginalGraduationDate(DateUtil.stringConvertYYYYMMDD(personnelInfo.getOriginalGraduationDateStr()));
        personnelInfo.setNowGraduationDate(DateUtil.stringConvertYYYYMMDD(personnelInfo.getNowGraduationDateStr()));
        personnelInfo.setCorrectionDate(DateUtil.stringConvertYYYYMMDD(personnelInfo.getCorrectionDateStr()));
        personnelInfo.setEstimateRetirementDate(DateUtil.stringConvertYYYYMMDD(personnelInfo.getEstimateRetirementDateStr()));
        personnelInfo.setRetirementDate(DateUtil.stringConvertYYYYMMDD(personnelInfo.getRetirementDateStr()));
        return personnelManageMapper.insertSelective(personnelInfo);
    }

    /**
     * 按周期计算时差
     *
     * @param date           日期
     * @param timeDifference 时差
     * @return int
     */
    private int calculateTimeDifferenceByChronoUnit(Date date, int timeDifference) {

        int flag = 0;

        SimpleDateFormat s1 = new SimpleDateFormat("yyyy");
        SimpleDateFormat s2 = new SimpleDateFormat("MM");
        SimpleDateFormat s3 = new SimpleDateFormat("dd");
        String year = s1.format(date);
        String month = s2.format(date);
        String dayOfMonth = s3.format(date);

        LocalDate today = LocalDate.now();
        LocalDate oldDate = LocalDate.of(Integer.parseInt(year), Month.of(Integer.parseInt(month)), Integer.parseInt(dayOfMonth));

        long days = ChronoUnit.DAYS.between(today, oldDate);
        if (days <= timeDifference) {
            flag = 1;
        }
        return flag;
    }
}
