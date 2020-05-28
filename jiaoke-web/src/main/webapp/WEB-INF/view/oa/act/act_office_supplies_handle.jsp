<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
    <title>办公用品需求计划</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <style>
        .table-td-content {
            padding: 10px;
        }

        .tdLabel {
            text-align: right;
            padding-left: 10px;
        }

        .formTable thead tr th {
            line-height: 40px;
            border: solid 1px #e5e5e5;
            text-align: center;
            background: #f6f6f6;
            white-space: nowrap;
            font-size: 13px;
            font-weight: 600;
        }

        .formTable td {
            line-height: 20px;
        }
    </style>
</head>

<body id="body">

<div class="table-title">
    <span>${oaActOfficeSupplies.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActOfficeSupplies.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActOfficeSupplies.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActOfficeSupplies.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActOfficeSupplies.annex}" delims="," var="annex">
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


<form id="oaActOfficeSupplies">
    <div style="margin-top: 10px">
        <span class="form-number-left" style="margin-top: 0">部门
            <input type="text" class="form-number-content" style="cursor: no-drop"
                   value="${oaActOfficeSupplies.department}" readonly>
            <input type="hidden" name="id" value="${oaActOfficeSupplies.id}">
            <input type="hidden" name="promoter" value="${oaActOfficeSupplies.promoter}">
        </span>
    </div>

    <table class="formTable" style="margin: 0">
        <thead>
        <tr>
            <th style="width: 7%">序号</th>
            <th style="width: 41%">项目</th>
            <th style="width: 13%">单位</th>
            <th style="width: 13%">数量</th>
            <th style="width: 13%">单价</th>
            <th style="width: 13%">金额(元)</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${oaActOfficeSupplies.oaOfficeSuppliesList}" var="list" varStatus="status">
            <tr>
                <td class="table-td-content" style="text-align: center">${status.index+1}</td>
                <td class="table-td-content">${list.item}</td>
                <td class="table-td-content">${list.unit}</td>
                <td class="table-td-content">${list.number}</td>
                <td class="table-td-content">${list.price}</td>
                <td class="table-td-content">${list.money}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <table class="formTable">
        <tr>
            <td class="tdLabel">填表人</td>
            <td class="table-td-content" style="width: 194px;">
                ${oaActOfficeSupplies.preparer}
                <input type="hidden" name="departmentPrincipal" value="${oaActOfficeSupplies.departmentPrincipal}">
            </td>

            <td class="tdLabel">填表日期</td>
            <td class="table-td-content" style="width: 194px;">
                ${oaActOfficeSupplies.fillingDate}
            </td>

            <td class="tdLabel">合计(元)</td>
            <td class="table-td-content">
                ${oaActOfficeSupplies.total}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">审核</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="office_supplies_review">
                    <div style="width: 100%;height: 100%;" id="officeSuppliesReviewContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="office_supplies_review">
                    <textarea class="approval-content-textarea" readonly>${oaActOfficeSupplies.reviewContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActOfficeSupplies.reviewDate}"
                               readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActOfficeSupplies.review}"
                               readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">部门负责人</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="principal">
                    <div style="width: 100%;height: 100%;" id="principalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="principal">
                    <textarea class="approval-content-textarea"
                              readonly>${oaActOfficeSupplies.principalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActOfficeSupplies.principalDate}"
                               readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActOfficeSupplies.principal}"
                               readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">审批</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="office_supplies_supervisor">
                    <div style="width: 100%;height: 100%;" id="officeSuppliesSupervisorContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="office_supplies_supervisor">
                    <textarea class="approval-content-textarea"
                              readonly>${oaActOfficeSupplies.supervisorContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActOfficeSupplies.supervisorDate}"
                               readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActOfficeSupplies.supervisor}"
                               readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>
    </table>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="office_supplies_review,principal,office_supplies_supervisor">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //流程执行步骤
    var officeSupplies = JSON.parse('${oaActOfficeSuppliesJson}');

    //标记
    var flag = 0;

    if (officeSupplies.state === 0) {
        if (flag === 0) {
            if (officeSupplies.review === "" || officeSupplies.review === undefined) {
                $('#officeSuppliesReviewContent').append(
                    '<div id="officeSuppliesReview"><textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\\s+/g,\'\')" name="reviewContent"></textarea>\n' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>\n' +
                    '<input class="approval-date-input" type="text" name="reviewDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>\n' +
                    '</div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '<input class="approval-signature-input" type="text" name="review" value="${nickname}" readonly></div></div>');
                flag = 1;
            } else {
                $('#officeSuppliesReviewContent').append(
                    '<textarea class="approval-content-textarea" readonly>${oaActOfficeSupplies.reviewContent}</textarea>\n' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>\n' +
                    '<input class="approval-date-input" type="text" value="${oaActOfficeSupplies.reviewDate}" readonly>\n' +
                    '</div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '<input class="approval-signature-input" type="text" value="${oaActOfficeSupplies.review}" readonly></div>');
            }
        } else {
            $('#officeSuppliesReviewContent').append(
                '<textarea class="approval-content-textarea" readonly>${oaActOfficeSupplies.reviewContent}</textarea>\n' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>\n' +
                '<input class="approval-date-input" type="text" value="${oaActOfficeSupplies.reviewDate}" readonly>\n' +
                '</div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                '<input class="approval-signature-input" type="text" value="${oaActOfficeSupplies.review}" readonly></div>');
        }

        if (flag === 0) {
            if (officeSupplies.principal === "" || officeSupplies.principal === undefined) {
                $('#principalContent').append(
                    '<div id="officeSuppliesReview"><textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\\s+/g,\'\')" name="principalContent"></textarea>\n' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>\n' +
                    '<input class="approval-date-input" type="text" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>\n' +
                    '</div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '<input class="approval-signature-input" type="text" name="principal" value="${nickname}" readonly></div></div>');
                flag = 1;
            } else {
                $('#principalContent').append(
                    '<textarea class="approval-content-textarea" readonly>${oaActOfficeSupplies.principalContent}</textarea>\n' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>\n' +
                    '<input class="approval-date-input" type="text" value="${oaActOfficeSupplies.principalDate}" readonly>\n' +
                    '</div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '<input class="approval-signature-input" type="text" value="${oaActOfficeSupplies.principal}" readonly></div>');
            }
        } else {
            $('#principalContent').append(
                '<textarea class="approval-content-textarea" readonly>${oaActOfficeSupplies.principalContent}</textarea>\n' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>\n' +
                '<input class="approval-date-input" type="text" value="${oaActOfficeSupplies.principalDate}" readonly>\n' +
                '</div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                '<input class="approval-signature-input" type="text" value="${oaActOfficeSupplies.principal}" readonly></div>');
        }

        if (flag === 0) {
            if (officeSupplies.supervisor === "" || officeSupplies.supervisor === undefined) {
                $('#officeSuppliesSupervisorContent').append(
                    '<div id="officeSuppliesReview"><textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\\s+/g,\'\')" name="supervisorContent"></textarea>\n' +
                    '<div class="approval-date"><label class="approval-date-label">日期 </label>\n' +
                    '<input class="approval-date-input" type="text" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>\n' +
                    '</div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '<input class="approval-signature-input" type="text" name="supervisor" value="${nickname}" readonly></div></div>');
                flag = 1;
            } else {
                $('#officeSuppliesSupervisorContent').append(
                    '<textarea class="approval-content-textarea" readonly>${oaActOfficeSupplies.supervisorContent}</textarea>\n<div class="approval-date">\n' +
                    '<label class="approval-date-label">日期 </label>\n' +
                    '<input class="approval-date-input" type="text" value="${oaActOfficeSupplies.supervisorDate}" readonly>\n' +
                    '</div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '<input class="approval-signature-input" type="text" value="${oaActOfficeSupplies.supervisor}" readonly></div>');
            }
        } else {
            $('#officeSuppliesSupervisorContent').append(
                '<textarea class="approval-content-textarea" readonly>${oaActOfficeSupplies.supervisorContent}</textarea>\n' +
                '<div class="approval-date"><label class="approval-date-label">日期 </label>\n' +
                '<input class="approval-date-input" type="text" value="${oaActOfficeSupplies.supervisorDate}" readonly></div>\n' +
                '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                '<input class="approval-signature-input" type="text" value="${oaActOfficeSupplies.supervisor}" readonly></div>');
        }

        if (flag === 0 ){
            $('#return').html("");
            $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
        }
    } else {
        $('#officeSuppliesReviewContent').append(
            '<textarea class="approval-content-textarea" readonly>${oaActOfficeSupplies.reviewContent}</textarea>\n' +
            '<div class="approval-date"><label class="approval-date-label">日期 </label>\n' +
            '<input class="approval-date-input" type="text" value="${oaActOfficeSupplies.reviewDate}" readonly>\n' +
            '</div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
            '<input class="approval-signature-input" type="text" value="${oaActOfficeSupplies.review}" readonly></div>');
        $('#principalContent').append(
            '<textarea class="approval-content-textarea" readonly>${oaActOfficeSupplies.principalContent}</textarea>\n' +
            '<div class="approval-date"><label class="approval-date-label">日期 </label>\n' +
            '<input class="approval-date-input" type="text" value="${oaActOfficeSupplies.principalDate}" readonly>\n' +
            '</div><div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
            '<input class="approval-signature-input" type="text" value="${oaActOfficeSupplies.principal}" readonly></div>');
        $('#officeSuppliesSupervisorContent').append(
            '<textarea class="approval-content-textarea" readonly>${oaActOfficeSupplies.supervisorContent}</textarea>\n' +
            '<div class="approval-date"><label class="approval-date-label">日期 </label>\n' +
            '<input class="approval-date-input" type="text" value="${oaActOfficeSupplies.supervisorDate}" readonly></div>\n' +
            '<div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
            '<input class="approval-signature-input" type="text" value="${oaActOfficeSupplies.supervisor}" readonly></div>');
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
    }

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/officeSupplies/approvalSubmit',
            data: $('#oaActOfficeSupplies').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#tool,#return').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool,#return').show();
        $('#body').css('width', '80%');
    }
</script>
</html>

