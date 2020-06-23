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
    <link rel="stylesheet" href="../../../../static/new/css/font.css">
    <link rel="stylesheet" href="../../../../static/new/lib/layui/css/layui.css">
</head>
<style>
    body{
        overflow: hidden;
        height: 100%;
    }
    .simpletable thead tr th {
        text-align: center;
        text-indent: 0;
        width: 100px;
        background: #f2f2f2;
        border: solid 1px #e6e6e6;
        height: 37px;
        font-size: 14px;
        font-weight: 500;
    }

    .simpletable tbody tr td {
        text-align: center;
        text-indent: 0;
        border: 1px solid #e6e6e6;
    }

    .x-nav {
        padding: 0 20px;
        position: relative;
        z-index: 99;
        border-bottom: 1px solid #e5e5e5;
        line-height: 39px;
        height: 39px;
        overflow: hidden;
        background: #fff;
    }

    .layui-breadcrumb {
        visibility: visible;
        font-size: 0;
    }

    .x-nav > * {
        font-size: 13px;
    }

    .layui-breadcrumb a cite {
        color: #666;
        font-style: normal;
    }

    .layui-breadcrumb span[lay-separator] {
        margin: 0 10px;
        color: #999;
    }
</style>
<body>

<div class="x-nav">
    <span class="layui-breadcrumb" style="visibility: visible;display: inline-flex;">
        <a><cite>主页</cite></a><span lay-separator="">/</span>
        <a><cite>人事管理</cite></a><span lay-separator="">/</span>
        <a><cite>工资管理</cite></a><span lay-separator="">/</span>
        <a><cite>外包职工</cite></a><span lay-separator="">/</span>
        <a><cite>工资详情</cite></a>
    </span>

    <a class="layui-btn layui-btn-normal" style="margin-top: 5px;float: right;height: 30px;padding: 0 15px;line-height: 30px;" onclick="window.history.back()" title="返回">
        <i class="layui-icon layui-icon-return" style="font-size: 14px;"></i>
    </a>
</div>

<div style="overflow: auto;height: calc(100% - 45px);">
    <table class="simpletable simpletable_color" style="margin: 15px;">

        <thead>
        <tr>
            <th style="width: 50px">序号</th>
            <th style="width: 150px">部门</th>
            <th>姓名</th>
            <th style="width: 150px">岗位</th>
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
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script>
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
