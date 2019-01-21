<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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

    <!--1-->
    <div class="oa_homepage_upper_left">
        <div class="oa_homepage_modular_head">
            <!--<div style="background:#fff;position: absolute;top: 37px;left: 3%;right: 3%;height: 3px;width: 94%;"></div>-->
            <ul style="margin: 0;padding: 0">
                <li id="upcoming" class="upper_left_head_a head_option">
                    <a>
                        <span>待办工作</span>
                        <span>(2)</span>
                    </a>
                </li>

                <span class="head_dividing_line">|</span>

                <li id="form_approval" class="upper_left_head_b head_option">
                    <a>
                        <span>表单审批</span>
                        <span>(2)</span>
                    </a>
                </li>
            </ul>
        </div>

        <div id="menu1" class="menu1_style">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                <tr>
                    <td class="list_content">
                        <li>
                            <span class="list_content_name">
                                <a class="check_color" title="人力资源需求申请表">人力资源需求申请表</a>
                            </span>

                            <span class="list_content_date">
                                <a>2018-08-19</a>
                            </span>

                            <span class="list_content_sponsor">
                                <a>黄岐</a>
                            </span>

                            <span class="list_content_operating">
                                <a style="color: #2D93CA">协同</a>
                            </span>
                        </li>

                        <li>
                            <span class="list_content_name">
                                <a class="check_color" title="测试">测试</a>
                            </span>

                            <span class="list_content_date">
                                <a>2018-08-19</a>
                            </span>

                            <span class="list_content_sponsor">
                                <a>管理员</a>
                            </span>

                            <span class="list_content_operating">
                                <a style="color: #2D93CA">协同</a>
                            </span>
                        </li>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div id="menu2" class="menu2_style">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                <tr>
                    <td class="list_content">
                        <li>
                            <span class="list_content_name">
                                <a class="check_color" title="人力资源需求申请表">合同审批单</a>
                            </span>

                            <span class="list_content_date">
                                <a>2018-08-19</a>
                            </span>

                            <span class="list_content_sponsor">
                                <a>张三</a>
                            </span>

                            <span class="list_content_operating">
                                <a style="color: #2D93CA">协同</a>
                            </span>
                        </li>

                        <li>
                            <span class="list_content_name" title="测试">
                                <a class="check_color">请假单</a>
                            </span>

                            <span class="list_content_date">
                                <a>2018-08-19</a>
                            </span>

                            <span class="list_content_sponsor">
                                <a>管理员</a>
                            </span>

                            <span class="list_content_operating">
                                <a style="color: #2D93CA">协同</a>
                            </span>
                        </li>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!--2-->
    <div class="oa_homepage_upper_right">
        <iframe src="calendar_index.do" id="oa-iframe" name="right" width="100%" height="100%"
                frameborder="0"
                scrolling="auto"></iframe>
    </div>

    <!--3-->
    <div class="oa_homepage_bottom_left">
        <div class="oa_homepage_modular_head">
            <!--<div style="position: absolute;top: 37px;left: 3%;right: 3%;height: 3px;width: 94%;"></div>-->
            <ul style="margin: 0;padding: 0">
                <li class="upper_left_head_a">
                    <a style="font-size: 13px;">
                        <span>我的模板</span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="template_content">

            <!---->
            <div>
                <div style="height:100%;width:100%;">

                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tbody>
                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" id="leaveRequest" title="请假申请单">
                                    <img src="../../../static/images/icon/table.png">请假申请单</a>
                            </td>

                            <td class="template" valign="middle" id="conferenceRoom">
                                <a class="check_color" title="会议室申请单"><img src="/static/images/icon/table.png">会议室申请单</a>
                            </td>

                            <td class="template" valign="middle" id="assetUse">
                                <a class="check_color" title="资产领用申请单"><img src="/static/images/icon/table.png">资产领用申请单</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <!---->
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tbody>
                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" title="借款单"><img src="/static/images/icon/table.png">借款单</a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" title="出差申请单"><img src="/static/images/icon/table.png">出差申请单</a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" title="合同审批单"><img src="/static/images/icon/table.png">合同审批单</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tbody>
                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" title="离职审批单"><img src="/static/images/icon/table.png">离职审批单</a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" title="考勤申请单"><img src="/static/images/icon/table.png">考勤申请单</a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" title="员工转正审批单"><img src="/static/images/icon/table.png">员工转正审批单</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <!---->

                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tbody>
                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" title="资产采购申请单"><img src="/static/images/icon/table.png">资产采购申请单</a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" title="购书申请单">购书申请单</a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" title="公务用车申请单"><img src="/static/images/icon/table.png">公务用车申请单</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tbody>
                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" title="油补申请审批表"><img src="/static/images/icon/table.png">油补申请审批表</a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" title="审计委托申请书"><img src="/static/images/icon/table.png">审计委托申请书</a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" title="带薪年休假审批单"><img src="/static/images/icon/table.png">带薪年休假审批单</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                </div>
            </div>
            <!---->

        </div>
    </div>

    <!--4-->
    <div class="oa_homepage_bottom_right">
        <div class="oa_homepage_modular_head">
            <!--<div style="position: absolute;top: 37px;left: 3%;right: 3%;height: 3px;width: 94%;"></div>-->
            <ul style="margin: 0;padding: 0">
                <li id="tracking_items" class="upper_left_head_a head_option">
                    <a>
                        <span>跟踪事项</span>
                        <span>(2)</span>
                    </a>
                </li>

                <span class="head_dividing_line">|</span>

                <li id="schedule" class="upper_left_head_b head_option">
                    <a style="font-size: 13px;">
                        <span>日程时间</span>
                        <span>(2)</span>
                    </a>
                </li>
            </ul>
        </div>

        <div id="menu3" class="menu1_style">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                <tr>
                    <td class="list_content">
                        <li>
                            <span class="list_content_name">
                                <a class="check_color" title="人力资源需求申请表">采购审批单</a>
                            </span>

                            <span class="list_content_date">
                                <a>2018-08-19</a>
                            </span>

                            <span class="list_content_sponsor">
                                <a>赵柳</a>
                            </span>

                            <span class="list_content_operating">
                                <a style="color: #2D93CA">协同</a>
                            </span>
                        </li>

                        <li>
                            <span class="list_content_name">
                                <a class="check_color" title="测试">测试</a>
                            </span>

                            <span class="list_content_date">
                                <a>2018-08-19</a>
                            </span>

                            <span class="list_content_sponsor">
                                <a>管理员</a>
                            </span>

                            <span class="list_content_operating">
                                <a style="color: #2D93CA">协同</a>
                            </span>
                        </li>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div id="menu4" class="menu2_style">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                <tr>
                    <td class="list_content">
                        <li>
                            <span class="list_content_name ">
                                <a class="check_color" title="人力资源需求申请表">公务用车申请单</a>
                            </span>

                            <span class="list_content_date">
                                <a>2018-08-19</a>
                            </span>

                            <span class="list_content_sponsor">
                                <a>张三</a>
                            </span>

                            <span class="list_content_operating">
                                <a style="color: #2D93CA">协同</a>
                            </span>
                        </li>

                        <li>
                            <span class="list_content_name">
                                <a class="check_color" title="请假单">请假单</a>
                            </span>

                            <span class="list_content_date">
                                <a>2018-08-19</a>
                            </span>

                            <span class="list_content_sponsor">
                                <a>杰克</a>
                            </span>

                            <span class="list_content_operating">
                                <a style="color: #2D93CA">协同</a>
                            </span>
                        </li>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../static/js/oa/oa_common.js"></script>

<script>
    //请假申请单
    $('#leaveRequest').on('click', function () {
        window.location.href = "${path}/activitiForm/toLeaveRequest";
    });

    //资产领用申请单
    $('#assetUse').on('click', function () {
        window.location.href = "${path}/activitiForm/toAssetUse";
    });

    //会议室申请单
    $('#conferenceRoom').on('click', function () {
        window.location.href = "${path}/activitiForm/toConferenceRoom";
    });
</script>
</html>