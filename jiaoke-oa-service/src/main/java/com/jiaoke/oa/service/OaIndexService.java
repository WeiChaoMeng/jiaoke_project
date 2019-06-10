package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActTemporary;

/**
 * OA模块首页
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:44
 */
public interface OaIndexService {

    /**
     * 查询基本数据信息
     *
     * @param businessKey 业务键
     * @return OaActTemporary
     */
    OaActTemporary selectSimpleData(String businessKey);

    /**
     * 根据id获取nickname
     *
     * @param id id
     * @return nickname
     */
    String getNicknameById(Integer id);
}
