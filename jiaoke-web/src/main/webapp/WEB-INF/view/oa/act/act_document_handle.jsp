<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);%>
<html>
<head>
    <meta charset="utf-8">
    <title>发布公文</title>
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

<!-- 公文form -->
<form id="oaActDocument">
    <table class="formTable">

        <tbody>
        <tr>
            <td class="tdLabel">标题</td>
            <td class="table-td-content" colspan="5">
                ${oaActDocument.textTitle}
                <input type="hidden" name="id" value="${oaActDocument.id}">
                <input type="hidden" name="title" value="${oaActDocument.title}">
                <input type="hidden" name="copyGiveId" value="${oaActDocument.copyGiveId}">
                <input type="hidden" name="mainGiveId" value="${oaActDocument.mainGiveId}">
                <input type="hidden" name="promoter" value="${oaActDocument.promoter}">
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
                <shiro:hasPermission name="supervisor">
                    <div style="width: 100%;height: 100%;" id="supervisorContent">
                        <%--<input type="text" class="formInput-readonly" name="supervisor" value="${nickname}" readonly>--%>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="supervisor">
                    ${oaActDocument.supervisor}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">签发</td>
            <td colspan="2.5" class="table-td-content">
                <shiro:hasPermission name="company_principal">
                    <div style="width: 100%;height: 100%;" id="companyPrincipalContent">
                        <%--<textarea class="textarea-style" name="companyPrincipal" readonly>${nickname}</textarea>--%>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="company_principal">
                    ${oaActDocument.companyPrincipal}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">会签</td>
            <td colspan="2.5" class="table-td-content">
                <shiro:hasPermission name="countersign">
                    <div style="width: 100%;height: 100%;" id="countersignContent">
                        <textarea class="textarea-style" name="countersign" readonly>${oaActDocument.countersign} ${nickname}</textarea>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="countersign">
                    ${oaActDocument.countersign}
                </shiro:lacksPermission>
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
</form>

<div class="form-but" id="operationBut">
    <shiro:hasAnyPermission name="supervisor,company_principal,countersign">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>


</body>

<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>
    //流程执行步骤
    var oaDocument = JSON.parse('${oaActDocumentJson}');

    //标记
    var flag = 0;

    //核稿人
    if (flag === 0) {
        if (oaDocument.supervisor === "" || oaDocument.supervisor === undefined) {
            $('#supervisorContent').append('<input type="text" class="formInput-readonly" name="supervisor" value="${nickname}" readonly>');
            $('#countersignContent').text("");
            <%--$('#supervisorContent').append('<input type="text" class="formInput-readonly" name="supervisor" value="${nickname}" readonly><input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');--%>
            flag = 1;
        } else {
            $('#supervisorContent').append(oaDocument.supervisor);
        }
    } else {
        $('#supervisorContent').append(oaDocument.supervisor);
    }

    //签发
    if (flag === 0) {
        if (oaDocument.companyPrincipal === "" || oaDocument.companyPrincipal === undefined) {
            $('#companyPrincipalContent').append('<textarea class="textarea-style" name="companyPrincipal" readonly>${nickname}</textarea>');
            flag = 1;
        } else {
            $('#companyPrincipalContent').append(oaDocument.companyPrincipal);
            $('#operationBut').html("");
            $('#operationBut').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
            $('#countersignContent').html("");
            $('#countersignContent').append(oaDocument.countersign);
        }
    } else {
        $('#companyPrincipalContent').append(oaDocument.companyPrincipal);
    }

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/document/approvalSubmit',
            data: $('#oaActDocument').serialize() + "&taskId=" + taskId + "&flag=" + flag,
            async: false,
            success: function (data) {
                if (data === 'success') {
                    //返回上一页
                    <%--window.location.href = '${path}/oaHomePage/toOaHomePage';--%>
                    window.history.back();
                    window.top.tips("提交成功！", 0, 1, 1000);
                } else if (data === 'backSuccess') {
                    <%--window.location.href = '${path}/oaHomePage/toOaHomePage';--%>
                    window.history.back();
                    window.top.tips("提交成功,并将数据转存到待发事项中！", 6, 1, 2000);
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
        $('#tool,#operationBut').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool').show();
        $('#body,#operationBut').css('width', '70%');
    }
</script>
</html>

