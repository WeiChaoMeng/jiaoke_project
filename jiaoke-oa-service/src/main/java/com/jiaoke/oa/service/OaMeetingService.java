package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaMeeting;

import java.util.List;
import java.util.Map;

/**
 * 会议
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaMeetingService {

    /**
     * 新增
     *
     * @param oaMeeting oaMeeting
     * @return int
     */
    int insertSelective(OaMeeting oaMeeting);

    /**
     * 根据业务Id选择
     *
     * @param ids idList
     * @return list
     */
    List<OaMeeting> selectByBusinessId(List<Integer> ids);

    /**
     * 查询历史会议
     *
     * @param ids idList
     * @param map map
     * @return list
     */
    List<OaMeeting> selectHistoricMeeting(List<Integer> ids, Map<String, String> map);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return oaMeeting
     */
    OaMeeting selectByPrimaryKey(Integer id);


}
