<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
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
    <title>饭卡申请单审批处理</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActCard.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActCard.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActCard.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActCard.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActCard.annex}" delims="," var="annex">
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

<form id="oaActCard">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">申请人</td>
            <td class="table-td-content">
                ${oaActCard.applicant}
                <input type="hidden" name="id" value="${oaActCard.id}">
                <input type="hidden" name="title" value="${oaActCard.title}">
            </td>

            <td class="tdLabel">申请时间</td>
            <td class="table-td-content">
                ${oaActCard.applyTime}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">所属单位</td>
            <td class="table-td-content" style="padding: 10px;width: 30%;">
                ${oaActCard.company}
            </td>

            <td class="tdLabel">事由</td>
            <td class="table-td-content" style="padding: 10px;width: 30%;">
                ${oaActCard.reason}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">拟使用期限(开始)</td>
            <td class="table-td-content">
                ${oaActCard.startTime}
            </td>


            <td class="tdLabel">拟使用期限(结束)</td>
            <td class="table-td-content">
                ${oaActCard.endTime}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">关联部门负责人</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="officePrincipal">
                    <c:choose>
                        <c:when test="${oaActCard.principalContent == null}">
                            <textarea class="approval-content-textarea" style="background-color: #ffffff" name="principalContent"></textarea>
                        </c:when>
                        <c:otherwise>
                            <textarea class="approval-content-textarea" readonly>${oaActCard.principalContent}</textarea>
                        </c:otherwise>
                    </c:choose>

                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <c:choose>
                            <c:when test="${oaActCard.principalDate == null}">
                                <input class="approval-date-input" type="text" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>
                            </c:when>
                            <c:otherwise>
                                <input class="approval-date-input" type="text" value="${oaActCard.principalDate}" readonly>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <c:choose>
                            <c:when test="${oaActCard.principalSign == null}">
                                <input class="approval-signature-input" type="text" name="principalSign" value="${nickname}" readonly>
                            </c:when>
                            <c:otherwise>
                                <input class="approval-signature-input" type="text" value="${oaActCard.principalSign}" readonly>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="officePrincipal">
                    <textarea readonly class="approval-content-textarea">${oaActCard.principalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" value="${oaActCard.principalDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" value="${oaActCard.principalSign}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">关联部门领导主管</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="officeSupervisor">
                    <c:choose>
                        <c:when test="${oaActCard.supervisorContent == null}">
                            <textarea class="approval-content-textarea" style="background-color: #ffffff" name="supervisorContent"></textarea>
                        </c:when>
                        <c:otherwise>
                            <textarea class="approval-content-textarea" readonly>${oaActCard.supervisorContent}</textarea>
                        </c:otherwise>
                    </c:choose>

                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <c:choose>
                            <c:when test="${oaActCard.supervisorDate == null}">
                                <input class="approval-date-input" type="text" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>
                            </c:when>
                            <c:otherwise>
                                <input class="approval-date-input" type="text" value="${oaActCard.supervisorDate}" readonly>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <c:choose>
                            <c:when test="${oaActCard.supervisorSign == null}">
                                <input class="approval-signature-input" type="text" name="supervisorSign" value="${nickname}" readonly>
                            </c:when>
                            <c:otherwise>
                                <input class="approval-signature-input" type="text" value="${oaActCard.supervisorSign}" readonly>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="officeSupervisor">
                    <textarea readonly class="approval-content-textarea">${oaActCard.supervisorContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" value="${oaActCard.supervisorDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" value="${oaActCard.supervisorSign}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">主管部门负责人</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="cardApproval">
                    <c:choose>
                        <c:when test="${oaActCard.directorContent == null}">
                            <textarea class="approval-content-textarea" style="background-color: #ffffff" name="directorContent"></textarea>
                        </c:when>
                        <c:otherwise>
                            <textarea readonly class="approval-content-textarea">${oaActCard.directorContent}</textarea>
                        </c:otherwise>
                    </c:choose>

                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <c:choose>
                            <c:when test="${oaActCard.directorDate == null}">
                                <input class="approval-date-input" type="text" name="directorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>
                            </c:when>
                            <c:otherwise>
                                <input class="approval-date-input" type="text" value="${oaActCard.directorDate}" readonly>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>

                        <c:choose>
                            <c:when test="${oaActCard.directorSign == null}">
                                <input class="approval-signature-input" type="text" name="directorSign" value="${nickname}" readonly>
                            </c:when>
                            <c:otherwise>
                                <input class="approval-signature-input" type="text" value="${oaActCard.directorSign}" readonly>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="cardApproval">
                    <textarea readonly class="approval-content-textarea">${oaActCard.directorContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" value="${oaActCard.directorDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" value="${oaActCard.directorSign}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but">
    <shiro:hasAnyPermission name="officePrincipal,officeSupervisor,cardApproval">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
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
            url: '/card/approvalSubmit',
            data: $('#oaActCard').serialize() + "&taskId=" + taskId + "&flag=" + flag,
            async: false,
            success: function (data) {
                if (data === 'success') {
                    //返回上一页
                    window.location.href = '${path}/oaHomePage/toOaHomePage';
                    layer.msg('提交成功！');
                } else {
                    layer.msg('提交失败！');
                }
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    //打印
    function printContent() {
        $('#tool').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool').show();
        $('#body').css('width', '80%');
    }
</script>
</html>

