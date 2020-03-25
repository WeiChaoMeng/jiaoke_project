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
    <title>验收入库单详情</title>
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

        .relevance-tool {
            background: #f7f6f6;
            padding: 0;
            margin: 0;
            width: 100%;
        }

        .relevance-tool-padding {
            padding: 5px 0;
            border: solid 1px #eaeaea;

        }

        .relevance-file-content {
            display: inline-block;
            padding: 5px;
            cursor: pointer;
        }

        .relevance-content-link {
            color: #38adff;
            text-decoration: none;
            display: inline-block;
            vertical-align: middle;
        }
    </style>
</head>

<body id="body">

<div class="table-title">
    <span>${oaActAcceptanceWarehousing.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActAcceptanceWarehousing.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActAcceptanceWarehousing.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActAcceptanceWarehousing.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActAcceptanceWarehousing.annex}" delims="," var="annex">
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

    <c:choose>
        <c:when test="${oaActAcceptanceWarehousing.associatedId != null}">
            <div class="relevance-tool" id="relevanceList">
                <div class="relevance-tool-padding">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand" style="line-height: 20px">&#xea67;</button>
                    </div>

                    <div class="table-file">
                        <div class="relevance-file-content">
                            <span class="relevance-content-link" onclick="relevanceFormsDetails('${oaActAcceptanceWarehousing.associatedId}')">${oaActAcceptanceWarehousing.associatedName}</span>
                        </div>
                    </div>
                </div>
            </div>
        </c:when>
    </c:choose>
</div>

<table class="formTable" style="margin: 0">
    <thead>
    <tr>
        <th style="width: 7%">序号</th>
        <th style="width: 40%">物品名称</th>
        <th style="width: 16%">数量</th>
        <th style="width: 16%">验收时间</th>
        <th style="width: 21%">备注</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach items="${oaActAcceptanceWarehousing.oaAcceptanceWarehousingList}" var="list" varStatus="status">
        <tr>
            <td class="table-td-content" style="text-align: center">${status.index+1}</td>
            <td class="table-td-content">${list.name}</td>
            <td class="table-td-content">${list.number}</td>
            <td class="table-td-content">${list.date}</td>
            <td class="table-td-content">${list.remark}</td>
        </tr>
    </c:forEach>
    </tbody>

    <table class="formTable">
        <tr>
            <td class="tdLabel" style="width: 10%">购买人</td>
            <td class="table-td-content" style="width: 15%;">
                ${oaActAcceptanceWarehousing.purchaser}
            </td>

            <td class="tdLabel" style="width: 10%">签字时间</td>
            <td class="table-td-content" style="width: 15%;">
                ${oaActAcceptanceWarehousing.purchaserDate}
            </td>

            <td class="tdLabel" style="width: 10%">验收人</td>
            <td class="table-td-content" style="width: 15%;">
                ${oaActAcceptanceWarehousing.acceptor}
            </td>

            <td class="tdLabel" style="width: 10%">签字时间</td>
            <td class="table-td-content">
                ${oaActAcceptanceWarehousing.acceptorDate}
            </td>
        </tr>
    </table>
</table>
</flag>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //跳转办公用品需求计划表
    function relevanceFormsDetails(id) {
        window.top.relevanceFormsDetailsPreview(id);
    }

    //打印
    function printContent() {
        $('#tool,#return').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool').show();
        $('#body,#return').css('width', '80%');
    }
</script>
</html>

