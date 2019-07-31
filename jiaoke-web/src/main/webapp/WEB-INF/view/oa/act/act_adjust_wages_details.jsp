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
    <title>调资申请表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActAdjustWages.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActAdjustWages.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActAdjustWages.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActAdjustWages.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActAdjustWages.annex}" delims="," var="annex">
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
        <td class="tdLabel">姓名</td>
        <td class="table-td-content">
            ${oaActAdjustWages.name}
        </td>

        <td class="tdLabel">部门</td>
        <td class="table-td-content">
            ${oaActAdjustWages.department}
        </td>

        <td class="tdLabel">职务</td>
        <td class="table-td-content">
            ${oaActAdjustWages.position}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">入职时间</td>
        <td class="table-td-content">
            ${oaActAdjustWages.entryDateStr}
        </td>

        <td class="tdLabel">目前薪资</td>
        <td class="table-td-content">
            ${oaActAdjustWages.currentSalary}
        </td>

        <td class="tdLabel">期望薪资</td>
        <td class="table-td-content">
            ${oaActAdjustWages.salaryExpectation}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">申请原因</td>
        <td colspan="5" class="table-td-evaluation">
            <textarea class="evaluation-content" style="height: 90px" readonly>${oaActAdjustWages.reason}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期:</label>
                <input class="approval-date-input" type="text" value="${oaActAdjustWages.createTimeStr}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">本人签字:</label>
                <input class="approval-signature-input" type="text" value="${oaActAdjustWages.promoterStr}" readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">所在部门评价</td>
        <td colspan="5" class="table-td-textarea" style="line-height: 0">
            <div class="opinion-principal">
                <label class="opinion-principal-title">部长：</label>
                <textarea class="opinion-column-Juxtaposition" readonly></textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期:</label>
                    <input class="approval-date-input" type="text" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字:</label>
                    <input class="approval-signature-input" type="text" readonly>
                </div>
            </div>

            <div class="opinion-supervisor">
                <label class="opinion-principal-title">主管：</label>
                <textarea class="opinion-column-Juxtaposition" readonly></textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期:</label>
                    <input class="approval-date-input" type="text" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字:</label>
                    <input class="approval-signature-input" type="text" readonly>
                </div>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">组织人事部意见</td>
        <td colspan="5" class="approval-content">
            <textarea readonly class="approval-content-textarea"></textarea>
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
        <td class="tdLabel">总经理意见</td>
        <td colspan="5" class="approval-content">
            <textarea readonly class="approval-content-textarea"></textarea>
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

