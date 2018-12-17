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
    <title>外包员工</title>
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
    <th style="width: 5%">序号</th>
    <th style="width: 28%">表名称</th>
    <th style="width: 13%">实发金额</th>
    <th style="width: 13%">总数/已发</th>
    <th style="width: 15%">结算日期</th>
    <th style="width: 15%">上传时间</th>
    <th style="width: 10%">操作</th>
    <th></th>
    </thead>

    <tbody>

    <tr></tr>
    <tr class="even">
        <td>1</td>
        <td>外包职工工资表</td>
        <td>320332.12</td>
        <td>61/23</td>
        <td>2018-12</td>
        <td>2018-12-12</td>
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

    //导入excel
    function importExcel(filePath){
        alert("外包员工" + filePath);
        location.reload();
    }
</script>
</html>
