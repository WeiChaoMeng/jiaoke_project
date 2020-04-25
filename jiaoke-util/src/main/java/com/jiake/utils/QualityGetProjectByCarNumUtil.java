/**
 * FileName: QualityGetProjectByCarNumUtil
 * author:   Melone
 * Date:     2020/4/16 10:19
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiake.utils;

import com.ab.cip.handler.HeaderUtils;
import com.ab.cip.handler.RequestHeader;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.axiom.om.OMAbstractFactory;
import org.apache.axiom.om.OMElement;
import org.apache.axiom.om.OMFactory;
import org.apache.axiom.om.OMNamespace;
import org.apache.axis2.AxisFault;
import org.apache.axis2.addressing.EndpointReference;
import org.apache.axis2.client.Options;
import org.apache.axis2.rpc.client.RPCServiceClient;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.xml.sax.InputSource;

import javax.xml.namespace.QName;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

//import com.ab.cip.handler.RequestHeader;

//import com.ab.cip.handler.RequestHeader;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/4/16 10:19
 * @Description:
 */
public class QualityGetProjectByCarNumUtil {


    static String arg1 = "";
    static String url = "";
    static String repack = "";
    static String method = "";
    static String filename = "";


//    String CLIENT_SYSTEM_CODE = "client_system_code";
//    String MESSAGE_ID = "message_id";
//    String CLIENT_REQUEST_DT = "client_request_dt";
//    String CLIENT_IP = "client_ip";
//    String CIP_RECEIVE_REQUEST_DT = "cip_receive_request_dt";
//    String MESSAGE_ID_ORIGINAL = "message_id_original";
//    String CORRELATION_ID = "correlation_id";
//    String REPLY_OPERATION = "reply_operation";
//    String SYS_HEADER = "sys_header";
//    String BIZ_HEADER = "biz_header";
    /**
     * 返回发货记录的信息
     * @param carNum  车号
     * @param createDate  日期
     * @return
     */
    public static String getGhqrd(String carNum,String createDate){
        String fhjg = "";
        arg1 = "";
        boolean fhz = true;
        StringBuffer fhxml = new StringBuffer();
        try{
            Date date = new Date();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String today = format.format(date);
            //如果出现乱码请将此处的GBK改为UTF
            StringBuffer xml = new StringBuffer("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
            xml.append("<PACKET type=\"REQUEST\" version=\"1.0\">");
            /*****  <Head> 可以随意定义  也可以不写   *****/
            xml.append("<Head>");
            xml.append("<FuncName>获取发货记录的信息</FuncName>");
            xml.append("<TransDate>");
            xml.append(today.split(" ")[0]);
            xml.append("</TransDate>");
            xml.append("<TransTime>");
            xml.append(today.split(" ")[1]);
            xml.append("</TransTime>");
            xml.append("</Head>");
            /*****  <Head> 结束   *****/
            /*****  <Body>部分必须写以下参数 carNum,createDate*****/
            xml.append("<Body>");
            xml.append("<carNum>"+carNum+"</carNum>");
            xml.append("<createDate>"+createDate+"</createDate>");
            xml.append("</Body>");
            /*****  <Body> 结束   *****/
            xml.append("</PACKET>");
            System.out.println("请求获取用户"+xml);
            /*****  接口连接   必须写   固定值  不要改*****/
            url = "http://119.90.97.107:9022/services/XmlGhqrd";
            repack = "http://services.com";
            method = "getValues";
            /***** *****/
            //发出请求
            try{
                fhxml.append(fsqq(url,repack,method,xml,1,"getGhqrd"));
            }catch (AxisFault e) {
                fhz = false;
                arg1 = "获取供货确认单中出现异常！";
            }catch (Exception e) {
                fhz = false;
                arg1 = "获取供货确认单中出现异常！";
            }
            //解析请求
            if(fhz)fhjg = jxdh(fhxml);
        } catch (Exception e1) {
            arg1 = "操作失败！查询过程中出现异常！";
            e1.printStackTrace();
        } finally {
            try {

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return fhjg;
    }

    /**
     * 发送请求获取返回值的方法
     * @param url		请求地址
     * @param bao		包名地址
     * @param ff		方法名
     * @param xml		待传出的xml
     * @param flag		唯一标识id
     * @param bs		代表是哪个接口（FuncCode的值）
     * @return
     * @throws AxisFault
     */
    public static StringBuffer fsqq(String url,String bao,String ff,StringBuffer xml,int flag,String bs) throws AxisFault{
        //请求的xml生成文件(可以不要) 生成发送的xml文件
//        createFile(xml,flag,bs,"request");

        StringBuffer fhxml = new StringBuffer();
        //RPCServiceClient是RPC方式调用
        RPCServiceClient client = new RPCServiceClient();
        //2分钟
        client.getOptions().setTimeOutInMilliSeconds(120000L);
        Options options = client.getOptions();
        //设置调用WebService的URL
        EndpointReference epf = new EndpointReference(url);
        options.setTo(epf);

        client.addHeader(createHeaderOMElement());
        if(bao==null)bao = "";
        QName qname = new QName(bao, ff);

        Object[] result = client.invokeBlocking(qname,new Object[]{xml.toString()},new Class[]{String.class});
        System.out.println(result);
        fhxml.append(result[0]);
        client.cleanupTransport();

        //返回的xml生成文件
        // 生成返回的xml文件(可以不要)
//        createFile(fhxml,flag,bs,"response");
//        System.out.println("服务器返回："+fhxml);
        return fhxml;
    }

    /**
     * 创建头
     * @return
     */
    public static OMElement createHeaderOMElement() {
        OMFactory factory = OMAbstractFactory.getOMFactory();
        OMNamespace CIPHeaderElementNamespace = factory.createOMNamespace("",
                "");
        OMElement CIPHeaderOM = factory.createOMElement(
                RequestHeader.SYS_HEADER, CIPHeaderElementNamespace);

        // 消息ID
        OMElement MessageIdOM = factory.createOMElement(
                RequestHeader.MESSAGE_ID, CIPHeaderElementNamespace);
        // 客户端服务器IP
        OMElement ClientIPOM = factory.createOMElement(RequestHeader.CLIENT_IP,
                CIPHeaderElementNamespace);
        // 客户端系统标识
        OMElement ClientSysIDOM = factory.createOMElement(
                RequestHeader.CLIENT_SYSTEM_CODE, CIPHeaderElementNamespace);
        // 客户端调用时间
        OMElement ClientRQDTOM = factory.createOMElement(
                RequestHeader.CLIENT_REQUEST_DT, CIPHeaderElementNamespace);

        MessageIdOM.setText(HeaderUtils.createMessageId("AH008", "abcd"));
        ClientIPOM.setText(HeaderUtils.getLocalHostIP());
        ClientSysIDOM.setText("AH008");
        ClientRQDTOM.setText(HeaderUtils.getCurrentSysTime());

        CIPHeaderOM.addChild(MessageIdOM);
        CIPHeaderOM.addChild(ClientIPOM);
        CIPHeaderOM.addChild(ClientSysIDOM);
        CIPHeaderOM.addChild(ClientRQDTOM);
        return CIPHeaderOM;
    }


    /**
     * 解析Xml方法
     * @param xml
     * @return
     */
    public static String jxdh(StringBuffer xml){

        Map<String,String> map = new HashMap<>();
        StringReader read = new StringReader(xml.toString());
        InputSource source = new InputSource(read);
        //SAXBuilder使用一个第三方的SAX解析器,可以从不同的输入源来构造JDOM文档对象
        SAXBuilder builder = new SAXBuilder();
        //得到xml
        try {
            Document doc = builder.build(source);
            Element root = doc.getRootElement().getChild("Body");
            int re = Integer.parseInt(root.getChildText("Result"));
            //arg1 = root.getChildText("Msgs")+"("+filename+")";
            map.put("gcmc",root.getChildText("gcmc"));
            map.put("khmc",root.getChildText("khmc"));
            map.put("gdm",root.getChildText("gdm"));
            map.put("gysm",root.getChildText("gysm"));
            map.put("sgdw",root.getChildText("sgdw"));
            map.put("ch",root.getChildText("ch"));
            map.put("fhrq",root.getChildText("fhrq"));
            map.put("fhsj",root.getChildText("fhsj"));
            map.put("yj",root.getChildText("yj"));
            map.put("scsl",root.getChildText("scsl"));
            map.put("cpmc",root.getChildText("cpmc"));
            map.put("jz",root.getChildText("jz"));
            map.put("Result",root.getChildText("Result"));
            map.put("Msgs",root.getChildText("Msgs"));
        } catch (Exception e) {
            arg1 = "xml文件解析时出现异常！";
            System.out.println(xml);
            e.printStackTrace();
        }
        if (map == null || map.size() < 1){
            return "";
        }
        return JSON.toJSONString(map);
    }


    public static String getArg1() {
        return arg1;
    }
    /**
     * 生成XML文件的方法
     * @param xml		待传出的xml
     * @param flag		唯一标识id
     * @param bs		代表是哪个接口（FuncCode的值）
     * @param qq		request/response
     */
    public static void createFile(StringBuffer xml,int flag,String bs,String qq){
        File  file = null;
        //路径+request/response+FuncCode的值+id
        String sPath = "C:/test/"+qq+bs+flag+".xml";
        if("request".equals(qq)) filename = qq+bs+flag+".xml";
        try{
            FileOutputStream bw1 = null;
            //建立文件
            file = new File(sPath);
            file.createNewFile();
            bw1 = new FileOutputStream(file);
            Writer bw = new OutputStreamWriter(bw1,"UTF-8");
            bw.write(xml.toString());
            bw.close();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try {
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    public static  String getErpData(String crewNum,String carDate) throws InterruptedException{
        Thread.sleep(600000);
        String ghqrd = getGhqrd(crewNum,carDate);
        Map<String,String> map = (Map) JSONObject.parse(ghqrd);
        int count = 0;
        //判断是否查询到出厂单
        while (map == null ||!("0".equals(map.get("Result")))){
                Thread.sleep(600000);
                ghqrd = getGhqrd(crewNum,carDate);
                //计算查询时间用 count * 10分钟
                count++;
                if (count == 11){
                    break;
                }
        }
        return ghqrd;
    }
//    public static void main(String[] args) {//114.242.85.231  www.lqerp.com
//
//
//        String url = "http://119.90.97.107:9022/services/XmlGhqrd";
//        String bao = "http://services.com";
//        String ff = "getValues";
//        String carNum = "京AFX833";
//        String createDate = "2020-03-31";
//        /******************************方法二   start***************************************************/
//        System.out.println("****************方法二  strat******************");
//        getGhqrd(carNum,createDate);
//        System.out.println("****************方法二  end******************");
//    }



}
