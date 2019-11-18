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
    <title>印章使用审批单处理</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body style="width: 75%" id="body">
<div class="table-title">
    <span>${oaActSealsUse.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details" style="border: solid 1px #eaeaea;">
        <div class="top-info-bar-user">
            <span>${oaActSealsUse.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActSealsUse.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActSealsUse.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details" style="border: solid 1px #eaeaea;">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActSealsUse.annex}" delims="," var="annex">
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

<form id="oaActSealsUse">
    <div>
        <span class="form-number-left" style="float: right;min-width: 140px;">编号  ${oaActSealsUse.number}</span>
    </div>

    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">印章种类：</td>
            <td class="table-td-content">
                <c:choose>
                    <c:when test="${oaActSealsUse.seal == 0}">路驰公章</c:when>
                    <c:when test="${oaActSealsUse.seal == 1}">路驰合同章</c:when>
                    <c:when test="${oaActSealsUse.seal == 2}">路驰党支部章</c:when>
                    <c:when test="${oaActSealsUse.seal == 3}">路驰工会章</c:when>
                    <c:when test="${oaActSealsUse.seal == 4}">路驰法人章</c:when>
                    <c:when test="${oaActSealsUse.seal == 5}">路驰财务专用章</c:when>
                    <c:when test="${oaActSealsUse.seal == 6}">大兴公章</c:when>
                    <c:when test="${oaActSealsUse.seal == 7}">大兴合同章</c:when>
                </c:choose>
            </td>

            <td class="tdLabel">申请人：</td>
            <td class="table-td-content">
                ${oaActSealsUse.applicant}
                <input type="hidden" name="id" value="${oaActSealsUse.id}">
                <input type="hidden" name="title" value="${oaActSealsUse.title}">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">申请文件名称：</td>
            <td class="table-td-content" colspan="3">
                ${oaActSealsUse.name}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">部门负责人</td>
            <td class="table-td-content" style="width: 340px">
                <shiro:hasPermission name="officePrincipal">
                    <c:choose>
                        <c:when test="${oaActSealsUse.principal == null}">
                            <input type="text" class="formInput-readonly" name="principal" value="${nickname}"
                                   readonly="readonly">
                        </c:when>
                        <c:otherwise>
                            ${oaActSealsUse.principal}
                        </c:otherwise>
                    </c:choose>
                </shiro:hasPermission>

                <shiro:lacksPermission name="officePrincipal">
                    ${oaActSealsUse.principal}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">部门主管领导</td>
            <td class="table-td-content" style="width: 340px">
                <shiro:hasPermission name="officeSupervisor">
                    <c:choose>
                        <c:when test="${oaActSealsUse.supervisor == null}">
                            <input type="text" class="formInput-readonly" name="supervisor" value="${nickname}"
                                   readonly="readonly">
                        </c:when>
                        <c:otherwise>
                            ${oaActSealsUse.supervisor}
                        </c:otherwise>
                    </c:choose>
                </shiro:hasPermission>

                <shiro:lacksPermission name="officeSupervisor">
                    ${oaActSealsUse.supervisor}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" style="line-height: 0;padding: 16px 0;text-align: center;">印章管理部门主管领导
                <span style="display: block;padding-top: 15px;">（涉及资金支出以外的文件）</span>
            </td>
            <td class="table-td-content">
                <shiro:hasPermission name="sealManage">
                    <c:choose>
                        <c:when test="${oaActSealsUse.sealManage == null}">
                            <input type="text" class="formInput-readonly" name="sealManage" value="${nickname}"
                                   readonly="readonly">
                        </c:when>
                        <c:otherwise>
                            ${oaActSealsUse.sealManage}
                        </c:otherwise>
                    </c:choose>
                </shiro:hasPermission>

                <shiro:lacksPermission name="sealManage">
                    ${oaActSealsUse.sealManage}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">盖章人</td>
            <td class="table-td-content">
                <shiro:hasPermission name="stamp">
                    <c:choose>
                        <c:when test="${oaActSealsUse.stamp == null}">
                            <input type="text" class="formInput-readonly" name="stamp" value="${nickname}"
                                   readonly="readonly">
                        </c:when>
                        <c:otherwise>
                            ${oaActSealsUse.stamp}
                        </c:otherwise>
                    </c:choose>
                </shiro:hasPermission>

                <shiro:lacksPermission name="stamp">
                    ${oaActSealsUse.stamp}
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="officePrincipal,officeSupervisor,sealManage,stamp">
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
            url: '/sealsUse/approvalSubmit',
            data: $('#oaActSealsUse').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#body').css('width', '75%');
    }
</script>
</html>

