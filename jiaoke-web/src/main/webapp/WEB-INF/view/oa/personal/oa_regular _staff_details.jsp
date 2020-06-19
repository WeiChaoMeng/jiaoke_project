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
    <title>正式员工详情</title>
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
        <a><cite>正式职工</cite></a><span lay-separator="">/</span>
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
            <th style="width: 50px;">序号</th>
            <th style="width: 100px;">部门</th>
            <th style="width: 100px;">姓名</th>
            <th style="width: 150px;">岗位</th>
            <th style="width: 80px;">岗位工资</th>
            <th style="width: 100px;">技术职称津贴</th>
            <th style="width: 100px;">特殊工种津贴</th>
            <th style="width: 80px;">补发工资</th>
            <th style="width: 80px;">奖金</th>
            <th style="width: 80px;">月奖</th>
            <th style="width: 80px;">补助</th>
            <th style="width: 80px;">高温津贴</th>
            <th style="width: 80px;">加班费</th>
            <th style="width: 80px;">扣发工资</th>
            <th style="width: 80px;">应发工资</th>
            <th style="width: 80px;">养老险</th>
            <th style="width: 80px;">失业险</th>
            <th style="width: 80px;">医保</th>
            <th style="width: 80px;">大额</th>
            <th style="width: 80px;">公积金</th>
            <th style="width: 150px;">本月应扣三险一金合计</th>
            <th style="width: 150px;">扣三险及公积金后工资</th>
            <th style="width: 100px;">个人所得税</th>
            <th style="width: 80px;">会费</th>
            <th style="width: 80px;">实发金额</th>
            <th style="width: 80px;">结算日期</th>
            <th style="width: 10px"></th>

            <%--<th style="width: 50px">序号</th>--%>
            <%--<th style="width: 150px">部门</th>--%>
            <%--<th>姓名</th>--%>
            <%--<th style="width: 150px">岗位</th>--%>
            <%--<th>现岗位工资</th>--%>
            <%--<th>技术职称津贴</th>--%>
            <%--<th>特殊工种津贴</th>--%>
            <%--<th>通讯费</th>--%>
            <%--<th>交通补助</th>--%>
            <%--<th>交通油费补助</th>--%>
            <%--<th>值班费</th>--%>
            <%--<th>预支工资</th>--%>
            <%--<th>月奖</th>--%>
            <%--<th>高温津贴</th>--%>
            <%--<th>超时服务费</th>--%>
            <%--<th>扣发工资</th>--%>
            <%--<th>应发工资</th>--%>
            <%--<th>个人保险公积金</th>--%>
            <%--<th>个人所得税</th>--%>
            <%--<th>实发工资</th>--%>
            <%--<th>公司保险公积金</th>--%>
            <%--<th>服务费</th>--%>
            <%--<th>其他</th>--%>
            <%--<th>费用合计</th>--%>
            <%--<th>实结算日期</th>--%>
            <%--<th style="width: 10px;"></th>--%>
        </tr>
        </thead>

        <tbody id="TBody"></tbody>
    </table>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script>
    var data = JSON.parse('${oaPersonalWagesList}');
    var pagingHtml = '';
    for (let i = 0; i < data.length; i++) {
        pagingHtml += '<tr>';
        pagingHtml += '<td>' + data[i].serialNumber + '</td>';
        pagingHtml += '<td>' + data[i].department + '</td>';
        pagingHtml += '<td>' + data[i].name + '</td>';
        pagingHtml += '<td>' + data[i].position + '</td>';
        pagingHtml += '<td>' + data[i].positionSalary + '</td>';
        pagingHtml += '<td>' + data[i].technicalTitleAllowance + '</td>';
        pagingHtml += '<td>' + data[i].specialWorkAllowance + '</td>';
        pagingHtml += '<td>' + data[i].reissueWages + '</td>';
        pagingHtml += '<td>' + data[i].bonus + '</td>';
        pagingHtml += '<td>' + data[i].monthlyAward + '</td>';
        pagingHtml += '<td>' + data[i].subsidy + '</td>';
        pagingHtml += '<td>' + data[i].megathermalAllowance + '</td>';
        pagingHtml += '<td>' + data[i].overtimePay + '</td>';
        pagingHtml += '<td>' + data[i].withholdingWages + '</td>';
        pagingHtml += '<td>' + data[i].wagesPayable + '</td>';
        pagingHtml += '<td>' + data[i].endowmentInsurance + '</td>';
        pagingHtml += '<td>' + data[i].unemploymentInsurance + '</td>';
        pagingHtml += '<td>' + data[i].medicalInsurance + '</td>';
        pagingHtml += '<td>' + data[i].largeMedicalInsurance + '</td>';
        pagingHtml += '<td>' + data[i].accumulationFund + '</td>';
        pagingHtml += '<td>' + data[i].deductibleExpenses + '</td>';
        pagingHtml += '<td>' + data[i].feeAfterDeduction + '</td>';
        pagingHtml += '<td>' + data[i].individualIncomeTax + '</td>';
        pagingHtml += '<td>' + data[i].membershipFee + '</td>';
        pagingHtml += '<td>' + data[i].actualAmount + '</td>';
        pagingHtml += '<td>' + data[i].settlementDate + '</td>';
        pagingHtml += '</tr>';
    }
    $("#TBody").html(pagingHtml);
</script>
</html>
