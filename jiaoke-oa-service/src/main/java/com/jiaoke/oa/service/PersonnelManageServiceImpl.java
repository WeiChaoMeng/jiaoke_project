package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.DataAnalysis;
import com.jiaoke.oa.bean.PersonnelInfo;
import com.jiaoke.oa.bean.UserContract;
import com.jiaoke.oa.dao.PersonnelManageMapper;
import com.jiaoke.oa.dao.UserContractMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    private UserContractMapper userContractMapper;

    @Resource
    private PersonnelManageMapper personnelManageMapper;

    @Override
    public int addPersonnelInfo(PersonnelInfo personnelInfo) {
        return personnelManageMapper.insertSelective(personnelInfo);
    }

    @Override
    public List<PersonnelInfo> getPersonnelBasicData() {
        return personnelManageMapper.getPersonnelBasicData();
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        if (personnelManageMapper.deleteByPrimaryKey(id) < 0) {
            return -1;
        } else {
            if (userContractMapper.deleteByRelevanceId(id) < 0) {
                return -1;
            } else {
                return 1;
            }
        }
    }

    @Override
    public PersonnelInfo selectByPrimaryKey(Integer id) {
        return personnelManageMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(PersonnelInfo personnelInfo) {
        personnelInfo.setAge(DateUtil.getAge(DateUtil.stringConvertYYYYMMDD(personnelInfo.getBirthday())));
        personnelInfo.setWorkingYears(DateUtil.getAge(DateUtil.stringConvertYYYYMM(personnelInfo.getJoinWorkDate())));
        return personnelManageMapper.updateByPrimaryKeySelective(personnelInfo);
    }

    @Override
    public int appendContract(int id) {
        if (personnelManageMapper.updateContractState(id) < 0) {
            return -1;
        } else {
            UserContract userContract = new UserContract();
            userContract.setPersonnelId(id);
            userContract.setFirstTerm(0);
            userContract.setRenewTerm(0);
            userContract.setLastTerm(0);
            userContract.setContractTerm(0);
            userContractMapper.insertSelective(userContract);
            return 0;
        }

    }

    @Override
    public Map<String, Integer> getHomePageData() {
        Map<String, Integer> map = new HashMap<>(16);

        List<Integer> workType = personnelManageMapper.getWorkType();
        int ownEmployees = 0;
        int outsourcingWorkers = 0;
        map.put("totalNumber", workType.size());
        for (Integer integer : workType) {
            if (integer == 0) {
                ownEmployees++;
            } else {
                outsourcingWorkers++;
            }
            map.put("ownEmployees", ownEmployees);
            map.put("outsourcingWorkers", outsourcingWorkers);
        }

        //性别划分
        List<DataAnalysis> sexCount = personnelManageMapper.getSexCount();
        for (DataAnalysis dataAnalysis : sexCount) {
            if ("男".equals(dataAnalysis.getSex())) {
                map.put("man", dataAnalysis.getSexNumber());
            } else {
                map.put("woman", dataAnalysis.getSexNumber());
            }
        }

        //学历划分:0.初中及以下，1.高中，2.技校，3.中专，4.专科，5.本科，6.硕士，7.博士
        List<DataAnalysis> educationCount = personnelManageMapper.getEducationCount();
        for (DataAnalysis dataAnalysis : educationCount) {
            if (dataAnalysis.getEducation() == 0) {
                map.put("education0", dataAnalysis.getEducationNum());
            } else if (dataAnalysis.getEducation() == 1) {
                map.put("education1", dataAnalysis.getEducationNum());
            } else if (dataAnalysis.getEducation() == 2) {
                map.put("education2", dataAnalysis.getEducationNum());
            } else if (dataAnalysis.getEducation() == 3) {
                map.put("education3", dataAnalysis.getEducationNum());
            } else if (dataAnalysis.getEducation() == 4) {
                map.put("education4", dataAnalysis.getEducationNum());
            } else if (dataAnalysis.getEducation() == 5) {
                map.put("education5", dataAnalysis.getEducationNum());
            } else if (dataAnalysis.getEducation() == 6) {
                map.put("education6", dataAnalysis.getEducationNum());
            } else if (dataAnalysis.getEducation() == 7) {
                map.put("education7", dataAnalysis.getEducationNum());
            }
        }

        //技术等级划分 0.未取证，1.初级，2.中级，3.高级，4.技师，5.高级技师
        List<DataAnalysis> technologyCount = personnelManageMapper.getTechnologyCount();
        for (DataAnalysis dataAnalysis : technologyCount) {
            if (dataAnalysis.getTechnology() == 0) {
                map.put("technology0", dataAnalysis.getTechnologyNum());
            } else if (dataAnalysis.getTechnology() == 1) {
                map.put("technology1", dataAnalysis.getTechnologyNum());
            } else if (dataAnalysis.getTechnology() == 2) {
                map.put("technology2", dataAnalysis.getTechnologyNum());
            } else if (dataAnalysis.getTechnology() == 3) {
                map.put("technology3", dataAnalysis.getTechnologyNum());
            } else if (dataAnalysis.getTechnology() == 4) {
                map.put("technology4", dataAnalysis.getTechnologyNum());
            } else if (dataAnalysis.getTechnology() == 5) {
                map.put("technology5", dataAnalysis.getTechnologyNum());
            }
        }

        //职称划分:0.未取得职称，1.员级，2.助理，3.中级，4.副高级，5.正高级
        List<DataAnalysis> titleCount = personnelManageMapper.getTitleCount();
        for (DataAnalysis dataAnalysis : titleCount) {
            if (dataAnalysis.getTitle() == 0) {
                map.put("title0", dataAnalysis.getTitleNum());
            } else if (dataAnalysis.getTitle() == 1) {
                map.put("title1", dataAnalysis.getTitleNum());
            } else if (dataAnalysis.getTitle() == 2) {
                map.put("title2", dataAnalysis.getTitleNum());
            } else if (dataAnalysis.getTitle() == 3) {
                map.put("title3", dataAnalysis.getTitleNum());
            } else if (dataAnalysis.getTitle() == 4) {
                map.put("title4", dataAnalysis.getTitleNum());
            } else if (dataAnalysis.getTitle() == 5) {
                map.put("title5", dataAnalysis.getTitleNum());
            }
        }

        //户口性质划分 0.本埠城镇，1.本埠农村，2.外埠城镇，3.外埠农村
        List<DataAnalysis> accountCount = personnelManageMapper.getAccountCount();
        for (DataAnalysis dataAnalysis : accountCount) {
            if (dataAnalysis.getAccount() == 0) {
                map.put("account0", dataAnalysis.getAccountNum());
            } else if (dataAnalysis.getAccount() == 1) {
                map.put("account1", dataAnalysis.getAccountNum());
            } else if (dataAnalysis.getAccount() == 2) {
                map.put("account2", dataAnalysis.getAccountNum());
            } else if (dataAnalysis.getAccount() == 3) {
                map.put("account3", dataAnalysis.getAccountNum());
            }
        }

        //职务等级划分 0.领导班子，1.中层管理人员，2.一般管理人员，3.一线生产工人，4.其它
        List<DataAnalysis> jobCount = personnelManageMapper.getJobCount();
        for (DataAnalysis dataAnalysis : jobCount) {
            if (dataAnalysis.getJob() == 0) {
                map.put("job0", dataAnalysis.getJobNum());
            } else if (dataAnalysis.getJob() == 1) {
                map.put("job1", dataAnalysis.getJobNum());
            } else if (dataAnalysis.getJob() == 2) {
                map.put("job2", dataAnalysis.getJobNum());
            } else if (dataAnalysis.getJob() == 3) {
                map.put("job3", dataAnalysis.getJobNum());
            } else if (dataAnalysis.getJob() == 4) {
                map.put("job4", dataAnalysis.getJobNum());
            }
        }

        //职工年龄饼状图 年龄段：35（含）以下，36-45（含），46-55(含)，56以上
        List<Integer> age = personnelManageMapper.getAllAge();
        int age0 = 0;
        int age1 = 0;
        int age2 = 0;
        int age3 = 0;
        for (Integer integer : age) {
            if (integer < 36) {
                age0++;
            } else if (integer > 35 & integer < 46) {
                age1++;
            } else if (integer > 45 & integer < 56) {
                age2++;
            } else if (integer > 55) {
                age3++;
            }
        }
        map.put("age0", age0);
        map.put("age1", age1);
        map.put("age2", age2);
        map.put("age3", age3);
        return map;
    }

    @Override
    public List<PersonnelInfo> entryManage() throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        List<PersonnelInfo> personnelInfoList = personnelManageMapper.entryManage();
        for (PersonnelInfo personnelInfo : personnelInfoList) {
            //转正7天前提示
            int i = calculateTimeDifferenceByUnit(simpleDateFormat.parse(personnelInfo.getCorrectionDate()), 7);
            personnelInfo.setFlag(i);
        }
        return personnelInfoList;
    }

    @Override
    public List<PersonnelInfo> waitLeave() {
        return personnelManageMapper.waitLeave();
    }

    @Override
    public List<PersonnelInfo> alreadyLeave() {
        return personnelManageMapper.alreadyLeave();
    }

    @Override
    public List<PersonnelInfo> retireManage() {
        return personnelManageMapper.retireManage();
    }

    @Override
    public List<PersonnelInfo> jobChangeManage() {
        return personnelManageMapper.jobChangeManage();
    }

    @Override
    public int getContractTotal() {
        return userContractMapper.getContractTotal();
    }

    @Override
    public List<UserContract> contractList() {
        return userContractMapper.contractList();
    }

    @Override
    public UserContract getByPrimaryKey(int id) {
        return userContractMapper.getByPrimaryKey(id);
    }

    @Override
    public int updateUserContract(UserContract userContract) {
        if (userContract.getLastTerm() != 0) {
            userContract.setContractTerm(userContract.getLastTerm());
            userContract.setContractSign(userContract.getLastSign());
            userContract.setContractStop(userContract.getLastStop());
        } else if (userContract.getRenewTerm() != 0) {
            userContract.setContractTerm(userContract.getRenewTerm());
            userContract.setContractSign(userContract.getRenewSign());
            userContract.setContractStop(userContract.getRenewStop());
        } else if (userContract.getFirstTerm() != 0) {
            userContract.setContractTerm(userContract.getFirstTerm());
            userContract.setContractSign(userContract.getFirstSign());
            userContract.setContractStop(userContract.getFirstStop());
        }
        return userContractMapper.updateByPrimaryKeySelective(userContract);
    }

    /**
     * 按周期计算时差
     * ps:
     * 参数1 目标时间（格式YYYY-MM-DD）
     * 参数2 时间差
     * 返回值：当前时间与目标时间相差值 <= 参数2 结果 1，否则相反
     *
     * @param date           日期
     * @param timeDifference 时差
     * @return int
     */
    private int calculateTimeDifferenceByUnit(Date date, int timeDifference) {
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
