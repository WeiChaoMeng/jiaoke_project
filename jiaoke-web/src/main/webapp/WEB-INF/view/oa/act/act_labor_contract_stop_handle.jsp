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
    <title>劳动合同终止通知书</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body id="body" style="width: 70%">

<div class="table-title">
    <span>${oaActLaborContractStop.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActLaborContractStop.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActLaborContractStop.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActLaborContractStop.annex != ''}">
            <div class="top_toolbar" id="annexList">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActLaborContractStop.annex}" delims="," var="annex">
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

<form id="oaActLaborContractStop">
    <div style="margin-top: 10px">
        <div class="notice-personnel">
            <input type="text" class="notice-personnel-field" value="${oaActLaborContractStop.notifiedPersonStr}"
                   readonly>:
            <input type="hidden" name="id" value="${oaActLaborContractStop.id}">
            <input type="hidden" name="promoter" value="${oaActLaborContractStop.promoter}">
            <input type="hidden" name="notifiedPerson" value="${oaActLaborContractStop.notifiedPerson}">
        </div>

        <div class="notice-content">
            你与我公司签订的合同期为
            <input class="agreement-start-end start-date" type="text" value="${oaActLaborContractStop.startDate}"
                   readonly>至
            <input class="agreement-start-end end-date" type="text" value="${oaActLaborContractStop.endDate}" readonly>的劳动合同将于
            <input type="text" class="agreement-days" value="${oaActLaborContractStop.number}" readonly>天后到期。（附《劳动合同续订个人意向》）
        </div>

        <div class="notice-content">特此通知。</div>

        <div class="notice-sign">
            <div class="notice-sign-position">
                <label>通知人：</label>
                <input class="notice-relevant-personnel" type="text" value="${oaActLaborContractStop.promoterStr}"
                       readonly>
                <input class="notice-date" type="text" value="${oaActLaborContractStop.noticeDate}" readonly>
            </div>
        </div>

        <div class="notice-sign">
            <div class="notice-seal">
                <span>(盖章)</span>
            </div>
        </div>

        <div class="notice-sign">
            <div class="notice-sign-position">
                <label>接收人：</label>
                <c:choose>
                    <c:when test="${oaActLaborContractStop.receivingSign == '' || oaActLaborContractStop.receivingSign == null}">
                        <input class="notice-relevant-personnel" type="text" value="${nickname}" disabled>
                        <input class="notice-date" type="text"
                               value="<%=new SimpleDateFormat("yyyy 年 MM 月 dd 日").format(new Date())%>" disabled>
                    </c:when>

                    <c:otherwise>
                        <input class="notice-relevant-personnel" type="text"
                               value="${oaActLaborContractStop.receivingSign}" disabled>
                        <input class="notice-date" type="text" value="${oaActLaborContractStop.receivingDate}" disabled>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </div>

    <table class="form-table">
        <tbody>
        <tr>
            <td colspan="6" class="tdLabel" style="padding: 0;text-align: center">劳动合同续订个人意向</td>
        </tr>

        <tr>
            <td class="td-column-three" colspan="2">不续订劳动合同</td>
            <td class="td-column-three" colspan="2">与公司续订有固定期劳动合同</td>
            <td class="td-column-three" colspan="2">申请与公司续订无固定期劳动合同</td>
        </tr>

        <c:choose>
            <c:when test="${oaActLaborContractStop.renewal == '' || oaActLaborContractStop.renewal == null}">
                <tr id="renewal">
                    <td colspan="2" style="height: 30px;text-align: center">
                        <input type="checkbox" name="renewal" value="0">
                    </td>
                    <td colspan="2" style="height: 30px;text-align: center">
                        <input type="checkbox" name="renewal" value="1" checked>
                    </td>
                    <td colspan="2" style="height: 30px;text-align: center">
                        <input type="checkbox" name="renewal" value="2">
                    </td>
                </tr>
            </c:when>

            <c:otherwise>
                <tr>
                    <c:choose>
                        <c:when test="${oaActLaborContractStop.renewal == 0}">
                            <td colspan="2" style="height: 30px;text-align: center">
                                <input type="checkbox" checked disabled>
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td colspan="2" style="height: 30px;text-align: center">
                                <input type="checkbox" disabled>
                            </td>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActLaborContractStop.renewal == 1}">
                            <td colspan="2" style="height: 30px;text-align: center">
                                <input type="checkbox" checked disabled>
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td colspan="2" style="height: 30px;text-align: center">
                                <input type="checkbox" disabled>
                            </td>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActLaborContractStop.renewal == 2}">
                            <td colspan="2" style="height: 30px;text-align: center">
                                <input type="checkbox" checked disabled>
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td colspan="2" style="height: 30px;text-align: center">
                                <input type="checkbox" disabled>
                            </td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:otherwise>
        </c:choose>

        <tr>
            <td class="notice-td-label">其他需要补充的内容</td>
            <c:choose>
                <c:when test="${oaActLaborContractStop.receivingSign == '' || oaActLaborContractStop.receivingSign == null}">
                    <td colspan="5" class="table-td-evaluation">
                        <textarea class="evaluation-content" oninput="value=value.replace(/\s+/g,'')" style="height: 90px" name="supplementDetails"></textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text" name="receivingDate"
                                   value="<%=new SimpleDateFormat("yyyy 年 MM 月 dd 日").format(new Date())%>" readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">本人签字 </label>
                            <input class="approval-signature-input" type="text" name="receivingSign" value="${nickname}"
                                   readonly>
                        </div>
                    </td>
                </c:when>

                <c:otherwise>
                    <td colspan="5" class="table-td-evaluation">
                    <textarea class="evaluation-content-disabled" style="height: 90px"
                              readonly>${oaActLaborContractStop.supplementDetails}</textarea>
                        <div class="approval-date">
                            <label class="approval-date-label">日期 </label>
                            <input class="approval-date-input" type="text"
                                   value="${oaActLaborContractStop.receivingDate}"
                                   readonly>
                        </div>
                        <div class="approval-signature">
                            <label class="approval-signature-label">本人签字 </label>
                            <input class="approval-signature-input" type="text"
                                   value="${oaActLaborContractStop.receivingSign}" readonly>
                        </div>
                    </td>
                </c:otherwise>
            </c:choose>
        </tr>
        </tbody>
    </table>

    <div class="notice-tips">
        <span class="notice-tips-mark">*</span>
        <span class="notice-tips-script">此通知一式两份，接收人、公司各执一份。</span>
    </div>
</form>

<div class="form-but" id="return">
    <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script>

    $(document).ready(function () {
        $('#renewal').find('input[type=checkbox]').bind('click', function () {
            $('#renewal').find('input[type=checkbox]').not(this).prop("checked", false);
        });
    });

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '/laborContractStop/approvalSubmit',
            data: $('#oaActLaborContractStop').serialize() + "&taskId=" + taskId + "&flag=" + flag,
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
        $('#tool').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool').show();
        $('#body').css('width', '70%');
    }
</script>
</html>

