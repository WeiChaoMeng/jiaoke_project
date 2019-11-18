package com.jiake.utils;

import java.io.File;
import java.util.Properties;

/**
 * 文件(附件)上传
 *
 * @author lihui
 * @version 1.0
 * @date 2019-11-6 0:59
 */
public class FileUploadUtil {

    private static String FILE_PATH;

    static {
        String name = "conf/db.properties";
        Properties props = OaResources.readAsProperties(name);
        FILE_PATH = props.getProperty("file.path");
    }

    public static void deleteFile(String fileName) {
        String filePath = FILE_PATH + fileName;
        new File(filePath).delete();
    }
}
