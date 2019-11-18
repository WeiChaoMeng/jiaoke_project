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
    <title>证照使用审批单（复印件）处理</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 70%">
<div class="table-title">
    <span>${oaActLicenceUse.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActLicenceUse.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActLicenceUse.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActLicenceUse.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActLicenceUse.annex}" delims="," var="annex">
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

<form id="oaActLicenceUse">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">印章种类：</td>
            <td class="table-td-content">
                <c:choose>
                    <c:when test="${oaActLicenceUse.seal == 0}">路驰营业执照正本</c:when>
                    <c:when test="${oaActLicenceUse.seal == 1}">路驰营业执照副本</c:when>
                    <c:when test="${oaActLicenceUse.seal == 2}">路驰工会法人资格证书</c:when>
                    <c:when test="${oaActLicenceUse.seal == 3}">大兴营业执照正本</c:when>
                    <c:when test="${oaActLicenceUse.seal == 4}">大兴营业执照副本</c:when>
                </c:choose>
            </td>

            <td class="tdLabel">领取时间：</td>
            <td class="table-td-content">
                ${oaActLicenceUse.receiveTime}
                <input type="hidden" name="id" value="${oaActLicenceUse.id}">
                <input type="hidden" name="title" value="${oaActLicenceUse.title}">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">用途：</td>
            <td class="table-td-content" colspan="3">
                ${oaActLicenceUse.purpose}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">使用人</td>
            <td class="table-td-content" style="width: 340px;">
                ${oaActLicenceUse.user}
            </td>

            <td class="tdLabel">部门负责人</td>
            <td class="table-td-content" style="width: 340px;">
                <shiro:hasPermission name="officePrincipal">
                    <input type="text" class="formInput-readonly" name="principal" value="${nickname}" readonly>
                </shiro:hasPermission>

                <shiro:lacksPermission name="officePrincipal">
                    ${oaActLicenceUse.principal}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">证照主管领导</td>
            <td class="table-td-content">
                <shiro:hasPermission name="licenceManage">
                    <input type="text" class="formInput-readonly" name="licenceManage" value="${nickname}" readonly>
                </shiro:hasPermission>

                <shiro:lacksPermission name="licenceManage">
                    ${oaActLicenceUse.licenceManage}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">经办人</td>
            <td class="table-td-content">
                <shiro:hasPermission name="licenceOperator">
                    <input type="text" class="formInput-readonly" name="licenceOperator" value="${nickname}" readonly>
                </shiro:hasPermission>

                <shiro:lacksPermission name="licenceOperator">
                    ${oaActLicenceUse.licenceOperator}
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="officePrincipal,licenceManage,licenceOperator">
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
            url: '/licenceUse/approvalSubmit',
            data: $('#oaActLicenceUse').serialize() + "&taskId=" + taskId + "&flag=" + flag,
            async: false,
            success: function (data) {
                if (data === 'success') {
                    //返回上一页
                    window.location.href = '${path}/oaHomePage/toOaHomePage';
                    window.top.tips("提交成功！", 0, 1, 1000);
                } else {
                    window.top.tips("提交失败！", 0, 2, 1000);
                }
            },
            error: function (result) {
                window.top.tips("出错！", 6, 2, 1000);
            }
        })
    }

    //打印
    function printContent() {
        $('#tool,#return').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool,#return').show();
        $('#body').css('width', '70%');
    }
</script>
</html>

