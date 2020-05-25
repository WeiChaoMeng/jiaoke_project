package com.jiaoke.oa.service;

/**
 * 厂区安全
 *
 * @author lihui
 * @version 1.0
 * @date 2020-5-15 16:02
 */
public interface SecurityService {

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
