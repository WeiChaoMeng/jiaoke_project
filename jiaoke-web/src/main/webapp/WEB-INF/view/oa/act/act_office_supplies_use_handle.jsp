<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>办公用品领用详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <style>
        .table-td-content {
            padding: 10px;
        }

        .tdLabel {
            text-align: right;
            padding-left: 10px;
        }

        .table-td-content {
            line-height: 35px;
            padding: 0 10px;
        }

        .formTable thead tr th {
            line-height: 40px;
            border: solid 1px #e5e5e5;
            text-align: center;
            background: #f6f6f6;
            white-space: nowrap;
            font-size: 13px;
            font-weight: 600;
        }
    </style>
</head>

<body id="body">

<div class="table-title">
    <span>${oaActOfficeSuppliesUse.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActOfficeSuppliesUse.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActOfficeSuppliesUse.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActOfficeSuppliesUse.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActOfficeSuppliesUse.annex}" delims="," var="annex">
                        <div class="table-file">
                            <div class="table-file-content">
                                <span class="table-file-title"
                                      title="${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}">${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}</span>
                                <a class="table-file-download icon"
                                   href="/fileDownloadHandle/download?fileName=${annex}"
                                   title="下载">&#xebda;</a>
                            </div>
                        </div>
                    </c:forTokens>
                </div>
            </div>
        </c:when>
    </c:choose>
</div>

<form id="oaActOfficeSuppliesUse">
    <table class="formTable" style="margin: 0">
        <thead>
        <tr>
            <th style="width: 10%">序号</th>
            <th style="width: 60%">办公用品名称</th>
            <th style="width: 15%">领取数量</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${oaActOfficeSuppliesUse.oaOfficeSuppliesUseList}" var="list" varStatus="status">
            <tr>
                <td class="table-td-content" style="text-align: center">${status.index+1}</td>
                <td class="table-td-content">${list.name}</td>
                <td class="table-td-content">${list.number}</td>
            </tr>
        </c:forEach>
        </tbody>

        <table class="formTable">
            <tr>
                <td class="tdLabel">领用部门</td>
                <td class="table-td-content" style="width: 18%;">
                    ${oaActOfficeSuppliesUse.recipientsDepartment}
                    <input type="hidden" name="id" value="${oaActOfficeSuppliesUse.id}">
                    <input type="hidden" name="promoter" value="${oaActOfficeSuppliesUse.promoter}">
                </td>

                <td class="tdLabel">领用人签字</td>
                <td class="table-td-content" style="width: 18%;">
                    ${oaActOfficeSuppliesUse.recipientsPreparer}
                </td>

                <td class="tdLabel">领用时间</td>
                <td class="table-td-content">
                    ${oaActOfficeSuppliesUse.recipientsDate}
                </td>
            </tr>
        </table>
    </table>
</form>
<div class="form-but" id="return">
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>
    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/officeSuppliesUse/approvalSubmit',
            data: $('#oaActOfficeSuppliesUse').serialize() + "&taskId=" + taskId + "&flag=" + flag,
            async: false,
            success: function (data) {
                if (data === 'success') {
                    //返回上一页
                    window.location.href = '${path}/oaHomePage/toOaHomePage';
                    window.top.tips("提交成功！", 0, 1, 1000);
                } else {
                    window.top.tips("提交失败！", 0, 2, 1000);
                }
            },
            error: function (result) {
                window.top.tips("出错！", 6, 2, 1000);
            }
        })
    }

    //打印
    function printContent() {
        $('#tool,#return').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool,#return').show();
        $('#body').css('width', '80%');
    }
</script>
</html>

