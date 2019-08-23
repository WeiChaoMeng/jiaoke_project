<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2019-8-6
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人事管理</title>
    <link rel="stylesheet" type="text/css" href="../../../static/css/personnel/personnelCommon.css">
</head>
<body>
<%--菜单--%>
<div class="nav">
    <ul id="nav-ul">
        <li class="nav-item" id="JB">
            <img src="../../../static/images/personnel/basic.png">
            <span>基本信息</span>
        </li>

        <li class="nav-item" id="DA">
            <img src="../../../static/images/personnel/archives.png">
            <span>员工档案</span>
        </li>

        <li class="nav-item" id="DT">
            <img src="../../../static/images/personnel/dynamic.png">
            <span>人员管理</span>
        </li>

        <li class="nav-item" id="HT">
            <img src="../../../static/images/personnel/contract.png">
            <span>合同管理</span>
        </li>
    </ul>
</div>

<div class="frame-page">
    <iframe class="personnel" src="toHomePage" id="personnel" name="personnel" frameborder="0"
            scrolling="auto"></iframe>
</div>
</body>
<script src="../../../static/js/jquery.min.js" type="text/javascript"></script>
<script>
    $('#nav-ul li').on('click',function () {
        $('#nav-ul li').removeClass('nav-item-style');
        $(this).addClass('nav-item-style');
    });

    $('.nav-item').click(function () {
        switch ($(this).attr('id')) {
            case 'JB':
                $("#personnel").attr("src", "toBasic?page=1");
                break;

            case 'DA':
                $("#personnel").attr("src", "toFile?page=1");
                break;

            case 'DT':
                $("#personnel").attr("src", "toDynamic?page=1");
                break;

            case 'HT':
                $("#personnel").attr("src", "toContract?page=1");
                break;
        }

    })
</script>
</html>
