<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OA系统</title>
    <link rel="stylesheet" type="text/css" href="../../../static/css/nav.css">
    <link href="../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <link rel="stylesheet" type="text/css" href="../../../static/fonts/font_2/iconfont.css">
    <link rel="stylesheet" type="text/css" href="../../../static/fonts/font_3/iconfont.css">
</head>
<body>
<div class="nav nav-mini">
    <div class="nav-top">
        <div id="mini" style="border-bottom: 2px #fff solid;"><img  style="padding: 3.5px 13px" src="../../../static/images/mini.png"></div>
    </div>
    <ul>
        <li class="nav-item">
            <a><i class="iconfont icon-gerenshiwu"></i><span
                    style="margin-left: 10px;">个人事务</span><i
                    class="my-icon nav-more"></i></a>
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
                <span id="aaa" style="margin-left: 10px;">协同工作</span><i class="my-icon nav-more"></i>
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
            <a><i class="iconfont icon-gongwen"></i><span style="margin-left: 10px;">公文管理</span><i
                    class="my-icon nav-more"></i></a>
            <ul>
                <li><a id="document_processing"><span>公文发布</span></a></li>
                <li><a id="waiting_document"><span>待发公文</span></a></li>
                <li><a id="document_signing"><span>公文签收</span></a></li>
                <li><a id="historical_documents"><span>历史公文</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a><i class="iconfont icon-danganguanli"></i><span
                    style="margin-left: 10px;">档案管理</span><i
                    class="my-icon nav-more"></i></a>
            <ul>
                <li><a id="employee_files"><span>自有员工档案</span></a></li>
                <li><a id="dispatch_file"><span>劳务派遣档案</span></a></li>
                <li><a id="contract_archives"><span>合同档案</span></a></li>
                <li><a id=""><span>财务管理档案</span></a></li>
                <li><a id=""><span>生产管理部档案</span></a></li>
                <li><a id=""><span>质量技术部档案</span></a></li>
                <li><a id=""><span>物资管理部档案</span></a></li>
                <li><a id=""><span>综合办公室档案</span></a></li>
                <li><a id=""><span>经营开发部档案</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a><i class="iconfont icon-huiyiguanli"></i><span style="margin-left: 10px;">会议管理</span><i
                    class="my-icon nav-more"></i></a>
            <ul>
                <li><a id="meeting_schedule"><span>会议安排</span></a></li>
                <li><a id="conference_calendar"><span>会议日历</span></a></li>
                <li><a id="not_open_meeting"><span>待开会议</span></a></li>
                <li><a id="historical_conference"><span>已开会议</span></a></li>
                <li><a id="conference_resources"><span>会议资源</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a><i class="iconfont icon-ziyuanguanli"></i><span
                    style="margin-left: 10px;">资源管理</span><i
                    class="my-icon nav-more"></i></a>
            <ul>
                <li><a id="resource_storage"><span>资源入库</span></a></li>
                <li><a id="resources_archives"><span>资源档案</span></a></li>
                <li><a id="apply_resource"><span>申领资源</span></a></li>
                <li><a id="receive_record"><span>领用记录</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a><i class="iconfont icon-wenhua"></i><span style="margin-left: 10px;">企业文化建设</span><i
                    class="my-icon nav-more"></i></a>
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
                <img src="../../../static/images/homepage.png">
            </span>

            <span class="now_location_content" id="content">
               <a>个人空间</a>

            </span>
        </div>

        <iframe src="oa_index.jsp" id="oa-iframe" name="right" width="99%" height="92%" frameborder="0"
                scrolling="auto" style="padding-left:10px;"></iframe>
    </div>
</div>

<!--<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>-->
<!--<script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>-->
<script src="../../../static/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../../../static/js/oa/nav.js"></script>
</body>
</html>