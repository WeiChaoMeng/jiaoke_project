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
    <title>合同评审表详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActContractReview.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActContractReview.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActContractReview.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActContractReview.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActContractReview.annex}" delims="," var="annex">
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

    <span class="fill-in-date">
        合同编号<input type="text" value="${oaActContractReview.contractNumber}" style="cursor: no-drop" class="form-number-content" readonly>
    </span>

    <table class="formTable" style="margin: 0;">
        <tbody>
        <tr>
            <td class="tdLabel">合同名称</td>
            <td colspan="3" class="table-td-content">
                ${oaActContractReview.contractName}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">客户名称</td>
            <td colspan="3" class="table-td-content">
                ${oaActContractReview.customerName}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">工程名称</td>
            <td colspan="3" class="table-td-content">
                ${oaActContractReview.engineeringName}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">材料型号、品种数量t</td>
            <td colspan="3" class="table-td-content">
                ${oaActContractReview.modelNumber}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">供料时间</td>
            <td colspan="3" class="table-td-content">
                ${oaActContractReview.feedingTime}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">结算条款</td>
            <td colspan="3" class="table-td-content">
                ${oaActContractReview.settlementTerms}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">合同总价</td>
            <td colspan="3" class="table-td-content">
                ${oaActContractReview.contractPrice}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">物资部门审核意见</td>
            <td colspan="3" class="approval-content">
                <textarea readonly class="approval-content-textarea">${oaActContractReview.materialPrincipalContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期</label>
                    <input class="approval-date-input" type="text" value="${oaActContractReview.materialPrincipalDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字</label>
                    <input class="approval-signature-input" type="text" value="${oaActContractReview.materialPrincipal}" readonly>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">财务部门审核意见</td>
            <td colspan="3" class="approval-content">
                <textarea readonly class="approval-content-textarea">${oaActContractReview.financePrincipalContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期</label>
                    <input class="approval-date-input" type="text" value="${oaActContractReview.financePrincipalDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字</label>
                    <input class="approval-signature-input" type="text" value="${oaActContractReview.financePrincipal}" readonly>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">质量技术审核意见</td>
            <td colspan="3" class="approval-content">
                <textarea readonly class="approval-content-textarea">${oaActContractReview.qualityPrincipalContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期</label>
                    <input class="approval-date-input" type="text" value="${oaActContractReview.qualityPrincipalDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字</label>
                    <input class="approval-signature-input" type="text" value="${oaActContractReview.qualityPrincipal}" readonly>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">经营部门审核意见</td>
            <td colspan="3" class="approval-content">
                <textarea readonly class="approval-content-textarea">${oaActContractReview.operatingPrincipalContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期</label>
                    <input class="approval-date-input" type="text" value="${oaActContractReview.operatingPrincipalDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字</label>
                    <input class="approval-signature-input" type="text" value="${oaActContractReview.operatingPrincipal}" readonly>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">法务审核意见</td>
            <td colspan="3" class="approval-content">
                <textarea readonly class="approval-content-textarea">${oaActContractReview.legalAffairsContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期</label>
                    <input class="approval-date-input" type="text" value="${oaActContractReview.legalAffairsDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字</label>
                    <input class="approval-signature-input" type="text" value="${oaActContractReview.legalAffairs}" readonly>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">总经理审核意见</td>
            <td colspan="3" class="approval-content">
                <textarea readonly class="approval-content-textarea">${oaActContractReview.companyPrincipalContent}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期</label>
                    <input class="approval-date-input" type="text" value="${oaActContractReview.companyPrincipalDate}" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字</label>
                    <input class="approval-signature-input" type="text" value="${oaActContractReview.companyPrincipal}" readonly>
                </div>

                <%--暂存附件--%>
                <input type="hidden" id="annex" name="annex">
            </td>
        </tr>
        </tbody>
    </table>

    <div>
        <span class="fill-in-date" style="float: left;margin: 5px 0 20px 10px;">
            利润中心：<input type="text" class="form-number-content" style="cursor: not-allowed;" value="${oaActContractReview.profitCenter}" readonly>
        </span>
        <span class="fill-in-date" style="margin: 5px 10px 20px 0;">
            制表人：<input type="text" class="form-number-content" style="cursor: not-allowed;"  value="${oaActContractReview.promoterStr}" readonly>
        </span>
    </div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>
    //打印
    function printContent() {
        $('#tool').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool').show();
        $('#body').css('width', '80%');
    }
</script>
</html>

