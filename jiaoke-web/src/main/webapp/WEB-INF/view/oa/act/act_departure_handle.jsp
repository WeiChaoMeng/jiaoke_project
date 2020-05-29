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
    <title>离职会签表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 60%">

<div class="table-title">
    <span>${oaActDeparture.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActDeparture.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActDeparture.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActDeparture.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActDeparture.annex}" delims="," var="annex">
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

<form id="oaActDeparture">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">姓名</td>
            <td class="table-td-content" style="width: 35%">
                ${oaActDeparture.name}
                <input type="hidden" name="id" value="${oaActDeparture.id}">
                <input type="hidden" name="promoter" value="${oaActDeparture.promoter}">
            </td>

            <td class="tdLabel">离职日期</td>
            <td class="table-td-content">
                ${oaActDeparture.departureDate}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">部门</td>
            <td class="tdLabel" style="text-align: center;">签字(部长、主管)</td>
            <td class="tdLabel" colspan="2" style="text-align: center;">备注</td>
        </tr>

        <tr>
            <td class="tdLabel">综合办公室</td>
            <td class="table-td-content" style="padding: 5px 10px;">
                <shiro:hasPermission name="office_principal">
                    <c:choose>
                        <c:when test="${oaActDeparture.officePrincipal == null || oaActDeparture.officePrincipal == ''}">
                            <input type="text" class="formInput-readonly" name="officePrincipal" style="margin-bottom: 5px;" value="${nickname}" readonly>
                        </c:when>
                        <c:otherwise>
                            <input type="text" class="formInput-readonly" name="officePrincipalT" style="margin-bottom: 5px;" value="${nickname}" readonly>
                        </c:otherwise>
                    </c:choose>
                </shiro:hasPermission>
                <shiro:lacksPermission name="office_principal">
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;width: 50%;border-right: 0;float: left;" value="${oaActDeparture.officePrincipal}" readonly>
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;width: 50%;border-left: 0;float: left;" value="${oaActDeparture.officePrincipalT}" readonly>
                </shiro:lacksPermission>

                <shiro:hasPermission name="office_supervisor">
                    <input type="text" class="formInput-readonly" name="officeSupervisor"  value="${nickname}" readonly>
                </shiro:hasPermission>
                <shiro:lacksPermission name="office_supervisor">
                    <input type="text" class="formInput-readonly" value="${oaActDeparture.officeSupervisor}" readonly>
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">备注</td>
            <td class="table-td-content">
                <shiro:hasPermission name="office_principal">
                    <c:choose>
                        <c:when test="${oaActDeparture.officePrincipal == null || oaActDeparture.officePrincipal == ''}">
                            <input type="text" class="formInput" style="margin-bottom: 5px;" name="officePrincipalRemark" autocomplete="off">
                        </c:when>
                        <c:otherwise>
                            <input type="text" class="formInput" style="margin-bottom: 5px;" name="officePrincipalRemarkT" autocomplete="off">
                        </c:otherwise>
                    </c:choose>
                </shiro:hasPermission>
                <shiro:lacksPermission name="office_principal">
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;width: 50%;border-right: 0;float: left;" value="${oaActDeparture.officePrincipalRemark}" readonly>
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;width: 50%;border-left: 0;float: left;" value="${oaActDeparture.officePrincipalRemarkT}" readonly>
                </shiro:lacksPermission>

                <shiro:hasPermission name="office_supervisor">
                    <input type="text" class="formInput" name="officeSupervisorRemark" autocomplete="off">
                </shiro:hasPermission>
                <shiro:lacksPermission name="office_supervisor">
                    <input type="text" class="formInput-readonly" value="${oaActDeparture.officeSupervisorRemark}"
                           readonly>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">经营开发部</td>
            <td class="table-td-content" style="padding: 5px 10px;">
                <shiro:hasPermission name="operating_principal">
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;" name="operatingPrincipal" value="${nickname}" readonly>
                </shiro:hasPermission>
                <shiro:lacksPermission name="operating_principal">
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                           value="${oaActDeparture.operatingPrincipal}" readonly>
                </shiro:lacksPermission>

                <shiro:hasPermission name="operating_supervisor">
                    <input type="text" class="formInput-readonly" name="operatingSupervisor"  value="${nickname}" readonly>
                </shiro:hasPermission>
                <shiro:lacksPermission name="operating_supervisor">
                    <input type="text" class="formInput-readonly" value="${oaActDeparture.operatingSupervisor}"
                           readonly>
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">备注</td>
            <td class="table-td-content">
                <shiro:hasPermission name="operating_principal">
                    <input type="text" class="formInput" style="margin-bottom: 5px;" name="operatingPrincipalRemark"
                           autocomplete="off">
                </shiro:hasPermission>
                <shiro:lacksPermission name="operating_principal">
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                           value="${oaActDeparture.operatingPrincipalRemark}"
                           readonly>
                </shiro:lacksPermission>

                <shiro:hasPermission name="operating_supervisor">
                    <input type="text" class="formInput" name="operatingSupervisorRemark" autocomplete="off">
                </shiro:hasPermission>
                <shiro:lacksPermission name="operating_supervisor">
                    <input type="text" class="formInput-readonly" value="${oaActDeparture.operatingSupervisorRemark}"
                           readonly>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">生产管理部</td>
            <td class="table-td-content" style="padding: 5px 10px;">
                <shiro:hasPermission name="produce_principal">
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;" name="producePrincipal" value="${nickname}" readonly>
                </shiro:hasPermission>
                <shiro:lacksPermission name="produce_principal">
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                           value="${oaActDeparture.producePrincipal}" readonly>
                </shiro:lacksPermission>

                <shiro:hasPermission name="produce_supervisor">
                    <input type="text" class="formInput-readonly" name="produceSupervisor"  value="${nickname}" readonly>
                </shiro:hasPermission>
                <shiro:lacksPermission name="produce_supervisor">
                    <input type="text" class="formInput-readonly" value="${oaActDeparture.produceSupervisor}" readonly>
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">备注</td>
            <td class="table-td-content">
                <shiro:hasPermission name="produce_principal">
                    <input type="text" class="formInput" style="margin-bottom: 5px;" name="producePrincipalRemark"
                           autocomplete="off">
                </shiro:hasPermission>
                <shiro:lacksPermission name="produce_principal">
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                           value="${oaActDeparture.producePrincipalRemark}"
                           readonly>
                </shiro:lacksPermission>

                <shiro:hasPermission name="produce_supervisor">
                    <input type="text" class="formInput" name="produceSupervisorRemark" autocomplete="off">
                </shiro:hasPermission>
                <shiro:lacksPermission name="produce_supervisor">
                    <input type="text" class="formInput-readonly" value="${oaActDeparture.produceSupervisorRemark}"
                           readonly>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">质量技术部</td>
            <td class="table-td-content" style="padding: 5px 10px;">
                <shiro:hasPermission name="quality_principal">
                    <c:choose>
                        <c:when test="${oaActDeparture.qualityPrincipal == null || oaActDeparture.qualityPrincipal == ''}">
                            <input type="text" class="formInput-readonly" name="qualityPrincipal" style="margin-bottom: 5px;" value="${nickname}" readonly>
                        </c:when>
                        <c:otherwise>
                            <input type="text" class="formInput-readonly" name="qualityPrincipalT" style="margin-bottom: 5px;" value="${nickname}" readonly>
                        </c:otherwise>
                    </c:choose>
                </shiro:hasPermission>
                <shiro:lacksPermission name="quality_principal">
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;width: 50%;border-right: 0;float: left;" value="${oaActDeparture.qualityPrincipal}" readonly>
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;width: 50%;border-left: 0;float: left;" value="${oaActDeparture.qualityPrincipalT}" readonly>
                </shiro:lacksPermission>

                <shiro:hasPermission name="quality_supervisor">
                    <input type="text" class="formInput-readonly" name="qualitySupervisor"  value="${nickname}" readonly>
                </shiro:hasPermission>
                <shiro:lacksPermission name="quality_supervisor">
                    <input type="text" class="formInput-readonly" value="${oaActDeparture.qualitySupervisor}" readonly>
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">备注</td>
            <td class="table-td-content">
                <shiro:hasPermission name="quality_principal">
                    <c:choose>
                        <c:when test="${oaActDeparture.qualityPrincipal == null || oaActDeparture.qualityPrincipal == ''}">
                            <input type="text" class="formInput" style="margin-bottom: 5px;" name="qualityPrincipalRemark" autocomplete="off">
                        </c:when>
                        <c:otherwise>
                            <input type="text" class="formInput" style="margin-bottom: 5px;" name="qualityPrincipalRemarkT" autocomplete="off">
                        </c:otherwise>
                    </c:choose>
                </shiro:hasPermission>
                <shiro:lacksPermission name="quality_principal">
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;width: 50%;border-right: 0;float: left;" value="${oaActDeparture.qualityPrincipalRemark}" readonly>
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;width: 50%;border-left: 0;float: left;" value="${oaActDeparture.qualityPrincipalRemarkT}" readonly>
                </shiro:lacksPermission>

                <shiro:hasPermission name="quality_supervisor">
                    <input type="text" class="formInput" name="qualitySupervisorRemark" autocomplete="off">
                </shiro:hasPermission>
                <shiro:lacksPermission name="quality_supervisor">
                    <input type="text" class="formInput-readonly" value="${oaActDeparture.qualitySupervisorRemark}"
                           readonly>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">物资管理部</td>
            <td class="table-td-content" style="padding: 5px 10px;">
                <shiro:hasPermission name="material_principal">
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;" name="materialPrincipal" value="${nickname}" readonly>
                </shiro:hasPermission>
                <shiro:lacksPermission name="material_principal">
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                           value="${oaActDeparture.materialPrincipal}" readonly>
                </shiro:lacksPermission>

                <shiro:hasPermission name="material_supervisor">
                    <input type="text" class="formInput-readonly" name="materialSupervisor"  value="${nickname}" readonly>
                </shiro:hasPermission>
                <shiro:lacksPermission name="material_supervisor">
                    <input type="text" class="formInput-readonly" value="${oaActDeparture.materialSupervisor}" readonly>
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">备注</td>
            <td class="table-td-content">
                <shiro:hasPermission name="material_principal">
                    <input type="text" class="formInput" style="margin-bottom: 5px;" name="materialPrincipalRemark"
                           autocomplete="off">
                </shiro:hasPermission>
                <shiro:lacksPermission name="material_principal">
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                           value="${oaActDeparture.materialPrincipalRemark}"
                           readonly>
                </shiro:lacksPermission>

                <shiro:hasPermission name="material_supervisor">
                    <input type="text" class="formInput" name="materialSupervisorRemark" autocomplete="off">
                </shiro:hasPermission>
                <shiro:lacksPermission name="material_supervisor">
                    <input type="text" class="formInput-readonly" value="${oaActDeparture.materialSupervisorRemark}"
                           readonly>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">财务管理部</td>
            <td class="table-td-content" style="padding: 5px 10px;">
                <shiro:hasPermission name="finance_principal">
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;" name="financePrincipal" value="${nickname}" readonly>
                </shiro:hasPermission>
                <shiro:lacksPermission name="finance_principal">
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                           value="${oaActDeparture.financePrincipal}" readonly>
                </shiro:lacksPermission>

                <shiro:hasPermission name="finance_supervisor">
                    <input type="text" class="formInput-readonly" name="financeSupervisor"  value="${nickname}" readonly>
                </shiro:hasPermission>
                <shiro:lacksPermission name="finance_supervisor">
                    <input type="text" class="formInput-readonly" value="${oaActDeparture.financeSupervisor}" readonly>
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">备注</td>
            <td class="table-td-content">
                <shiro:hasPermission name="finance_principal">
                    <input type="text" class="formInput" style="margin-bottom: 5px;" name="financePrincipalRemark"
                           autocomplete="off">
                </shiro:hasPermission>
                <shiro:lacksPermission name="finance_principal">
                    <input type="text" class="formInput-readonly" style="margin-bottom: 5px;"
                           value="${oaActDeparture.financePrincipalRemark}"
                           readonly>
                </shiro:lacksPermission>

                <shiro:hasPermission name="finance_supervisor">
                    <input type="text" class="formInput" name="financeSupervisorRemark" autocomplete="off">
                </shiro:hasPermission>
                <shiro:lacksPermission name="finance_supervisor">
                    <input type="text" class="formInput-readonly" value="${oaActDeparture.financeSupervisorRemark}"
                           readonly>
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">总经理</td>
            <td class="table-td-content" style="padding: 5px 10px;">
                <shiro:hasPermission name="company_principal">
                    <input type="text" class="formInput-readonly" name="companyPrincipal" value="${nickname}" readonly>
                </shiro:hasPermission>
                <shiro:lacksPermission name="company_principal">
                    <input type="text" class="formInput-readonly" value="${oaActDeparture.companyPrincipal}" readonly>
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">备注</td>
            <td class="table-td-content">
                <shiro:hasPermission name="finance_supervisor">
                    <input type="text" class="formInput" name="companyPrincipalRemark" autocomplete="off">
                </shiro:hasPermission>
                <shiro:lacksPermission name="finance_supervisor">
                    <input type="text" class="formInput-readonly" value="${oaActDeparture.companyPrincipalRemark}"
                           readonly>
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="principal,supervisor,company_principal">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script>

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/departure/approvalSubmit',
            data: $('#oaActDeparture').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#tool').show();
        $('#body,#return').css('width', '60%');
    }
</script>
</html>

