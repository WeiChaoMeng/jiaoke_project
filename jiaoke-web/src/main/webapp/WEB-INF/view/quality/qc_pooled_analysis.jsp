<%--
  Created by IntelliJ IDEA.
  User: Melone
  Date: 2020/10/12
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>生产数据汇总分析</title>
    <link href="../../../static/css/qc/pooled_analysis.css" rel="stylesheet" type="text/css"/>
    <script src="../../../static/js/jquery.js"></script>
    <script src="../../../static/js/layer/layer.js"></script>
</head>
<style type="text/css">
    table {
        border-collapse: collapse;
        margin: 0 auto;
        text-align: center;
    }

    table td, table th {
        border: 1px solid #cad9ea;
        color: #666;
        height: 30px;
        width: 25%;
    }

    table thead th {
        background-color: #f2fdfe;
        width: 100px;
    }

    table tr:nth-child(odd) {
        background: #fff;
    }

    table tr:nth-child(even) {
        background: #F5FAFA;
    }
    h2{
        margin-left: 40%;
        font-weight: bold;
        color: #5e5a5a;
    }
    .titleDiv{
        margin: 1% 5%;
        font-weight: bold;
        color: #5e5a5a;
    }
</style>
<body>
<div class="large-content">
    <div class="large-group clearfix">
        <h3 class="large-header">
            <em>生产数据分析</em>
        </h3>
        <div class="large-switch clearfix">

            <div class="large-switch-middle bd">
                <ul class="clearfix">
                    <li class="large-switch-item">
                        <div class="large-item-img">
                            <img src="../../../static/images/qc/pic-001.png" alt="">
                        </div>
                        <div class="large-item-title">产品类型统计</div>
                        <div class="large-item-text">依据产品类型分析各类产品生产情况</div>
                        <a href="#" class="large-item-link" onclick="goProductPooled()" >查看详情</a>
                    </li>
                    <li class="large-switch-item">
                        <div class="large-item-img">
                            <img src="../../../static/images/qc/pic-002.png" alt="">
                        </div>
                        <div class="large-item-title">班组生产统计</div>
                        <div class="large-item-text">根据班组分类分析生产情况</div>
                        <a href="#" class="large-item-link"  onclick="goSquadPooled()">查看详情</a>
                    </li>
                    <li class="large-switch-item">
                        <div class="large-item-img">
                            <img src="../../../static/images/qc/pic-003.png" alt="">
                        </div>
                        <div class="large-item-title">再生料统计</div>
                        <div class="large-item-text">根据日期时间段统计再生料使用情况</div>
                        <a href="#" class="large-item-link" onclick="goRegenerationPooled()"  >查看详情</a>
                    </li>
                    <li class="large-switch-item">
                        <div class="large-item-img">
                            <img src="../../../static/images/qc/pic-004.png" alt="">
                        </div>
                        <div class="large-item-title">工程用料统计</div>
                        <div class="large-item-text">根据工程类型统计各类生产情况</div>
                        <a href="#" class="large-item-link" onclick="goProjectPooled()" >查看详情</a>
                    </li>

                    <li class="large-switch-item-clear">
                        <div class="large-switch-dx">敬请期待</div>
                    </li>
                </ul>

            </div>
        </div>
    </div>
</div>
<input type="text" value="${path}" id="path" style="display: none" >

<script type="text/javascript">
    // jQuery(".large-switch").slide({
    //     autoPlay: false,
    //     trigger: "click",
    //     delayTime: 1000
    // });
    layer.config({
        extend: 'myskin/style.css', //加载您的扩展样式
        skin: 'layer-ext-yourskin'
    });
    function goProductPooled() {
        var path = $("#path").val();
        layer.open({
            type: 2,
            title: '产品类型统计',
            skin: 'layer-ext-yourskin',
            shadeClose: true,
            shade: false,
            scrollbar:false,
            maxmin: true, //开启最大化最小化按钮
            area: ['90%', '90%'],
            content: path + '/qc_pooled_product.do'
        });
    }
    
    function goRegenerationPooled() {
        var path = $("#path").val();
        layer.open({
            type: 2,
            title: '再生使用统计',
            skin: 'layer-ext-yourskin',
            shadeClose: true,
            shade: false,
            scrollbar:false,
            maxmin: true, //开启最大化最小化按钮
            area: ['90%', '90%'],
            content: path + '/qc_pooled_regenerate.do'
        });
    }

    function goSquadPooled() {
        var path = $("#path").val();
        layer.open({
            type: 2,
            title: '班组生产统计',
            skin: 'layer-ext-yourskin',
            shadeClose: true,
            shade: false,
            scrollbar:false,
            maxmin: true, //开启最大化最小化按钮
            area: ['90%', '90%'],
            content: path + '/qc_pooled_squad.do'
        });
    }
    
    function goProjectPooled() {
        var path = $("#path").val();
        layer.open({
            type: 2,
            title: '工程统计',
            skin: 'layer-ext-yourskin',
            shadeClose: true,
            shade: false,
            scrollbar:false,
            maxmin: true, //开启最大化最小化按钮
            area: ['90%', '90%'],
            content: path + '/qc_pooled_project.do'
        });
    }
</script>

</body>
</html>
