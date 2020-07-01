package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaOutsourcedStaff;
import com.jiaoke.oa.bean.OaOutsourcedStatistics;
import com.jiaoke.oa.bean.OaPersonalWages;
import com.jiaoke.oa.bean.OaWageStatistics;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * 工资统计
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/28 2:58
 */
public interface OaWageStatisticsService {

    /**
     * 导入excel
     *
     * @param file file
     * @return NumberOfAffectedRows
     * @throws IOException exc
     */
    int importPersonalWages(MultipartFile file) throws IOException;

    /**
     * 获取所有正式员工
     *
     * @return list
     */
    List<OaWageStatistics> getAllRegularEmployee();

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteRegularStaffByPrimaryKey(Integer id);

    /**
     * 根据ID查询数据
     *
     * @param id id
     * @return list
     */
    OaPersonalWages selectRegularStaffById(int id);

    /**
     * 更新状态
     *
     * @param id    id
     * @param state s
     * @return int
     */
    int updatePersonalWagesState(Integer id, Integer state);

    /**
     * 根据结算月筛选
     *
     * @param settlementDate settlementDate
     * @return o
     */
    List<OaWageStatistics> settlementMonthRegularStaffFilter(String settlementDate);

    /**
     * 根据统计ID查询数据
     *
     * @param wageStatisticsId wageStatisticsId
     * @return list
     */
    List<OaPersonalWages> selectRegularStaffByWageStatisticsId(int wageStatisticsId);

    /**-----------------外包职工-------------------*/
    /**
     * 导入外包职工工资
     *
     * @param file file
     * @return NumberOfAffectedRows
     * @throws IOException exc
     */
    int importOutsourcedStaffWages(MultipartFile file) throws IOException;

    /**
     * 获取外包职工统计数据
     *
     * @return list
     */
    List<OaOutsourcedStatistics> getAllOutsourcedStatistics();

    /**
     * 根据统计ID查询数据
     *
     * @param wageStatisticsId wageStatisticsId
     * @return list
     */
    List<OaOutsourcedStaff> selectOutsourcedStaffByWageStatisticsId(int wageStatisticsId);

    /**
     * 根据ID查询数据
     *
     * @param id id
     * @return list
     */
    OaOutsourcedStaff selectOutsourcedStaffById(int id);

    /**
     * 更新状态
     *
     * @param id    id
     * @param state s
     * @return int
     */
    int updateOutsourcingStaffState(Integer id, Integer state);
    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 根据结算月筛选
     *
     * @param settlementMonth settlementMonth
     * @return o
     */
    List<OaOutsourcedStaff> settlementMonthFilter(String settlementMonth);

    /**-------------------------------------------------*/
    /**
     * 根据登录人昵称获取工资
     *
     * @param nickName 登录人昵称
     * @return OaPersonalWages
     */
    List<OaOutsourcedStaff> getOutsourcingStaffByNickName(String nickName);

    /**
     * 根据登录人昵称获取工资
     *
     * @param nickName 登录人昵称
     * @return OaPersonalWages
     */
    List<OaPersonalWages> getPersonalWagesByNickName(String nickName);
}
