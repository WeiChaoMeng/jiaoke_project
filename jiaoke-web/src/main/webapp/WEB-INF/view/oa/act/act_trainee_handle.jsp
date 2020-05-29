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
    <title>毕业生见习期满考核鉴定表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <style>
        .tdLabel{
            width: 10%;
        }
        .opinion-column-Juxtaposition{
            height: 90px;
        }
        .approval-content-textarea{
            height: 90px;
        }
    </style>
</head>

<body id="body">

<div class="table-title">
    <span>${oaActTrainee.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActTrainee.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActTrainee.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActTrainee.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActTrainee.annex}" delims="," var="annex">
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

<span class="filling-date" style="float: left">单位（部门）名称：</span>
<span class="filling-date" style="float: left">${oaActTrainee.corporation}</span>

<span class="filling-date">${oaActTrainee.fillingTime}</span>
<span class="filling-date">填表日期：</span>

<form id="oaActTrainee" style="margin: 0">
    <table class="formTable" style="margin: 0">
        <tbody>
        <tr>
            <td class="tdLabel">姓名</td>
            <td class="table-td-content">
                ${oaActTrainee.name}
                <input type="hidden" name="id" value="${oaActTrainee.id}">
                <input type="hidden" name="promoter" value="${oaActTrainee.promoter}">
            </td>

            <td class="tdLabel">性别</td>
            <td class="table-td-content">
                ${oaActTrainee.sex}
            </td>

            <td class="tdLabel">出生年月</td>
            <td class="table-td-content">
                ${oaActTrainee.birthday}
            </td>

            <td class="tdLabel">参加工作时间</td>
            <td class="table-td-content">
                ${oaActTrainee.workingHours}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">学历</td>
            <td class="table-td-content">
                ${oaActTrainee.education}
            </td>

            <td class="tdLabel">何时毕业于何校</td>
            <td class="table-td-content" colspan="3">
                ${oaActTrainee.school}
            </td>

            <td class="tdLabel">学制</td>
            <td class="table-td-content">
                ${oaActTrainee.schoolSystem}
            </td>
        </tr>

        <tr>
            <td class="tdLabel" style="width: 5%;text-align: center;padding: 15px 0;line-height: normal;">本<br/>人<br/>简<br/>(学)<br/>历</td>
            <td colspan="7" class="approval-content" style="padding: 10px;">
                <textarea class="approval-content-textarea" style="height: 100%;" readonly>${oaActTrainee.resume}</textarea>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" colspan="8" style="padding: 0;text-align: center;">大中专院校毕业见习期：从 <span>${oaActTrainee.internship}</span>
                见习期工资 <span>${oaActTrainee.wages}</span>元/月</td>
        </tr>

        <tr>
            <td class="tdLabel" style="width: 5%;text-align: center;padding: 15px 0;line-height: normal;">自<br/>我<br/>鉴<br/>定</td>
            <td colspan="7" class="approval-content" style="padding: 10px;">
                <textarea class="approval-content-textarea" style="height: 100%;" readonly>${oaActTrainee.selfAccreditation}</textarea>
            </td>
        </tr>
        </tbody>
    </table>

    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel" rowspan="2" style="width: 5%;text-align: center;padding: 15px 0;line-height: normal;">定<br/>级</td>
            <td class="tdLabel" style="line-height: normal;width: 5%;text-align: center;padding: 15px 0;">单<br/>位<br/>或<br/>部<br/>门<br/>意<br/>见</td>
            <td colspan="6" class="table-td-textarea" style="line-height: 0">
                <div class="opinion-principal" style="width: 100%">

                    <shiro:hasPermission name="company_principal">
                        <div style="width: 100%;height: 100%;" id="companyPrincipalContent"></div>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="company_principal">
                        <textarea class="opinion-column-Juxtaposition" readonly>${oaActTrainee.companyPrincipalContent}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text" value="${oaActTrainee.companyPrincipalDate}" readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字 </label>
                            <input class="approval-signature-input" type="text" value="${oaActTrainee.companyPrincipal}" readonly>
                        </div>
                    </shiro:lacksPermission>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" style="line-height: normal;width: 5%;text-align: center;padding: 15px 0;">单<br/>位<br/>审<br/>批<br/>意<br/>见</td>
            <td colspan="6" class="table-td-textarea" style="line-height: 0">
                <div class="opinion-principal" style="width: 100%">
                    <textarea class="opinion-column-Juxtaposition" readonly></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" readonly>
                    </div>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" colspan="2">备注</td>
            <td class="table-td-content" colspan="6" style="padding: 10px;" id="personnelCensorContent">
                <textarea class="approval-content-textarea" readonly>${oaActTrainee.remarks}</textarea>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="company_principal">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //流程执行步骤
    var oaActTrainee = JSON.parse('${oaActTraineeJson}'.replace(/\r/g,"\\r").replace(/\n/g,"\\n"));
    //标记
    var flag = 0;

    if (oaActTrainee.personnelCensor === "" || oaActTrainee.personnelCensor === undefined) {
        $('#personnelCensorContent').append('<input type="hidden" name="personnelCensor" value="${nickname}">');
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
        flag = 1;
    } else {
        if (oaActTrainee.state === 0) {
            if (flag === 0) {
                if (oaActTrainee.companyPrincipal === "" || oaActTrainee.companyPrincipal === undefined) {
                    $('#companyPrincipalContent').append(
                        '<textarea class="approval-content-textarea" name="companyPrincipalContent" style="background-color: #ffffff"></textarea>' +
                        '<div class="approval-date"><label class="approval-date-label">日期 </label>' +
                        '<input class="approval-date-input" type="text" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                        '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                        '<input class="approval-signature-input" type="text" name="companyPrincipal" value="${nickname}" readonly></div>');
                    flag = 1;
                }
            }

            if (flag === 0) {
                $('#return').html("");
                $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
            }

        } else {
            $('#return').html("");
            $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
        }
    }

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/trainee/approvalSubmit',
            data: $('#oaActTrainee').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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

