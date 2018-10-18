package com.jiake.utils;

import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.util.Properties;

/**
 * 读取资源文件工具类
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/12 15:38
 */
public class OaResources {
    private static ClassLoader DEFAULT_CLASSLOADER = null;

    public static Properties readAsProperties(String name) {
        return readAsProperties(name, null);
    }

    public static Properties readAsProperties(String name, String charset) {

        InputStream in = null;
        Properties prop = null;
        Reader reader = null;
        try {
            in = getResourceAsStream(name);
            prop = new Properties();
            if (StringUtils.isBlank(charset)) {
                prop.load(in);
            } else {
                reader = new InputStreamReader(in, charset);
                prop.load(reader);
            }


        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {

            if (in != null) {

                try {

                    in.close();
                } catch (IOException e) {

                    e.printStackTrace();
                }
            }

        }

        return prop;
    }

    public static InputStream getResourceAsStream(String name) {

        return getClassLoader().getResourceAsStream(name);
    }

    public static URL getResource(String name) {

        return getClassLoader().getResource(name);
    }

    public static ClassLoader getClassLoader() {

        if (DEFAULT_CLASSLOADER != null) {

            return DEFAULT_CLASSLOADER;
        }

        return Thread.currentThread().getContextClassLoader();
    }

    public static void setDefaultClassloader(ClassLoader defaultClassloader) {

        DEFAULT_CLASSLOADER = defaultClassloader;
    }
}
