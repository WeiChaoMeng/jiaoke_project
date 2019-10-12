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
    <title>转正申请表审批</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActRegularization.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActRegularization.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActRegularization.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActRegularization.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActRegularization.annex}" delims="," var="annex">
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

<form id="oaActRegularization">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">姓名</td>
            <td class="table-td-content">
                ${oaActRegularization.name}
                <input type="hidden" name="id" value="${oaActRegularization.id}">
                <input type="hidden" name="title" value="${oaActRegularization.title}">
            </td>

            <td class="tdLabel">部门</td>
            <td class="table-td-content">
                ${oaActRegularization.department}
            </td>

            <td class="tdLabel">职务</td>
            <td class="table-td-content">
                ${oaActRegularization.position}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">学历</td>
            <td class="table-td-content">
                <c:choose>
                    <c:when test="${oaActRegularization.education == 0}">初中及以下</c:when>
                    <c:when test="${oaActRegularization.education == 1}">中专/中技</c:when>
                    <c:when test="${oaActRegularization.education == 2}">高中</c:when>
                    <c:when test="${oaActRegularization.education == 3}">大专</c:when>
                    <c:when test="${oaActRegularization.education == 4}">本科</c:when>
                    <c:when test="${oaActRegularization.education == 5}">硕士</c:when>
                    <c:when test="${oaActRegularization.education == 6}">博士</c:when>
                </c:choose>
            </td>

            <td class="tdLabel">入职时间</td>
            <td class="table-td-content">
                ${oaActRegularization.entryDateStr}
            </td>

            <td class="tdLabel">试用期时间</td>
            <td class="table-td-content">
                ${oaActRegularization.probationPeriodStr}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">自我评价</td>
            <td colspan="5" class="table-td-details">
                <textarea class="evaluation-content-disabled" readonly>${oaActRegularization.selfAssessment}</textarea>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">部门评价</td>
            <td colspan="5" class="table-td-textarea" style="line-height: 0">
                <div class="opinion-principal">
                    <label class="opinion-principal-title">部长：</label>
                    <shiro:hasPermission name="officePrincipal">
                        <textarea class="opinion-column-Juxtaposition" style="background-color: #ffffff"
                                  name="principalContent"></textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期:</label>
                            <input class="approval-date-input" type="text" name="principalDate"
                                   value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字:</label>
                            <input class="approval-signature-input" type="text" name="principalSign" value="${nickname}"
                                   readonly>
                        </div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="officePrincipal">
                        <textarea class="opinion-column-Juxtaposition"
                                  readonly>${oaActRegularization.principalContent}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期:</label>
                            <input class="approval-date-input" type="text" value="${oaActRegularization.principalDate}"
                                   readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字:</label>
                            <input class="approval-signature-input" type="text"
                                   value="${oaActRegularization.principalSign}"
                                   readonly>
                        </div>
                    </shiro:lacksPermission>
                </div>

                <div class="opinion-supervisor">
                    <label class="opinion-principal-title">主管：</label>
                    <shiro:hasPermission name="officeSupervisor">
                        <textarea class="opinion-column-Juxtaposition" name="supervisorContent"
                                  style="background-color: #ffffff"></textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期:</label>
                            <input class="approval-date-input" type="text" name="supervisorDate"
                                   value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字:</label>
                            <input class="approval-signature-input" type="text" name="supervisorSign"
                                   value="${nickname}"
                                   readonly>
                        </div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="officeSupervisor">
                        <textarea class="opinion-column-Juxtaposition"
                                  readonly>${oaActRegularization.supervisorContent}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期:</label>
                            <input class="approval-date-input" type="text" value="${oaActRegularization.supervisorDate}"
                                   readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字:</label>
                            <input class="approval-signature-input" type="text"
                                   value="${oaActRegularization.supervisorSign}"
                                   readonly>
                        </div>
                    </shiro:lacksPermission>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">组织人事部意见</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="personnel">
                    <textarea class="approval-content-textarea" name="personnelContent"
                              style="background-color: #ffffff"></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期:</label>
                        <input class="approval-date-input" type="text" name="personnelDate"
                               value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字:</label>
                        <input class="approval-signature-input" type="text" name="personnelSign" value="${nickname}"
                               readonly>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="personnel">
                    <textarea class="approval-content-textarea"
                              readonly>${oaActRegularization.personnelContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期:</label>
                        <input class="approval-date-input" type="text" value="${oaActRegularization.personnelDate}"
                               readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字:</label>
                        <input class="approval-signature-input" type="text" value="${oaActRegularization.personnelSign}"
                               readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">总经理审批</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="companyPrincipal">
                    <textarea class="approval-content-textarea" name="presidentContent"
                              style="background-color: #ffffff"></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期:</label>
                        <input class="approval-date-input" type="text" name="presidentDate"
                               value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字:</label>
                        <input class="approval-signature-input" type="text" name="presidentSign" value="${nickname}"
                               readonly>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="companyPrincipal">
                    <textarea class="approval-content-textarea"
                              readonly>${oaActRegularization.presidentContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期:</label>
                        <input class="approval-date-input" type="text" value="${oaActRegularization.presidentDate}"
                               readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字:</label>
                        <input class="approval-signature-input" type="text" value="${oaActRegularization.presidentSign}"
                               readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="officePrincipal,officeSupervisor,personnel,companyPrincipal">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/jeDate/src/jedate.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/regularization/approvalSubmit',
            data: $('#oaActRegularization').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#tool,#return').show();
        $('#body').css('width', '80%');
    }
</script>
</html>

