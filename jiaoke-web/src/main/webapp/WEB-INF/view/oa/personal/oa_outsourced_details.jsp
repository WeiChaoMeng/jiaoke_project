<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>外包员工详情</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
</head>
<style>
    .simpletable thead tr th {
        text-align: center;
        text-indent: 0;
        width: 100px;
    }

    .simpletable tbody tr td {
        text-align: center;
        text-indent: 0;
    }
</style>
<body>

<table class="simpletable simpletable_color" style="margin-top: 10px;">

    <thead>
    <th>员工编号</th>
    <th>部门</th>
    <th>姓名</th>
    <th>岗位</th>
    <th>岗位工资</th>
    <th>技术职称津贴</th>
    <th>特殊工种津贴</th>
    <th>补发工资</th>
    <th>月奖</th>
    <th>高温津贴</th>
    <th>超时服务费</th>
    <th>应发工资</th>
    <th style="width: 140px">操作</th>
    <th style="width: 10px;"></th>
    </thead>

    <tbody>

    <tr></tr>
    <tr class="even">
        <td>W601</td>
        <td>技术部</td>
        <td>李四</td>
        <td>仪器仪表</td>
        <td>8000</td>
        <td>300</td>
        <td>600</td>
        <td>100</td>
        <td>400</td>
        <td>200</td>
        <td>0</td>
        <td>9600</td>
        <td>
            <div class="more-operation cursor_hand">
                <i class="toolico iconfont">&#xe7ea;</i>
                <i class="toolico iconfont">&#xe7e9;</i>
            </div>
        </td>
    </tr>

    </tbody>

</table>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script>

    /* 预定撤销 - 查询条件*/
    $("#condition5").on("change", function () {
        var opt = $("#condition5").val();
        if (opt == 2) {
            $(".head_right_side_select").css("display", "block");
            $(".head_right_side_input").css("display", "none");
        } else if (opt == 1) {
            $(".head_right_side_input").css("display", "block");
            $(".head_right_side_select").css("display", "none");
        } else {
            $(".head_right_side_input").css("display", "none");
            $(".head_right_side_select").css("display", "none");
        }
    });
</script>
</html>
