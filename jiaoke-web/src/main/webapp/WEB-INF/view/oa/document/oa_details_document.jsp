<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>待办公文详情</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
</head>

<body>
<table class="formtable" style="width: 90%;margin: 40px auto 0;">

    <tbody>
    <input type="hidden" id="taskId" value="${oaDocument.taskId}">
    <input type="hidden" id="id" value="${oaDocument.id}">
    <input type="hidden" id="draftedPerson" value="${oaDocument.draftedPerson}">
    <tr>
        <td class="tlabel">标题：</td>
        <td colspan="5">${oaDocument.textTitle}</td>
    </tr>

    <tr>
        <td class="tlabel">文号：</td>
        <td style="width: 240px">${oaDocument.textNumber}</td>
        <td class="tlabel">密级：</td>
        <td style="width: 240px">
            <c:if test="${oaDocument.rank == 0}">普通公文</c:if>
            <c:if test="${oaDocument.rank == 1}">秘密公文</c:if>
            <c:if test="${oaDocument.rank == 2}">机密公文</c:if>
            <c:if test="${oaDocument.rank == 3}">绝密公文</c:if>
        </td>
        <td class="tlabel">标识：</td>
        <td style="width: 240px">
            <c:if test="${oaDocument.identification == 0}">平行文</c:if>
            <c:if test="${oaDocument.identification == 1}">上行文</c:if>
            <c:if test="${oaDocument.identification == 2}">内部行文</c:if>
            <c:if test="${oaDocument.identification == 3}">外部行文</c:if>
            <c:if test="${oaDocument.identification == 4}">其它</c:if>
        </td>
    </tr>

    <tr>
        <td class="tlabel">公文类型：</td>
        <td>
            <c:if test="${oaDocument.docType == 0}">公文</c:if>
            <c:if test="${oaDocument.docType == 1}">会议纪要</c:if>
            <c:if test="${oaDocument.docType == 2}">请示</c:if>
            <c:if test="${oaDocument.docType == 3}">通知</c:if>
            <c:if test="${oaDocument.docType == 4}">通告</c:if>
            <c:if test="${oaDocument.docType == 5}">函</c:if>
        </td>
        <td class="tlabel">发文时间：</td>
        <td colspan="">
            ${oaDocument.writingTime}
        </td>
        <td class="tlabel">保存期限：</td>
        <td>
            <c:if test="${oaDocument.storageLife == 0}">10年</c:if>
            <c:if test="${oaDocument.storageLife == 1}">30年</c:if>
            <c:if test="${oaDocument.storageLife == 2}">永久</c:if>
        </td>
    </tr>

    <tr>
        <td class="tlabel">拟稿部门：</td>
        <td>
            <c:if test="${oaDocument.draftingDepartment == 10}">综合办公室</c:if>
            <c:if test="${oaDocument.draftingDepartment == 11}">经营开发部</c:if>
            <c:if test="${oaDocument.draftingDepartment == 12}">生产管理部</c:if>
            <c:if test="${oaDocument.draftingDepartment == 13}">财务管理部</c:if>
            <c:if test="${oaDocument.draftingDepartment == 14}">物资管理部</c:if>
            <c:if test="${oaDocument.draftingDepartment == 15}">质量技术部</c:if>
        </td>
        <td class="tlabel">拟稿人：</td>
        <td>${oaDocument.draftedPerson}</td>
        <td class="tlabel">核稿人：</td>
        <td>${oaDocument.nuclearDrafts}</td>
    </tr>

    <tr>
        <td class="tlabel">签发：</td>
        <td colspan="2.5">${oaDocument.issue}</td>
        <td class="tlabel">会签：</td>
        <td colspan="2.5">${oaDocument.countersign}</td>
    </tr>

    <tr>
        <td class="tlabel">抄送：</td>
        <td colspan="5">${oaDocument.copyGive}</td>
    </tr>

    <tr>
        <td class="tlabel">内容：</td>
        <td colspan="5">${oaDocument.content}</td>
    </tr>

    <tr>
        <td class="tlabel">印制：</td>
        <td>${oaDocument.print}</td>
        <td class="tlabel">校对：</td>
        <td>${oaDocument.proofreading}</td>
        <td class="tlabel">份数：</td>
        <td>${oaDocument.attachmentNumber}</td>
    </tr>

    <tr>
        <td class="tlabel">发起人：</td>
        <td>${oaDocument.userInfoId}</td>
        <td class="tlabel">附件：</td>
        <td colspan="3">${oaDocument.attachment}</td>
    </tr>

    <tr>
        <td class="tlabel">处理人意见：</td>
        <td colspan="5" style="height: 68px;padding: 10px;">
            <textarea id="endorse" class="opinion-column"></textarea>
        </td>
    </tr>
    </tbody>

</table>

<div style="text-align: center;padding-top: 20px;">
    <input type="button" value="返回" onclick="previousPage()"
           style="padding: 7px 20px; background: #92ebff;border: 1px #a5a5a5 solid;">
    <input type="button" value="同意" onclick="consent()"
           style="padding: 7px 20px; background: #92ebff;border: 1px #a5a5a5 solid;">

    <%--<input type="button" value="不同意" onclick="noConsent()"
           style="padding: 7px 20px; background: #92ebff;border: 1px #a5a5a5 solid;">--%>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script>
    //返回上一页
    function previousPage() {
        window.history.back();
    }

    //同意
    function consent() {
        //任务id
        var taskId = $("#taskId").val();
        //表单id
        var id = $("#id").val();
        //处理人意见
        var annotation = $("#endorse").val();

        window.location.href = "${path}/document/documentApproval?taskId=" + taskId + "&id=" + id + "&annotation=" + annotation;
    }

    //不同意
</script>
</html>

