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
                <div style="height:100%;width:100%;overflow: auto">

                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tbody>
                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('car')" title="用车申请单">
                                    <em class="template-icon">&#xe695;</em>用车申请单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('meals')" title="客饭审批单">
                                    <em class="template-icon">&#xe695;</em>客饭审批单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('card')" title="饭卡申请单">
                                    <em class="template-icon">&#xe695;</em>饭卡申请单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('sealsBorrow')" title="印章借用审批单">
                                    <em class="template-icon">&#xe695;</em>印章借用审批单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('sealsUse')" title="印章使用审批单">
                                    <em class="template-icon">&#xe695;</em>印章使用审批单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('licenceBorrow')" title="证照借用审批单（原件）">
                                    <em class="template-icon">&#xe695;</em>证照借用审批单（原件）
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('licenceUse')" title="证照使用审批单（复印件）">
                                    <em class="template-icon">&#xe695;</em>证照使用审批单（复印件）
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('review')" title="合同审查表">
                                    <em class="template-icon">&#xe695;</em>合同审查表
                                </a>
                            </td>
                        </tr>

                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('read')" title="收文阅办审批单">
                                    <em class="template-icon">&#xe695;</em>收文阅办审批单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('maintain')" title="设备维修申请单">
                                    <em class="template-icon">&#xe695;</em>设备维修申请单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('acceptance')" title="验收单">
                                    <em class="template-icon">&#xe695;</em>设备维修验收单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('engineering')" title="工程名称变更记录表">
                                    <em class="template-icon">&#xe695;</em>工程名称变更记录表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('document')" title="发送公文">
                                    <em class="template-icon">&#xe695;</em>发送公文
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('officeSupplies')" title="办公用品需求计划">
                                    <em class="template-icon">&#xe695;</em>办公用品需求计划
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('confirm')" title="确认单审批单">
                                    <em class="template-icon">&#xe695;</em>确认单审批单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('leave')" title="请假审批表">
                                    <em class="template-icon">&#xe695;</em>请假审批表
                                </a>
                            </td>
                        </tr>

                        <%--new--%>
                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="assetUse()" title="资产领用申请单">
                                    <em class="template-icon">&#xe695;</em>资产领用申请单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="conferenceRoom()" title="会议室申请单">
                                    <em class="template-icon">&#xe695;</em>会议室申请单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('regularization')" title="转正申请表">
                                    <em class="template-icon">&#xe695;</em>转正申请表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('transfer')" title="转岗审批表">
                                    <em class="template-icon">&#xe695;</em>转岗审批表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('annualLeave')" title="年休假审批表">
                                    <em class="template-icon">&#xe695;</em>年休假审批表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('rotation')" title="员工轮岗审批表">
                                    <em class="template-icon">&#xe695;</em>员工轮岗审批表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('rotationHandover')" title="轮岗交接表">
                                    <em class="template-icon">&#xe695;</em>轮岗交接表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('adjustWages')" title="调资审批表">
                                    <em class="template-icon">&#xe695;</em>调资审批表
                                </a>
                            </td>
                        </tr>

                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('productionLeave')" title="生产假审批表">
                                    <em class="template-icon">&#xe695;</em>生产假审批表
                                </a>
                            </td>


                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('dimission')" title="离职会签表">
                                    <em class="template-icon">&#xe695;</em>离职会签表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('pactStop')" title="劳务协议终止通知书">
                                    <em class="template-icon">&#xe695;</em>劳务协议终止通知书
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('pactSign')" title="劳务派遣员工协议签订、续订、变更、终止审批表">
                                    <em class="template-icon">&#xe695;</em>劳务派遣员工协议签订、续订、变更、终止审批表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('contractSign')"
                                   title="劳务派遣员工合同签订、续订、变更、终止审批表">
                                    <em class="template-icon">&#xe695;</em>劳务派遣员工合同签订、续订、变更、终止审批表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('laborContractStop')" title="劳动合同终止通知书">
                                    <em class="template-icon">&#xe695;</em>劳动合同终止通知书
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('laborContractSign')" title="劳动合同签订通知书">
                                    <em class="template-icon">&#xe695;</em>劳动合同签订通知书
                                </a>
                            </td>
                        </tr>

                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('laborContractRenewal')"
                                   title="劳动合同签订、续订、变更、终止审批表">
                                    <em class="template-icon">&#xe695;</em>劳动合同签订、续订、变更、终止审批表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('relieveLaborContract')" title="解除劳动合同审批表">
                                    <em class="template-icon">&#xe695;</em>解除劳动合同审批表
                                </a>
                            </td>

                            <%--<td class="template" valign="middle">--%>
                            <%--<a class="check_color" onclick="assets()" title="固定资产投资完成验收单（生产用）">--%>
                            <%--<em class="template-icon">&#xe695;</em>固定资产投资完成验收单（生产用）--%>
                            <%--</a>--%>
                            <%--</td>--%>

                            <%--<td class="template" valign="middle">--%>
                            <%--<a class="check_color" onclick="liaison()" title="信息联络处理单">--%>
                            <%--<em class="template-icon">&#xe695;</em>信息联络处理单--%>
                            <%--</a>--%>
                            <%--</td>--%>

                            <%--未完成--%>
                            <%--<td class="template" valign="middle">--%>
                            <%--<a class="check_color" onclick="commonJump('rewardsPenalties')" title="奖罚意见表">--%>
                            <%--<em class="template-icon">&#xe695;</em>奖罚意见表--%>
                            <%--</a>--%>
                            <%--</td>--%>

                            <%--<td class="template" valign="middle">--%>
                            <%--<a class="check_color" onclick="commonJump('overtime')" title="加班审批表、统计表">--%>
                            <%--<em class="template-icon">&#xe695;</em>加班统计表--%>
                            <%--</a>--%>
                            <%--</td>--%>
                        </tr>
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
                $('#dataNumber').text('(' + result.upcomingMatterNumber + ')');

                var list = result.upcomingMatterList;

                if (list === "empty") {
                    $("#pending").html();
                } else {
                    var pendingList = '';
                    for (let i = 0; i < list.length; i++) {
                        pendingList += '<tr>';
                        pendingList += '    <td class="list_content">';
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
                        pendingList += '</tr>';
                    }

                    $("#pending").html(pendingList);
                }

                //跟踪
                $('#trackingNumber').text('(' + result.trackingMatterNumber + ')');

                var alreadyIssued = result.trackingMatterList;

                if (alreadyIssued === "empty") {
                    $("#history").html();
                } else {
                    var trackList = '';
                    for (let i = 0; i < alreadyIssued.length; i++) {
                        trackList += '<tr>';
                        trackList += '    <td class="list_content" style="width: 69%">';
                        trackList += '        <span class="list_content_name">';
                        trackList += '            <a class="check_color" onclick="taskDetails(\'' + alreadyIssued[i].url + '\',\'' + alreadyIssued[i].correlationId + '\',\'' + alreadyIssued[i].taskId + '\')" title="' + alreadyIssued[i].title + '">' + alreadyIssued[i].title + '</a>';
                        trackList += '        </span>';
                        trackList += '    </td>';
                        trackList += '    <td class="list-content-time" style="width: 15%">';
                        trackList += '        <span class="list_content_date">';
                        trackList += '            <a title="申请时间">' + alreadyIssued[i].createTimeStr + '</a>';
                        trackList += '        </span>';
                        trackList += '    </td>';
                        trackList += '    <td class="list-content-proposer" style="width: 15%">';
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

    /*-----------new---------------*/

    function commonJump(classAddress) {
        window.location.href = "${path}" + classAddress + "/toIndex";
    }

    //固定资产投资完成验收单（生产用）
    function assets() {
        window.location.href = "${path}/actTab/toFixedAssets";
    }

    //办公用品需求计划
    function supplies() {
        window.location.href = "${path}/actTab/toOfficeSupplies";
    }

    //信息联络处理单
    function liaison() {
        window.location.href = "${path}/liaison/toInformationLiaison";
    }

    /*-------------------------------------------------------------*/
    //待办工作板块 - 任务审批处理页面
    function taskApprovalHandle(url, id, taskId) {
        if (url.indexOf('.do') !== -1) {
            window.location.href = "${path}approval" + url + "?id=" + id + "&taskId=" + taskId;
        } else {
            url += "/approval";
            window.location.href = "${path}" + url + "?id=" + id + "&taskId=" + taskId;
        }
    }

    //跟踪事项板块 - 任务详情
    function taskDetails(url, id, taskId) {
        if (url.indexOf('.do') !== -1) {
            window.location.href = "${path}details" + url + "?id=" + id + "&taskId=" + taskId;
        } else {
            url += "/details";
            window.location.href = "${path}" + url + "?id=" + id + "&taskId=" + taskId;
        }
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