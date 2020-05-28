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
    <title>员工轮岗审批表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActRotation.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActRotation.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActRotation.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActRotation.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActRotation.annex}" delims="," var="annex">
                        <div class="table-file">
                            <div class="table-file-content">
                                <span class="table-file-title" title="${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}">${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}</span>
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
    <input type="text" class="filling-date-content" value="${oaActRotation.fillingDate}" readonly>
    <span class="filling-date">填表日期 </span>
</div>

<table class="formTable">
    <tbody>
    <tr>
        <td class="tdLabel">姓名</td>
        <td class="table-td-content" style="width: 18%;">
            ${oaActRotation.name}
        </td>

        <td class="tdLabel">性别</td>
        <td class="table-td-content" style="width: 18%;">
            <c:choose>
                <c:when test="${oaActRotation.sex == 0}">
                    男
                </c:when>
                <c:when test="${oaActRotation.sex == 1}">
                    女
                </c:when>
            </c:choose>
        </td>

        <td class="tdLabel">出生年月</td>
        <td class="table-td-content" style="width: 18%;">
            ${oaActRotation.birthday}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">名族</td>
        <td class="table-td-content">
            ${oaActRotation.ethnic}
        </td>

        <td class="tdLabel">学历</td>
        <td class="table-td-content">
            <c:choose>
                <c:when test="${oaActRotation.education == 0}">
                    初中及以下
                </c:when>
                <c:when test="${oaActRotation.education == 1}">
                    中专/中技
                </c:when>
                <c:when test="${oaActRotation.education == 2}">
                    高中
                </c:when>
                <c:when test="${oaActRotation.education == 3}">
                    大专
                </c:when>
                <c:when test="${oaActRotation.education == 4}">
                    本科
                </c:when>
                <c:when test="${oaActRotation.education == 5}">
                    硕士
                </c:when>
                <c:when test="${oaActRotation.education == 6}">
                    博士
                </c:when>
            </c:choose>
        </td>

        <td class="tdLabel">专业</td>
        <td class="table-td-content">
            ${oaActRotation.major}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">所在部门</td>
        <td class="table-td-content">
            ${oaActRotation.department}
        </td>

        <td class="tdLabel">现工作岗位</td>
        <td class="table-td-content">
            ${oaActRotation.presentPost}
        </td>

        <td class="tdLabel">担任本岗位起始时间</td>
        <td class="table-td-content">
            ${oaActRotation.startingTime}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">转入部门</td>
        <td class="table-td-content">
            ${oaActRotation.newDepartmentStr}
        </td>

        <td class="tdLabel">调整原因</td>
        <td colspan="3" class="table-td-content" id="adjustReasons">

            <c:choose>
                <c:when test="${oaActRotation.adjust == 0}">
                    <span>关键岗位工作满5年
                        <input type="checkbox" style="vertical-align: middle;margin-left: 5px" checked disabled>
                    </span>
                </c:when>
                <c:otherwise>
                    <span>关键岗位工作满5年
                        <input type="checkbox" style="vertical-align: middle;margin-left: 5px" disabled>
                    </span>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${oaActRotation.adjust == 1}">
                    <span style="margin-left: 50px">自愿申请
                        <input type="checkbox" style="vertical-align: middle;margin-left: 5px" checked disabled>
                    </span>
                </c:when>
                <c:otherwise>
                    <span style="margin-left: 50px">自愿申请
                        <input type="checkbox" style="vertical-align: middle;margin-left: 5px" disabled>
                    </span>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${oaActRotation.adjust == 2}">
                    <span style="margin-left: 50px">工作需要
                        <input type="checkbox" style="vertical-align: middle;margin-left: 5px" checked disabled>
                    </span>
                </c:when>
                <c:otherwise>
                    <span style="margin-left: 50px">工作需要
                        <input type="checkbox" style="vertical-align: middle;margin-left: 5px" disabled>
                    </span>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">所在部门意见</td>
        <td colspan="5" class="approval-content">
            <div style="width: 49%;float:left;">
                <textarea readonly class="approval-content-textarea">${oaActRotation.principalContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActRotation.principalDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActRotation.principal}" readonly>
                </div>
            </div>

            <div style="width: 49%;float:right;">
                <textarea readonly class="approval-content-textarea">${oaActRotation.principalContentT}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActRotation.principalDateT}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActRotation.principalT}" readonly>
                </div>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">分管部门意见</td>
        <td colspan="5" class="approval-content">
            <textarea readonly class="approval-content-textarea">${oaActRotation.transferPrincipalContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActRotation.transferPrincipalDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActRotation.transferPrincipal}" readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">组织人事部门意见</td>
        <td colspan="5" class="approval-content">
            <textarea readonly class="approval-content-textarea">${oaActRotation.personnelContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActRotation.personnelDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActRotation.personnel}" readonly>
            </div>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">总经理意见</td>
        <td colspan="5" class="approval-content">
            <textarea readonly class="approval-content-textarea">${oaActRotation.companyPrincipalContent}</textarea>
            <div class="approval-date">
                <label class="approval-date-label">日期 </label>
                <input class="approval-date-input" type="text" value="${oaActRotation.companyPrincipalDate}" readonly>
            </div>
            <div class="approval-signature">
                <label class="approval-signature-label">签字 </label>
                <input class="approval-signature-input" type="text" value="${oaActRotation.companyPrincipal}" readonly>
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

