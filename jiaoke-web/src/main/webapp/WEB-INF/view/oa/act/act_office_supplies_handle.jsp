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
            text-align: left;
            padding-left: 10px;
        }

        .approval-div-style {
            width: 100%;
            margin-bottom: 15px;
            display: inline-block;
        }

        .approval-input {
            width: 20%;
            float: left;
        }

        .approval-input-span {
            font-size: 13px;
            width: 40%;
            display: inline-block;
            float: left;
            line-height: 29px;
            text-align: right;
            text-indent: 5px;
        }

        .approval-input-input {
            border: 0;
            border-bottom: 1px #000 solid;
            width: 60%;
            outline: none;
            height: 28px;
            text-align: left;
            font-weight: 500;
            color: #000;
            text-indent: 5px;
            font-size: 13px;
            float: left;
            cursor: no-drop;
        }

        .order-number-style{
            height: 28px;display: inline-block;line-height: 28px;font-size: 14px;
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
                                <span class="table-file-title" title="${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}">${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}</span>
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
            <input type="text" class="form-number-content" style="cursor: no-drop" value="${oaActOfficeSupplies.department}" readonly>
            <input type="hidden" name="id" value="${oaActOfficeSupplies.id}">
            <input type="hidden" name="title" value="${oaActOfficeSupplies.title}">
        </span>
    </div>

    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel" style="width: 7%">序号</td>
            <td class="tdLabel" style="width: 45%">项目</td>
            <td class="tdLabel" style="width: 16%">数量</td>
            <td class="tdLabel" style="width: 16%">单价</td>
            <td class="tdLabel" style="width: 16%">金额(元)</td>
        </tr>

        <tr>
            <td class="table-td-content" style="text-align: center;"><span class="order-number-style">1</span></td>
            <td class="table-td-content">${oaActOfficeSupplies.itemOne}</td>
            <td class="table-td-content">${oaActOfficeSupplies.numberOne}</td>
            <td class="table-td-content">${oaActOfficeSupplies.priceOne}</td>
            <td class="table-td-content">${oaActOfficeSupplies.moneyOne}</td>
        </tr>

        <tr>
            <td class="table-td-content" style="text-align: center;"><span class="order-number-style">2</span></td>
            <td class="table-td-content">${oaActOfficeSupplies.itemTwo}</td>
            <td class="table-td-content">${oaActOfficeSupplies.numberTwo}</td>
            <td class="table-td-content">${oaActOfficeSupplies.priceTwo}</td>
            <td class="table-td-content">${oaActOfficeSupplies.moneyTwo}</td>
        </tr>

        <tr>
            <td class="table-td-content" style="text-align: center;"><span class="order-number-style">3</span></td>
            <td class="table-td-content">${oaActOfficeSupplies.itemThree}</td>
            <td class="table-td-content">${oaActOfficeSupplies.numberThree}</td>
            <td class="table-td-content">${oaActOfficeSupplies.priceThree}</td>
            <td class="table-td-content">${oaActOfficeSupplies.moneyThree}</td>
        </tr>

        <tr>
            <td class="table-td-content" style="text-align: center;"><span class="order-number-style">4</span></td>
            <td class="table-td-content">${oaActOfficeSupplies.itemFour}</td>
            <td class="table-td-content">${oaActOfficeSupplies.numberFour}</td>
            <td class="table-td-content">${oaActOfficeSupplies.priceFour}</td>
            <td class="table-td-content">${oaActOfficeSupplies.moneyFour}</td>
        </tr>

        <tr>
            <td class="table-td-content" style="text-align: center;"><span class="order-number-style">5</span></td>
            <td class="table-td-content">${oaActOfficeSupplies.itemFive}</td>
            <td class="table-td-content">${oaActOfficeSupplies.numberFive}</td>
            <td class="table-td-content">${oaActOfficeSupplies.priceFive}</td>
            <td class="table-td-content">${oaActOfficeSupplies.priceFive}</td>
        </tr>

        <tr>
            <td class="tdLabel" style="width: 0;text-align: right;">合计</td>
            <td class="table-td-content" colspan="4">${oaActOfficeSupplies.total}</td>
        </tr>
        </tbody>
    </table>

    <div class="approval-div-style">
        <div class="approval-input">
            <span class="approval-input-span">审批</span>
            <shiro:hasPermission name="office_supplies_approval">
                <div id="officeSuppliesApprovalContent">
                    <%--<input type="text" class="approval-input-input" name="officeSuppliesApproval" value="${nickname}" readonly>--%>
                    <%--<input type="hidden" name="officeSuppliesApprovalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">--%>
                </div>
            </shiro:hasPermission>

            <shiro:lacksPermission name="office_supplies_approval">
                <input type="text" class="approval-input-input" value="${oaActOfficeSupplies.officeSuppliesApproval}" readonly>
            </shiro:lacksPermission>
        </div>

        <div class="approval-input">
            <span class="approval-input-span">部门主管</span>
            <shiro:hasPermission name="supervisor">
                <div id="supervisorContent">
                    <%--<input type="text" class="approval-input-input" name="supervisor" value="${nickname}"  readonly>--%>
                    <%--<input type="hidden" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">--%>
                </div>
            </shiro:hasPermission>

            <shiro:lacksPermission name="supervisor">
                <input type="text" class="approval-input-input" value="${oaActOfficeSupplies.supervisor}" readonly>
            </shiro:lacksPermission>
        </div>

        <div class="approval-input">
            <span class="approval-input-span">填表人</span>
            <input type="text" class="approval-input-input" value="${oaActOfficeSupplies.preparer}" readonly>
        </div>

        <div class="approval-input">
            <span class="approval-input-span">验收</span>
            <shiro:hasPermission name="office_supplies_acceptance">
                <div id="officeSuppliesAcceptanceContent">
                    <%--<input type="text" class="approval-input-input" name="officeSuppliesAcceptance" value="${nickname}"  readonly>--%>
                </div>
            </shiro:hasPermission>

            <shiro:lacksPermission name="office_supplies_acceptance">
                <input type="text" class="approval-input-input" value="${oaActOfficeSupplies.officeSuppliesAcceptance}" readonly>
            </shiro:lacksPermission>
        </div>

        <div class="approval-input">
            <span class="approval-input-span">验收时间</span>
            <shiro:hasPermission name="office_supplies_acceptance">
                <div id="officeSuppliesAcceptanceDateContent">
                    <%--<input type="hidden" name="officeSuppliesAcceptanceDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">--%>
                </div>
            </shiro:hasPermission>

            <shiro:lacksPermission name="office_supplies_acceptance">
                <input type="text" class="approval-input-input" value="${oaActOfficeSupplies.officeSuppliesAcceptanceDate}" readonly>
            </shiro:lacksPermission>
        </div>
    </div>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="office_supplies_approval,supervisor,office_supplies_acceptance">
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
    if (flag === 0) {
        if (officeSupplies.officeSuppliesApproval === "" || officeSupplies.officeSuppliesApproval === undefined) {
            $('#officeSuppliesApprovalContent').append('<input type="text" class="approval-input-input" name="officeSuppliesApproval" value="${nickname}" readonly="readonly"><input type="hidden" name="officeSuppliesApprovalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#officeSuppliesApprovalContent').append('<input type="text" class="approval-input-input" value="${oaActOfficeSupplies.officeSuppliesApproval}" readonly>');
        }
    } else {
        $('#officeSuppliesApprovalContent').append('<input type="text" class="approval-input-input" value="${oaActOfficeSupplies.officeSuppliesApproval}" readonly>');
    }

    if (flag === 0) {
        if (officeSupplies.supervisor === "" || officeSupplies.supervisor === undefined) {
            $('#supervisorContent').append('<input type="text" class="approval-input-input" name="supervisor" value="${nickname}" readonly="readonly"><input type="hidden" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#supervisorContent').append('<input type="text" class="approval-input-input" value="${oaActOfficeSupplies.supervisor}" readonly>');
        }
    } else {
        $('#supervisorContent').append('<input type="text" class="approval-input-input" value="${oaActOfficeSupplies.supervisor}" readonly>');
    }

    if (flag === 0) {
        if (officeSupplies.officeSuppliesAcceptance === "" || officeSupplies.officeSuppliesAcceptance === undefined) {
            $('#officeSuppliesAcceptanceContent').append('<input type="text" class="approval-input-input" name="officeSuppliesAcceptance" value="${nickname}" readonly="readonly">');
            $('#officeSuppliesAcceptanceDateContent').append('<input type="text" class="approval-input-input" name="officeSuppliesAcceptanceDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#officeSuppliesAcceptanceContent').append('<input type="text" class="approval-input-input" value="${oaActOfficeSupplies.officeSuppliesAcceptance}" readonly>');
            $('#officeSuppliesAcceptanceDateContent').append('<input type="text" class="approval-input-input" value="${oaActOfficeSupplies.officeSuppliesAcceptanceDate}" readonly>')
        }
    } else {
        $('#officeSuppliesAcceptanceContent').append('<input type="text" class="approval-input-input" value="${oaActOfficeSupplies.officeSuppliesAcceptance}" readonly>');
        $('#officeSuppliesAcceptanceDateContent').append('<input type="text" class="approval-input-input" value="${oaActOfficeSupplies.officeSuppliesAcceptanceDate}" readonly>')
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
        $('#body,#return').css('width', '80%');
    }
</script>
</html>

