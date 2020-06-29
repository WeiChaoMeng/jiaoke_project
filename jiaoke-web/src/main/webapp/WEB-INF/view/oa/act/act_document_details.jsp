<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);%>
<html>
<head>
    <meta charset="utf-8">
    <title>公文详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActDocument.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActDocument.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActDocument.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActDocument.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActDocument.annex}" delims="," var="annex">
                        <div class="table-file">
                            <div class="table-file-content">
                                <span class="table-file-title"
                                      title="${fn:substring(annex,annex.indexOf("_")+1,annex.length())}">${fn:substring(annex,annex.indexOf("_")+1,annex.length())}</span>
                                <a class="table-file-download icon"
                                   href="javascript:location.href=encodeURI('/fileDownloadHandle/download?fileName=${annex}')"
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
        <td class="tdLabel">标题</td>
        <td class="table-td-content" colspan="5">
            ${oaActDocument.textTitle}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">文号</td>
        <td class="table-td-content">
            ${oaActDocument.textNumber}
        </td>

        <td class="tdLabel">密级</td>
        <td class="table-td-content">
            <c:if test="${oaActDocument.secretLevel == 0}">普通公文</c:if>
            <c:if test="${oaActDocument.secretLevel == 1}">秘密公文</c:if>
            <c:if test="${oaActDocument.secretLevel == 2}">机密公文</c:if>
            <c:if test="${oaActDocument.secretLevel == 3}">绝密公文</c:if>
        </td>

        <td class="tdLabel">标识</td>
        <td class="table-td-content">
            <c:if test="${oaActDocument.identification == 0}">内部行文</c:if>
            <c:if test="${oaActDocument.identification == 1}">平行文</c:if>
            <c:if test="${oaActDocument.identification == 2}">上行文</c:if>
            <c:if test="${oaActDocument.identification == 3}">外部行文</c:if>
            <c:if test="${oaActDocument.identification == 4}">其它</c:if>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">公文类型</td>
        <td class="table-td-content">
            <c:if test="${oaActDocument.docType == 0}">公文</c:if>
            <c:if test="${oaActDocument.docType == 1}">会议纪要</c:if>
            <c:if test="${oaActDocument.docType == 2}">请示</c:if>
            <c:if test="${oaActDocument.docType == 3}">通知</c:if>
            <c:if test="${oaActDocument.docType == 4}">通告</c:if>
            <c:if test="${oaActDocument.docType == 5}">函</c:if>
        </td>

        <td class="tdLabel">发文时间</td>
        <td class="table-td-content">
            ${oaActDocument.writingTime}
        </td>

        <td class="tdLabel">保存期限</td>
        <td class="table-td-content">
            <c:if test="${oaActDocument.storageLife == 0}">10年</c:if>
            <c:if test="${oaActDocument.storageLife == 1}">30年</c:if>
            <c:if test="${oaActDocument.storageLife == 2}">永久</c:if>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">拟稿部门</td>
        <td class="table-td-content">
            <c:if test="${oaActDocument.draftingDepartment == 10}">综合办公室</c:if>
            <c:if test="${oaActDocument.draftingDepartment == 11}">经营开发部</c:if>
            <c:if test="${oaActDocument.draftingDepartment == 12}">生产管理部</c:if>
            <c:if test="${oaActDocument.draftingDepartment == 13}">财务管理部</c:if>
            <c:if test="${oaActDocument.draftingDepartment == 14}">物资管理部</c:if>
            <c:if test="${oaActDocument.draftingDepartment == 15}">质量技术部</c:if>
            <c:if test="${oaActDocument.draftingDepartment == 16}">领导班子</c:if>
            <c:if test="${oaActDocument.draftingDepartment == 17}">其他</c:if>
        </td>

        <td class="tdLabel">拟稿人</td>
        <td class="table-td-content">
            ${oaActDocument.draftedPerson}
        </td>

        <td class="tdLabel">核稿人</td>
        <td class="table-td-content">
            ${oaActDocument.supervisor}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">签发</td>
        <td colspan="2.5" class="table-td-content">
            ${oaActDocument.companyPrincipal}
        </td>

        <td class="tdLabel">会签</td>
        <td colspan="2.5" class="table-td-content">
            ${oaActDocument.countersign}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">主送</td>
        <td class="table-td-content" colspan="5">
            ${oaActDocument.mainGive}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">抄送</td>
        <td class="table-td-content" colspan="5">
            ${oaActDocument.copyGive}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">内容</td>
        <td class="table-td-content" colspan="5">
            ${oaActDocument.content}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">印制</td>
        <td class="table-td-content">
            ${oaActDocument.print}
        </td>

        <td class="tdLabel">校对</td>
        <td class="table-td-content">
            ${oaActDocument.proofreading}
        </td>

        <td class="tdLabel">份数</td>
        <td class="table-td-content">
            ${oaActDocument.attachmentNumber}
        </td>
    </tr>
    </tbody>
</table>
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
        $('#body').css('width', '80%');
    }</script>
</html>

