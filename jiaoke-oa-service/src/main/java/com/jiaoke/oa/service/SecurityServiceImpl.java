package com.jiaoke.oa.service;

import com.jiaoke.oa.dao.SecurityMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 厂区安全
 *
 * @author lihui
 * @version 1.0
 * @date 2020-5-15 16:02
 */
@Service
public class SecurityServiceImpl implements SecurityService{

    @Resource
    private SecurityMapper securityMapper;

    @Override
    public int updateAccessToken(String accessToken) {
        return securityMapper.updateAccessToken(accessToken);
    }

    @Override
    public String getAccessToken() {
        return securityMapper.getAccessToken();
    }
}
