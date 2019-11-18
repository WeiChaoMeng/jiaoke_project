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
    <title>办公用品需求计划详情</title>
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
            margin-bottom: 10px;
            display: inline-block;
        }

        .approval-input {
            width: 20%;
            float: left;
        }

        .approval-input-span {
            font-size: 13px;
            width: 50%;
            display: inline-block;
            float: left;
            line-height: 29px;
            text-align: right;
            text-indent: 5px;
        }

        .approval-input-input {
            border: 0;
            width: 50%;
            outline: none;
            line-height: 29px;
            text-align: left;
            font-weight: 500;
            color: #000;
            text-indent: 5px;
            font-size: 13px;
            float: left;
        }

        .table-td-content{
            line-height: 35px;
            padding: 0 10px;
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

<div style="margin: 10px 10px 5px;float: left;font-size: 13px;">
    <span style="font-size: 13px">部门：</span>
    <span style="font-size: 13px">${oaActOfficeSupplies.department}</span>
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
        <td class="table-td-content">${oaActOfficeSupplies.serialOne}</td>
        <td class="table-td-content">${oaActOfficeSupplies.itemOne}</td>
        <td class="table-td-content">${oaActOfficeSupplies.numberOne}</td>
        <td class="table-td-content">${oaActOfficeSupplies.priceOne}</td>
        <td class="table-td-content">${oaActOfficeSupplies.moneyOne}</td>
    </tr>

    <tr>
        <td class="table-td-content">${oaActOfficeSupplies.serialTwo}</td>
        <td class="table-td-content">${oaActOfficeSupplies.itemTwo}</td>
        <td class="table-td-content">${oaActOfficeSupplies.numberTwo}</td>
        <td class="table-td-content">${oaActOfficeSupplies.priceTwo}</td>
        <td class="table-td-content">${oaActOfficeSupplies.moneyTwo}</td>
    </tr>

    <tr>
        <td class="table-td-content">${oaActOfficeSupplies.serialThree}</td>
        <td class="table-td-content">${oaActOfficeSupplies.itemThree}</td>
        <td class="table-td-content">${oaActOfficeSupplies.numberThree}</td>
        <td class="table-td-content">${oaActOfficeSupplies.priceThree}</td>
        <td class="table-td-content">${oaActOfficeSupplies.moneyThree}</td>
    </tr>

    <tr>
        <td class="table-td-content">${oaActOfficeSupplies.serialFour}</td>
        <td class="table-td-content">${oaActOfficeSupplies.itemFour}</td>
        <td class="table-td-content">${oaActOfficeSupplies.numberFour}</td>
        <td class="table-td-content">${oaActOfficeSupplies.priceFour}</td>
        <td class="table-td-content">${oaActOfficeSupplies.moneyFour}</td>
    </tr>

    <tr>
        <td class="table-td-content">${oaActOfficeSupplies.serialFive}</td>
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
    <div class="approval-input" style="width: 15%;">
        <span class="approval-input-span">审批：</span>
        <span class="approval-input-input">${oaActOfficeSupplies.approval}</span>
    </div>

    <div class="approval-input" style="width: 20%;">
        <span class="approval-input-span">部门主管：</span>
        <span class="approval-input-input">${oaActOfficeSupplies.supervisor}</span>
    </div>

    <div class="approval-input" style="width: 17%;">
        <span class="approval-input-span">填表人：</span>
        <span class="approval-input-input">${oaActOfficeSupplies.preparer}</span>
    </div>

    <div class="approval-input" style="width: 15%;">
        <span class="approval-input-span">验收：</span>
        <span class="approval-input-input">${oaActOfficeSupplies.acceptance}</span>
    </div>

    <div class="approval-input" style="width: 33%;">
        <span class="approval-input-span" style="width: 40%;">验收时间：</span>
        <span class="approval-input-input" style="width: 60%;">${oaActOfficeSupplies.acceptanceDate}</span>

    </div>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>
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

