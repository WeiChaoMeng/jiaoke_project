<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/10/8
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OA系统</title>
    <link rel="stylesheet" type="text/css" href="/static/css/nav.css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <link rel="stylesheet" type="text/css" href="/static/fonts/font_2/iconfont.css">
    <link rel="stylesheet" type="text/css" href="/static/fonts/font_3/iconfont.css">
</head>
<body>
<div class="nav nav-mini">
    <div class="nav-top">
        <div id="mini" style="border-bottom: 2px #fff solid;">
            <img style="padding: 3.5px 13px" src="../../../static/images/icon/mini.png">
        </div>
    </div>
    <ul>
        <li class="nav-item">
            <a>
                <i class="iconfont icon-gerenshiwu"></i>
                <span class="parent-menu-span">个人事务</span>
                <i class="my-icon nav-more"></i>
            </a>
            <ul>
                <li><a id="persional_attendance"><span>个人考勤</span></a></li>
                <li><a id="persional_salary"><span>个人工资</span></a></li>
                <li><a id="wage_statistics"><span>工资统计</span></a></li>
                <li><a id="schedule_planning"><span>日程计划</span></a></li>
                <li><a id="notepad"><span>待办记事</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a><i class="iconfont icon-m3-newCoordination-copy"></i>
                <span class="parent-menu-span">协同工作</span>
                <i class="my-icon nav-more"></i>
            </a>
            <ul>
                <li><a id="new_matter"><span>新建事项</span></a></li>
                <li><a id="waiting_matter"><span>待发事项</span></a></li>
                <li><a id="already_issued_matter"><span>已发事项</span></a></li>
                <li><a id="to_do_matter"><span>待办事项</span></a></li>
                <li><a id="managed_matter"><span>已办事项</span></a></li>
                <li><a id="supervision_matters"><span>督办事项</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a><i class="iconfont icon-gongwen"></i>
                <span class="parent-menu-span">公文管理</span>
                <i class="my-icon nav-more"></i></a>
            <ul>
                <shiro:hasPermission name="createDocument">
                    <li><a id="release_document"><span>新建公文</span></a></li>
                    <li><a id="primed_document"><span>待发公文</span></a></li>
                    <li><a id="issued_document"><span>已发公文</span></a></li>
                </shiro:hasPermission>
                <li><a id="pending_document"><span>待办公文</span></a></li>
                <li><a id="done_document"><span>已办公文</span></a></li>

            </ul>
        </li>

        <%--<li class="nav-item">
            <a><i class="iconfont icon-danganguanli"></i>
                <span class="parent-menu-span">档案管理</span>
                <i class="my-icon nav-more"></i>
            </a>
            <ul>
                <li><a id="contract_archives"><span>合同档案</span></a></li>
                <li><a id="general_office"><span>综合办公室</span></a></li>
                <li><a id="business_development"><span>经营开发部</span></a></li>
                <li><a id="quality_technology"><span>质量技术部</span></a></li>
                <li><a id="material_administration"><span>物资管理部</span></a></li>
                <li><a id="finance_administration"><span>财务管理部</span></a></li>
                <li><a id="production_administration"><span>生产管理部</span></a></li>
            </ul>
        </li>--%>

        <shiro:hasPermission name="comprehensiveOffice">
            <li class="nav-item">
                <a><i class="iconfont icon-danganguanli"></i>
                    <span class="parent-menu-span" id="office">综合办公室档案</span>
                    <i class="my-icon nav-more"></i>
                </a>
                <ul>
                    <li>
                        <a id="office_release_document" onclick="IFrame(this,$('#office').text(),'comprehensiveOffice/officeReleaseDocument')">
                            <span>公司发文</span>
                        </a>
                    </li>
                    <li>
                        <a id="office_receive_document" onclick="IFrame(this,$('#office').text(),'comprehensiveOffice/officeReceiveDocument')">
                            <span>公司收文</span>
                        </a>
                    </li>
                    <li>
                        <a id="office_meeting_summary" onclick="IFrame(this,$('#office').text(),'comprehensiveOffice/officeMeetingSummary')">
                            <span>会议纪要</span>
                        </a>
                    </li>
                    <li>
                        <a id="office_management_system" onclick="IFrame(this,$('#office').text(),'comprehensiveOffice/officeManagementSystem')">
                            <span>管理体系相关</span>
                        </a>
                    </li>
                    <li>
                        <a id="office_contract_agreement" onclick="IFrame(this,$('#office').text(),'comprehensiveOffice/officeContractAgreement')">
                            <span>合同、协议</span>
                        </a>
                    </li>
                    <li>
                        <a id="office_eia_monitoring" onclick="IFrame(this,$('#office').text(),'comprehensiveOffice/officeEiaMonitor')">
                            <span>环评监测报告</span>
                        </a>
                    </li>
                    <li>
                        <a id="office_other_documents" onclick="IFrame(this,$('#office').text(),'comprehensiveOffice/officeOtherDocuments')">
                            <span>其他文件</span>
                        </a>
                    </li>
                </ul>
            </li>
        </shiro:hasPermission>

        <shiro:hasPermission name="financialManagement">
            <li class="nav-item">
                <a><i class="iconfont icon-danganguanli"></i>
                    <span class="parent-menu-span">财务管理部档案</span>
                    <i class="my-icon nav-more"></i>
                </a>
                <ul>
                    <li><a id="voucher"><span>凭证</span></a></li>
                    <li><a id="finance_contract"><span>合同</span></a></li>
                    <li><a id="finance_bill"><span>票据</span></a></li>
                    <li><a id="confirm"><span>确认</span></a></li>
                    <li><a id="report_material"><span>报表及资料</span></a></li>
                    <li><a id="finance_other_documents"><span>其他文件</span></a></li>
                </ul>
            </li>
        </shiro:hasPermission>

        <li class="nav-item">
            <a><i class="iconfont icon-huiyiguanli"></i>
                <span class="parent-menu-span">会议管理</span>
                <i class="my-icon nav-more"></i></a>
            <ul>
                <li><a id="meeting_schedule"><span>会议安排</span></a></li>
                <li><a id="conference_calendar"><span>会议日历</span></a></li>
                <li><a id="not_open_meeting"><span>待开会议</span></a></li>
                <li><a id="historical_conference"><span>已开会议</span></a></li>
                <li><a id="conference_resources"><span>会议资源</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a><i class="iconfont icon-ziyuanguanli"></i>
                <span class="parent-menu-span">资源管理</span>
                <i class="my-icon nav-more"></i></a>
            <ul>
                <li><a id="resource_storage"><span>资源入库</span></a></li>
                <li><a id="resources_archives"><span>资源档案</span></a></li>
                <li><a id="apply_resource"><span>申领资源</span></a></li>
                <li><a id="receive_record"><span>领用记录</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a><i class="iconfont icon-wenhua"></i>
                <span class="parent-menu-span">企业文化建设</span>
                <i class="my-icon nav-more"></i></a>
            <ul>
                <li><a id="announcements"><span>公告</span></a></li>
                <li><a id="news"><span>新闻</span></a></li>
            </ul>
        </li>
    </ul>
</div>

<!--现在位置-->
<div class="right" style="width: 100%; height: 100%;">
    <div class="right_page">

        <div class="now_location">
            <span class="now_location_icon">
                <img src="../../../static/images/icon/homepage.png">
            </span>

            <span class="now_location_content" id="content">
               <a>个人空间</a>

            </span>
        </div>

        <iframe src="oaIndex.do" id="oa-iframe" name="right" width="99%" height="92%" frameborder="0"
                scrolling="auto" style="padding-left:10px;"></iframe>
    </div>
</div>
</body>
<!--<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>-->
<!--<script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>-->
<script src="../../../static/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../../../static/js/oa/nav.js"></script>
<script>
    function IFrame(own,fatherMenuTitle,url) {
        var content = $('#content');
        content.empty();
        content.append("<a style='margin-right:8px'>" + fatherMenuTitle + "</a>" + ">" + "<a style='margin-left: 8px'>" + $(own).children().text() + "</a>");
        $('#oa-iframe').attr("src", url);
    }
</script>
</html>