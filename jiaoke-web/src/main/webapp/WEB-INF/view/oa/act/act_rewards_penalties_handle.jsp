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
    <title>奖罚意见表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body" style="width: 60%">

<div class="table-title">
    <span>${oaActRewardsPenalties.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActRewardsPenalties.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActRewardsPenalties.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActRewardsPenalties.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActRewardsPenalties.annex}" delims="," var="annex">
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

<form id="oaActRewardsPenalties">
    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel" style="padding: 0;text-align: center">奖罚月份</td>
            <td colspan="2" class="table-td-content" style="text-align: center">
                ${oaActRewardsPenalties.month}
                <input type="hidden" name="id" value="${oaActRewardsPenalties.id}">
                <input type="hidden" name="promoter" value="${oaActRewardsPenalties.promoter}">
            </td>
        </tr>

        <tr>
            <td colspan="2" class="tdLabel" style="padding: 0;text-align: center">奖罚事项</td>
            <td class="tdLabel" style="padding: 0;text-align: center">主管签字</td>
        </tr>

        <tr>
            <shiro:hasPermission name="supervisor">
                <td colspan="2" class="table-td-textarea">
                    <div style="width: 100%;height: 100%;" id="officeContent"></div>
                </td>

                <td class="table-td-textarea">
                    <div style="width: 100%;height: 100%;display: inline;" id="office"></div>
                </td>
            </shiro:hasPermission>

            <shiro:lacksPermission name="supervisor">
                <td colspan="2" class="table-td-textarea">
                    <textarea class="approval-content-textarea" style="height: 75px"
                              readonly>${oaActRewardsPenalties.officeContent}</textarea>
                </td>

                <td class="table-td-textarea">
                    <input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.office}" readonly>
                </td>
            </shiro:lacksPermission>
        </tr>

        <tr>
            <shiro:hasPermission name="supervisor">
                <td colspan="2" class="table-td-textarea">
                    <div style="width: 100%;height: 100%;" id="qualityContent"></div>
                </td>

                <td class="table-td-textarea">
                    <div style="width: 100%;height: 100%;display: inline;" id="quality"></div>
                </td>
            </shiro:hasPermission>

            <shiro:lacksPermission name="supervisor">
                <td colspan="2" class="table-td-textarea">
                    <textarea class="approval-content-textarea" style="height: 75px"
                              readonly>${oaActRewardsPenalties.qualityContent}</textarea>
                </td>

                <td class="table-td-textarea">
                    <input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.quality}" readonly>
                </td>
            </shiro:lacksPermission>
        </tr>

        <tr>
            <shiro:hasPermission name="supervisor">
                <td colspan="2" class="table-td-textarea">
                    <div style="width: 100%;height: 100%;" id="businessContent"></div>
                </td>

                <td class="table-td-textarea">
                    <div style="width: 100%;height: 100%;display: inline;" id="business"></div>
                </td>
            </shiro:hasPermission>

            <shiro:lacksPermission name="supervisor">
                <td colspan="2" class="table-td-textarea">
                    <textarea class="approval-content-textarea" style="height: 75px"
                              readonly>${oaActRewardsPenalties.businessContent}</textarea>
                </td>

                <td class="table-td-textarea">
                    <input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.business}" readonly>
                </td>
            </shiro:lacksPermission>
        </tr>

        <tr>
            <shiro:hasPermission name="supervisor">
                <td colspan="2" class="table-td-textarea">
                    <div style="width: 100%;height: 100%;" id="productionContent"></div>
                </td>

                <td class="table-td-textarea">
                    <div style="width: 100%;height: 100%;display: inline;" id="production"></div>
                </td>
            </shiro:hasPermission>

            <shiro:lacksPermission name="supervisor">
                <td colspan="2" class="table-td-textarea">
                    <textarea class="approval-content-textarea" style="height: 75px"
                              readonly>${oaActRewardsPenalties.productionContent}</textarea>
                </td>

                <td class="table-td-textarea">
                    <input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.production}" readonly>
                </td>
            </shiro:lacksPermission>
        </tr>

        <tr>
            <shiro:hasPermission name="supervisor">
                <td colspan="2" class="table-td-textarea">
                    <div style="width: 100%;height: 100%;" id="suppliesContent"></div>
                </td>

                <td class="table-td-textarea">
                    <div style="width: 100%;height: 100%;display: inline;" id="supplies"></div>
                </td>
            </shiro:hasPermission>

            <shiro:lacksPermission name="supervisor">
                <td colspan="2" class="table-td-textarea">
                    <textarea class="approval-content-textarea" style="height: 75px"
                              readonly>${oaActRewardsPenalties.suppliesContent}</textarea>
                </td>

                <td class="table-td-textarea">
                    <input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.supplies}" readonly>
                </td>
            </shiro:lacksPermission>
        </tr>

        <tr>
            <shiro:hasPermission name="supervisor">
                <td colspan="2" class="table-td-textarea">
                    <div style="width: 100%;height: 100%;" id="financialContent"></div>
                </td>

                <td class="table-td-textarea">
                    <div style="width: 100%;height: 100%;display: inline;" id="financial"></div>
                </td>
            </shiro:hasPermission>

            <shiro:lacksPermission name="supervisor">
                <td colspan="2" class="table-td-textarea">
                    <textarea class="approval-content-textarea" style="height: 75px"
                              readonly>${oaActRewardsPenalties.financialContent}</textarea>
                </td>

                <td class="table-td-textarea">
                    <input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.financial}" readonly>
                </td>
            </shiro:lacksPermission>
        </tr>

        <tr>
            <td class="tdLabel" style="padding: 0;text-align: center">总经理意见</td>
            <td colspan="5" class="table-td-textarea">
                <shiro:hasPermission name="company_principal">
                    <div style="width: 100%;height: 100%;" id="companyPrincipalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="company_principal">
                    <textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.financialContent}</textarea>
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="form-but" id="return">
    <shiro:hasAnyPermission name="supervisor,company_principal">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script>

    //流程执行步骤
    var oaActRewardsPenalties = JSON.parse('${oaActRewardsPenaltiesJson}');
    //标记
    var flag = 0;

    if (flag === 0) {
        if (oaActRewardsPenalties.office === "" || oaActRewardsPenalties.office === undefined) {
            $('#officeContent').append('<textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\\s+/g,\'\')" style="height: 75px" name="officeContent"></textarea>');
            $('#office').append('<input type="text" class="formInput-readonly" name="office" value="${nickname}" readonly>' +
                '<input type="hidden" name="officeDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#officeContent').append('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.officeContent}</textarea>');
            $('#office').append('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.office}" readonly>');
        }
    } else {
        $('#officeContent').append('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.officeContent}</textarea>');
        $('#office').append('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.office}" readonly>');
    }

    if (flag === 0) {
        if (oaActRewardsPenalties.quality === "" || oaActRewardsPenalties.quality === undefined) {
            $('#qualityContent').append('<textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\\s+/g,\'\')" style="height: 75px" name="qualityContent"></textarea>');
            $('#quality').append('<input type="text" class="formInput-readonly" name="quality" value="${nickname}" readonly>' +
                '<input type="hidden" name="qualityDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#qualityContent').append('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.qualityContent}</textarea>');
            $('#quality').append('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.quality}" readonly>');
        }
    } else {
        $('#qualityContent').append('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.qualityContent}</textarea>');
        $('#quality').append('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.quality}" readonly>');
    }

    if (flag === 0) {
        if (oaActRewardsPenalties.business === "" || oaActRewardsPenalties.business === undefined) {
            $('#businessContent').append('<textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\\s+/g,\'\')" style="height: 75px" name="businessContent"></textarea>');
            $('#business').append('<input type="text" class="formInput-readonly" name="business" value="${nickname}" readonly>' +
                '<input type="hidden" name="businessDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#businessContent').append('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.businessContent}</textarea>');
            $('#business').append('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.business}" readonly>');
        }
    } else {
        $('#businessContent').append('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.businessContent}</textarea>');
        $('#business').append('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.business}" readonly>');
    }

    if (flag === 0) {
        if (oaActRewardsPenalties.production === "" || oaActRewardsPenalties.production === undefined) {
            $('#productionContent').append('<textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\\s+/g,\'\')" style="height: 75px" name="productionContent"></textarea>');
            $('#production').append('<input type="text" class="formInput-readonly" name="production" value="${nickname}" readonly>' +
                '<input type="hidden" name="productionDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#productionContent').append('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.productionContent}</textarea>');
            $('#production').append('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.production}" readonly>');
        }
    } else {
        $('#productionContent').append('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.productionContent}</textarea>');
        $('#production').append('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.production}" readonly>');
    }

    if (flag === 0) {
        if (oaActRewardsPenalties.supplies === "" || oaActRewardsPenalties.supplies === undefined) {
            $('#suppliesContent').append('<textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\\s+/g,\'\')" style="height: 75px" name="suppliesContent"></textarea>');
            $('#supplies').append('<input type="text" class="formInput-readonly" name="supplies" value="${nickname}" readonly>' +
                '<input type="hidden" name="suppliesDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#suppliesContent').append('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.suppliesContent}</textarea>');
            $('#supplies').append('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.supplies}" readonly>');
        }
    } else {
        $('#suppliesContent').append('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.suppliesContent}</textarea>');
        $('#supplies').append('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.supplies}" readonly>');
    }

    if (flag === 0) {
        if (oaActRewardsPenalties.financial === "" || oaActRewardsPenalties.financial === undefined) {
            $('#financialContent').append('<textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\\s+/g,\'\')" style="height: 75px" name="financialContent"></textarea>');
            $('#financial').append('<input type="text" class="formInput-readonly" name="financial" value="${nickname}" readonly>' +
                '<input type="hidden" name="financialDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#financialContent').append('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.financialContent}</textarea>');
            $('#financial').append('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.financial}" readonly>');
        }
    } else {
        $('#financialContent').append('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.financialContent}</textarea>');
        $('#financial').append('<input type="text" class="formInput-readonly" value="${oaActRewardsPenalties.financial}" readonly>');
    }

    if (flag === 0) {
        if (oaActRewardsPenalties.companyPrincipal === "" || oaActRewardsPenalties.companyPrincipal === undefined) {
            $('#companyPrincipalContent').append(
                '<textarea class="write-approval-content-textarea" onkeyup="value=value.replace(/\\s+/g,\'\')" style="height: 75px" name="companyPrincipalContent"></textarea>' +
                '<input type="hidden" name="companyPrincipal" value="${nickname}">' +
                '<input type="hidden" name="companyPrincipalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.companyPrincipalContent}</textarea>');
        }
    } else {
        $('#companyPrincipalContent').append('<textarea class="approval-content-textarea" style="height: 75px" readonly>${oaActRewardsPenalties.companyPrincipalContent}</textarea>');
    }

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/rewardsPenalties/approvalSubmit',
            data: $('#oaActRewardsPenalties').serialize() + "&taskId=" + taskId + "&flag=" + flag,
            async: false,
            success: function (data) {
                if (data === 'success') {
                    //返回上一页
                    window.location.href = '${path}/oaHomePage/toOaHomePage';
                    layer.msg('提交成功！');
                } else {
                    layer.msg('提交失败！');
                }
            },
            error: function (result) {
                layer.msg("出错！");
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

