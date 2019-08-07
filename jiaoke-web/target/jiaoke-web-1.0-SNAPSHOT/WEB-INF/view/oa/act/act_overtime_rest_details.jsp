<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>加班（倒休）审批表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActOvertimeRest.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActOvertimeRest.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActOvertimeRest.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActOvertimeRest.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActOvertimeRest.annex}" delims="," var="annex">
                        <div class="table-file">
                            <div class="table-file-content">
                                <span title="${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}">${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}</span>
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

<table class="formTable">
    <tbody>
    <tr>
        <td class="tdLabel">单位名称</td>
        <td colspan="5" class="table-td-content">
            <c:choose>
                <c:when test="${oaActOvertimeRest.company == 0}">
                    北京市政路桥建材集团有限公司路驰分公司
                </c:when>
            </c:choose>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">姓名</td>
        <td class="table-td-content">
            ${oaActOvertimeRest.name}
        </td>

        <td class="tdLabel">申请时间</td>
        <td class="table-td-content">
            ${oaActOvertimeRest.applyDateStr}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">事由</td>
        <td colspan="5" class="table-td-evaluation">
            <textarea class="evaluation-content-disabled" style="height: 90px" readonly>${oaActOvertimeRest.reason}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期:</label>
                <input class="approval-date-input" type="text" value="${oaActOvertimeRest.createTimeStr}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">本人签字:</label>
                <input class="approval-signature-input" type="text" value="${oaActOvertimeRest.promoterStr}" readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">部门负责人</td>
        <td colspan="5" class="approval-content">
            <textarea disabled="disabled" class="approval-content-textarea"></textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期:</label>
                <input class="approval-date-input" type="text" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字:</label>
                <input class="approval-signature-input" type="text" readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">主管领导</td>
        <td colspan="5" class="approval-content">
            <textarea disabled="disabled" class="approval-content-textarea"></textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期:</label>
                <input class="approval-date-input" type="text" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字:</label>
                <input class="approval-signature-input" type="text" readonly>
            </div>
        </td>
    </tr>
    </tbody>
</table>

<div class="form-but" id="return">
    <button type="button" class="return-but" onclick="previousPage()">返回</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/jeDate/src/jedate.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //返回上一页
    function previousPage() {
        window.history.back();
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

