<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人事管理</title>
    <link rel="stylesheet" type="text/css" href="../../../static/css/personnel/personnelCommon.css">
</head>
<body>
<%--菜单--%>
<div class="nav nav-mini">
    <ul id="nav-ul" class="nav-ul">
        <li class="nav-item" id="JB">
            <img src="../../../static/images/personnel/basic.png" style="width: 30px">
            <span>基本信息</span>
        </li>

        <li class="nav-item">
            <img src="../../../static/images/personnel/dynamic.png" style="width: 30px">
            <span>人员管理</span>

            <ul>
                <li><a id="entry"><span>入职</span></a></li>
                <li><a id="waitLeave"><span>等待离职</span></a></li>
                <li><a id="alreadyLeave"><span>已经离职</span></a></li>
                <li><a id="retired"><span>退休</span></a></li>
                <li><a id="jobChange"><span>职位变动</span></a></li>
            </ul>
        </li>

        <li class="nav-item" id="HT">
            <img src="../../../static/images/personnel/contract.png" style="width: 30px">
            <span>合同管理</span>

            <ul>
                <li><a id="contract"><span>合同台账</span></a></li>
                <%--<li><a id="terminate"><span>终止合同</span></a></li>--%>
                <%--<li><a id="relieve"><span>解除合同</span></a></li>--%>
            </ul>
        </li>

        <li class="nav-item" id="KQ">
            <img src="../../../static/images/personnel/kq.png" style="width: 30px">
            <span>考勤管理</span>
        </li>

        <li class="nav-item" id="GZ">
            <img src="../../../static/images/personnel/gz.png" style="width: 30px">
            <span>工资管理</span>

            <ul>
                <li><a id="regularEmployee"><span>正式职工</span></a></li>
                <li><a id="outsourcedStaff"><span>外包职工</span></a></li>
            </ul>
        </li>
    </ul>
</div>

<div class="frame-page">
    <iframe class="personnel" src="personnel/toHomePage" id="personnel" name="personnel" frameborder="0"
            scrolling="auto"></iframe>
</div>
</body>
<script src="../../../static/js/jquery.min.js" type="text/javascript"></script>
<script>
    $('.nav-item').click(function () {
        switch ($(this).attr('id')) {
            case 'JB':
                $("#personnel").attr("src", "personnel/toBasic?page=1");
                break;
            case 'KQ':
                $("#personnel").attr("src", "personalAttendance/toAttendanceStatistics");
                break;
        }
    });

    //入职管理
    $("#entry").on("click", function () {
        $('#personnel').attr("src", "personnel/toEntry?page=1");
    });

    //等待离职管理
    $("#waitLeave").on("click", function () {
        $('#personnel').attr("src", "personnel/toWaitLeave?page=1");
    });

    //已经离职管理
    $("#alreadyLeave").on("click", function () {
        $('#personnel').attr("src", "personnel/toAlreadyLeave?page=1");
    });

    //退休管理
    $("#retired").on("click", function () {
        $('#personnel').attr("src", "personnel/toRetireManage?page=1");
    });

    //职务及岗位变动管理
    $("#jobChange").on("click", function () {
        $('#personnel').attr("src", "personnel/toJobChange?page=1");
    });

    //职务及岗位变动管理
    $("#contract").on("click", function () {
        $('#personnel').attr("src", "personnel/toContract?page=1");
    });

    //工资管理-正式职工
    $("#regularEmployee").on("click", function () {
        $('#personnel').attr("src", "wageStatistics/toRegularEmployee");
    });

    //工资管理-外包职工
    $("#outsourcedStaff").on("click", function () {
        $('#personnel').attr("src", "wageStatistics/toOutsourcedStaff");
    });
</script>
</html>
