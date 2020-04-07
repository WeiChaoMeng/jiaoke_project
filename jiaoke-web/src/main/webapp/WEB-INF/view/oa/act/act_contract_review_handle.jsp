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
    <title>合同评审表详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 70%">

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

<form id="oaActContractReview">
    <span class="fill-in-date">
        合同编号<input type="text" value="${oaActContractReview.contractNumber}" style="cursor: no-drop" class="form-number-content" readonly>
    </span>

    <table class="formTable" style="margin: 0;">
        <tbody>
        <tr>
            <td class="tdLabel">合同名称</td>
            <td colspan="3" class="table-td-content">
                ${oaActContractReview.contractName}
                <input type="hidden" name="id" value="${oaActContractReview.id}">
                <input type="hidden" name="promoter" value="${oaActContractReview.promoter}">
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
                <shiro:hasPermission name="material_principal">
                    <textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\s+/g,'')" name="materialPrincipalContent"></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" name="materialPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text"  name="materialPrincipal" value="${nickname}" readonly>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="material_principal">
                    <textarea readonly class="approval-content-textarea">${oaActContractReview.materialPrincipalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" value="${oaActContractReview.materialPrincipalDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" value="${oaActContractReview.materialPrincipal}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">财务部门审核意见</td>
            <td colspan="3" class="approval-content">
                <shiro:hasPermission name="finance_principal">
                    <textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\s+/g,'')" name="financePrincipalContent"></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" name="financePrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" name="financePrincipal" value="${nickname}" readonly>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="finance_principal">
                    <textarea readonly class="approval-content-textarea">${oaActContractReview.financePrincipalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" value="${oaActContractReview.financePrincipalDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" value="${oaActContractReview.financePrincipal}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">质量技术审核意见</td>
            <td colspan="3" class="approval-content">
                <shiro:hasPermission name="quality_principal">
                    <textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\s+/g,'')" name="qualityPrincipalContent"></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" name="qualityPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" name="qualityPrincipal" value="${nickname}" readonly>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="quality_principal">
                    <textarea readonly class="approval-content-textarea">${oaActContractReview.qualityPrincipalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" value="${oaActContractReview.qualityPrincipalDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" value="${oaActContractReview.qualityPrincipal}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">经营部门审核意见</td>
            <td colspan="3" class="approval-content">
                <shiro:hasPermission name="operating_principal">
                    <textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\s+/g,'')" name="operatingPrincipalContent"></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" name="operatingPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" name="operatingPrincipal" value="${nickname}" readonly>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="operating_principal">
                    <textarea readonly class="approval-content-textarea">${oaActContractReview.operatingPrincipalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" value="${oaActContractReview.operatingPrincipalDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" value="${oaActContractReview.operatingPrincipal}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">法务审核意见</td>
            <td colspan="3" class="approval-content">
                <shiro:hasPermission name="legal_affairs">
                    <textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\s+/g,'')" name="legalAffairsContent"></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" name="legalAffairsDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" name="legalAffairs" value="${nickname}" readonly>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="legal_affairs">
                    <textarea readonly class="approval-content-textarea">${oaActContractReview.legalAffairsContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" value="${oaActContractReview.legalAffairsDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" value="${oaActContractReview.legalAffairs}" readonly>
                    </div>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">总经理审核意见</td>
            <td colspan="3" class="approval-content">
                <shiro:hasPermission name="company_principal">
                    <textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\s+/g,'')" name="companyPrincipalContent"></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" name="companyPrincipal" value="${nickname}" readonly>
                    </div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="company_principal">
                    <textarea readonly class="approval-content-textarea">${oaActContractReview.companyPrincipalContent}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期</label>
                        <input class="approval-date-input" type="text" value="${oaActContractReview.companyPrincipalDate}" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字</label>
                        <input class="approval-signature-input" type="text" value="${oaActContractReview.companyPrincipal}" readonly>
                    </div>
                </shiro:lacksPermission>

                <%--暂存附件--%>
                <input type="hidden" id="annex" name="annex">
            </td>
        </tr>
        </tbody>
    </table>

    <div style="height: 50px;">
        <span class="fill-in-date" style="float: left;margin: 5px 0 20px 10px;">
            利润中心：<input type="text" class="form-number-content" style="cursor: not-allowed;" value="${oaActContractReview.profitCenter}" readonly>
        </span>
        <span class="fill-in-date" style="margin: 5px 10px 20px 0;">
            制表人：<input type="text" class="form-number-content" style="cursor: not-allowed;"  value="${oaActContractReview.promoterStr}" readonly>
        </span>
    </div>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="material_principal,finance_principal,quality_principal,operating_principal,legal_affairs,company_principal">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
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
            url: '/contractReview/approvalSubmit',
            data: $('#oaActContractReview').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#body').css('width', '70%');
    }
</script>
</html>

