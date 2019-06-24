<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>OA首页</title>
    <link href="/static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
</head>
<body class="inner-container" style="padding:15px 8px 0px 8px;">
<div style="width: 100%;">

    <div class="oa_homepage_upper_left">
        <div class="oa_homepage_modular_head">
            <ul style="margin: 0;padding: 0">
                <li id="upcoming" class="upper_left_head_a head_option">
                    <a>
                        <span>待办工作</span>
                        <span id="dataNumber"></span>
                    </a>
                </li>

                <li>
                    <span class="more-data" title="更多" onclick="morePending()">&#xe910;</span>
                </li>
            </ul>
        </div>

        <div id="menu1" class="menu1_style">
            <table style="table-layout: fixed;width: 100%">
                <tbody id="pending"></tbody>
            </table>
        </div>
    </div>

    <div class="oa_homepage_upper_right">
        <div class="oa_homepage_modular_head">
            <ul style="margin: 0;padding: 0">
                <li id="tracking_items" class="upper_left_head_a head_option">
                    <a>
                        <span>跟踪事项</span>
                        <span id="trackingNumber">(0)</span>
                    </a>
                </li>

                <li>
                    <span class="more-data" title="更多" onclick="moreAlreadySend()">&#xe910;</span>
                </li>
            </ul>
        </div>

        <div id="menu3" class="menu1_style">
            <table style="table-layout: fixed;width: 100%">
                <tbody id="history"></tbody>
            </table>
        </div>
    </div>

    <div class="oa_homepage_bottom">
        <div class="oa_homepage_modular_head">
            <ul style="margin: 0;padding: 0">
                <li class="upper_left_head_a">
                    <a style="font-size: 13px;">
                        <span>我的模板</span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="template_content">
            <div>
                <div style="height:100%;width:100%;">

                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tbody>
                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="carApplication()" title="用车申请单">
                                    <img src="../../../static/images/icon/table.png">用车申请单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="meals()" title="客饭审批单">
                                    <img src="../../../static/images/icon/table.png">客饭审批单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="card()" title="饭卡申请单">
                                    <img src="../../../static/images/icon/table.png">饭卡申请单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="sealsBorrow()" title="印章借用审批单">
                                    <img src="/static/images/icon/table.png">印章借用审批单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="sealsUse()" title="印章使用审批单">
                                    <img src="/static/images/icon/table.png">印章使用审批单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="licenceBorrow()" title="证照借用审批单（原件）">
                                    <img src="/static/images/icon/table.png">证照借用审批单（原件）
                                </a>
                            </td>
                        </tr>

                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="licenceUse()" title="证照使用审批单（复印件）">
                                    <img src="/static/images/icon/table.png">证照使用审批单（复印件）
                                </a>
                            </td>

                            <%--<td class="template" valign="middle">
                                <a class="check_color" onclick="review()" title="合同审查表">
                                    <img src="../../../static/images/icon/table.png">合同审查表
                                </a>
                            </td>--%>

                           <%-- <td class="template" valign="middle">
                                <a class="check_color" onclick="read()" title="收文阅办审批单">
                                    <img src="/static/images/icon/table.png">收文阅办审批单
                                </a>
                            </td>--%>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="maintain()" title="设备维修申请单">
                                    <img src="/static/images/icon/table.png">设备维修申请单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="acceptance()" title="验收单">
                                    <img src="/static/images/icon/table.png">验收单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="engineering()" title="工程名称变更记录表">
                                    <img src="/static/images/icon/table.png">工程名称变更记录表
                                </a>
                            </td>
                        </tr>

                        <%--<tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="assets()" title="固定资产投资完成验收单（生产用）">
                                    <img src="/static/images/icon/table.png">固定资产投资完成验收单（生产用）
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="supplies()" title="办公用品需求计划">
                                    <img src="/static/images/icon/table.png">办公用品需求计划
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="confirm()" title="确认单审批单">
                                    <img src="/static/images/icon/table.png">确认单审批单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="liaison()" title="信息联络处理单">
                                    <img src="/static/images/icon/table.png">信息联络处理单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="assetUse()" title="资产领用申请单">
                                    <img src="/static/images/icon/table.png">资产领用申请单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="conferenceRoom()" title="会议室申请单">
                                    <img src="/static/images/icon/table.png">会议室申请单
                                </a>
                            </td>
                        </tr>--%>

                        <%--<tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="leaveRequest()" title="请假申请单">
                                    <img src="/static/images/icon/table.png">请假申请单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="filesUpload()" title="文件上传">
                                    <img src="/static/images/icon/table.png">文件上传</a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="filesDownload()" title="文件下载">
                                    <img src="/static/images/icon/table.png">文件下载</a>
                            </td>
                        </tr>--%>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../static/js/oa/oa_common.js"></script>
<script src="../../../static/js/oa/layer/layer.js"></script>
<script>

    //加载待办数据
    $(function () {
        $.ajax({
            type: "post",
            url: '/oaHomePage/loadingData',
            async: false,
            success: function (data) {
                var result = JSON.parse(data);

                //待办
                $('#dataNumber').text('(' + result.dataNumber + ')');

                var list = result.oaActTemporaryList;

                if (list === "empty") {
                    $("#pending").html();
                } else {
                    var pendingList = '';
                    for (let i = 0; i < list.length; i++) {
                        pendingList += '<tr>';
                        pendingList += '    <td class="list_content">';
                        pendingList += '        <span class="list_content_name">';
                        pendingList += '            <a class="check_color" onclick="taskApprovalHandle(\'' + list[i].url + '\',\'' + list[i].id + '\',\'' + list[i].taskId + '\')" title="' + list[i].title + '">' + list[i].title + '</a>';
                        pendingList += '        </span>';
                        pendingList += '    </td>';
                        pendingList += '    <td class="list-content-time">';
                        pendingList += '        <span class="list_content_date">';
                        pendingList += '            <a title="申请时间">' + list[i].createTimeStr + '</a>';
                        pendingList += '        </span>';
                        pendingList += '    </td>';
                        pendingList += '    <td class="list-content-proposer">';
                        pendingList += '        <span class="list_content_sponsor">';
                        pendingList += '            <a title="申请人">' + list[i].promoter + '</a>';
                        pendingList += '        </span>';
                        pendingList += '    </td>';
                        pendingList += '</tr>';
                    }

                    $("#pending").html(pendingList);
                }

                //跟踪
                $('#trackingNumber').text('(' + result.alreadyIssuedNumber + ')');

                var alreadyIssued = result.alreadyIssuedList;

                if (alreadyIssued === "empty") {
                    $("#history").html();
                } else {
                    var trackList = '';
                    for (let i = 0; i < alreadyIssued.length; i++) {
                        trackList += '<tr>';
                        trackList += '    <td class="list_content" style="width: 74%">';
                        trackList += '        <span class="list_content_name">';
                        trackList += '            <a class="check_color" onclick="taskDetails(\'' + alreadyIssued[i].url + '\',\'' + alreadyIssued[i].id + '\',\'' + alreadyIssued[i].taskId + '\')" title="' + alreadyIssued[i].title + '">' + alreadyIssued[i].title + '</a>';
                        trackList += '        </span>';
                        trackList += '    </td>';
                        trackList += '    <td class="list-content-time" style="width: 15%">';
                        trackList += '        <span class="list_content_date">';
                        trackList += '            <a title="申请时间">' + alreadyIssued[i].createTimeStr + '</a>';
                        trackList += '        </span>';
                        trackList += '    </td>';
                        trackList += '    <td class="list-content-proposer" style="width: 10%">';
                        trackList += '        <span class="list_content_sponsor">';
                        trackList += '            <a style="color: #2196F3;font-weight: 600;" title="当前待办人">' + alreadyIssued[i].currentExecutor + '</a>';
                        trackList += '        </span>';
                        trackList += '    </td>';
                        trackList += '</tr>';
                    }

                    $("#history").html(trackList);
                }
            },
            error: function (result) {
                layer.msg("出错！");
            }
        });
    });

    //用车申请单
    function carApplication() {
        window.location.href = "${path}/car/toCarApply";
    }

    //客饭审批单
    function meals() {
        window.location.href = "${path}/meals/toMeals";
    }

    //饭卡申请单
    function card() {
        window.location.href = "${path}/card/toCard";
    }

    //合同审查表
    function review() {
        window.location.href = "${path}/review/toReview";
    }

    //印章借用审批单
    function sealsBorrow() {
        window.location.href = "${path}/sealsBorrow/toSealsBorrow";
    }

    //印章使用审批单
    function sealsUse() {
        window.location.href = "${path}/sealsUse/toSealsUse";
    }

    //证照借用审批单（原件）
    function licenceBorrow() {
        window.location.href = "${path}/licenceBorrow/toLicenceBorrow";
    }

    //证照使用审批单（复印件）
    function licenceUse() {
        window.location.href = "${path}/licenceUse/toLicenceUse";
    }

    //设备维修申请单
    function maintain() {
        window.location.href = "${path}/maintain/toMaintain";
    }

    //验收单
    function acceptance() {
        window.location.href = "${path}/acceptance/toAcceptance";
    }

    //工程名称变更记录表
    function engineering() {
        window.location.href = "${path}/engineering/toEngineering";
    }

    //固定资产投资完成验收单（生产用）
    function assets() {
        window.location.href = "${path}/actTab/toFixedAssets";
    }

    //办公用品需求计划
    function supplies() {
        window.location.href = "${path}/actTab/toOfficeSupplies";
    }

    //确认单审批单 confirm
    function confirm() {
        window.location.href = "${path}/confirm/toConfirm";
    }

    //信息联络处理单
    function liaison() {
        window.location.href = "${path}/liaison/toInformationLiaison";
    }

    //收文阅办审批单
    function read() {
        window.location.href = "${path}/read/toRead";
    }

    //资产领用申请单
    function assetUse() {
        window.location.href = "${path}/assetUse/toAssetUse";
    }

    //会议室申请单
    function conferenceRoom() {
        window.location.href = "${path}/conferenceRoom/toConferenceRoom";
    }

    //请假申请单
    function leaveRequest() {
        window.location.href = "${path}/leaveRequest/toLeaveRequest";
    }

    /*------其他------*/

    //上传
    function filesUpload() {
        window.location.href = "${path}/actTab/filesUpload";
    }

    //下载
    function filesDownload() {
        window.location.href = "${path}/actTab/filesDownload";
    }

    //待办工作板块 - 任务审批处理页面
    function taskApprovalHandle(url, id, taskId) {
        url += "/approval";
        window.location.href = "${path}" + url + "?id=" + id + "&taskId=" + taskId;
    }

    //跟踪事项板块 - 任务详情
    function taskDetails(url, id, taskId) {
        url += "/details";
        window.location.href = "${path}" + url + "?id=" + id + "&taskId=" + taskId;
    }

    //更多待办任务
    function morePending() {
        window.location.href = "${path}/collaboration/pending?page=1";
    }

    //更多已发任务
    function moreAlreadySend() {
        window.location.href = "${path}/collaboration/alreadySend?page=1";
    }
</script>
</html>