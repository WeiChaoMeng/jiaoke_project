package com.jiaoke.controller;

import com.alibaba.fastjson.JSONObject;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.service.SecurityService;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;

/**
 * 厂区安全
 *
 * @author lihui
 * @version 1.0
 * @date 2020-5-15 16:02
 */
@Controller
@RequestMapping(value = "/security")
public class SecurityController {

    @Resource
    private SecurityService securityService;

    /**
     * 获取accessToken
     *
     * @return accessToken
     */
    @RequestMapping(value = "/getAccessToken")
    @ResponseBody
    public String getAccessToken() {
        String accessToken = securityService.getAccessToken();
        return JsonHelper.toJSONString(accessToken);
    }

    @Scheduled(cron = "0 0 23 * * ?")
    public void updateAccessToken() {
        String dataString = sendPost("https://open.ys7.com/api/lapp/token/get", "appKey=d20ead7b125648bdaa472af62e3ec8c6&appSecret=d8ac0f34f857e8738d17c57aa6481566");
        String accessTokenData = JSONObject.parseObject(dataString).getString("data");
        String accessToken = JSONObject.parseObject(accessTokenData).getString("accessToken");
        securityService.updateAccessToken(accessToken);
    }

    /**
     * 向指定 URL 发送POST方法的请求
     *
     * @param url   发送请求的 URL
     * @param param 请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return 所代表远程资源的响应结果
     */
    private static String sendPost(String url, String param) {
        System.out.println("执行");
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输出流、输入流
        finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }
}
