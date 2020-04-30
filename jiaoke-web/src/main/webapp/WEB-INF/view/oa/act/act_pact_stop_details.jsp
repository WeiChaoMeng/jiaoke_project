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
    <title>劳务协议终止通知书</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body" style="width: 70%">

<div class="table-title">
    <span>${oaActPactStop.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActPactStop.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActPactStop.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActPactStop.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActPactStop.annex}" delims="," var="annex">
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

<div style="margin-top: 10px">
    <div class="notice-personnel">
        <input type="text" class="notice-personnel-field" value="${oaActPactStop.notifiedPerson}" readonly>:
    </div>

    <div class="notice-content">
        你与我公司签订的协议期为
        <input class="agreement-start-end start-date" type="text" value="${oaActPactStop.startDate}" readonly>至
        <input class="agreement-start-end end-date" type="text" value="${oaActPactStop.endDate}" readonly>的劳务协议将于
        <input type="text" class="agreement-days" value="${oaActPactStop.number}" readonly>天后到期。（附《劳务协议续签个人意向》）
    </div>

    <div class="notice-content">特此通知。</div>

    <div class="notice-sign">
        <div class="notice-sign-position">
            <label>通知人：</label>
            <input class="notice-relevant-personnel" type="text" value="${oaActPactStop.promoterStr}" readonly>
            <input class="notice-date" type="text" value="${oaActPactStop.noticeDate}" readonly>
        </div>
    </div>

    <div class="notice-sign">
        <div class="notice-seal">
            <span>(盖章)</span>
        </div>
    </div>

    <div class="notice-sign">
        <div class="notice-sign-position">
            <label>接收人：</label>
            <input class="notice-relevant-personnel" type="text" value="${oaActPactStop.receivingSign}" readonly>
            <input class="notice-date" type="text" value="${oaActPactStop.receivingDate}" readonly>
        </div>
    </div>
</div>

<table class="form-table">
    <tbody>
    <tr>
        <td colspan="6" class="tdLabel" style="padding: 0;text-align: center">劳务协议续签个人意向</td>
    </tr>

    <tr>
        <td class="td-column-two" colspan="3">不续签劳务协议</td>
        <td class="td-column-two" colspan="3">申请与公司续签劳务协议</td>
    </tr>

    <tr id="renewal">
        <c:choose>
            <c:when test="${oaActPactStop.renewal == 0}">
                <td colspan="3" style="height: 30px;text-align: center">
                    <input type="checkbox" style="vertical-align: middle;" checked disabled>
                </td>
            </c:when>
            <c:otherwise>
                <td colspan="3" style="height: 30px;text-align: center">
                    <input type="checkbox" style="vertical-align: middle;" disabled>
                </td>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${oaActPactStop.renewal == 1}">
                <td colspan="3" style="height: 30px;text-align: center">
                    <input type="checkbox" style="vertical-align: middle;" checked disabled>
                </td>
            </c:when>
            <c:otherwise>
                <td colspan="3" style="height: 30px;text-align: center">
                    <input type="checkbox" style="vertical-align: middle;" disabled>
                </td>
            </c:otherwise>
        </c:choose>
    </tr>

    <tr>
        <td class="notice-td-label">其他需要补充的内容</td>
        <td colspan="5" class="table-td-evaluation">
            <textarea class="evaluation-content-disabled" style="height: 90px"
                      readonly>${oaActPactStop.supplementDetails}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActPactStop.receivingDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">本人签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActPactStop.receivingSign}"
                       readonly>
            </div>
        </td>
    </tr>
    </tbody>
</table>

<div class="notice-tips">
    <span class="notice-tips-mark">*</span>
    <span class="notice-tips-script">此通知一式两份，接收人、公司各执一份。</span>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script>
    //打印
    function printContent() {
        $('#tool').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool').show();
        $('#body').css('width', '70%');
    }
</script>
</html>

