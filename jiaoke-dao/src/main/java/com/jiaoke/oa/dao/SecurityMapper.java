package com.jiaoke.oa.dao;

import org.springframework.stereotype.Repository;

/**
 * 厂区安全
 *
 * @author lihui
 * @version 1.0
 * @date 2020-5-15 16:02
 */
@Repository
public interface SecurityMapper {
    /**
     * 更新accessToken
     *
     * @param accessToken accessToken
     * @return int
     */
    int updateAccessToken(String accessToken);

    /**
     * 获取AccessToken
     *
     * @return string
     */
    String getAccessToken();
}
