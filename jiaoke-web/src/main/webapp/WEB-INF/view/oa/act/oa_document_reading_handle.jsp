<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>收文阅办审批单审批</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 65%">


<div class="table-title">
    <span>${oaActRead.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActRead.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActRead.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActRead.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActRead.annex}" delims="," var="annex">
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

<form id="oaActRead">

    <div>
        <span class="fill-in-date" style="float: right;min-width: 130px">${oaActRead.departmentNumbering}</span>

        <span class="form-number-left" style="float: right;min-width: 130px">编号 ${oaActRead.numbering}</span>
    </div>

    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">来文机关</td>
            <td class="table-td-content">
                ${oaActRead.organ}
                <input type="hidden" name="id" value="${oaActRead.id}">
            </td>

            <td class="tdLabel">来文字号</td>
            <td class="table-td-content">
                ${oaActRead.fontSize}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">份数</td>
            <td class="table-td-content">
                ${oaActRead.copies}
            </td>

            <td class="tdLabel">收文日期</td>
            <td class="table-td-content">
                ${oaActRead.receiptTime}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">文件标题</td>
            <td colspan="3" class="table-td-content" style="padding: 10px">
                ${oaActRead.fileTitle}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">拟办意见</td>
            <td colspan="3" class="table-td-content" style="padding: 10px">
                <shiro:hasPermission name="receipt_proposed">
                    <textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\s+/g,'')" name="receiptProposedContent"></textarea>
                    <input type="hidden" name="receiptProposed" value="${nickname}">
                    <input type="hidden" name="receiptProposedDate"
                           value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">

                    <div style="line-height: 20px;margin-top: 5px;">
                        <input type="radio" name="receiptDepartment" value="0" checked
                               style="vertical-align: middle;margin-left: 5px;outline: none;">
                        <span style="font-size: 13px;margin-right: 15px;">领导班子成员</span>
                        <input type="radio" name="receiptDepartment" value="1"
                               style="vertical-align: middle;outline: none;">
                        <span style="font-size: 13px;">各部门负责人</span>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="receipt_proposed">
                    <textarea class="approval-content-textarea" readonly>${oaActRead.receiptProposedContent}</textarea>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">部门意见</td>
            <td colspan="3" class="table-td-content" style="padding: 10px">
                <shiro:hasAnyPermission name="dep_opinion">
                    <textarea class="approval-content-textarea" readonly>${oaActRead.departmentOpinion}</textarea>
                </shiro:hasAnyPermission>

                <shiro:lacksPermission name="dep_opinion">
                    <textarea class="approval-content-textarea" name="departmentOpinion"
                              readonly>${oaActRead.departmentOpinion} ${nickname}</textarea>
                    <input type="hidden" name="departmentOpinionDate">
                </shiro:lacksPermission>

            </td>
        </tr>

        <tr>
            <td class="tdLabel">领导批示</td>
            <td colspan="3" class="table-td-content" style="padding: 10px">
                <shiro:hasPermission name="company_principal">
                    <textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\s+/g,'')" name="companyPrincipalContent"></textarea>
                    <input type="hidden" name="companyPrincipal" value="${nickname}">
                    <input type="hidden" name="companyPrincipalDate"
                           value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">
                </shiro:hasPermission>

                <shiro:lacksPermission name="company_principal">
                    <textarea class="approval-content-textarea" readonly>${oaActRead.companyPrincipalContent}</textarea>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">办理结果</td>
            <td colspan="3" class="table-td-content" style="padding: 10px">
                <shiro:hasPermission name="handling_result">
                    <textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\s+/g,'')" name="outcome"></textarea>
                </shiro:hasPermission>

                <shiro:lacksPermission name="handling_result">
                    <textarea class="approval-content-textarea" readonly>${oaActRead.outcome}</textarea>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">保存期限</td>
            <td colspan="3" class="table-td-content" style="padding: 10px">
                <shiro:hasPermission name="handling_result">
                    <textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\s+/g,'')" name="deadline"></textarea>
                </shiro:hasPermission>

                <shiro:lacksPermission name="handling_result">
                    <textarea class="approval-content-textarea" readonly>${oaActRead.deadline}</textarea>
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but">
    <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
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
            url: '/read/approvalSubmit',
            data: $('#oaActRead').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#tool').show();
        $('#body,#return').css('width', '65%');
    }
</script>
</html>

