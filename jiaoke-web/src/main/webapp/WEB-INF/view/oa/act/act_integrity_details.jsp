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
    <title>廉政谈话审批表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActIntegrity.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActIntegrity.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActIntegrity.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActIntegrity.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActIntegrity.annex}" delims="," var="annex">
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
                <c:when test="${oaActIntegrity.company == 0}">
                    北京市政路桥建材集团有限公司路驰分公司
                </c:when>
            </c:choose>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">时间</td>
        <td class="table-td-content">
            ${oaActIntegrity.dateStr}
        </td>

        <td class="tdLabel">地点</td>
        <td class="table-td-content">
            ${oaActIntegrity.address}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">谈话人</td>
        <td class="table-td-content">
            ${oaActIntegrity.talker}
        </td>

        <td class="tdLabel">被谈话人</td>
        <td class="table-td-content">
            ${oaActIntegrity.interviewee}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">谈话内容(含廉政提醒)</td>
        <td colspan="5" class="table-td-evaluation" style="padding: 10px;height: 110px;">
            <textarea class="evaluation-content" style="height: 100%" readonly>${oaActIntegrity.content}</textarea>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">本人表态(含廉政承诺)</td>
        <td colspan="5" class="table-td-evaluation" style="padding: 10px;height: 94px;">
            <textarea class="evaluation-content" style="height: 100%;background-color: #e8e8e8;" readonly></textarea>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">被谈话人签字</td>
        <td colspan="5" class="table-td-content">
            <input type="text" class="formInput-readonly" readonly>
        </td>
    </tr>
    </tbody>
</table>

<div class="note-taker-style">
    <input type="text" class="note-taker-content">
    <span class="note-taker-title">记录人：</span>
</div>

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

