package com.jiaoke.controller.oa;

import com.google.gson.Gson;
import com.jiake.utils.OaResources;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * @author lihui
 * @version 1.0
 * @date 2019-5-23 14:39
 */

@Controller
@RequestMapping(value = "/fileDownloadHandle")
public class DownLoadServlet {

    private static String FILE_PATH;
    private static String DOWNLOAD_PATH;

    static {
        String name = "conf/db.properties";
        Properties props = OaResources.readAsProperties(name);
        FILE_PATH = props.getProperty("file.path");
        DOWNLOAD_PATH = props.getProperty("download.path");
    }

    /**
     * * 如果SFTP器配置Nginx，可通过URL路径直接下载文件
     *      *
     * @param fileName 文件名称
     * @param request request
     * @param response response
     * @throws IOException e
     */
    @RequestMapping(value = "/download")
    @ResponseBody
    public void fileDownNg(String fileName, HttpServletRequest request, HttpServletResponse response) throws IOException {
        BufferedInputStream dis = null;
        BufferedOutputStream fos = null;

        try {
            String url = DOWNLOAD_PATH + URLEncoder.encode(fileName, "utf-8");
            String realName = fileName.substring(fileName.indexOf("_") + 1);
            URL httpUrl = new URL(url);
            response.setContentType("application/x-msdownload;");
            response.setHeader("Content-disposition", "attachment; filename=" + URLEncoder.encode(realName,"UTF-8"));
            response.setHeader("Content-Length", String.valueOf(httpUrl.openConnection().getContentLength()));

            dis = new BufferedInputStream(httpUrl.openStream());
            fos = new BufferedOutputStream(response.getOutputStream());

            byte[] buff = new byte[1024];
            int bytesRead;
            while (-1 != (bytesRead = dis.read(buff, 0, buff.length))) {
                fos.write(buff, 0, bytesRead);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (dis != null) {
                dis.close();
            }
            if (fos != null) {
                fos.close();
            }

        }
    }


//    @RequestMapping(value = "/download")
//    @ResponseBody
    public void download(String fileName, HttpServletRequest request, HttpServletResponse response) throws IOException {

        fileName = URLDecoder.decode(fileName,"UTF-8");
//        fileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
        //得到要下载的文件
        File file = new File(FILE_PATH + fileName);
        //如果文件不存在
        if (!file.exists()) {
            Map<String, Object> map = new HashMap<>(16);
            map.put("message", "您要下载的资源已被删除！！");
            writeJson(response, map);
            return;
        }
        //处理文件名
        String realname = fileName.substring(fileName.indexOf("_") + 1);
        //设置响应头，控制浏览器下载该文件
        response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(realname, "UTF-8"));
        //读取要下载的文件，保存到文件输入流
        FileInputStream in = new FileInputStream(FILE_PATH + "\\" + fileName);
        //创建输出流
        OutputStream out = response.getOutputStream();
        //创建缓冲区
        byte buffer[] = new byte[1024];
        int len = 0;
        //循环将输入流中的内容读取到缓冲区当中
        while ((len = in.read(buffer)) > 0) {
            //输出缓冲区的内容到浏览器，实现文件下载
            out.write(buffer, 0, len);
        }
        //关闭文件输入流
        in.close();
        //关闭输出流
        out.close();
    }

    /**
     * @param filename     要下载的文件名
     * @param saveRootPath 上传文件保存的根目录，也就是/WEB-INF/upload目录
     * @return 要下载的文件的存储目录
     */
    private String findFileSavePathByFileName(String filename, String saveRootPath) {
        int hashcode = filename.hashCode();
        //0--15
        int dir1 = hashcode & 0xf;
        //0-15
        int dir2 = (hashcode & 0xf0) >> 4;
        //upload\2\3  upload\3\5
        String dir = saveRootPath + "\\" + dir1 + "\\" + dir2;
        File file = new File(dir);
        if (!file.exists()) {
            //创建目录
            file.mkdirs();
        }
        return dir;
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
}
