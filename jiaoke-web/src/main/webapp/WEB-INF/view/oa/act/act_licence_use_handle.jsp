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

<form id="oaActLicenceUse">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">证照种类</td>
            <td class="table-td-content">
                <c:choose>
                    <c:when test="${oaActLicenceUse.seal == 0}">路驰营业执照正本</c:when>
                    <c:when test="${oaActLicenceUse.seal == 1}">路驰营业执照副本</c:when>
                    <c:when test="${oaActLicenceUse.seal == 2}">路驰工会法人资格证书</c:when>
                    <c:when test="${oaActLicenceUse.seal == 3}">大兴营业执照正本</c:when>
                    <c:when test="${oaActLicenceUse.seal == 4}">大兴营业执照副本</c:when>
                </c:choose>
            </td>

            <td class="tdLabel">领取时间</td>
            <td class="table-td-content">
                ${oaActLicenceUse.receiveTime}
                <input type="hidden" name="id" value="${oaActLicenceUse.id}">
                <input type="hidden" name="title" value="${oaActLicenceUse.title}">
                <input type="hidden" name="promoter" value="${oaActLicenceUse.promoter}">
                <input type="hidden" name="departmentPrincipal" value="${oaActLicenceUse.departmentPrincipal}">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">用途</td>
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
                <shiro:hasPermission name="principal">
                    <div style="width: 100%;height: 100%;" id="principalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="principal">
                    ${oaActLicenceUse.principal}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">证照主管领导</td>
            <td class="table-td-content">
                <shiro:hasPermission name="licence_manage">
                    <div style="width: 100%;height: 100%;" id="licenceManageContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="licence_manage">
                    ${oaActLicenceUse.licenceManage}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">经办人</td>
            <td class="table-td-content" style="vertical-align: baseline;">
                <shiro:hasPermission name="licence_operator">
                    <div id="licenceOperatorContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="licence_operator">
                    ${oaActLicenceUse.licenceOperator}
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="principal,licence_manage,licence_operator">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //流程执行步骤
    var licenceUse = JSON.parse('${oaActLicenceUseJson}');
    //标记
    var flag = 0;

    if (licenceUse.state === 0) {
        if (flag === 0) {

            var principalNums = JSON.parse('${principalNum}');
            //单个审批人
            if (principalNums === "noPrincipalNum") {
                if (licenceUse.principal === "" || licenceUse.principal === undefined) {
                    $('#principalContent').append('<input type="text" class="formInput-readonly" name="principal" value="${oaActLicenceUse.principal} ${nickname}" readonly="readonly"><input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                    flag = 1;
                } else {
                    $('#principalContent').append(licenceUse.principal);
                }
            } else {
                if (licenceUse.principal === undefined) {
                    $('#principalContent').append('<input type="text" class="formInput-readonly" name="principal" value="${oaActLicenceUse.principal} ${nickname}" readonly="readonly"><input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                    flag = 1;
                } else if ((licenceUse.principal).length === principalNums.length) {
                    $('#principalContent').append(licenceUse.principal);
                } else {
                    $('#principalContent').append('<input type="text" class="formInput-readonly" name="principal" value="${oaActLicenceUse.principal} ${nickname}" readonly="readonly"><input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                    flag = 1;
                }
            }

        } else {
            $('#principalContent').append(licenceUse.principal);
        }

        if (flag === 0) {
            if (licenceUse.licenceManage === "" || licenceUse.licenceManage === undefined) {
                $('#licenceManageContent').append('<input type="text" class="formInput-readonly" name="licenceManage" value="${nickname}" readonly="readonly"><input type="hidden" name="licenceManageDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                flag = 1;
            } else {
                $('#licenceManageContent').append(licenceUse.licenceManage);
            }
        } else {
            $('#licenceManageContent').append(licenceUse.licenceManage);
        }

        if (flag === 0) {
            if (licenceUse.licenceOperator === "" || licenceUse.licenceOperator === undefined) {
                $('#licenceOperatorContent').append('<input type="text" class="formInput-readonly" name="licenceOperator" value="${nickname}" readonly="readonly"><input type="hidden" name="licenceOperatorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                $('#licenceOperatorContent').css('margin-top','6px');
                flag = 1;
            } else {
                $('#licenceOperatorContent').append(licenceUse.licenceOperator);
                $('#licenceOperatorContent').css('position','absolute');
            }
        } else {
            $('#licenceOperatorContent').append(licenceUse.licenceOperator);
        }

        if (flag === 0) {
            $('#return').html("");
            $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
        }
    } else {
        $('#principalContent').append(licenceUse.principal);
        $('#licenceManageContent').append(licenceUse.licenceManage);
        $('#licenceOperatorContent').append(licenceUse.licenceOperator);
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
    }

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
                } else if (data === 'backSuccess') {
                    window.location.href = '${path}/oaHomePage/toOaHomePage';
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
        $('#tool,#return').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool,#return').show();
        $('#body').css('width', '70%');
    }
</script>
</html>

