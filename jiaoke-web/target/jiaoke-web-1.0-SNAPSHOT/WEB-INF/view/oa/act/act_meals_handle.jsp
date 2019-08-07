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
    <title>客饭审批单</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body>

<div class="table-title">
    <span>${oaActMeals.title}</span>
</div>
<div class="top_toolbar">
    <div class="top_toolbar_inside" style="height: 40px;border-bottom: none;">
        <div style="line-height: 40px;margin: 0 10px;float: left;">
            <span style="float: left;margin-left: 10px;font-size: 13px;">申请时间：${oaActMeals.createTimeStr}</span>
        </div>

        <div class="head_left_button" style="float: right;line-height: 40px;" id="printBut">
            <button type="button" class="cursor_hand" onclick="printContent()" style="font-size: 13px;">&#xea0e; 打印
            </button>
        </div>
    </div>
</div>

<table class="formTable" style="margin: 0">
    <tbody>
    <tr>
        <td class="tdLabel">点菜人：</td>
        <td class="table-td-content">
            ${oaActMeals.applicant}
        </td>

        <td class="tdLabel">招待事由：</td>
        <td colspan="3" class="table-td-content">
            ${oaActMeals.entertain}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">用餐时间：</td>
        <td class="table-td-content">
            ${oaActMeals.diningTimeStr}
        </td>

        <td class="tdLabel">标准：</td>
        <td class="table-td-content">
            <c:choose>
                <c:when test="${oaActMeals.standard == 0}">10元</c:when>
                <c:when test="${oaActMeals.standard == 2}">20元</c:when>
                <c:when test="${oaActMeals.standard == 3}">30元</c:when>
                <c:when test="${oaActMeals.standard == 4}">40元</c:when>
                <c:when test="${oaActMeals.standard == 5}">50元</c:when>
                <c:when test="${oaActMeals.standard == 6}">60元</c:when>
            </c:choose>
        </td>

        <td class="tdLabel">厨师选择：</td>
        <td class="table-td-content">
            <c:choose>
                <c:when test="${oaActMeals.chef == 0}">大厨</c:when>
                <c:when test="${oaActMeals.chef == 2}">二厨</c:when>
            </c:choose>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">人数：</td>
        <td class="table-td-content">
            ${oaActMeals.number}
        </td>

        <td class="tdLabel">地点：</td>
        <td class="table-td-content">
            ${oaActMeals.place}
        </td>

        <td class="tdLabel">桌数：</td>
        <td class="table-td-content">
            ${oaActMeals.tableNumber}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">菜品：</td>
        <td class="table-td-content">
            <c:choose>
                <c:when test="${oaActMeals.dishes == 0}">A类</c:when>
                <c:when test="${oaActMeals.dishes == 1}">B类</c:when>
                <c:when test="${oaActMeals.dishes == 2}">C类</c:when>
                <c:when test="${oaActMeals.dishes == 3}">D类</c:when>
                <c:when test="${oaActMeals.dishes == 4}">E类</c:when>
                <c:when test="${oaActMeals.dishes == 5}">F类</c:when>
                <c:when test="${oaActMeals.dishes == 6}">G类</c:when>
                <c:when test="${oaActMeals.dishes == 7}">其他菜品</c:when>
            </c:choose>
        </td>

        <td class="tdLabel">菜品内容：</td>
        <td colspan="3" class="table-td-content">
            ${oaActMeals.dishesContent}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">附件：</td>
        <td colspan="5" class="table-td-content">
            <c:forTokens items="${oaActMeals.annex}" delims="," var="annex">
                <div class="table-file">
                    <div class="table-file-content">
                        <span title="${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}">${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}</span>
                        <a class="table-file-download icon" href="/fileDownloadHandle/download?fileName=${annex}"
                           title="下载">&#xebda;</a>
                    </div>
                </div>
            </c:forTokens>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">备注：</td>
        <td colspan="5" class="table-td-content">
            ${oaActMeals.remarks}
        </td>
    </tr>

    <shiro:lacksPermission name="mealsApproval">
        <tr>
            <c:forEach items="${commentsList}" var="comments">
                <td class="tdLabel">审批人意见</td>
                <td colspan="5" class="approval-content">
                    <textarea disabled="disabled" class="approval-content-textarea">${comments.message}</textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期:</label>
                        <input class="approval-date-input" type="text" value="${comments.timeStr}" disabled>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字:</label>
                        <input class="approval-signature-input" type="text" value="${comments.userName}" disabled>
                    </div>
                </td>
            </c:forEach>
        </tr>
    </shiro:lacksPermission>

    <shiro:hasPermission name="mealsApproval">
        <tr>
            <td class="tdLabel">审批人意见</td>
            <td colspan="5" class="approval-content">
                <textarea class="approval-content-textarea" id="processingOpinion"
                          style="background: #ffffff;padding: 5px"></textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期:</label>
                    <input type="text" class="approval-date-input"
                           value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date())%>" disabled="disabled">
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字:</label>
                    <input type="text" class="approval-signature-input" value="${nickname}" disabled="disabled">
                </div>
            </td>
        </tr>
    </shiro:hasPermission>
    </tbody>
</table>

<div class="form-but" style="margin-top: 20px;" id="operationBut">
    <button type="button" class="return-but" style="margin-right: 10px;" onclick="previousPage()">返回</button>
    <button type="button" class="commit-but" style="margin-right: 10px;" onclick="commit(1)">提交</button>
    <shiro:hasPermission name="mealsApproval">
        <button type="button" class="commit-but" onclick="commit(2)">回退</button>
    </shiro:hasPermission>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //返回上一页
    function previousPage() {
        window.history.back();
    }

    //提交
    function commit(flag) {
        var processingOpinion = $('#processingOpinion').val();
        if (flag === 2) {
            if ($.trim(processingOpinion) === "") {
                window.top.tips("请填写回退意见！", 6, 5, 2000);
            } else {
                commitAjax(processingOpinion, flag);
            }
        } else {
            commitAjax(processingOpinion, flag);
        }
    }

    function commitAjax(processingOpinion, flag) {
        $.ajax({
            type: "post",
            url: '/meals/approvalSubmit',
            data: {
                'processingOpinion': processingOpinion,
                'taskId': taskId,
                'flag': flag
            },
            async: false,
            success: function (data) {
                if (data === 'success') {
                    window.top.tips('提交成功！', 0, 1, 1000);
                    //返回上一页
                    window.location.href = '${path}/oaHomePage/toOaHomePage';
                } else {
                    window.top.tips('提交失败！', 0, 2, 1000);
                }
            },
            error: function (result) {
                window.top.tips('错误，请检查网络！', 6, 2, 1000);
            }
        })
    }

    //打印
    function printContent() {
        //隐藏不需要的内容
        $('#printBut,#operationBut').hide();
        window.print();
        //还原页面
        $('#printBut,#operationBut').show();
    }

</script>
</html>

