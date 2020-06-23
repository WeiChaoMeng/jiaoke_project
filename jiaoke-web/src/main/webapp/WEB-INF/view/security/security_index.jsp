<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>监控</title>
    <link href="../../../static/css/security/security_common.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="aerial-view-style">
    <img src="../../../static/images/security/vertical_view-1.jpg" style="width: 100%;height: 100%">

    <div class="office-zone"></div>

    <div class="production-zone"></div>

    <div class="monitor-preview-view1" id="monitorPreviewView1">
        <div class="monitor-preview-view-name">1号机组操作间</div>
        <img class="monitor-preview-view-close" src="../../../static/images/security/close.png" onclick="closeMonitorPreviewView1()">
        <div style="height: calc(100% - 30px);">
            <div class="crew-content-row">
                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle1-1.jpg" onclick="guard('760303618','1')">
                </div>

                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle1-2.jpg" onclick="guard('760303618','2')">
                </div>

                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle1-3.jpg" onclick="guard('760303618','3')">
                </div>

                <div class="crew-content-passage" style="margin: 0">
                    <img src="../../../static/cockpit/img/passage/aisle1-4.jpg" onclick="guard('760303618','4')">
                </div>
            </div>

            <div class="crew-content-row">
                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle1-5.jpg" onclick="guard('760303618','5')">
                </div>

                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle1-6.jpg" onclick="guard('760303618','6')">
                </div>

                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle1-7.jpg" onclick="guard('760303618','7')">
                </div>

                <div class="crew-content-passage" style="margin: 0">
                    <img src="../../../static/cockpit/img/passage/aisle1-8.jpg" onclick="guard('760303618','8')">
                </div>
            </div>

            <div class="crew-content-row">
                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle1-9.jpg" onclick="guard('760303618','9')">
                </div>

                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle1-10.jpg" onclick="guard('760303618','10')">
                </div>

                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle1-11.jpg" onclick="guard('760303618','11')">
                </div>

                <div class="crew-content-passage" style="margin: 0">
                    <img src="../../../static/cockpit/img/passage/aisle1-12.jpg" onclick="guard('760303618','12')">
                </div>
            </div>

            <div class="crew-content-row">
                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle1-13.jpg" onclick="guard('760303618','13')">
                </div>

                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle1-14.jpg" onclick="guard('760303618','14')">
                </div>

                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle1-15.jpg" onclick="guard('760303618','15')">
                </div>

                <div class="crew-content-passage" style="margin: 0">
                    <img src="../../../static/cockpit/img/passage/aisle1-16.jpg" onclick="guard('760303618','16')">
                </div>
            </div>
        </div>
    </div>

    <img src="../../../static/cockpit/img/passage/crew1.png" style="position: absolute;left: 73%;top: 66%;" title="1号机组"  onclick="openMonitorPreviewView1()">

    <div class="monitor-preview-view1" id="monitorPreviewView2">
        <div class="monitor-preview-view-name">2号机组操作间</div>
        <img class="monitor-preview-view-close" src="../../../static/images/security/close.png" onclick="closeMonitorPreviewView2()">
        <div style="height: calc(100% - 30px);">
            <div class="crew-content-row">
                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle2-1.jpg" onclick="guard('C60480112','1')">
                </div>

                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle2-2.jpg" onclick="guard('C60480112','2')">
                </div>

                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle2-3.jpg" onclick="guard('C60480112','3')">
                </div>

                <div class="crew-content-passage" style="margin: 0">
                    <img src="../../../static/cockpit/img/passage/aisle2-4.jpg" onclick="guard('C60480112','4')">
                </div>
            </div>

            <div class="crew-content-row">
                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle2-5.jpg" onclick="guard('C60480112','5')">
                </div>

                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle2-6.jpg" onclick="guard('C60480112','6')">
                </div>

                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle2-7.jpg" onclick="guard('C60480112','7')">
                </div>

                <div class="crew-content-passage" style="margin: 0">
                    <img src="../../../static/cockpit/img/passage/aisle2-8.jpg" onclick="guard('C60480112','8')">
                </div>
            </div>

            <div class="crew-content-row">
                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle2-9.jpg" onclick="guard('C60480112','9')">
                </div>

                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle2-10.jpg" onclick="guard('C60480112','10')">
                </div>

                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle2-11.jpg" onclick="guard('C60480112','11')">
                </div>

                <div class="crew-content-passage" style="margin: 0">
                    <img src="../../../static/cockpit/img/passage/aisle2-12.jpg" onclick="guard('C60480112','12')">
                </div>
            </div>

            <div class="crew-content-row">
                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle2-13.jpg" onclick="guard('C60480112','13')">
                </div>

                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle2-14.jpg" onclick="guard('C60480112','14')">
                </div>

                <div class="crew-content-passage">
                    <img src="../../../static/cockpit/img/passage/aisle2-15.jpg" onclick="guard('C60480112','15')">
                </div>

                <div class="crew-content-passage" style="margin: 0">
                    <img src="../../../static/cockpit/img/passage/aisle2-16.jpg" onclick="guard('C60480112','16')">
                </div>
            </div>
        </div>
    </div>
    <img src="../../../static/cockpit/img/passage/crew2.png" style="position: absolute;left: 84%;top: 66%;" title="2号机组" onclick="openMonitorPreviewView2()">

    <shiro:hasPermission name="D1303461201">
        <div class="dyndmkn-region">
            <img class="dyndmkn-position" onclick="guard('D13034612','1')" title="东院南大门口内"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461202">
        <div class="dyndmkw-region">
            <img class="dyndmkw-position" onclick="guard('D13034612','2')" title="东院南大门口外"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461203">
        <div class="dybglqxxd-region">
            <img class="dybglqxxd-position" onclick="guard('D13034612','3')" title="东院办公楼前西向东"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461204">

        <div class="dyzdsysdxx-region">
            <img class="dyzdsysdxx-position" onclick="guard('D13034612','4')" title="东院正达实验室东向西"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461205">
        <div class="dybglqdxx-region">
            <img class="dybglqdxx-position" onclick="guard('D13034612','5')" title="东院办公楼前东向西"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461206">
        <div class="dyydcxgcnxb-region">
            <img class="dyydcxgcnxb-position" onclick="guard('D13034612','6')" title="东院运动场小广场南向北"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461207">
        <div class="dynmztdbxn-region">
            <img class="dynmztdbxn-position" onclick="guard('D13034612','7')" title="东院南门主通道北向南"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461208">
        <div class="dybglhdtddxx-region">
            <img class="dybglhdtddxx-position" onclick="guard('D13034612','8')" title="东院办公楼后东通道东向西"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461209">
        <div class="dybglzdtd-region">
            <img class="dybglzdtd-position" onclick="guard('D13034612','9')" title="东院办公楼正达通道"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461210">
        <div class="dybgllctd-region">
            <img class="dybgllctd-position" onclick="guard('D13034612','10')" title="东院办公楼路驰通道"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461211">
        <div class="dycws-region">
            <img class="dycws-position" onclick="guard('D13034612','11')" title="东院财务室"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461212">
        <div class="dybglxcnxb-region">
            <img class="dybglxcnxb-position" onclick="guard('D13034612','12')" title="东院办公楼西侧南向北"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461213">
        <div class="dygnglxctdnxb-region">
            <img class="dygnglxctdnxb-position" onclick="guard('D13034612','13')" title="东院供暖锅炉房西侧通道南向北"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461214">
        <div class="dybglhtdxxd-region">
            <img class="dybglhtdxxd-position" onclick="guard('D13034612','14')" title="东院办公楼后通道西向东"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461215">
        <div class="dyyqz-region">
            <img class="dyyqz-position" onclick="guard('D13034612','15')" title="东院燃气站"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461216">
        <div class="xlhlcdhtd-region">
            <img class="xlhlcdhtd-position" onclick="guard('D13034612','16')" title="小龙河料车等候通道"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461217">
        <div class="dydbnctddxx-region">
            <img class="dydbnctddxx-position" onclick="guard('D13034612','17')" title="东院地磅南侧通道东向西"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461218">
        <div class="dydbnctdxxd-region">
            <img class="dydbnctdxxd-position" onclick="guard('D13034612','18')" title="东院地磅南侧通道西向东"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461219">
        <div class="dyxmdxx-region">
            <img class="dyxmdxx-position" onclick="guard('D13034612','19')" title="东院西门东向西"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461220">
        <div class="dydbbctddxx-region">
            <img class="dydbbctddxx-position" onclick="guard('D13034612','20')" title="东院地磅北侧通道东向西"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461221">
        <div class="dydbbctdxxd-region">
            <img class="dydbbctdxxd-position" onclick="guard('D13034612','21')" title="东院地磅北侧通道西向东"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461222">
        <div class="dydbdcbtdbxn-region">
            <img class="dydbdcbtdbxn-position" onclick="guard('D13034612','22')" title="东院地磅东侧北通道北向南"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461223">
        <div class="dypdsxctdnxb-region">
            <img class="dypdsxctdnxb-position" onclick="guard('D13034612','23')" title="东院配电室西侧通道南向北"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461224">
        <div class="dyxmbxn-region">
            <img class="dyxmbxn-position" onclick="guard('D13034612','24')" title="东院西门北向南"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461225">
        <div class="dyxmwdxx-region">
            <img class="dyxmwdxx-position" onclick="guard('D13034612','25')" title="东院西门外东向西"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461226">
        <div class="dyslkntdxxd-region">
            <img class="dyslkntdxxd-position" onclick="guard('D13034612','26')" title="东院石料库南通道西向东"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461227">
        <div class="dyslkxmnxb-region">
            <img class="dyslkxmnxb-position" onclick="guard('D13034612','27')" title="东院石料库西门南向北"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461228">
        <div class="dy1hjnctdxxd-region">
            <img class="dy1hjnctdxxd-position" onclick="guard('D13034612','28')" title="东院1号机南侧通道西向东"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461229">
        <div class="dyslknbtdnxb-region">
            <img class="dyslknbtdnxb-position" onclick="guard('D13034612','29')" title="东院石料库南北通道南向北"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461230">
        <div class="dy1hjnctdbxn-region">
            <img class="dy1hjnctdbxn-position" onclick="guard('D13034612','30')" title="东院1号机南侧通道北向南"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461231">
        <div class="dy1hjnslk-region">
            <img class="dy1hjnslk-position" onclick="guard('D13034612','31')" title="东院1号机南上料口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461232">
        <div class="dy1hjbslk-region">
            <img class="dy1hjbslk-position" onclick="guard('D13034612','32')" title="东院1号机北上料口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461233">
        <div class="dy2hjslk-region">
            <img class="dy2hjslk-position" onclick="guard('D13034612','33')" title="东院2号机上料口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303461234">
        <div class="dy1hjzjtd-region">
            <img class="dy1hjzjtd-position" onclick="guard('D13034612','34')" title="东院1号机中间通道"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487001">
        <div class="dy2hjnslk-region">
            <img class="dy2hjnslk-position" onclick="guard('D13034870','1')" title="东院2号机南上料口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487002">
        <div class="dy2hjbslk-region">
            <img class="dy2hjbslk-position" onclick="guard('D13034870','2')" title="东院2号机北上料口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487003">
        <div class="dyslknbtdbxn-region">
            <img class="dyslknbtdbxn-position" onclick="guard('D13034870','3')" title="东院石料库南北通道北向南"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487004">
        <div class="dyslkffc-region">
            <img class="dyslkffc-position" onclick="guard('D13034870','4')" title="东院石料库废粉池"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487005">
        <div class="dylqgqdctdnxb-region">
            <img class="dylqgqdctdnxb-position" onclick="guard('D13034870','5')" title="东院沥青罐区东侧通道南向北"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487006">
        <div class="dy1hjcpltd-region">
            <img class="dy1hjcpltd-position" onclick="guard('D13034870','6')" title="东院1号机成品料通道"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487007">
        <div class="dy1hjfftd-region">
            <img class="dy1hjfftd-position" onclick="guard('D13034870','7')" title="东院1号机废粉通道"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487008">
        <div class="dy2hjcpltd-region">
            <img class="dy2hjcpltd-position" onclick="guard('D13034870','8')" title="东院2号机成品料通道"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487009">
        <div class="dy2hjfftd-region">
            <img class="dy2hjfftd-position" onclick="guard('D13034870','9')" title="东院2号机废粉通道"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487010">
        <div class="dy1hjyscdhq-region">
            <img class="dy1hjyscdhq-position" onclick="guard('D13034870','10')" title="东院1号机运输车等候区"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487011">
        <div class="dy2hjzwxj-region">
            <img class="dy2hjzwxj-position" onclick="guard('D13034870','11')" title="东院2号机组维修间"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487012">
        <div class="dy12hjztdxxd-region">
            <img class="dy12hjztdxxd-position" onclick="guard('D13034870','12')" title="东院1.2号机中通道西向东"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487013">
        <div class="dy2hjzslk-region">
            <img class="dy2hjzslk-position" onclick="guard('D13034870','13')" title="东院2号机再生料库"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487014">
        <div class="dyssmq-region">
            <img class="dyssmq-position" onclick="guard('D13034870','14')" title="东院宿舍门前"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487015">
        <div class="dyxyk1-region">
            <img class="dyxyk1-position" onclick="guard('D13034870','15')" title="东院卸油口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487016">
        <div class="dyxyk2-region">
            <img class="dyxyk2-position" onclick="guard('D13034870','16')" title="东院卸油口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487017">
        <div class="dykfssmq-region">
            <img class="dykfssmq-position" onclick="guard('D13034870','17')" title="东院库房.宿舍门前"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487018">
        <div class="dykfmq-region">
            <img class="dykfmq-position" onclick="guard('D13034870','18')" title="东院库房门前"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487019">
        <div class="dyxyk3-region">
            <img class="dyxyk4-position" onclick="guard('D13034870','19')" title="卸油口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487020">
        <div class="dyxyk4-region">
            <img class="dyxyk4-position" onclick="guard('D13034870','20')" title="卸油口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487021">
        <div class="dyhlq-region">
            <img class="dyhlq-position" onclick="guard('D13034870','21')" title="东院糊沥青"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487022">
        <div class="dy2hjyscdhq-region">
            <img class="dy2hjyscdhq-position" onclick="guard('D13034870','22')" title="东院2号机运输车等候区"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487023">
        <div class="dyglfczj-region">
            <img class="dyglfczj-position" onclick="guard('D13034870','23')" title="东院锅炉房操作间"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487024">
        <div class="dy2hjbc-region">
            <img class="dy2hjbc-position" onclick="guard('D13034870','24')" title="东院2号机北侧"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487025">
        <div class="dy2hjslqbxn-region">
            <img class="dy2hjslqbxn-position" onclick="guard('D13034870','25')" title="东院2号机上料区北向南"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487026">
        <div class="dygqbxn-region">
            <img class="dygqbxn-position" onclick="guard('D13034870','26')" title="东院罐区北向南"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487027">
        <div class="dyljz-region">
            <img class="dyljz-position" onclick="guard('D13034870','27')" title="东院垃圾站"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487028">
        <div class="dyxctdbxn-region">
            <img class="dyxctdbxn-position" onclick="guard('D13034870','28')" title="东院西侧通道北向南"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487029">
        <div class="xystbxn-region">
            <img class="xystbxn-position" onclick="guard('D13034870','29')" title="西院食堂北向南"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487030">
        <div class="xystxxd-region">
            <img class="xystxxd-position" onclick="guard('D13034870','30')" title="西院食堂西向东"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487031">
        <div class="xynccjnc-region">
            <img class="xynccjnc-position" onclick="guard('D13034870','31')" title="西院南侧车间南侧"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487032">
        <div class="xylzsxc-region">
            <img class="xylzsxc-position" onclick="guard('D13034870','32')" title="西院冷再生西侧"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487033">
        <div class="xybtdxxd-region">
            <img class="xybtdxxd-position" onclick="guard('D13034870','33')" title="西院北通道西向东"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487034">
        <div class="xylzsxlk-region">
            <img class="xylzsxlk-position" onclick="guard('D13034870','34')" title="西院冷再生卸料口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D1303487035">
        <div class="dybglwdmk-region">
            <img class="dybglwdmk-position" onclick="guard('D13034870','35')" title="东院办公楼外大门口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357401">
        <div class="xysysxtdbxn-region">
            <img class="xysysxtdbxn-position" onclick="guard('D68963574','1')" title="西院实验室西通道北向南"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357402">
        <div class="xyzmbxn-region">
            <img class="xyzmbxn-position" onclick="guard('D68963574','2')" title="西院正门北向南"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357403">
        <div class="xylzscpltd-region">
            <img class="xylzscpltd-position" onclick="guard('D68963574','3')" title="西院冷再生成品料通道"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357404">
        <div class="xyzmnxb-region">
            <img class="xyzmnxb-position" onclick="guard('D68963574','4')" title="西院正门南向北"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357405">
        <div class="xypscjdrk-region">
            <img class="xypscjdrk-position" onclick="guard('D68963574','5')" title="西院破碎车间东入口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357406">
        <div class="xypscjsltdxx-region">
            <img class="xypscjsltdxx-position" onclick="guard('D68963574','6')" title="西院破碎车间上料台东向西"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357407">
        <div class="xypscjclq-region">
            <img class="xypscjclq-position" onclick="guard('D68963574','7')" title="西院破碎车间储料区"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357408">
        <div class="xypscjjldrk-region">
            <img class="xypscjjldrk-position" onclick="guard('D68963574','8')" title="西院破碎车间进料东入口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357409">
        <div class="xydbfdxx-region">
            <img class="xydbfdxx-position" onclick="guard('D68963574','9')" title="西院地磅房东向西"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357410">
        <div class="xycxtccrk-region">
            <img class="xycxtccrk-position" onclick="guard('D68963574','10')" title="西院晨曦停车场入口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357411">
        <div class="xypscjnkq1-region">
            <img class="xypscjnkq1-position" onclick="guard('D68963574','11')" title="西院破碎车间南库区1"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357413">
        <div class="xypscjnkq2-region">
            <img class="xypscjnkq2-position" onclick="guard('D68963574','13')" title="西院破碎车间南库区2"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357414">
        <div class="xypscjjznxb-region">
            <img class="xypscjjznxb-position" onclick="guard('D68963574','14')" title="西院破碎车间机组南向北"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357415">
        <div class="xypscjnkq3-region">
            <img class="xypscjnkq3-position" onclick="guard('D68963574','15')" title="西院破碎车间南库区3"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357412">
        <div class="xysxlbxn-region">
            <img class="xysxlbxn-position" onclick="guard('D68963574','12')" title="西院水洗料北向南"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357416">
        <div class="xysxlcdc-region">
            <img class="xysxlcdc-position" onclick="guard('D68963574','16')" title="西院水洗料沉淀池"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357417">
        <div class="xysxlslt-region">
            <img class="xysxlslt-position" onclick="guard('D68963574','17')" title="西院水洗料上料台"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357418">
        <div class="xysxldxn-region">
            <img class="xysxldxn-position" onclick="guard('D68963574','18')" title="西院水洗料东向西"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357419">
        <div class="xypscjnxb-region">
            <img class="xypscjnxb-position" onclick="guard('D68963574','19')" title="西院破碎车间南向北"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357420">
        <div class="xypscjxxd-region">
            <img class="xypscjxxd-position" onclick="guard('D68963574','20')" title="西院破碎车间西向东"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357421">
        <div class="xylzschxpd-region">
            <img class="xylzschxpd-position" onclick="guard('D68963574','21')" title="西院冷再生粗环型皮带"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357422">
        <div class="xylzsxhxpd-region">
            <img class="xylzsxhxpd-position" onclick="guard('D68963574','22')" title="西院冷再生细环型皮带"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357423">
        <div class="xyllc-region">
            <img class="xyllc-position" onclick="guard('D68963574','23')" title="西院冷料仓"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357424">
        <div class="xylzscptd1-region">
            <img class="xylzscptd1-position" onclick="guard('D68963574','24')" title="西院冷再生成品通道1"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357425">
        <div class="xylzscptd2-region">
            <img class="xylzscptd2-position" onclick="guard('D68963574','25')" title="西院冷再生成品通道2"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357426">
        <div class="xylzszdsjlk-region">
            <img class="xylzszdsjlk-position" onclick="guard('D68963574','26')" title="西院冷再生最顶上进料口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357427">
        <div class="xypscjslk-region">
            <img class="xypscjslk-position" onclick="guard('D68963574','27')" title="西院破碎车间上料口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357428">
        <div class="xypscjxlk-region">
            <img class="xypscjxlk-position" onclick="guard('D68963574','28')" title="西院破碎车间细料口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357429">
        <div class="xypscjclk-region">
            <img class="xypscjclk-position" onclick="guard('D68963574','29')" title="西院破碎车间粗料口"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357430">
        <div class="xypscjzpd-region">
            <img class="xypscjzpd-position" onclick="guard('D68963574','30')" title="西院破碎车间主皮带"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357431">
        <div class="xypscj1-region">
            <img class="xypscj1-position" onclick="guard('D68963574','31')" title="西院破碎车间"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>

    <shiro:hasPermission name="D6896357432">
        <div class="xypscj2-region">
            <img class="xypscj2-position" onclick="guard('D68963574','32')" title="西院破碎车间"
                 src="../../../static/images/security/dian.png">
        </div>
    </shiro:hasPermission>
    <%--图例--%>
    <div class="signal-region">
        <div>
            <span class="signal-region-name">厂区安全监控分布图</span>
        </div>

        <div class="legend-region">
            <span class="legend-region-name">图例</span>

            <div class="legend-region-content">
                <span class="boundary-legend-img"></span>
                <span class="boundary-legend-name">厂区边界</span>
            </div>

            <div class="legend-region-content">
                <span class="boundary-legend-img" style="border: 2px dashed #0345ff;"></span>
                <span class="boundary-legend-name">办公区</span>
            </div>

            <div class="legend-region-content">
                <span class="boundary-legend-img" style="border: 2px dashed #61b91e;"></span>
                <span class="boundary-legend-name">生产区</span>
            </div>

            <div class="legend-region-content">
                <img class="scope-location-img" src="../../../static/images/security/sxt.png">
                <span class="scope-location-name">监控位置</span>
            </div>

            <div class="legend-region-content">
                <span class="scope-legend-img"></span>
                <span class="scope-legend-name">监控范围</span>
            </div>
        </div>
    </div>
</div>

<div id="myPlayer" style="display: none"></div>

</body>
<script type="text/javascript" src="../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../static/js/security/security_common.js"></script>
<script src="../../../static/js/oa/layer/layer.js"></script>
<script src="../../../static/EZUIKit/ezuikit.js"></script>
<script>
    function guard(serial, channel) {
        window.lar = layer.open({
            title: false,
            type: 1,
            area: ['800px', '448px'],
            shadeClose: false, //点击遮罩关闭
            shade: 0.8,
            content: $("#myPlayer"),
            offset: ['10%', '25%'],
            closeBtn: 2,
            cancel: function (index, layero) {
                layer.close(index);
                player.stop();
            },
            success: function (layero, index) {
            }
        });

        $.ajax({
            type: "post",
            url: '${path}/security/getAccessToken',
            async: false,
            dataType: 'json',
            success: function (data) {
                player = new EZUIPlayer({
                    id: 'myPlayer',
                    url: 'ezopen://open.ys7.com/' + serial + '/' + channel + '.hd.live',
                    autoplay: true,
                    accessToken: data,
                    decoderPath: '../../../static/EZUIKit/',
                    width: 800,
                    height: 448,
                    splitBasis: 1
                });
            },
            error: function (result) {
                layer.msg("出错！");
            }
        });
    }

    //1号机监控视图
    function openMonitorPreviewView1() {
        $('#monitorPreviewView2').css('display','none');
        $('#monitorPreviewView1').css('display','block');
    }

    function closeMonitorPreviewView1() {
        $('#monitorPreviewView1').css('display','none');
    }

    //2号机监控视图
    function openMonitorPreviewView2() {
        $('#monitorPreviewView1').css('display','none');
        $('#monitorPreviewView2').css('display','block');
    }

    function closeMonitorPreviewView2() {
        $('#monitorPreviewView2').css('display','none');
    }
</script>
</html>
