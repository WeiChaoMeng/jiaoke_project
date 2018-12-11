package com.jiake.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Json工具类
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/19 9:41
 */
public class JsonHelper {

    private static Logger logger = LoggerFactory.getLogger(JsonHelper.class);

    public static <T> T parseObject(String jsonString, Class<T> clazz) {
        logger.debug("[ json to object : " + jsonString + " ]");
        return JSON.parseObject(jsonString, clazz);
    }

    public static String toJSONString(Object object) {
        return JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss", SerializerFeature.WriteDateUseDateFormat);
    }

}
