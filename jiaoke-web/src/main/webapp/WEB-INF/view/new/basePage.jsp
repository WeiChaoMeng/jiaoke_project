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
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8"/>
    <link rel="icon" href="../../../static/images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../../../static/new/css/font.css">
    <link rel="stylesheet" href="../../../static/new/css/xadmin.css">
    <link rel="stylesheet" href="../../../static/new/css/basepage.css">
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

        <div class="layui-col-md7">
            <div class="layui-card">
                <div class="layui-card-header">数据统计</div>
                <div class="layui-card-body ">
                    <ul class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">
                        <li class="layui-col-md4 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>文章数</h3>
                                <p>
                                    <cite>66</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md4 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>会员数</h3>
                                <p>
                                    <cite>12</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md4 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>回复数</h3>
                                <p>
                                    <cite>99</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md4 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>商品数</h3>
                                <p>
                                    <cite>67</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md4 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>文章数</h3>
                                <p>
                                    <cite>67</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md4 layui-col-xs6 ">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>文章数</h3>
                                <p>
                                    <cite>6766</cite></p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="layui-col-md5">
            <div class="layui-card">
                <div class="layui-card-body">
                    <div class="layui-carousel" id="test1">
                        <div carousel-item>
                            <div><img src="../../../static/new/images/lbt3.jpg" style="width: 100%;height: 100%;"></div>
                            <div><img src="../../../static/new/images/lbt1.jpg" style="width: 100%;height: 100%;"></div>
                            <div><img src="../../../static/new/images/lbt2.jpg" style="width: 100%;height: 100%;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">常用模板</div>
                <div class="layui-card-body" style=" min-height: 190px;">
                    <table style="font-size: 14px;width: 100%;">
                        <tbody>
                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('car')" title="用车申请单">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>用车申请单
                                </a>
                            </td>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('sealsBorrow')" title="印章借用审批单">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>印章借用审批单
                                </a>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('sealsUse')" title="印章使用审批单">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>印章使用审批单
                                </a>
                            </td>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('licenceBorrow')" title="证照借用审批单（原件）">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>证照借用审批单（原件）
                                </a>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('licenceUse')" title="证照使用审批单（复印件）">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>证照使用审批单（复印件）
                                </a>
                            </td>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('officeSupplies')" title="办公用品需求计划">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>办公用品需求计划
                                </a>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('officeSuppliesUse')" title="办公用品需求计划">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>办公用品领用
                                </a>
                            </td>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('annualLeave')" title="年休假审批表">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>年休假审批表
                                </a>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('adjustWages')" title="调资审批表">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>调资审批表
                                </a>
                            </td>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('productionLeave')" title="生产假审批表">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>生产假审批表
                                </a>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('annualLeave')" title="年休假审批表">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>年休假审批表
                                </a>
                            </td>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('leave')" title="请假审批表">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>请假审批表
                                </a>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('regularization')" title="转正申请表">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>转正申请表
                                </a>
                            </td>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('transfer')" title="转岗审批表">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>转岗审批表
                                </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <div class="layui-carousel-ind more-date-content">
                        <i class="layui-icon more-date-icon" onclick="moreModel()">&#xe65f;</i>
                    </div>
                </div>

            </div>
        </div>

        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">待办工作</div>
                <div class="layui-card-body" style="min-height: 190px;">
                    <table style="font-size: 14px;width: 100%;">
                        <tbody id="pending"></tbody>
                    </table>

                    <div class="layui-carousel-ind more-date-content">
                        <i class="layui-icon more-date-icon" onclick="morePending()">&#xe65f;</i>
                    </div>
                </div>
            </div>
        </div>

            <div class="layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header">公告</div>
                    <div class="layui-card-body" style="min-height: 168px;">
                        <ul>
                            <c:forEach items="${oaNoticeList}" var="notice">
                                <li>
                                    <a class="text-title-style" href="notice/homePageDetails?id=${notice.id}">${notice.title}</a>
                                    <i class="layuiadmin-badge-time" style="margin: 0;position: static;">${notice.releaseDateStr}</i>
                                </li>
                            </c:forEach>
                        </ul>

                        <div class="layui-carousel-ind more-date-content">
                            <i class="layui-icon more-date-icon" onclick="moreNotice()">&#xe65f;</i>
                        </div>
                    </div>
                </div>
            </div>

        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">新闻</div>
                <div class="layui-card-body" style="min-height: 168px;">
                    <ul>
                        <c:forEach items="${oaNewsCenterList}" var="newsCenter">
                            <li>
                                <a class="text-title-style" href="newsCenter/newsDetails?id=${newsCenter.id}">${newsCenter.newsHeadlines}</a>
                                <i class="layuiadmin-badge-time" style="margin: 0;position: static;">${newsCenter.releaseDateStr}</i>
                            </li>
                        </c:forEach>
                    </ul>

                    <div class="layui-carousel-ind more-date-content">
                        <i class="layui-icon more-date-icon" onclick="moreNews()">&#xe65f;</i>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
<script type="text/javascript" src="../../../static/js/jquery.js"></script>
<script>
    function commonJump(classAddress) {
        window.location.href = "${path}" + classAddress + "/toIndex";
    }

    function moreModel(){
        window.location.href = "${path}collaboration/toFlowTemplate";
    }

    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,height: '209px' //设置容器宽度
        });
    });

    //加载待办数据
    $(function () {
        $.ajax({
            type: "post",
            url: '/oaHomePage/loadingPendingData',
            async: false,
            success: function (data) {
                var result = JSON.parse(data);

                //待办
                $('#dataNumber').text('(' + result.upcomingMatterNumber + ')');

                var list = result.upcomingMatterList;

                if (list === "empty") {
                    $("#pending").html();
                } else {
                    var pendingList = '';
                    for (let i = 0; i < list.length; i++) {
                        pendingList += '<tr>';
                        pendingList += '    <td class="list_content" style="width: 70%">';
                        pendingList += '        <span class="list_content_name">';
                        pendingList += '            <a class="check_color" onclick="taskApprovalHandle(\'' + list[i].url + '\',\'' + list[i].correlationId + '\',\'' + list[i].taskId + '\')" title="' + list[i].title + '">' + list[i].title + '</a>';
                        pendingList += '        </span>';
                        pendingList += '    </td>';
                        pendingList += '    <td class="list-content-time">';
                        pendingList += '        <span class="list_content_date">';
                        pendingList += '            <a title="申请时间">' + list[i].createTimeStr + '</a>';
                        pendingList += '        </span>';
                        pendingList += '    </td>';
                        pendingList += '    <td class="list-content-proposer">';
                        pendingList += '        <span class="list_content_sponsor">';
                        pendingList += '            <a title="申请人">' + list[i].promoterStr + '</a>';
                        pendingList += '        </span>';
                        pendingList += '    </td>';
                        pendingList += '    <td class="list-content-proposer">';
                        pendingList += '        <span class="list_content_sponsor">';
                        if (list[i].statusCode === "被回退") {
                            pendingList += '            <a title="状态" style="color: #ff0000;font-weight: 600;">' + list[i].statusCode + '</a>';
                        }else{
                            pendingList += '            <a title="状态" style="color: #2196F3;font-weight: 600;">' + list[i].statusCode + '</a>';
                        }
                        pendingList += '        </span>';
                        pendingList += '    </td>';
                        pendingList += '</tr>';
                    }

                    $("#pending").html(pendingList);
                }
            },
            error: function (result) {
                layer.msg("出错！");
            }
        });
    });

    //待办工作板块 - 任务审批处理页面
    function taskApprovalHandle(url, id, taskId) {
        if (url.indexOf('.do') !== -1) {
            window.location.href = "${path}approval" + url + "?id=" + id + "&taskId=" + taskId;
        } else {
            url += "/approval";
            window.location.href = "${path}" + url + "?id=" + id + "&taskId=" + taskId;
        }
    }

    //更多待办任务
    function morePending() {
        window.location.href = "${path}/collaboration/pending?page=1";
    }

    //更多公告
    function moreNotice() {
        window.location.href = "${path}notice/toIndex?page=1";
    }

    //更多新闻
    function moreNews() {
        window.location.href = "${path}newsCenter/toNewsList?page=1";
    }
</script>
</html>