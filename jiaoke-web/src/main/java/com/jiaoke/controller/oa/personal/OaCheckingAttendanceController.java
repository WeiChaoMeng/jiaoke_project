package com.jiaoke.controller.oa.personal;

import com.jiake.utils.DingDingUtil;
import com.taobao.api.ApiException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * OA-个人事务-考勤
 *
 * @author lihui
 * @version 1.0
 * @date 2018/12/29 14:43
 */
@Controller
@RequestMapping(value = "/OaCheckingAttendance")
public class OaCheckingAttendanceController {

    public void se() throws ApiException {
        String accessToken = DingDingUtil.getAccessToken();
    }
}
