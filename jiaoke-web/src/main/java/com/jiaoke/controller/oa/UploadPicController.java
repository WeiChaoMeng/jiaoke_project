package com.jiaoke.controller.oa;


import com.google.gson.Gson;
import com.jiake.utils.OaResources;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.PosixFilePermission;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 图片上传工具类
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/12 15:16
 */
@Controller
@RequestMapping(value = "/uploadPic")
public class UploadPicController {

    private static String PICTURE_URL;
    private static String PICTURE_PATH;

    static {
        String name = "conf/db.properties";
        Properties props = OaResources.readAsProperties(name);
        PICTURE_URL = props.getProperty("picture.url");
        PICTURE_PATH = props.getProperty("picture.path");
    }

    /**
     * 图片上传
     *
     * @param file     图片文件
     * @param request  request
     * @param response response
     * @throws IOException exc
     */
    @RequestMapping(value = "/uploadImg", method = RequestMethod.POST)
    @ResponseBody
    public void uploadPicture(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, Object> map = new HashMap<>(16);
        File targetFile = null;
        //返回存储路径
        String url = "";
        //获取文件名加后缀
        String fileName = file.getOriginalFilename();
        if (fileName != null && fileName != "") {
            //存储路径http://localhost:8081/
            String returnUrl = PICTURE_URL;
            //文件存储位置
            String path = PICTURE_PATH;
            //文件后缀
            String fileF = fileName.substring(fileName.lastIndexOf("."));
            //新的文件名
            Date date = new Date();
            fileName = date.getTime() + "-" + new Random().nextInt(1000) + fileF;

            File file1 = new File(path);
            //将图片存入文件夹
            targetFile = new File(file1, fileName);
            try {
                //将上传的文件写到服务器上指定的文件。
                file.transferTo(targetFile);
                url = returnUrl + fileName;
                map.put("message", "success");
                map.put("imageFilePaths", url);
            } catch (Exception e) {
                e.printStackTrace();
                map.put("message", "error");
            }
        }
        writeJson(response, map);
    }

    /**
     * NIO方式修改文件权限
     *
     * @param dirFile dirFile
     * @throws IOException e
     */
    private void changeFolderPermission(File dirFile) throws IOException {
        //设置权限
        Set<PosixFilePermission> perms = new HashSet<PosixFilePermission>();
        perms.add(PosixFilePermission.OWNER_READ);
        perms.add(PosixFilePermission.OWNER_WRITE);
        perms.add(PosixFilePermission.OWNER_EXECUTE);
        perms.add(PosixFilePermission.GROUP_READ);
        perms.add(PosixFilePermission.GROUP_WRITE);
        perms.add(PosixFilePermission.GROUP_EXECUTE);
        try {
            Path path = Paths.get(dirFile.getAbsolutePath());
            Files.setPosixFilePermissions(path, perms);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 随机数
     *
     * @return 18位随机数
     */
    private String randomNumber() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String newDate = sdf.format(new Date());
        String result = "";
        Random random = new Random();
        for (int i = 0; i < 4; i++) {
            result += random.nextInt(10);
        }
        return newDate + result;
    }

    /**
     * 输出JSON数据
     *
     * @param response
     * @param jsonStr
     */
    public void writeJson(HttpServletResponse response, String jsonStr) {
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setContentType("text/json;charset=utf-8");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        PrintWriter pw = null;
        try {
            pw = response.getWriter();
            pw.write(jsonStr);
            pw.flush();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pw != null) {
                pw.close();
            }
        }
    }

    /**
     * 向页面响应json字符数组串流.
     *
     * @param response response
     * @param jsonStr  jsonStr
     * @date 2015-1-14 下午4:18:33
     */
    public void writeJsonStr(HttpServletResponse response, String jsonStr) throws IOException {

        OutputStream outStream = null;
        try {
            response.reset();
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setCharacterEncoding("UTF-8");
            outStream = response.getOutputStream();
            outStream.write(jsonStr.getBytes("UTF-8"));
            outStream.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (outStream != null) {
                outStream.close();
            }
        }
    }

    public void writeJsonStr(HttpServletResponse response, InputStream in) throws IOException {

        if (null == in) {
            return;
        }
        OutputStream outStream = null;
        try {
            response.reset();
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Pragma", "No-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            outStream = response.getOutputStream();
            int len = 0;
            byte[] byt = new byte[1024];
            while ((len = in.read(byt)) != -1) {
                outStream.write(byt, 0, len);
            }
            outStream.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (outStream != null) {
                outStream.close();
                in.close();
            }
        }
    }


    /**
     * 输出JSON数据
     *
     * @param response response
     */
    public void writeJson(HttpServletResponse response, Object obj) {
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setContentType("text/json;charset=utf-8");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        PrintWriter pw = null;
        Gson gson = new Gson();
        try {
            pw = response.getWriter();
            pw.write(gson.toJson(obj));
            pw.flush();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pw != null) {
                pw.close();
            }
        }
    }


    /**
     * 输出HTML数据
     *
     * @param response response
     * @param html     html
     */
    public void writeHtml(HttpServletResponse response, String html) {

        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setContentType("text/html;;charset=utf-8");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        PrintWriter pw = null;
        try {
            pw = response.getWriter();
            pw.write(html);
            pw.flush();
        } catch (Exception e) {

        } finally {
            if (pw != null) {
                pw.close();
            }
        }
    }

}
