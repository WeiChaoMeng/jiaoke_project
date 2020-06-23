<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <title>正式员工详情</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
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

    .clickColor {
        background: #bdbdbd80;
    }

    .simpletable tbody tr:hover{
        background: #bdbdbd80;
    }
</style>
<body>

<table class="simpletable simpletable_color" style="margin-top: 10px;width: 2500px;color: #000;">

    <thead>
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
    <th style="width: 130px;">操作</th>
    <th style="width: 10px"></th>
    </thead>

    <tbody id="tbody"></tbody>

</table>

<div id="fenye" style="right: 10px;position: fixed;bottom: 10px;">
    <div class="">
        <div class="" style="float: right;">
            <ul class="pagination" id="pagination" style="margin: 0"></ul>
        </div>
    </div>
</div>

<div style="position: fixed;bottom: 10px;left: 44%;">
    <input id="sendAll" type="button" value="一键发送" onclick="sendAll()"
           style="padding: 7px 15px;background: #92ebff;border: 1px #a5a5a5 solid;">
</div>

<div style="position: fixed;bottom: 10px;right: 44%;">
    <input type="button" value="返回" onclick="previousPage()"
           style="padding: 7px 20px; background: #92ebff;border: 1px #a5a5a5 solid;color: #000;">
</div>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/paging/jqPaginator.js"></script>
<script>

    var total = $('#total').val();

    $.jqPaginator('#pagination', {
        totalPages: Math.ceil(total / 13), //(10 + 5 -1) / 5,// 总页数 = （当前页 + 每页大小 - 1） / 每页大小
        visiblePages: 10,
        currentPage: 1,
        prev: '<li class="prev"><a href="javascript:;">前一页</a></li>',
        next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
        onPageChange: function (page) {
            let rows = 13;
            var wageStatisticsId = $('#wageStatisticsId').val();
            $.ajax({
                type: "post",
                url: '${path}/wageStatistics/pagingList',
                data: {"wageStatisticsId": wageStatisticsId, "page": page, "rows": rows},
                success: function (data) {
                    if (data === "error") {
                        alert("没有数据")
                    } else {
                        var pagingHtml = "";
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
                            pagingHtml += '<td class="operation-content">';
                            pagingHtml += '<a>删除</a>';
                            pagingHtml += '<span>|</span>';
                            pagingHtml += '<a>编辑</a>';
                            pagingHtml += '</td>';
                            pagingHtml += '</tr>';
                        }
                        $("#tbody").html(pagingHtml);
                    }
                },
                error: function (msg) {
                    alert("出错了！");
                }
            });

        }
    });

    $("#tbody").on('click', 'tr', function () {
        if ($(this).hasClass("clickColor")) {
            $(this).removeClass("clickColor");
        } else {
            var trs = $(this).parent().find("tr");
            trs.removeClass("clickColor");
            $(this).addClass("clickColor");
        }
    });

    //返回上一页
    function previousPage() {
        window.history.back();
    }

    function sendAll() {
        var wageStatisticsId = $('#wageStatisticsId').val();
        $.ajax({
            cache: true,
            type: "POST",
            url: '${path}/wageStatistics/sendAll',
            data: {"wageStatisticsId": wageStatisticsId},
            error: function (request) {
                alert("Connection error");
            },
            success: function (result) {
                if (result === "success") {
                    alert("发送成功！")
                    $('#sendAll').attr("disabled", true);
                    $('#sendAll').css("background-color", "#dde0e0");
                } else {
                    alert("发送失败！")
                }
            }
        })
    }
</script>
</html>
