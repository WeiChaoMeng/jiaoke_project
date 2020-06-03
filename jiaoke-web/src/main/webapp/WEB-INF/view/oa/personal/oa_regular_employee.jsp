<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>正式员工</title>
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

    .simpletable tbody tr:hover {
        background-color: #bdbdbd80;
    }
</style>
<body style="padding: 15px">

<table class="simpletable simpletable_color">

    <thead>
    <th style="width: 5%">序号</th>
    <th style="width: 28%">表名称</th>
    <th style="width: 13%">实发总金额</th>
    <th style="width: 13%">总数/已发</th>
    <th style="width: 15%">结算日期</th>
    <th style="width: 15%">上传时间</th>
    <th style="width: 10%">操作</th>
    </thead>

    <tbody>
    <%--oaWageStatisticsList--%>
    <c:forEach items="${oaWageStatisticsList}" var="wageStatistics" varStatus="status">
        <tr onclick="wageStatisticsDetails(this)">
            <input type="hidden" value="${wageStatistics.id}" id="wageStatisticsId">
            <input type="hidden" value="${wageStatistics.overallNumberPeople}" id="overallNumberPeople">
            <td>${status.count}</td>
            <td>${wageStatistics.name}</td>
            <td>${wageStatistics.grossActualAmount}</td>
            <td>${wageStatistics.overallNumberPeople}/${wageStatistics.quantityIssued}</td>
            <td>${wageStatistics.settlementDate}</td>
            <td>${wageStatistics.createDateStr}</td>
            <td class="operation-content" style="padding: 0;">
                <div style="margin: 0 auto;width:90px;height: 30px;">
                    <a style="z-index: 1000;" onclick="dele(this)">删除</a>
                    <span>|</span>
                    <a>编辑</a>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>

</table>

<div style="position: fixed;bottom: 30px;left: 45%;background: #92ebff;border: solid 1px #d4d4d4;">
    <input id="fileSelect" type="file"
           style="height: 30px;opacity: 0;width: 102px;position: absolute;left: 0;top: 0;"
           value="" onchange="importExcel(this)" multiple="multiple"
           accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel">
    <span style="width: 60px;float: left;line-height: 28px;padding: 0 20px;text-align: center;">
        <a href="javascript:;">导入Excel</a>
    </span>

</div>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script>

    //导入excel
    function importExcel(obj) {
        //正则表达式获取文件名，不带后缀
        var filePath = $(obj).val();
        if (filePath == null || filePath === undefined || filePath === '') {
            return false;
        }
        var data = new FormData();
        $.each($(obj)[0].files, function (i, file) {
            data.append('file', file);
        });
        console.log(data);
        $.ajax({
            cache: true,
            type: "POST",
            url: '${path}/wageStatistics/importPersonalWages',
            data: data,
            contentType: false,    //不可缺
            processData: false,    //不可缺
            error: function (request) {
                alert("Connection error");
            },
            success: function (result) {
                if (result === "success") {
                    alert("Excel导入成功");
                    location.reload();
                } else {
                    alert("Excel导入失败");
                }
            }
        });
    }

    function wageStatisticsDetails(own) {
        var wageStatisticsId = $(own).find("input[id='wageStatisticsId']").val();
        // var wageStatisticsId = $("#wageStatisticsId").val();
        window.location.href = "${path}/wageStatistics/toRegularEmployeeDetails?wageStatisticsId=" + wageStatisticsId;
    }

    function dele(own) {
        var r = confirm("是否要删除已选择？");
        if (r === true) {
            alert("删除成功");
            preventBubble();
        }
        else {
            alert("取消删除");
            preventBubble();
        }

        preventBubble();
    }

    function preventBubble(event) {
        var e = arguments.callee.caller.arguments[0] || event; //若省略此句，下面的e改为event，IE运行可以，但是其他浏览器就不兼容  
        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else if (window.event) {
            window.event.cancelBubble = true;
        }
    }

</script>
</html>
