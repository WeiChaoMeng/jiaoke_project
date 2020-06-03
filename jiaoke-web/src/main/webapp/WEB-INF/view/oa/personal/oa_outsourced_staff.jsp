<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>外包员工</title>
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
        <th style="width: 5%">序号</th>
        <th style="width: 23%">表名称</th>
        <th style="width: 13%">实发总金额</th>
        <th style="width: 13%">总数</th>
        <th style="width: 10%">结算月份</th>
        <th style="width: 15%">上传日期</th>
        <th style="width: 10%">上传人</th>
        <th style="width: 10%">操作</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach items="${outsourcedStatisticsList}" var="outsourcedStatistics" varStatus="status">
        <tr onclick="wageStatisticsDetails(this)">
            <input type="hidden" value="${outsourcedStatistics.id}" id="wageStatisticsId">
            <td>${status.count}</td>
            <td>${outsourcedStatistics.name}</td>
            <td>${outsourcedStatistics.totalAmount}</td>
            <td>${outsourcedStatistics.total}</td>
            <td>${outsourcedStatistics.settlementMonth}</td>
            <td>${outsourcedStatistics.createDate}</td>
            <td>${outsourcedStatistics.uploadUsers}</td>
            <td class="operation-content" style="padding: 0;">
                <div>
                    <a style="z-index: 1000;float: none;" onclick="dele(this)">删除</a>
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
            url: '${path}/wageStatistics/importOutsourcedStaffWages',
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
        window.location.href = "${path}/wageStatistics/toOutsourcedDetails?wageStatisticsId=" + wageStatisticsId;
    }
</script>
</html>
