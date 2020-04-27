package com.jiaoke.controller.oa;

import com.google.gson.Gson;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.OaResources;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

/**
 * @author lihui
 * @version 1.0
 * @date 2019-5-23 13:25
 */
@Controller
@RequestMapping(value = "/fileUploadHandle")
public class FilesUploadHandle {

    private static String FILE_PATH;

    static {
        String name = "conf/db.properties";
        Properties props = OaResources.readAsProperties(name);
        FILE_PATH = props.getProperty("file.path");
    }

    /**
     * 多个文件上传
     *
     * @param files    files
     * @param request  request
     * @param response response
     */
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public void uploadFile(@RequestParam("files") MultipartFile[] files, HttpServletRequest request, HttpServletResponse response) {

        ArrayList<Map<String, Object>> list = new ArrayList<>();

        for (int i = 0; i < files.length; i++) {
            Map<String, Object> map = new HashMap<>(16);
            //消息提示
            String message = "";
            try {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setSizeThreshold(1024 * 100);
                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setHeaderEncoding("UTF-8");
                if (!ServletFileUpload.isMultipartContent(request)) {
                    return;
                }
//                upload.setFileSizeMax(1024 * 1024 * 10);
                upload.setSizeMax(1024 * 1024 * 50);
                String filename = files[i].getOriginalFilename();
                if (filename == null || filename.trim().equals("")) {
                    return;
                }
                filename = filename.substring(filename.lastIndexOf("\\") + 1);
                String fileExtName = filename.substring(filename.lastIndexOf(".") + 1);
                InputStream in = files[i].getInputStream();
                String saveFilename = makeFileName(filename);
                FileOutputStream out = new FileOutputStream(FILE_PATH +  saveFilename);
                byte buffer[] = new byte[1024];
                int len = 0;
                while ((len = in.read(buffer)) > 0) {
                    out.write(buffer, 0, len);
                }
                in.close();
                out.close();

                map.put("message", "success");
                map.put("filePaths", saveFilename);
                map.put("originalName", filename);
            } catch (Exception e) {
                e.printStackTrace();
                map.put("message", "error");
            }
            list.add(map);
        }
        writeJson(response, list);
    }

    /**
     * 单个文件上传
     *
     * @param file     file
     * @param request  request
     * @param response response
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public void upload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) {

        Map<String, Object> map = new HashMap<>(16);

        //消息提示
        String message = "";
        try {
            //1、创建一个DiskFileItemFactory工厂
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //设置缓冲区的大小为100KB，如果不指定，那么缓冲区的大小默认是10KB
            factory.setSizeThreshold(1024 * 100);
            //2、创建一个文件上传解析器
            ServletFileUpload upload = new ServletFileUpload(factory);
            //解决上传文件名的中文乱码
            upload.setHeaderEncoding("UTF-8");
            //3、判断提交上来的数据是否是上传表单的数据
            if (!ServletFileUpload.isMultipartContent(request)) {
                //按照传统方式获取数据
                return;
            }
            //设置上传单个文件的大小的最大值，目前是设置为1024*1024字节，也就是1MB
            upload.setFileSizeMax(1024 * 1024);
            //设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为10MB
            upload.setSizeMax(1024 * 1024 * 10);
            //得到上传的文件名称，
            String filename = file.getOriginalFilename();
            if (filename == null || filename.trim().equals("")) {
                return;
            }
            //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
            filename = filename.substring(filename.lastIndexOf("\\") + 1);
            //得到上传文件的扩展名,如果需要限制上传的文件类型，那么可以通过文件的扩展名来判断上传的文件类型是否合法
            String fileExtName = filename.substring(filename.lastIndexOf(".") + 1);
            //获取item中的上传文件的输入流
            InputStream in = file.getInputStream();
            //得到文件保存的名称
            String saveFilename = makeFileName(filename);
            //创建一个文件输出流
            FileOutputStream out = new FileOutputStream(FILE_PATH + "\\" + saveFilename);
            //创建一个缓冲区
            byte buffer[] = new byte[1024];
            //判断输入流中的数据是否已经读完的标识
            int len = 0;
            //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
            while ((len = in.read(buffer)) > 0) {
                //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                out.write(buffer, 0, len);
            }
            //关闭输入流
            in.close();
            //关闭输出流
            out.close();
            map.put("message", "success");
            map.put("filePaths", saveFilename);
            map.put("originalName", filename);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("message", "error");
        }
        writeJson(response, map);
    }

    /**
     * 删除文件
     *
     * @param fileName fileName
     * @return json
     */
    @RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
    @ResponseBody
    public String deleteFile(String fileName) {
        String filePath = FILE_PATH + fileName;

        File file = new File(filePath);

        if (!file.exists()) {
            return "error";
        } else {
            if (file.delete()) {
                return "success";
            } else {
                return "error";
            }
        }
    }

    /**
     * @param filename 文件的原始名称
     * @return uuid+"_"+文件的原始名称
     */
    private String makeFileName(String filename) {  //2.jpg
        //为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
        return UUID.randomUUID().toString().replace("-", "") + "_" + filename;
    }

    /**
     * 为防止一个目录下面出现太多文件，要使用hash算法打散存储
     *
     * @param filename 文件名，要根据文件名生成存储目录
     * @param savePath 文件存储路径
     * @return 新的存储目录
     */
    private String makePath(String filename, String savePath) {
        //得到文件名的hashCode的值，得到的就是filename这个字符串对象在内存中的地址
        int hashcode = filename.hashCode();
        //0--15
        int dir1 = hashcode & 0xf;
        //0-15
        int dir2 = (hashcode & 0xf0) >> 4;
        //构造新的保存目录
        //upload\2\3  upload\3\5
        String dir = savePath + "\\" + dir1 + "\\" + dir2;
        //File既可以代表文件也可以代表目录
        File file = new File(dir);
        //如果目录不存在
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
