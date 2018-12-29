package com.jiake.utils;

import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.request.OapiGettokenRequest;
import com.dingtalk.api.response.OapiGettokenResponse;
import com.taobao.api.ApiException;

/**
 * 钉钉
 *
 * @author lihui
 * @version 1.0
 * @date 2018/12/29 14:47
 */
public class DingDingUtil {

    /**
     * 获取AccessToken(正常情况下AccessToken有效期为7200秒，有效期内重复获取返回相同结果，并自动续期)
     *
     * @return AccessToken
     * @throws ApiException
     */
    public static String getAccessToken() throws ApiException {
        String appkey = "ding65fmltgg5v96gdrj";
        String corpSecret = "dLAhYyB-MdxVU6tKzMILWMiZDlo6QpkDdFA_IhASGPbPWGopF3Xa_pXjPSeJH4KK";
        DefaultDingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/gettoken");
        OapiGettokenRequest request = new OapiGettokenRequest();
        request.setAppkey(appkey);
        request.setAppsecret(corpSecret);
        request.setHttpMethod("GET");
        OapiGettokenResponse response = client.execute(request);
        return response.getAccessToken();
    }


}
