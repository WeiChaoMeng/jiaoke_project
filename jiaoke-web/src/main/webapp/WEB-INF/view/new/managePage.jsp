<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>我的桌面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="icon" href="../../../static/images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../../../static/new/css/font.css">
    <link rel="stylesheet" href="../../../static/new/css/xadmin.css">
    <script src="../../../static/new/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../../static/new/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">

        <%--地图--%>
            <div class="layui-col-md7">
                <div class="layui-card">
                    <div class="layui-card-header">运输轨迹图</div>
                    <div class="layui-card-body" style="height: 575px">
                        <div id="container" style="width: 100%;height: 100%;margin: 0;padding: 0"></div>
                    </div>
                </div>
            </div>

        <%--<div class="layui-col-sm6 layui-col-md2-5">--%>
            <%--<div class="layui-card">--%>
                <%--<div class="layui-card-header">本周生产量(吨)--%>
                    <%--<span class="layui-badge layui-bg-blue layuiadmin-badge">周</span></div>--%>
                <%--<div class="layui-card-body  ">--%>
                    <%--<p class="layuiadmin-big-font">0</p>--%>
                    <%--<p>时间段--%>
                        <%--<span class="layuiadmin-span-color">2020-04-06 至 2020-04-08</span>--%>
                    <%--</p>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="layui-col-sm6 layui-col-md2-5">--%>
            <%--<div class="layui-card">--%>
                <%--<div class="layui-card-header">本月生产量(吨)--%>
                    <%--<span class="layui-badge layui-bg-cyan layuiadmin-badge">月</span></div>--%>
                <%--<div class="layui-card-body ">--%>
                    <%--<p class="layuiadmin-big-font">655.36</p>--%>
                    <%--<p>时间段--%>
                        <%--<span class="layuiadmin-span-color">2020-04-01 至 2020-04-08</span>--%>
                    <%--</p>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="layui-col-sm6 layui-col-md2-5" style="width: 21%;">
            <div class="layui-card">
                <div class="layui-card-header">本年生产量(万吨)
                    <span class="layui-badge layui-bg-green layuiadmin-badge">年</span></div>
                <div class="layui-card-body ">
                    <p class="layuiadmin-big-font">0.36</p>
                    <p>时间段
                        <span class="layuiadmin-span-color">2020-01-01 至 2020-04-08</span>
                    </p>
                </div>
            </div>
        </div>
        <div class="layui-col-sm6 layui-col-md2-5" style="width: 20.5%;">
            <div class="layui-card">
                <div class="layui-card-header">累计完成生产量(万吨)
                    <span class="layui-badge layui-bg-orange layuiadmin-badge">总</span></div>
                <div class="layui-card-body ">
                    <p class="layuiadmin-big-font">88.45</p>
                    <p>时间段
                        <span class="layuiadmin-span-color">2018-11-01 至 2020-04-08</span>
                    </p>
                </div>
            </div>
        </div>

        <%--<div class="layui-col-sm6 layui-col-md2-5">--%>
            <%--<div class="layui-card" onclick="gotoERP()">--%>
                <%--<div class="layui-card-header">登陆生产ERP系统--%>
                    <%--<span class="layui-badge layui-bg-red layuiadmin-badge">总</span></div>--%>
                <%--<div class="layui-card-body ">--%>
                    <%--<p class="layuiadmin-big-font">ERP</p>--%>
                    <%--<p>ERP快捷入口--%>
                        <%--<span class="layuiadmin-span-color"><i class="iconfont">&#xe6a7;</i></span>--%>
                    <%--</p>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>

            <%--<div class="layui-col-sm12 layui-col-md12">--%>
                <%--<div class="layui-card">--%>
                    <%--<div class="layui-card-header">最新一周新增用户</div>--%>
                    <%--<div class="layui-card-body" style="min-height: 280px;">--%>
                        <%--<div id="main1" class="layui-col-sm12" style="height: 300px;"></div>--%>

                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>

        <div class="layui-col-md5">
            <div class="layui-card">
                <div class="layui-card-header">待办工作</div>
                <div class="layui-card-body" style="min-height: 170px;">
                    <table style="font-size: 13px;width: 100%;">
                        <tbody>
                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="list_content" style="width: 75%;">
                                <span class="list_content_name">
                                    <a class="check_color" onclick="taskApprovalHandle('annualLeave','2020040214123242776391','534053')" title="年休假审批表(2020-04-02 14:11:43)">年休假审批表(2020-04-05 11:22:20)</a>
                                </span>
                            </td>
                            <td class="list-content-time" style="width: 15%;">
                                <span class="list_content_date">
                                    <a title="申请时间">2020-04-05</a>
                                </span>
                            </td>
                            <td class="list-content-proposer" style="width: 10%;">
                                <span class="list_content_sponsor">
                                    <a title="申请人">测试</a>
                                </span>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="list_content" style="width: 75%;">
                                <span class="list_content_name">
                                    <a class="check_color" onclick="taskApprovalHandle('annualLeave','2020040214123242776391','534053')" title="证照借用(2020-04-02 14:11:43)">证照借用(2020-04-02 14:11:43)</a>
                                </span>
                            </td>
                            <td class="list-content-time" style="width: 15%;">
                                <span class="list_content_date">
                                    <a title="申请时间">2020-04-02</a>
                                </span>
                            </td>
                            <td class="list-content-proposer" style="width: 10%;">
                                <span class="list_content_sponsor">
                                    <a title="申请人">测试</a>
                                </span>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="list_content" style="width: 75%;">
                                <span class="list_content_name">
                                    <a class="check_color" onclick="taskApprovalHandle('annualLeave','2020040214123242776391','534053')" title="用车审批单(2020-04-02 14:11:43)">用车审批单(2020-04-01 09:10:00)</a>
                                </span>
                            </td>
                            <td class="list-content-time" style="width: 15%;">
                                <span class="list_content_date">
                                    <a title="申请时间">2020-04-01</a>
                                </span>
                            </td>
                            <td class="list-content-proposer" style="width: 10%;">
                                <span class="list_content_sponsor">
                                    <a title="申请人">测试</a>
                                </span>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="list_content" style="width: 75%;">
                                <span class="list_content_name">
                                    <a class="check_color" onclick="taskApprovalHandle('annualLeave','2020040214123242776391','534053')" title="办公用品领用(2020-04-02 14:11:43)">办公用品领用(2020-04-01 09:10:00)</a>
                                </span>
                            </td>
                            <td class="list-content-time" style="width: 15%;">
                                <span class="list_content_date">
                                    <a title="申请时间">2020-04-01</a>
                                </span>
                            </td>
                            <td class="list-content-proposer" style="width: 10%;">
                                <span class="list_content_sponsor">
                                    <a title="申请人">测试</a>
                                </span>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="list_content" style="width: 75%;">
                                <span class="list_content_name">
                                    <a class="check_color" onclick="taskApprovalHandle('annualLeave','2020040214123242776391','534053')" title="奖罚意见表(2020-04-02 14:11:43)">奖罚意见表(2020-04-01 09:10:00)</a>
                                </span>
                            </td>
                            <td class="list-content-time" style="width: 15%;">
                                <span class="list_content_date">
                                    <a title="申请时间">2020-04-01</a>
                                </span>
                            </td>
                            <td class="list-content-proposer" style="width: 10%;">
                                <span class="list_content_sponsor">
                                    <a title="申请人">测试</a>
                                </span>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="list_content" style="width: 75%;">
                                <span class="list_content_name">
                                    <a class="check_color" onclick="taskApprovalHandle('annualLeave','2020040214123242776391','534053')" title="转岗审批表(2020-04-02 14:11:43)">转岗审批表(2020-04-01 09:10:00)</a>
                                </span>
                            </td>
                            <td class="list-content-time" style="width: 15%;">
                                <span class="list_content_date">
                                    <a title="申请时间">2020-04-01</a>
                                </span>
                            </td>
                            <td class="list-content-proposer" style="width: 10%;">
                                <span class="list_content_sponsor">
                                    <a title="申请人">测试</a>
                                </span>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="list_content" style="width: 75%;">
                                <span class="list_content_name">
                                    <a class="check_color" onclick="taskApprovalHandle('annualLeave','2020040214123242776391','534053')" title="收文阅办单(2020-04-02 14:11:43)">收文阅办单(2020-04-01 09:10:00)</a>
                                </span>
                            </td>
                            <td class="list-content-time" style="width: 15%;">
                                <span class="list_content_date">
                                    <a title="申请时间">2020-04-01</a>
                                </span>
                            </td>
                            <td class="list-content-proposer" style="width: 10%;">
                                <span class="list_content_sponsor">
                                    <a title="申请人">测试</a>
                                </span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="layui-col-md5">
                <div class="layui-card">
                    <div class="layui-card-header">公告</div>
                    <div class="layui-card-body" style="min-height: 170px">
                        <ul>
                            <li>
                                <a href="notice/homePageDetails?id=11">中秋节廉洁提醒</a>
                                <i class="layuiadmin-badge-time">2019-09-12</i>
                            </li>
                            <li>
                                <span></span>
                                <a href="notice/homePageDetails?id=10">端午小长假廉洁提醒</a>
                                <i class="layuiadmin-badge-time">2019-06-06</i>
                            </li>
                            <li>
                                <span></span>
                                <a href="notice/homePageDetails?id=9">路驰党支部严明纪律规定，廉洁过好“五一”</a>
                                <i class="layuiadmin-badge-time">2019-04-30</i>
                            </li>
                            <li>
                                <span></span>
                                <a href="notice/homePageDetails?id=8">【廉政】清明节廉政提醒</a>
                                <i class="layuiadmin-badge-time">2019-04-04</i>
                            </li>
                            <li>
                                <span></span>
                                <a href="notice/homePageDetails?id=7">中共北京市政路桥集团有限公司纪委文件</a>
                                <i class="layuiadmin-badge-time">2019-03-28</i>
                            </li>
                            <li>
                                <span></span>
                                <a href="notice/homePageDetails?id=6">中国共产党纪律处分条例</a>
                                <i class="layuiadmin-badge-time">2019-03-12</i>
                            </li>
                            <li>
                                <span></span>
                                <a href="notice/homePageDetails?id=5">2018年职工大会</a>
                                <i class="layuiadmin-badge-time">2018-11-22</i>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>


    </div>
</div>
</div>
</body>

<%--<script src="https://cdn.bootcss.com/echarts/4.2.1-rc1/echarts.min.js"></script>--%>
<script src="https://webapi.amap.com/maps?v=1.4.15&key=c4f16b4da2e9c9023eac7f81d021bb1b&plugin=AMap.DistrictSearch"></script>
<script src="https://webapi.amap.com/ui/1.0/main.js?v=1.0.11"></script>
<%--<script>--%>
    <%--function gotoERP() {--%>
        <%--window.open("http://119.90.97.107:9002/",'_blank');--%>
    <%--}--%>

    <%--// 基于准备好的dom，初始化echarts实例--%>
    <%--var myChart = echarts.init(document.getElementById('main1'));--%>

    <%--// 指定图表的配置项和数据--%>
    <%--var option = {--%>
        <%--grid: {--%>
            <%--top: '5%',--%>
            <%--right: '1%',--%>
            <%--left: '1%',--%>
            <%--bottom: '10%',--%>
            <%--containLabel: true--%>
        <%--},--%>
        <%--tooltip: {--%>
            <%--trigger: 'axis'--%>
        <%--},--%>
        <%--xAxis: {--%>
            <%--type: 'category',--%>
            <%--data: ['周一','周二','周三','周四','周五','周六','周日']--%>
        <%--},--%>
        <%--yAxis: {--%>
            <%--type: 'value'--%>
        <%--},--%>
        <%--series: [{--%>
            <%--name:'用户量',--%>
            <%--data: [820, 932, 901, 934, 1290, 1330, 1320],--%>
            <%--type: 'line',--%>
            <%--smooth: true--%>
        <%--}]--%>
    <%--};--%>


    <%--// 使用刚指定的配置项和数据显示图表。--%>
    <%--myChart.setOption(option);--%>
<%--</script>--%>
<script>
    var map = new AMap.Map('container', {
        zoom:9,
        center: [116.393178,40.027604],
        pitch: 0,
        viewMode: '2D',
        //设置地图背景图
        mapStyle: 'amap://styles/blue'

    });
    //map.setZoom(12.2); //设置地图层级
    new AMap.DistrictSearch({
        extensions: 'all',
        showbiz: false,
        subdistrict: 0
    }).search('北京市', function (status, result) {
        // 外多边形坐标数组和内多边形坐标数组
        var outer = [
            new AMap.LngLat(-360, 90, true),
            new AMap.LngLat(-360, -90, true),
            new AMap.LngLat(360, -90, true),
            new AMap.LngLat(360, 90, true),
        ];
        var holes = result.districtList[0].boundaries;

        var pathArray = [
            outer
        ];
        pathArray.push.apply(pathArray, holes)
        var polygon = new AMap.Polygon({
            pathL: pathArray,
            strokeColor: '#ff0600',
            strokeWeight: 1,
            fillColor: '#ffffff',
            fillOpacity: 1
        });
        polygon.setPath(pathArray);
        map.add(polygon);

        AMapUI.load(['ui/misc/PathSimplifier', 'lib/$'], function (PathSimplifier, $) {

            if (!PathSimplifier.supportCanvas) {
                alert('当前环境不支持 Canvas！');
                return;
            }

            var defaultRenderOptions = {
                renderAllPointsIfNumberBelow: -1,
                pathTolerance: 0,
                keyPointTolerance: -1,
                pathLineStyle: {
                    lineWidth: 0,
                    strokeStyle: '#033447',
                    borderWidth: 3,
                    borderStyle: null,
                    dirArrowStyle: false
                },
                pathLineHoverStyle: {
                    lineWidth: 3,
                    strokeStyle: '#ffffff',
                    borderWidth: 1,
                    borderStyle: null,
                    dirArrowStyle: false
                },
                pathLineSelectedStyle: {
                    lineWidth: 3,
                    strokeStyle: '#ffffff',
                    borderWidth: 1,
                    borderStyle: null,
                    dirArrowStyle: true
                },
                dirArrowStyle: {
                    stepSpace: 35,
                    strokeStyle: '#ffffff',
                    lineWidth: 2
                },
                startPointStyle: {
                    radius: 4,
                    fillStyle: '#109618',
                    lineWidth: 1,
                    strokeStyle: '#eeeeee'
                },
                endPointStyle: {
                    radius: 4,
                    fillStyle: '#dc3912',
                    lineWidth: 1,
                    strokeStyle: '#eeeeee'
                },
                keyPointStyle: {
                    radius: 3,
                    fillStyle: 'rgba(8, 126, 196, 1)',
                    lineWidth: 1,
                    strokeStyle: '#eeeeee'
                },
                keyPointHoverStyle: {
                    radius: 4,
                    fillStyle: 'rgba(0, 0, 0, 0)',
                    lineWidth: 2,
                    strokeStyle: '#ffa500'
                },
                keyPointOnSelectedPathLineStyle: {
                    radius: 4,
                    fillStyle: 'rgba(8, 126, 196, 1)',
                    lineWidth: 2,
                    strokeStyle: '#eeeeee'
                }
            };

            var pathSimplifierIns = new PathSimplifier({
                zIndex: 300,
                autoSetFitView:false,
                map: map, //所属的地图实例
                getPath: function (pathData, pathIndex) {
                    return pathData.path;
                },
                getHoverTitle: function (pathData, pathIndex, pointIndex) {
                    if (pointIndex >= 0) {
                        return pathData.name + '，点：' + pointIndex + '/' + pathData.path.length;
                    }
                    return pathData.name + '，点数量' + pathData.path.length;
                },
                renderOptions: defaultRenderOptions
            });

            window.pathSimplifierIns = pathSimplifierIns;

            //设置数据
            pathSimplifierIns.setData([
                {
                    "name": "路驰 - > 大兴机场",
                    "path": [[116.352291,39.697203],[116.354217,39.695478],  [116.356594, 39.696718], [116.358498, 39.696863], [116.361331, 39.696978],
                        [116.362591, 39.696908], [116.363836, 39.696363], [116.365289, 39.695559], [116.366754, 39.694605], [116.367779, 39.693813],
                        [116.368712, 39.692562], [116.36905, 39.691555], [116.369259, 39.69058], [116.369431, 39.690155], [116.369769, 39.689495],
                        [116.369951, 39.689259], [116.370252, 39.688826], [116.371019, 39.688252], [116.371705, 39.687736], [116.373025, 39.686745],
                        [116.373958, 39.686035], [116.374672, 39.685466], [116.376582, 39.683885], [116.377982, 39.682737], [116.380315, 39.680821],
                        [116.381195, 39.680144], [116.38311, 39.679166], [116.384698, 39.678402], [116.387917, 39.676804], [116.391564, 39.675], [116.393748, 39.673955],
                        [116.396124, 39.672857], [116.398173, 39.671899], [116.400974, 39.670512], [116.403795, 39.66912], [116.407829, 39.667097], [116.411059, 39.665325],
                        [116.411971, 39.665181], [116.414503, 39.665172], [116.41461, 39.664396], [116.414723, 39.663545], [116.414969, 39.661864], [116.415173, 39.66058],
                        [116.415291, 39.659613], [116.415318, 39.658222], [116.415307, 39.656574], [116.415318, 39.654719], [116.415339, 39.652807], [116.41535, 39.651068],
                        [116.415393, 39.649466], [116.41542, 39.648061], [116.415441, 39.645682], [116.415457, 39.643237], [116.415436, 39.641386], [116.415457, 39.639362],
                        [116.415447, 39.636941], [116.415457, 39.633979], [116.415484, 39.62955], [116.415484, 39.625877], [116.4155, 39.623344], [116.415517, 39.620782],
                        [116.415533, 39.618142], [116.415668, 39.606162], [116.416183, 39.596044], [116.417642, 39.594457], [116.419445, 39.592803], [116.424852, 39.58308],
                        [116.427599, 39.574877], [116.428457, 39.57018], [116.429144, 39.565019], [116.428285, 39.556979],
                        [116.42826, 39.551355], [116.428121, 39.546433], [116.427713, 39.544116], [116.427316, 39.539268], [116.428163, 39.536049], [116.428775, 39.533914], [116.429075, 39.532987]
                    ]
                },
                {
                    "name": "路驰 - > 丽泽桥",
                    "path": [[116.352291,39.697203],[116.354217,39.695478],[116.356594, 39.696718], [116.358652, 39.696871], [116.361334, 39.696974], [116.361506, 39.697176], [116.361463, 39.697416], [116.359457, 39.697824], [116.357606, 39.698113],
                        [116.356034, 39.698889], [116.354779, 39.69995], [116.353443, 39.701295], [116.3523, 39.703219], [116.351684, 39.704387], [116.349903, 39.70773], [116.348642, 39.710309], [116.347531, 39.712715],
                        [116.346389, 39.715034], [116.345434, 39.717031], [116.344999, 39.717914], [116.344522, 39.717943],[116.344698,39.718774],[116.344821,39.719393],[116.345256,39.720891],[116.345508,39.722063],
                        [116.346307,39.725818],[116.346264,39.728697],[116.346061,39.731911],[116.345846,39.73471],[116.345546,39.737511],[116.345234,39.740609],[116.345101,39.744728],[116.344914,39.746044],[116.344731,39.746625],
                        [116.344383,39.751744],[116.343428,39.759472],[116.342902,39.763145],[116.342178,39.768538],[116.341727,39.772117],[116.341727,39.774401],[116.342124,39.776834],[116.34368,39.780569],[116.345772,39.784007],
                        [116.347639,39.787008],[116.348476,39.790116],[116.347757,39.795062],[116.347692,39.797873],[116.346298,39.802419],[116.34553,39.807044],[116.344919,39.8177],[116.34597,39.830142],[116.34596,39.842599],
                        [116.346212,39.847483],[116.348014,39.850342],[116.347649,39.85105],[116.346619,39.851248],[116.34648,39.851231],[116.34515,39.850449],[116.342703,39.849189],[116.333927,39.849016],[116.329968,39.849065]
                        ,[116.323381,39.851314],[116.322319,39.852154],[116.316278,39.858776],[116.313221,39.863305],[116.312555,39.867488],[116.310604, 39.884675]
                    ]
                },
                {
                    "name": "路驰 - > 马驹桥",
                    "path": [[116.352291,39.697203],[116.354217,39.695478],[116.356594, 39.696718], [116.358652, 39.696871], [116.361334, 39.696974], [116.361506, 39.697176], [116.361463, 39.697416], [116.359457, 39.697824],
                        [116.357606, 39.698113],[116.356034, 39.698889], [116.354779, 39.69995], [116.353443, 39.701295], [116.3523, 39.703219], [116.351684, 39.704387], [116.349903, 39.70773], [116.348642, 39.710309],
                        [116.347531, 39.712715],[116.346389, 39.715034], [116.345434, 39.717031], [116.344999, 39.717914], [116.344522, 39.717943],[116.344698,39.718774],[116.344821,39.719393],[116.345256,39.720891],
                        [116.345508,39.722063],[116.36628,39.721981],[116.381815,39.721618],[116.392222,39.721139],[116.393746,39.720743],[116.398499,39.720867],[116.403466,39.720628],[116.406829,39.720636],[116.412666,39.720925],
                        [116.415488,39.721403],[116.423486,39.722398],[116.426088,39.722658],[116.433437,39.722604],[116.440792,39.722881],[116.447744,39.724659],[116.454739,39.72543],[116.463364,39.726239],[116.47214,39.727481],
                        [116.482086,39.729536],[116.487257,39.730922],[116.494349,39.734272],[116.498437,39.736087],[116.501698,39.73725],[116.509005,39.738768],[116.517963,39.739655],[116.521584,39.740096],[116.527968,39.742287],
                        [116.536975,39.745483],[116.545343,39.746201],[116.556791,39.746399],[116.559199,39.746915],[116.578839,39.75512]
                    ]
                },
                {
                    "name": "路驰 - > 西六环",
                    "path": [[116.352298,39.697197],[116.355398,39.694469],[116.356149,39.692884],[116.354239,39.692826],[116.353778,39.692875],[116.35234,39.692785],[116.352196,39.692426],[116.351799,39.69238],[116.342604,39.692017],
                        [116.329794,39.691571],[116.318164,39.691678],[116.317745,39.691984],[116.317552,39.698951],[116.314183,39.697383],[116.313593,39.696136],[116.306555,39.693577],[116.291867,39.691811],[116.267776,39.690766],
                        [116.247837,39.692644],[116.225285,39.695706],[116.213156,39.696148],[116.19511,39.696247],[116.171351,39.696759],[116.153408,39.697378],[116.120341,39.698447],[116.110932,39.698905],[116.104924,39.700544],
                        [116.100611,39.703218],[116.097113,39.707791],[116.09612,39.711825],[116.095884,39.726065],[116.097011,39.73307],[116.099017,39.740958],[116.099961,39.74773],[116.101458,39.758447],[116.102177,39.765457],
                        [116.102187,39.770492],[116.103169,39.773469],[116.104821,39.775728],[116.108399,39.778408],[116.114949,39.783182],[116.117932,39.788903],[116.119037,39.79406],[116.119173,39.803789],[116.119897,39.80857],
                        [116.121077,39.814182],[116.120551,39.819118],[116.119435,39.821953],[116.116812,39.826304],[116.115525,39.830501],[116.115675,39.834802],[116.116694,39.837793],[116.118899,39.841191],[116.121924,39.844367],
                        [116.12929,39.851891],[116.135893,39.857726],[116.137471,39.859398],[116.139445,39.862882],[116.140024,39.865262],[116.140292,39.868906],[116.141843,39.871957],[116.14527,39.875442],[116.147802,39.879723],
                        [116.148574,39.882918]
                    ]
                }
            ]);

            //对第一条线路（即索引 0）创建一个巡航器 // #033447
            var navg1 = pathSimplifierIns.createPathNavigator(0, {
                loop: true, //循环播放
                speed: 10000, //巡航速度，单位千米/小时
                pathNavigatorStyle: {
                    width: 0,
                    height: 0,
                    //使用图片
                    content: 'defaultPathNavigator',
                    strokeStyle: null,
                    fillStyle: null,
                    //经过路径的样式
                    pathLinePassedStyle: {
                        lineWidth: 3,
                        strokeStyle: '#ffffff',
                        dirArrowStyle: false
                    }
                }
            });

            navg1.start();

            //对第一条线路（即索引 0）创建一个巡航器
            var navg2 = pathSimplifierIns.createPathNavigator(1, {
                loop: true, //循环播放
                speed: 10000, //巡航速度，单位千米/小时
                pathNavigatorStyle: {
                    width: 0,
                    height: 0,
                    //使用图片
                    content: 'defaultPathNavigator',
                    strokeStyle: null,
                    fillStyle: null,
                    //经过路径的样式
                    pathLinePassedStyle: {
                        lineWidth: 3,
                        strokeStyle: '#ffffff',
                        dirArrowStyle: false
                    }
                }
            });

            navg2.start();

            //对第一条线路（即索引 0）创建一个巡航器
            var navg3 = pathSimplifierIns.createPathNavigator(2, {
                loop: true, //循环播放
                speed: 10000, //巡航速度，单位千米/小时
                pathNavigatorStyle: {
                    width: 0,
                    height: 0,
                    //使用图片
                    content: 'defaultPathNavigator',
                    strokeStyle: null,
                    fillStyle: null,
                    //经过路径的样式
                    pathLinePassedStyle: {
                        lineWidth: 3,
                        strokeStyle: '#ffffff',
                        dirArrowStyle: false
                    }
                }
            });

            navg3.start();

            //对第一条线路（即索引 0）创建一个巡航器
            var navg4 = pathSimplifierIns.createPathNavigator(3, {
                loop: true, //循环播放
                speed: 10000, //巡航速度，单位千米/小时
                pathNavigatorStyle: {
                    width: 0,
                    height: 0,
                    //使用图片
                    content: 'defaultPathNavigator',
                    strokeStyle: null,
                    fillStyle: null,
                    //经过路径的样式
                    pathLinePassedStyle: {
                        lineWidth: 3,
                        strokeStyle: '#ffffff',
                        dirArrowStyle: false
                    }
                }
            });

            navg4.start();
        });
    })
</script>
</html>