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
            text-align: right;
            padding-left: 10px;
        }

        .table-td-content {
            line-height: 35px;
            padding: 0 10px;
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
    </style>
</head>

<body id="body" style="width: 70%">

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

<flag>

    <div style="margin: 10px 10px 5px;float: left;font-size: 13px;">
        <span style="font-size: 13px">部门：</span>
        <span style="font-size: 13px">${oaActOfficeSupplies.department}</span>
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
                <td class="table-td-content" style="text-align: center;">${list.number}</td>
                <td class="table-td-content" style="text-align: center;">${list.price}</td>
                <td class="table-td-content" style="text-align: center;">${list.money}</td>
            </tr>
        </c:forEach>
        </tbody>

        <table class="formTable">
            <tr>
                <td class="tdLabel">填表人</td>
                <td class="table-td-content" style="width: 18%;">
                    ${oaActOfficeSupplies.preparer}
                </td>

                <td class="tdLabel">填表日期</td>
                <td class="table-td-content" style="width: 18%;">
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
                </td>
            </tr>

            <tr>
                <td class="tdLabel">部门负责人</td>
                <td colspan="5" class="approval-content">
                    <div style="width: 49%;float: left">
                        <textarea class="approval-content-textarea" readonly>${oaActOfficeSupplies.principalContent}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text" value="${oaActOfficeSupplies.principalDate}"
                                   readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字 </label>
                            <input class="approval-signature-input" type="text" value="${oaActOfficeSupplies.principal}" readonly>
                        </div>
                    </div>

                    <div style="width: 49%;float: right">
                        <textarea class="approval-content-textarea" readonly>${oaActOfficeSupplies.principalContentT}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text" value="${oaActOfficeSupplies.principalDateT}"
                                   readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">签字 </label>
                            <input class="approval-signature-input" type="text" value="${oaActOfficeSupplies.principalT}" readonly>
                        </div>
                    </div>
                </td>
            </tr>

            <tr>
                <td class="tdLabel">审批</td>
                <td colspan="5" class="approval-content">
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
                </td>
            </tr>
        </table>
    </table>
</flag>

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
        $('#body,#return').css('width', '70%');
    }
</script>
</html>

