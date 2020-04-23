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
    <style>
        .input-radio-div{
            width: 100px;display: inline-block;text-align: center;
        }
        .radio-style{
            vertical-align: middle;outline: none;zoom: 120%;
        }
        .deadline-select{
            line-height: 20px;margin-top: 8px;width: 25%;display: inline-block;float: right
        }

        .dep-radio{
            line-height: 30px;margin-top: 8px;width: 75%;display: inline-block;
        }

        .handling-result-div{
            border-top: 1px solid #eaeaea;width: 100%;display: inline-block;margin-top: 10px;
        }
    </style>
</head>

<body id="body" style="width: 70%">


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
        <span class="fill-in-date" style="float: left;min-width: 130px">${oaActRead.departmentNumbering}</span>

        <span class="form-number-left" style="float: right;min-width: 130px">编号 ${oaActRead.numbering}</span>
    </div>

    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">来文机关</td>
            <td class="table-td-content" style="width: 314px;">
                ${oaActRead.organ}
                <input type="hidden" name="id" value="${oaActRead.id}">
                <input type="hidden" name="promoter" value="${oaActRead.promoter}">
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
                    <div style="width: 100%;height: 100%;" id="receiptProposedContent"></div>

                    <%--<textarea oninput="value=value.replace(/\s+/g,'')" class="approval-content-textarea" name="receiptProposedContent" style="background-color: #ffffff"></textarea>--%>
                    <%--<div class="approval-date">--%>
                        <%--<label class="approval-date-label">日期 </label>--%>
                        <%--<input class="approval-date-input" type="text" name="receiptProposedDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>--%>
                    <%--</div>--%>
                    <%--<div class="approval-signature"><label class="approval-signature-label">签字 </label>--%>
                        <%--<input class="approval-signature-input" type="text" name="receiptProposed" value="${nickname}" readonly>--%>
                    <%--</div>--%>
                </shiro:hasPermission>

                <shiro:lacksPermission name="receipt_proposed">
                    <textarea class="approval-content-textarea" readonly>${oaActRead.receiptProposedContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActRead.receiptProposedDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActRead.receiptProposed}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">领导批示</td>
            <td colspan="3" class="table-td-content" style="padding: 10px">
                <shiro:hasPermission name="company_principal">
                    <div style="width: 100%;height: 100%;" id="companyPrincipalContent"></div>

                    <%--<textarea oninput="value=value.replace(/\s+/g,'')" class="approval-content-textarea" name="companyPrincipalContent" style="background-color: #ffffff"></textarea>--%>
                    <%--<div class="approval-date">--%>
                        <%--<label class="approval-date-label">日期 </label>--%>
                        <%--<input class="approval-date-input" type="text" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>--%>
                    <%--</div>--%>
                    <%--<div class="approval-signature"><label class="approval-signature-label">签字 </label>--%>
                        <%--<input class="approval-signature-input" type="text" name="companyPrincipal" value="${nickname}" readonly>--%>
                    <%--</div>--%>
                </shiro:hasPermission>

                <shiro:lacksPermission name="company_principal">
                    <textarea class="approval-content-textarea" readonly>${oaActRead.companyPrincipalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActRead.companyPrincipalDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActRead.companyPrincipal}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">办理结果</td>
            <td colspan="3" class="table-td-content" style="padding: 10px">
                <shiro:hasPermission name="handling_result">
                    <div style="width: 100%;height: 100%;" id="outcomeContent"></div>

                    <%--<textarea oninput="value=value.replace(/\s+/g,'')" class="approval-content-textarea" name="outcomeContent" style="background-color: #ffffff"></textarea>--%>
                    <%--<div class="approval-date">--%>
                        <%--<label class="approval-date-label">日期 </label>--%>
                        <%--<input class="approval-date-input" type="text" name="outcomeDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>--%>
                    <%--</div>--%>
                    <%--<div class="approval-signature"><label class="approval-signature-label">签字 </label>--%>
                        <%--<input class="approval-signature-input" type="text" name="outcome" value="${nickname}" readonly>--%>
                    <%--</div>--%>

                    <%--<div class="handling-result-div">--%>
                        <%--<div class="dep-radio">--%>
                            <%--<div class="input-radio-div">--%>
                                <%--<input type="radio" class="radio-style" name="receiptDepartment" value="1" checked>--%>
                                <%--<span style="font-size: 13px;">领导班子成员</span>--%>
                            <%--</div>--%>

                            <%--<div class="input-radio-div">--%>
                                <%--<input type="radio" class="radio-style" name="receiptDepartment" value="2">--%>
                                <%--<span style="font-size: 13px;">各部室负责人</span>--%>
                            <%--</div>--%>

                            <%--<div class="input-radio-div">--%>
                                <%--<input type="radio" class="radio-style" name="receiptDepartment" value="0">--%>
                                <%--<span style="font-size: 13px;">无</span>--%>
                            <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="deadline-select">--%>
                            <%--<select class="select" name="deadline">--%>
                                <%--<option value="0">10年</option>--%>
                                <%--<option value="1">30年</option>--%>
                                <%--<option value="2">永久</option>--%>
                            <%--</select>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                </shiro:hasPermission>

                <shiro:lacksPermission name="handling_result">
                    <textarea class="approval-content-textarea" readonly>${oaActRead.outcomeContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" value="${oaActRead.outcomeDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" value="${oaActRead.outcome}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="receipt_proposed,company_principal">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>
    //流程执行步骤
    var read = JSON.parse('${oaActReadJson}');

    //标记
    var flag = 0;
    if (read.state === 0) {
        if (flag === 0) {
            if (read.receiptProposed === "" || read.receiptProposed === undefined) {
                $('#receiptProposedContent').append('<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="receiptProposedContent" style="background-color: #ffffff"></textarea>\n' +
                    '                    <div class="approval-date">\n' +
                    '                        <label class="approval-date-label">日期 </label>\n' +
                    '                        <input class="approval-date-input" type="text" name="receiptProposedDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>\n' +
                    '                    </div>\n' +
                    '                    <div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '                        <input class="approval-signature-input" type="text" name="receiptProposed" value="${nickname}" readonly>\n' +
                    '                    </div>');
                flag = 1;
            } else {
                $('#receiptProposedContent').append('<textarea class="approval-content-textarea" readonly>${oaActRead.receiptProposedContent}</textarea>\n' +
                    '                    <div class="approval-date">\n' +
                    '                        <label class="approval-date-label">日期 </label>\n' +
                    '                        <input class="approval-date-input" type="text" value="${oaActRead.receiptProposedDate}" readonly>\n' +
                    '                    </div>\n' +
                    '                    <div class="approval-signature">\n' +
                    '                        <label class="approval-signature-label">签字 </label>\n' +
                    '                        <input class="approval-signature-input" type="text" value="${oaActRead.receiptProposed}" readonly>\n' +
                    '                    </div>');
            }
        } else {
            $('#receiptProposedContent').append('<textarea class="approval-content-textarea" readonly>${oaActRead.receiptProposedContent}</textarea>\n' +
                '                    <div class="approval-date">\n' +
                '                        <label class="approval-date-label">日期 </label>\n' +
                '                        <input class="approval-date-input" type="text" value="${oaActRead.receiptProposedDate}" readonly>\n' +
                '                    </div>\n' +
                '                    <div class="approval-signature">\n' +
                '                        <label class="approval-signature-label">签字 </label>\n' +
                '                        <input class="approval-signature-input" type="text" value="${oaActRead.receiptProposed}" readonly>\n' +
                '                    </div>');
        }

        if (flag === 0) {
            if (read.companyPrincipal === "" || read.companyPrincipal === undefined) {
                $('#companyPrincipalContent').append('<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="companyPrincipalContent" style="background-color: #ffffff"></textarea>\n' +
                    '                    <div class="approval-date">\n' +
                    '                        <label class="approval-date-label">日期 </label>\n' +
                    '                        <input class="approval-date-input" type="text" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>\n' +
                    '                    </div>\n' +
                    '                    <div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '                        <input class="approval-signature-input" type="text" name="companyPrincipal" value="${nickname}" readonly>\n' +
                    '                    </div>');
                flag = 1;
            } else {
                $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActRead.companyPrincipalContent}</textarea>\n' +
                    '                    <div class="approval-date">\n' +
                    '                        <label class="approval-date-label">日期 </label>\n' +
                    '                        <input class="approval-date-input" type="text" value="${oaActRead.companyPrincipalDate}" readonly>\n' +
                    '                    </div>\n' +
                    '                    <div class="approval-signature">\n' +
                    '                        <label class="approval-signature-label">签字 </label>\n' +
                    '                        <input class="approval-signature-input" type="text" value="${oaActRead.companyPrincipal}" readonly>\n' +
                    '                    </div>');
            }
        } else {
            $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActRead.companyPrincipalContent}</textarea>\n' +
                '                    <div class="approval-date">\n' +
                '                        <label class="approval-date-label">日期 </label>\n' +
                '                        <input class="approval-date-input" type="text" value="${oaActRead.companyPrincipalDate}" readonly>\n' +
                '                    </div>\n' +
                '                    <div class="approval-signature">\n' +
                '                        <label class="approval-signature-label">签字 </label>\n' +
                '                        <input class="approval-signature-input" type="text" value="${oaActRead.companyPrincipal}" readonly>\n' +
                '                    </div>');
        }

        if (flag === 0) {
            if (read.outcome === "" || read.outcome === undefined) {
                $('#outcomeContent').append('<textarea oninput="value=value.replace(/\\s+/g,\'\')" class="approval-content-textarea" name="outcomeContent" style="background-color: #ffffff"></textarea>\n' +
                    '                    <div class="approval-date">\n' +
                    '                        <label class="approval-date-label">日期 </label>\n' +
                    '                        <input class="approval-date-input" type="text" name="outcomeDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>\n' +
                    '                    </div>\n' +
                    '                    <div class="approval-signature"><label class="approval-signature-label">签字 </label>\n' +
                    '                        <input class="approval-signature-input" type="text" name="outcome" value="${nickname}" readonly>\n' +
                    '                    </div>\n' +
                    '\n' +
                    '                    <div class="handling-result-div">\n' +
                    '                        <div class="dep-radio">\n' +
                    '                            <div class="input-radio-div">\n' +
                    '                                <input type="radio" class="radio-style" name="receiptDepartment" value="1" checked>\n' +
                    '                                <span style="font-size: 13px;">领导班子成员</span>\n' +
                    '                            </div>\n' +
                    '\n' +
                    '                            <div class="input-radio-div">\n' +
                    '                                <input type="radio" class="radio-style" name="receiptDepartment" value="2">\n' +
                    '                                <span style="font-size: 13px;">各部室负责人</span>\n' +
                    '                            </div>\n' +
                    '\n' +
                    '                            <div class="input-radio-div">\n' +
                    '                                <input type="radio" class="radio-style" name="receiptDepartment" value="0">\n' +
                    '                                <span style="font-size: 13px;">无</span>\n' +
                    '                            </div>\n' +
                    '                        </div>\n' +
                    '\n' +
                    '                        <div class="deadline-select">\n' +
                    '                            <select class="select" name="deadline">\n' +
                    '                                <option value="0">10年</option>\n' +
                    '                                <option value="1">30年</option>\n' +
                    '                                <option value="2">永久</option>\n' +
                    '                            </select>\n' +
                    '                        </div>\n' +
                    '                    </div>');
                flag = 1;
            } else {
                $('#outcomeContent').append('<textarea class="approval-content-textarea" readonly>${oaActRead.outcomeContent}</textarea>\n' +
                    '                    <div class="approval-date">\n' +
                    '                        <label class="approval-date-label">日期 </label>\n' +
                    '                        <input class="approval-date-input" type="text" value="${oaActRead.outcomeDate}" readonly>\n' +
                    '                    </div>\n' +
                    '                    <div class="approval-signature">\n' +
                    '                        <label class="approval-signature-label">签字 </label>\n' +
                    '                        <input class="approval-signature-input" type="text" value="${oaActRead.outcome}" readonly>\n' +
                    '                    </div>');
            }
        } else {
            $('#outcomeContent').append('<textarea class="approval-content-textarea" readonly>${oaActRead.outcomeContent}</textarea>\n' +
                '                    <div class="approval-date">\n' +
                '                        <label class="approval-date-label">日期 </label>\n' +
                '                        <input class="approval-date-input" type="text" value="${oaActRead.outcomeDate}" readonly>\n' +
                '                    </div>\n' +
                '                    <div class="approval-signature">\n' +
                '                        <label class="approval-signature-label">签字 </label>\n' +
                '                        <input class="approval-signature-input" type="text" value="${oaActRead.outcome}" readonly>\n' +
                '                    </div>');
        }

        if (flag === 0) {
            $('#return').html("");
            $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
        }
    }else {
        $('#receiptProposedContent').append('<textarea class="approval-content-textarea" readonly>${oaActRead.receiptProposedContent}</textarea>\n' +
            '                    <div class="approval-date">\n' +
            '                        <label class="approval-date-label">日期 </label>\n' +
            '                        <input class="approval-date-input" type="text" value="${oaActRead.receiptProposedDate}" readonly>\n' +
            '                    </div>\n' +
            '                    <div class="approval-signature">\n' +
            '                        <label class="approval-signature-label">签字 </label>\n' +
            '                        <input class="approval-signature-input" type="text" value="${oaActRead.receiptProposed}" readonly>\n' +
            '                    </div>');
        $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" readonly>${oaActRead.companyPrincipalContent}</textarea>\n' +
            '                    <div class="approval-date">\n' +
            '                        <label class="approval-date-label">日期 </label>\n' +
            '                        <input class="approval-date-input" type="text" value="${oaActRead.companyPrincipalDate}" readonly>\n' +
            '                    </div>\n' +
            '                    <div class="approval-signature">\n' +
            '                        <label class="approval-signature-label">签字 </label>\n' +
            '                        <input class="approval-signature-input" type="text" value="${oaActRead.companyPrincipal}" readonly>\n' +
            '                    </div>');
        $('#outcomeContent').append('<textarea class="approval-content-textarea" readonly>${oaActRead.outcomeContent}</textarea>\n' +
            '                    <div class="approval-date">\n' +
            '                        <label class="approval-date-label">日期 </label>\n' +
            '                        <input class="approval-date-input" type="text" value="${oaActRead.outcomeDate}" readonly>\n' +
            '                    </div>\n' +
            '                    <div class="approval-signature">\n' +
            '                        <label class="approval-signature-label">签字 </label>\n' +
            '                        <input class="approval-signature-input" type="text" value="${oaActRead.outcome}" readonly>\n' +
            '                    </div>');
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
    }


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

