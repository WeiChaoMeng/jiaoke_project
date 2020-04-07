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
    <title>合同审查表审批处理</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActReview.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActReview.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActReview.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActReview.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActReview.annex}" delims="," var="annex">
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

<span class="fill-in-date" style="min-width: 130px">编号 ${oaActReview.numbering}</span>

<form id="oaActReview">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">合同名称</td>
            <td class="table-td-content" colspan="3">
                ${oaActReview.name}
                <input type="hidden" name="id" value="${oaActReview.id}">
                <input type="hidden" name="title" value="${oaActReview.title}">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">合同相对人</td>
            <td class="table-td-content" colspan="3">
                ${oaActReview.relative}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">合同金额</td>
            <td class="table-td-content">
                ${oaActReview.amount}
            </td>

            <td class="tdLabel">合同编号</td>
            <td class="table-td-content">
                ${oaActReview.number}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">经办人</td>
            <td class="table-td-content" style="width: 340px">
                ${oaActReview.promoterStr}
            </td>

            <td class="tdLabel">部门负责人</td>
            <td class="table-td-content" style="width: 340px">
                <shiro:hasPermission name="principal">
                    <div style="width: 100%;height: 100%;" id="principalContent">
                        <%--<input type="text" class="formInput-readonly" name="principal" value="${nickname}" readonly>--%>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="principal">
                    ${oaActReview.principal}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">法务审查意见</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="legal_affairs">
                    <div style="width: 100%;height: 100%;" id="legalAffairsContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="legal_affairs">
                    <textarea class="approval-content-textarea" readonly>${oaActReview.legalAffairsContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" value="${oaActReview.legalAffairsDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" value="${oaActReview.legalAffairs}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">财务部门审查意见</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="finance">
                    <div style="width: 100%;height: 100%;" id="financeContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="finance">
                    <textarea class="approval-content-textarea" readonly>${oaActReview.financeContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" value="${oaActReview.financeDate}"
                               readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" value="${oaActReview.finance}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">主管领导审查意见</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="supervisor">
                    <div style="width: 100%;height: 100%;" id="supervisorContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="supervisor">
                    <textarea class="approval-content-textarea" readonly>${oaActReview.supervisorContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" value="${oaActReview.supervisorDate}"
                               readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" value="${oaActReview.supervisor}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">主要领导审查意见</td>
            <td colspan="5" class="approval-content">
                <shiro:hasPermission name="company_principal">
                    <div style="width: 100%;height: 100%;" id="companyPrincipalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="company_principal">
                    <textarea class="approval-content-textarea" readonly>${oaActReview.companyPrincipalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" value="${oaActReview.companyPrincipalDate}"
                               readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" value="${oaActReview.companyPrincipal}"
                               readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="notice-tips">
    <span class="notice-tips-mark">*</span>
    <span class="notice-tips-script">注：1.不涉及技术审查的可不填“技术负责人审查意见”。2.应收款确认单不需填写“法务审查意见”。</span>
</div>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="finance,legal_affairs,principal,supervisor,company_principal">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //流程执行步骤
    var review = JSON.parse('${oaActReviewJson}');
    console.log(review);
    console.log(review.companyPrincipal);
    //标记
    var flag = 0;
    if (flag === 0) {
        if (review.principal === "" || review.principal === undefined) {
            $('#principalContent').append('<input type="text" class="formInput-readonly" name="principal" value="${nickname}" readonly>' +
            '<input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#principalContent').append(review.principal);
        }
    } else {
        $('#principalContent').append(review.principal);
    }

    //法务
    if (flag === 0) {
        if (review.legalAffairs === "" || review.legalAffairs === undefined) {
            $('#legalAffairsContent').append('<textarea onkeyup="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="legalAffairsContent" style="background-color: #ffffff"></textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期</label>' +
                '<input class="approval-date-input" type="text" name="legalAffairsDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字</label>' +
                '<input class="approval-signature-input" type="text" name="legalAffairs" value="${nickname}" readonly></div>');
            flag = 1;
        } else {
            $('#legalAffairsContent').append('<textarea class="approval-content-textarea" readonly>${oaActReview.legalAffairsContent}</textarea>\n' +
                '                    <div class="approval-date">\n' +
                '                        <label class="approval-date-label">日期</label>\n' +
                '                        <input class="approval-date-input" type="text" value="${oaActReview.legalAffairsDate}" readonly>\n' +
                '                    </div>\n' +
                '                    <div class="approval-signature">\n' +
                '                        <label class="approval-signature-label">签字</label>\n' +
                '                        <input class="approval-signature-input" type="text" value="${oaActReview.legalAffairs}" readonly>\n' +
                '                    </div>');
        }
    } else {
        $('#legalAffairsContent').append('<textarea class="approval-content-textarea" readonly>${oaActReview.legalAffairsContent}</textarea>\n' +
            '                    <div class="approval-date">\n' +
            '                        <label class="approval-date-label">日期</label>\n' +
            '                        <input class="approval-date-input" type="text" value="${oaActReview.legalAffairsDate}" readonly>\n' +
            '                    </div>\n' +
            '                    <div class="approval-signature">\n' +
            '                        <label class="approval-signature-label">签字</label>\n' +
            '                        <input class="approval-signature-input" type="text" value="${oaActReview.legalAffairs}" readonly>\n' +
            '                    </div>');
    }

    //财务
    if (flag === 0) {
        if (review.finance === "" || review.finance === undefined) {
            $('#financeContent').append('<textarea onkeyup="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="financeContent" style="background-color: #ffffff"></textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期</label>' +
                '<input class="approval-date-input" type="text" name="financeDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字</label>' +
                '<input class="approval-signature-input" type="text" name="finance" value="${nickname}" readonly></div>');
            flag = 1;
        } else {
            $('#financeContent').append('<textarea class="approval-content-textarea" readonly>${oaActReview.financeContent}</textarea>\n' +
                '                    <div class="approval-date">\n' +
                '                        <label class="approval-date-label">日期</label>\n' +
                '                        <input class="approval-date-input" type="text" value="${oaActReview.financeDate}"\n' +
                '                               readonly>\n' +
                '                    </div>\n' +
                '                    <div class="approval-signature">\n' +
                '                        <label class="approval-signature-label">签字</label>\n' +
                '                        <input class="approval-signature-input" type="text" value="${oaActReview.finance}" readonly>\n' +
                '                    </div>');
        }
    } else {
        $('#financeContent').append('<textarea class="approval-content-textarea" readonly>${oaActReview.financeContent}</textarea>\n' +
            '                    <div class="approval-date">\n' +
            '                        <label class="approval-date-label">日期</label>\n' +
            '                        <input class="approval-date-input" type="text" value="${oaActReview.financeDate}"\n' +
            '                               readonly>\n' +
            '                    </div>\n' +
            '                    <div class="approval-signature">\n' +
            '                        <label class="approval-signature-label">签字</label>\n' +
            '                        <input class="approval-signature-input" type="text" value="${oaActReview.finance}" readonly>\n' +
            '                    </div>');
    }

    //主管
    if (flag === 0) {
        if (review.supervisor === "" || review.supervisor === undefined) {
            $('#supervisorContent').append('<textarea onkeyup="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="supervisorContent" style="background-color: #ffffff"></textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期</label>' +
                '<input class="approval-date-input" type="text" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字</label>\n' +
                '<input class="approval-signature-input" type="text" name="supervisor" value="${nickname}" readonly></div>');
            flag = 1;
        } else {
            $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActReview.supervisorContent}</textarea>\n' +
                '                    <div class="approval-date">\n' +
                '                        <label class="approval-date-label">日期</label>\n' +
                '                        <input class="approval-date-input" type="text" value="${oaActReview.supervisorDate}"\n' +
                '                               readonly>\n' +
                '                    </div>\n' +
                '                    <div class="approval-signature">\n' +
                '                        <label class="approval-signature-label">签字</label>\n' +
                '                        <input class="approval-signature-input" type="text" value="${oaActReview.supervisor}" readonly>\n' +
                '                    </div>');
        }
    } else {
        $('#supervisorContent').append('<textarea class="approval-content-textarea" readonly>${oaActReview.supervisorContent}</textarea>\n' +
            '                    <div class="approval-date">\n' +
            '                        <label class="approval-date-label">日期</label>\n' +
            '                        <input class="approval-date-input" type="text" value="${oaActReview.supervisorDate}"\n' +
            '                               readonly>\n' +
            '                    </div>\n' +
            '                    <div class="approval-signature">\n' +
            '                        <label class="approval-signature-label">签字</label>\n' +
            '                        <input class="approval-signature-input" type="text" value="${oaActReview.supervisor}" readonly>\n' +
            '                    </div>');
    }

    //主要领导
    if (flag === 0) {
        if (review.companyPrincipal === "" || review.companyPrincipal === undefined) {
            $('#companyPrincipalContent').append('<textarea onkeyup="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="companyPrincipalContent" style="background-color: #ffffff"></textarea>' +
                '<div class="approval-date"><label class="approval-date-label">日期</label>' +
                '<input class="approval-date-input" type="text" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly></div>' +
                '<div class="approval-signature"><label class="approval-signature-label">签字</label>' +
                '<input class="approval-signature-input" type="text" name="companyPrincipal" value="${nickname}" readonly></div>');
            flag = 1;
        } else {
            $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActReview.supervisorContent}</textarea>\n' +
                '                    <div class="approval-date">\n' +
                '                        <label class="approval-date-label">日期</label>\n' +
                '                        <input class="approval-date-input" type="text" value="${oaActReview.supervisorDate}"\n' +
                '                               readonly>\n' +
                '                    </div>\n' +
                '                    <div class="approval-signature">\n' +
                '                        <label class="approval-signature-label">签字</label>\n' +
                '                        <input class="approval-signature-input" type="text" value="${oaActReview.supervisor}" readonly>\n' +
                '                    </div>');
        }
    } else {
        $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActReview.supervisorContent}</textarea>\n' +
            '                    <div class="approval-date">\n' +
            '                        <label class="approval-date-label">日期</label>\n' +
            '                        <input class="approval-date-input" type="text" value="${oaActReview.supervisorDate}"\n' +
            '                               readonly>\n' +
            '                    </div>\n' +
            '                    <div class="approval-signature">\n' +
            '                        <label class="approval-signature-label">签字</label>\n' +
            '                        <input class="approval-signature-input" type="text" value="${oaActReview.supervisor}" readonly>\n' +
            '                    </div>');
    }


    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/review/approvalSubmit',
            data: $('#oaActReview').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#body').css('width', '80%');
    }
</script>
</html>

