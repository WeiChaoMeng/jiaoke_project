package com.jiaoke.oa.service;

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
     * 发送全部
     *
     * @param wageStatisticsId 工资统计id
     * @return NumberOfAffectedRows
     */
    int sendAll(int wageStatisticsId);

    /**
     * 通过工资统计Id得到总数
     *
     * @param wageStatisticsId 工资统计id
     * @return total
     */
    int getTotalByWageStatisticsId(int wageStatisticsId);

    /**
     * 通过工资统计Id获得分页
     *
     * @param wageStatisticsId 工资统计id
     * @param page             page
     * @param rows             rows
     * @return list
     */
    List<OaPersonalWages> getPagingByWageStatisticsId(int wageStatisticsId, int page, int rows);

    /**
     * 根据登录人昵称获取工资
     *
     * @param nickName 登录人昵称
     * @return OaPersonalWages
     */
    OaPersonalWages getPersonalWagesByNickName(String nickName);
}
