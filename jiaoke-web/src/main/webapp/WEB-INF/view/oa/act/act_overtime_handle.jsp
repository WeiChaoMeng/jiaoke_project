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
    <title>加班统计表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
    <style>
        .formTable thead tr th {
            width: 10%;
            height: 30px;
            text-align: center;
            white-space: nowrap;
            border: solid 1px #e5e5e5;
            font-size: 13px;
            font-weight: 600;
            background: #f6f6f6;
            line-height: 40px;
        }

        .formTable tbody tr td {
            padding: 5px 10px;
        }

        .approval-div-style {
            width: 100%;
            margin-bottom: 10px;
            display: inline-block;
        }

        .approval-input {
            width: 33%;
            float: left;
        }

        .approval-input-span {
            font-size: 13px;
            width: 30%;
            display: inline-block;
            float: left;
            line-height: 29px;
            text-align: right;
            text-indent: 5px;
        }

        .approval-input-input {
            border: 0;
            border-bottom: 1px #000 solid;
            width: 35%;
            outline: none;
            height: 28px;
            text-align: left;
            font-weight: 500;
            color: #000;
            text-indent: 10px;
            font-size: 13px;
            float: left;
            cursor: no-drop;
        }
    </style>
</head>

<body id="body">

<div class="table-title">
    <span>${oaActOvertime.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActOvertime.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActOvertime.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActOvertime.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActOvertime.annex}" delims="," var="annex">
                        <div class="table-file">
                            <div class="table-file-content">
                                <span class="table-file-title"
                                      title="${fn:substring(annex,annex.indexOf("_")+1,annex.length())}">${fn:substring(annex,annex.indexOf("_")+1,annex.length())}</span>
                                <a class="table-file-download icon"
                                   href="javascript:location.href=encodeURI('/fileDownloadHandle/download?fileName=${annex}')"
                                   title="下载">&#xebda;</a>
                            </div>
                        </div>
                    </c:forTokens>
                </div>
            </div>
        </c:when>
    </c:choose>
</div>

<form id="oaActOvertime">
    <div style="margin-top: 10px">
    <span class="fill-in-date" style="margin-top: 0;float: left;">部门
        <input type="text" class="form-number-content" style="cursor: no-drop" value="${oaActOvertime.department}"
               readonly>
    </span>

        <span class="form-number-left" style="float: right;margin-top: 0;">日期
        <input type="text" class="form-number-content" style="cursor: no-drop" value="${oaActOvertime.statisticalDate}"
               readonly>
            <input type="hidden" name="id" value="${oaActOvertime.id}">
            <input type="hidden" name="title" value="${oaActOvertime.title}">
            <input type="hidden" name="departmentPrincipal" value="${oaActOvertime.departmentPrincipal}">
    </span>
    </div>

    <table class="formTable">
        <thead>
        <tr>
            <th style="width: 10%">姓名</th>
            <th style="width: 35%">周六、周日</th>
            <th style="width: 15%">法定节假日</th>
            <th style="width: 10%">倒休</th>
            <th style="width: 15%">周六日加班合计</th>
            <th style="width: 15%">法定节假日加班合计</th>
        </tr>
        </thead>

        <tbody id="tbo">
        <c:forEach items="${oaActOvertime.oaOvertimeStatisticsList}" var="list">
            <tr>
                <td>${list.name}</td>
                <td>${list.weekend}</td>
                <td>${list.legalHolidays}</td>
                <td>${list.restDown}</td>
                <td>${list.weekendTotal}</td>
                <td>${list.legalTotal}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="approval-div-style" style="margin-bottom: 30px">
        <div class="approval-input">
            <span class="approval-input-span">主管领导</span>
            <shiro:hasPermission name="supervisor">
                <div id="supervisorContent"></div>

                <%--<input type="text" class="approval-input-input" name="principal" value="${nickname}" readonly>--%>
                <%--<input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">--%>
            </shiro:hasPermission>

            <shiro:lacksPermission name="supervisor">
                <input type="text" class="approval-input-input" value="${oaActOvertime.supervisor}" readonly>
            </shiro:lacksPermission>

        </div>

        <div class="approval-input">
            <span class="approval-input-span">部门负责人</span>
            <shiro:hasPermission name="principal">
                <div id="principalContent"></div>

                <%--<input type="text" class="approval-input-input" name="supervisor" value="${nickname}" readonly>--%>
                <%--<input type="hidden" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">--%>
            </shiro:hasPermission>

            <shiro:lacksPermission name="principal">
                <input type="text" class="approval-input-input" value="${oaActOvertime.principal}" readonly>
            </shiro:lacksPermission>
        </div>

        <div class="approval-input">
            <span class="approval-input-span">考勤员</span>
            <input type="text" class="approval-input-input" value="${oaActOvertime.preparer}" readonly>
        </div>
    </div>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="principal,supervisor">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/jeDate/src/jedate.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //流程执行步骤
    var overtime = JSON.parse('${oaActOvertimeJson}');
    //标记
    var flag = 0;

    //被回退
    if (overtime.state === 0) {
        if (flag === 0) {

            var principalNums = JSON.parse('${principalNum}');
            //单个审批人
            if (principalNums === "noPrincipalNum") {
                if (overtime.principal === "" || overtime.principal === undefined) {
                    $('#principalContent').append(
                        '<input type="text" class="approval-input-input" name="principal" value="${oaActOvertime.principal} ${nickname}" readonly>\n' +
                        '                <input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                    flag = 1;
                } else {
                    $('#principalContent').append('<input type="text" class="approval-input-input" value="${oaActOvertime.principal}" readonly>');
                }
            } else {
                if (overtime.principal === undefined) {
                    $('#principalContent').append(
                        '<input type="text" class="approval-input-input" name="principal" value="${oaActOvertime.principal} ${nickname}" readonly>\n' +
                        '                <input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                    flag = 1;
                } else if ((overtime.principal).length === principalNums.length) {
                    $('#principalContent').append('<input type="text" class="approval-input-input" value="${oaActOvertime.principal}" readonly>');
                } else {
                    $('#principalContent').append(
                        '<input type="text" class="approval-input-input" name="principal" value="${oaActOvertime.principal} ${nickname}" readonly>\n' +
                        '                <input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                    flag = 1;
                }
            }

        } else {
            $('#principalContent').append('<input type="text" class="approval-input-input" value="${oaActOvertime.principal}" readonly>');
        }

        if (flag === 0) {
            if (overtime.supervisor === "" || overtime.supervisor === undefined) {
                $('#supervisorContent').append(
                    '<input type="text" class="approval-input-input" name="supervisor" value="${nickname}" readonly>\n' +
                    '                <input type="hidden" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
                flag = 1;
            } else {
                $('#supervisorContent').append('<input type="text" class="approval-input-input" value="${oaActOvertime.supervisor}" readonly>');
            }
        } else {
            $('#supervisorContent').append('<input type="text" class="approval-input-input" value="${oaActOvertime.supervisor}" readonly>');
        }

        if (flag === 0) {
            $('#return').html("");
            $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
        }
    } else {
        $('#principalContent').append('<input type="text" class="approval-input-input" value="${oaActOvertime.principal}" readonly>');
        $('#supervisorContent').append('<input type="text" class="approval-input-input" value="${oaActOvertime.supervisor}" readonly>');
        $('#return').html("");
        $('#return').append('<button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>');
    }

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/overtime/approvalSubmit',
            data: $('#oaActOvertime').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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

