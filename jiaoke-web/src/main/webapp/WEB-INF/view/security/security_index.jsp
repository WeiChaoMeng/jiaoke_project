<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>监控</title>
    <link href="../../../static/css/security/security_common.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="aerial-view-style">
    <img src="../../../static/images/security/vertical_view.jpg" style="width: 100%;height: 100%">

    <div class="dyndmkn-region">
        <img class="dyndmkn-position position-action" onclick="guard('D13034612','1')" title="东院南大门口内" src="../../../static/images/security/dian.png">
    </div>

    <div class="dyndmkw-region">
        <img class="dyndmkw-position position-action" onclick="guard('D13034612','2')" title="东院南大门口外" src="../../../static/images/security/dian.png">
    </div>

    <div class="dybglqxxd-region">
        <img class="dybglqxxd-position" onclick="guard('D13034612','3')" title="东院办公楼前西向东" src="../../../static/images/security/dian.png">
    </div>

    <div class="dyzdsysdxx-region">
        <img class="dyzdsysdxx-position" onclick="guard('D13034612','4')" title="东院正达实验室东向西" src="../../../static/images/security/dian.png">
    </div>

    <div class="dybglqdxx-region">
        <img class="dybglqdxx-position" onclick="guard('D13034612','5')" title="东院办公楼前东向西" src="../../../static/images/security/dian.png">
    </div>

    <div class="dyydcxgcnxb-region">
        <img class="dyydcxgcnxb-position" onclick="guard('D13034612','6')" title="东院运动场小广场南向北" src="../../../static/images/security/dian.png">
    </div>

    <div class="dynmztdbxn-region">
        <img class="dynmztdbxn-position" onclick="guard('D13034612','7')" title="东院南门主通道北向南" src="../../../static/images/security/dian.png">
    </div>

    <div class="dybglhdtddxx-region">
        <img class="dybglhdtddxx-position" onclick="guard('D13034612','8')" title="东院办公楼后东通道东向西" src="../../../static/images/security/dian.png">
    </div>

    <div class="dybglzdtd-region">
        <img class="dybglzdtd-position" onclick="guard('D13034612','9')" title="东院办公楼正达通道" src="../../../static/images/security/dian.png">
    </div>

    <div class="dybgllctd-region">
        <img class="dybgllctd-position" onclick="guard('D13034612','10')" title="东院办公楼路驰通道" src="../../../static/images/security/dian.png">
    </div>

    <div class="dycws-region">
        <img class="dycws-position" onclick="guard('D13034612','11')" title="东院财务室" src="../../../static/images/security/dian.png">
    </div>

    <div class="dybglxcnxb-region">
        <img class="dybglxcnxb-position" onclick="guard('D13034612','12')" title="东院办公楼西侧南向北" src="../../../static/images/security/dian.png">
    </div>

    <div class="dygnglxctdnxb-region">
        <img class="dygnglxctdnxb-position" onclick="guard('D13034612','13')" title="东院供暖锅炉房西侧通道南向北" src="../../../static/images/security/dian.png">
    </div>

    <div class="dybglhtdxxd-region">
        <img class="dybglhtdxxd-position" onclick="guard('D13034612','14')" title="东院办公楼后通道西向东" src="../../../static/images/security/dian.png">
    </div>

    <div class="dyyqz-region">
        <img class="dyyqz-position" onclick="guard('D13034612','15')" title="东院燃气站" src="../../../static/images/security/dian.png">
    </div>

    <div class="xlhlcdhtd-region">
        <img class="xlhlcdhtd-position" onclick="guard('D13034612','16')" title="小龙河料车等候通道" src="../../../static/images/security/dian.png">
    </div>

    <div class="dydbnctddxx-region">
        <img class="dydbnctddxx-position" onclick="guard('D13034612','17')" title="东院地磅南侧通道东向西" src="../../../static/images/security/dian.png">
    </div>

    <div class="dydbnctdxxd-region">
        <img class="dydbnctdxxd-position" onclick="guard('D13034612','18')" title="东院地磅南侧通道西向东" src="../../../static/images/security/dian.png">
    </div>

    <div class="dyxmdxx-region">
        <img class="dyxmdxx-position" onclick="guard('D13034612','19')" title="东院西门东向西" src="../../../static/images/security/dian.png">
    </div>

    <div class="dydbbctddxx-region">
        <img class="dydbbctddxx-position" onclick="guard('D13034612','20')" title="东院地磅北侧通道东向西" src="../../../static/images/security/dian.png">
    </div>

    <div class="dydbbctdxxd-region">
        <img class="dydbbctdxxd-position" onclick="guard('D13034612','21')" title="东院地磅北侧通道西向东" src="../../../static/images/security/dian.png">
    </div>

    <div class="dydbdcbtdbxn-region">
        <img class="dydbdcbtdbxn-position" onclick="guard('D13034612','22')" title="东院地磅东侧北通道北向南" src="../../../static/images/security/dian.png">
    </div>

    <div class="dyxmbxn-region">
        <img class="dyxmbxn-position" onclick="guard('D13034612','24')" title="东院西门北向南" src="../../../static/images/security/dian.png">
    </div>

    <div class="dyxmwdxx-region">
        <img class="dyxmwdxx-position" onclick="guard('D13034612','25')" title="东院西门外东向西" src="../../../static/images/security/dian.png">
    </div>

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
                <span class="scope-legend-img"></span>
                <span class="scope-legend-name">监控范围</span>
            </div>

            <div class="legend-region-content">
                <img class="scope-location-img" src="../../../static/images/security/sxt.png">
                <span class="scope-location-name">监控位置</span>
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

    function guard(serial,channel) {
        window.lar = layer.open({
            title: false,
            type: 1,
            area: ['800px','448px'],
            shadeClose: false, //点击遮罩关闭
            shade:0.8,
            content: $("#myPlayer"),
            offset: ['10%', '25%'],
            closeBtn: 2,
            cancel: function(index, layero){
                layer.close(index);
                player.stop();
            },
            success: function(layero, index){
                console.log(layero, index);
            }
        });

        player = new EZUIPlayer({
            id: 'myPlayer',
            url: 'ezopen://open.ys7.com/'+serial+'/'+channel+'.hd.live',
            autoplay: true,
            accessToken: "at.0sz086aecomohov56vp3lpsyc3l9ee37-5q5mfgepqy-1rjjkzx-y3phg5a3t",
            decoderPath: '../../../static/EZUIKit/',
            width: 800,
            height: 448,
            splitBasis: 1
        });
    }
</script>
</html>
