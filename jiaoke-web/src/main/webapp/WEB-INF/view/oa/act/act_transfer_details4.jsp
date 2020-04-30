<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>转岗审批表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <style>
        .tdLabel {
            width: 10%;
        }
    </style>
</head>

<body id="body">

<div class="table-title">
    <span>${transfer.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${transfer.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${transfer.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${transfer.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${transfer.annex}" delims="," var="annex">
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
    <input type="text" class="filling-date-content" value="${transfer.fillingDate}" readonly>
    <span class="filling-date">填表日期 </span>
</div>

<table class="formTable">
    <tbody>
    <tr>
        <td class="tdLabel">姓名</td>
        <td class="table-td-content" colspan="2">
            ${transfer.name}
        </td>

        <td class="tdLabel">年龄</td>
        <td class="table-td-content" colspan="2">
            ${transfer.age}
        </td>

        <td class="tdLabel">入职时间</td>
        <td class="table-td-content">
            ${transfer.entryDate}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">现部门</td>
        <td class="table-td-content">
            ${transfer.presentDepartment}
        </td>

        <td class="tdLabel">现岗位</td>
        <td class="table-td-content" style="width: 15%">
            ${transfer.presentPost}
        </td>

        <td class="tdLabel">拟转入部门</td>
        <td class="table-td-content">
            ${transfer.newDepartmentStr}
        </td>

        <td class="tdLabel">拟转入岗位</td>
        <td class="table-td-content">
            ${transfer.newPost}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">转岗事由</td>
        <td colspan="7" class="table-td-evaluation">
            <textarea class="evaluation-content-disabled" style="height: 73px" readonly>${transfer.cause}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${transfer.createTimeStr}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">本人签字 </label>
                <input class="approval-signature-input" type="text" value="${transfer.promoterStr}" readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">所在部门评价</td>
        <td colspan="7" class="table-td-textarea" style="line-height: 0">
            <div class="opinion-principal" style="width: 32%;float: left;">
                <label class="opinion-principal-title">部长</label>
                <textarea class="opinion-column-Juxtaposition" readonly>${transfer.principalContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${transfer.principalDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${transfer.principal}" readonly>
                </div>
            </div>

            <div class="opinion-principal" style="width: 32%;float: left;margin: 0 3px">
                <label class="opinion-principal-title">部长</label>
                <textarea class="opinion-column-Juxtaposition" readonly>${transfer.principalContentT}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${transfer.principalDateT}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${transfer.principalT}" readonly>
                </div>
            </div>

            <div class="opinion-supervisor" style="float: right;width: 34%;">
                <label class="opinion-principal-title">主管</label>
                <textarea class="opinion-column-Juxtaposition" readonly>${transfer.supervisorContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${transfer.supervisorDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${transfer.supervisor}" readonly>
                </div>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">转入部门意见</td>
        <td colspan="7" class="table-td-textarea" style="line-height: 0">
            <div class="opinion-principal" style="width: 32%;float: left;">
                <label class="opinion-principal-title">部长</label>
                <textarea class="opinion-column-Juxtaposition" readonly>${transfer.transferPrincipalContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${transfer.transferPrincipalDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${transfer.transferPrincipal}" readonly>
                </div>
            </div>

            <div class="opinion-principal" style="width: 32%;float: left;margin: 0 3px">
                <label class="opinion-principal-title">部长</label>
                <textarea class="opinion-column-Juxtaposition" readonly>${transfer.transferPrincipalContentT}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${transfer.transferPrincipalDateT}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${transfer.transferPrincipalT}" readonly>
                </div>
            </div>

            <div class="opinion-supervisor" style="float: right;width: 34%;">
                <label class="opinion-principal-title">主管</label>
                <textarea class="opinion-column-Juxtaposition" readonly>${transfer.transferSupervisorDate}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${transfer.transferSupervisorDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${transfer.transferSupervisor}" readonly>
                </div>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">组织人事部意见</td>
        <td colspan="7" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${transfer.personnelContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${transfer.personnelDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${transfer.personnel}" readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">总经理审批</td>
        <td colspan="7" class="approval-content">
            <textarea class="approval-content-textarea" readonly>${transfer.companyPrincipalContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${transfer.companyPrincipalDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${transfer.companyPrincipal}" readonly>
            </div>
        </td>
    </tr>
    </tbody>
</table>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script>
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

