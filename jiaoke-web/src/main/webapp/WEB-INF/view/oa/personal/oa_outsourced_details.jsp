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
    <tr>
        <th>序号</th>
        <th>部门</th>
        <th>姓名</th>
        <th>岗位</th>
        <th>现岗位工资</th>
        <th>技术职称津贴</th>
        <th>特殊工种津贴</th>
        <th>通讯费</th>
        <th>交通补助</th>
        <th>交通油费补助</th>
        <th>值班费</th>
        <th>预支工资</th>
        <th>月奖</th>
        <th>高温津贴</th>
        <th>超时服务费</th>
        <th>扣发工资</th>
        <th>应发工资</th>
        <th>个人保险公积金</th>
        <th>个人所得税</th>
        <th>实发工资</th>
        <th>公司保险公积金</th>
        <th>服务费</th>
        <th>其他</th>
        <th>费用合计</th>
        <th>实结算日期</th>
        <th style="width: 10px;"></th>
    </tr>
    </thead>

    <tbody id="TBody"></tbody>

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

    var data = JSON.parse('${outsourcedStaffListJson}');
    var resultData = '';
    for (let i = 0; i < data.length; i++) {
        resultData += '<tr>';
        resultData += '<td>' + data[i].serialNumber + '</td>';
        resultData += '<td>' + data[i].department + '</td>';
        resultData += '<td>' + data[i].name + '</td>';
        resultData += '<td>' + data[i].position + '</td>';
        resultData += '<td>' + data[i].positionSalary + '</td>';
        resultData += '<td>' + data[i].technicalTitleAllowance + '</td>';
        resultData += '<td>' + data[i].specialWorkAllowance + '</td>';
        resultData += '<td>' + data[i].ceynXjm + '</td>';
        resultData += '<td>' + data[i].travelAllowance + '</td>';
        resultData += '<td>' + data[i].oilFilling + '</td>';
        resultData += '<td>' + data[i].dutyFee + '</td>';
        resultData += '<td>' + data[i].advanceWages + '</td>';
        resultData += '<td>' + data[i].monthlyAward + '</td>';
        resultData += '<td>' + data[i].megathermalAllowance + '</td>';
        resultData += '<td>' + data[i].overtimePay + '</td>';
        resultData += '<td>' + data[i].withholdingWages + '</td>';
        resultData += '<td>' + data[i].wagesPayable + '</td>';
        resultData += '<td>' + data[i].accumulationFund + '</td>';
        resultData += '<td>' + data[i].individualIncometax + '</td>';
        resultData += '<td>' + data[i].actualAmount + '</td>';
        resultData += '<td>' + data[i].companyGold + '</td>';
        resultData += '<td>' + data[i].serviceFee + '</td>';
        resultData += '<td>' + data[i].other + '</td>';
        resultData += '<td>' + data[i].totalExpenses + '</td>';
        resultData += '<td>' + data[i].settlementDate + '</td>';
        resultData += '</tr>';
    }
    $("#TBody").html(resultData);
</script>
</html>
