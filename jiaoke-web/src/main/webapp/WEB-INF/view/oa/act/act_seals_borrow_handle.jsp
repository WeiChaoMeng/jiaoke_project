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
    <title>印章借用审批单处理</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body">
<div class="table-title">
    <span>${oaActSealsBorrow.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActSealsBorrow.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActSealsBorrow.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActSealsBorrow.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActSealsBorrow.annex}" delims="," var="annex">
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

<form id="oaActSealsBorrow">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">印章种类：</td>
            <td class="table-td-content">
                <c:choose>
                    <c:when test="${oaActSealsBorrow.seal == 0}">路驰公章</c:when>
                    <c:when test="${oaActSealsBorrow.seal == 1}">路驰合同章</c:when>
                    <c:when test="${oaActSealsBorrow.seal == 2}">路驰党支部章</c:when>
                    <c:when test="${oaActSealsBorrow.seal == 3}">路驰工会章</c:when>
                    <c:when test="${oaActSealsBorrow.seal == 4}">路驰法人章</c:when>
                    <c:when test="${oaActSealsBorrow.seal == 5}">路驰财务专用章</c:when>
                    <c:when test="${oaActSealsBorrow.seal == 6}">大兴公章</c:when>
                    <c:when test="${oaActSealsBorrow.seal == 7}">大兴合同章</c:when>
                </c:choose>
            </td>

            <td class="tdLabel">借用时间：</td>
            <td class="table-td-content">
                ${oaActSealsBorrow.borrowTimeStr}
                <input type="hidden" name="id" value="${oaActSealsBorrow.id}">
                <input type="hidden" name="title" value="${oaActSealsBorrow.title}">
                <input type="hidden" name="seal" value="${oaActSealsBorrow.seal}">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">盖章文件内容：</td>
            <td class="table-td-content" colspan="3">
                ${oaActSealsBorrow.content}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">借章人：</td>
            <td class="table-td-content">
                ${oaActSealsBorrow.borrower}
            </td>

            <td class="tdLabel">部门负责人：</td>
            <td class="table-td-content">
                <shiro:hasPermission name="officePrincipal">
                    <c:choose>
                        <c:when test="${oaActSealsBorrow.principal == null}">
                            <input type="text" class="formInput-readonly" name="principal" value="${nickname}"
                                   readonly="readonly">
                        </c:when>
                        <c:otherwise>
                            ${oaActSealsBorrow.principal}
                        </c:otherwise>
                    </c:choose>
                </shiro:hasPermission>

                <shiro:lacksPermission name="officePrincipal">
                    ${oaActSealsBorrow.principal}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">印章主管领导：</td>
            <td class="table-td-content">
                <shiro:hasAnyPermission name="sealManage,specialChapter">
                    <c:choose>
                        <c:when test="${oaActSealsBorrow.sealManage == null}">
                            <input type="text" class="formInput-readonly" name="sealManage" value="${nickname}"
                                   readonly="readonly">
                        </c:when>
                        <c:otherwise>
                            ${oaActSealsBorrow.sealManage}
                        </c:otherwise>
                    </c:choose>
                </shiro:hasAnyPermission>

                <shiro:lacksPermission name="sealManage">
                    ${oaActSealsBorrow.sealManage}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">公司负责人：</td>
            <td class="table-td-content">
                <shiro:hasPermission name="companyPrincipal">
                    <c:choose>
                        <c:when test="${oaActSealsBorrow.companyPrincipal == null}">
                            <input type="text" class="formInput-readonly" name="companyPrincipal" value="${nickname}"
                                   readonly="readonly">
                        </c:when>
                        <c:otherwise>
                            ${oaActSealsBorrow.companyPrincipal}
                        </c:otherwise>
                    </c:choose>
                </shiro:hasPermission>

                <shiro:lacksPermission name="companyPrincipal">
                    ${oaActSealsBorrow.companyPrincipal}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">经办人：</td>
            <td class="table-td-content">
                <shiro:hasPermission name="sealOperator">
                    <c:choose>
                        <c:when test="${oaActSealsBorrow.sealOperator == null}">
                            <input type="text" class="formInput-readonly" name="sealOperator" value="${nickname}"
                                   readonly="readonly">
                        </c:when>
                        <c:otherwise>
                            ${oaActSealsBorrow.sealOperator}
                        </c:otherwise>
                    </c:choose>
                </shiro:hasPermission>

                <shiro:lacksPermission name="sealOperator">
                    ${oaActSealsBorrow.sealOperator}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">归还时间：</td>
            <td class="table-td-content">
                <shiro:hasPermission name="sealOperator">
                    <c:choose>
                        <c:when test="${oaActSealsBorrow.returnTime == null}">
                            <input type="text" class="formInput-readonly" name="returnTime" value="<%=new SimpleDateFormat("yyyy-MM-dd HH").format(new Date())%>"
                                   readonly="readonly">
                        </c:when>
                        <c:otherwise>
                            ${oaActSealsBorrow.returnTime}
                        </c:otherwise>
                    </c:choose>
                </shiro:hasPermission>

                <shiro:lacksPermission name="sealOperator">
                    ${oaActSealsBorrow.returnTime}
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but">
    <shiro:hasAnyPermission name="officePrincipal,sealManage,sealOperator,companyPrincipal">
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
            url: '/sealsBorrow/approvalSubmit',
            data: $('#oaActSealsBorrow').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#tool,#return').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool').show();
        $('#body,#return').css('width', '80%');
    }
</script>
</html>

