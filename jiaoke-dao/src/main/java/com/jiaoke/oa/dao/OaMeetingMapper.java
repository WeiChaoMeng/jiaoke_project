package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaMeeting;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 会议
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaMeetingMapper extends Mapper<OaMeeting> {

    /**
     * 插入数据
     *
     * @param oaMeeting oaMeeting
     * @return int
     */
    int insertData(OaMeeting oaMeeting);

    /**
     * 根据业务Id选择
     *
     * @param ids idList
     * @return list
     */
    List<OaMeeting> selectByBusinessId(@Param("ids") List<Integer> ids);
}
