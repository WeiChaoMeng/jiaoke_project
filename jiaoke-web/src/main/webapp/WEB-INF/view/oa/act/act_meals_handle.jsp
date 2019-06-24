<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<!--startprint-->

<div class="table-title">
    <span>${oaActMeals.title}</span>
</div>
<div class="top_toolbar">
    <div class="top_toolbar_inside" style="height: 40px;border-bottom: none;">
        <div style="line-height: 40px;margin: 0 10px;float: left;">
            <span style="float: left;margin-left: 10px;font-size: 13px;">申请时间：${oaActMeals.createTimeStr}</span>
        </div>

        <div class="head_left_button" style="float: right;line-height: 40px;" id="printBut">
            <button type="button" class="cursor_hand" onclick="print()" style="font-size: 13px;">&#xea0e; 打印</button>
        </div>
    </div>
</div>
<!--  -->
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
        <td class="tdLabel">备注：</td>
        <td colspan="5" class="table-td-textarea">
            ${oaActMeals.remarks}
        </td>
    </tr>

    </tbody>
</table>

<div class="handle-container">
    <div class="handle-title">
        <div class="handle-title-script">处理意见</div>
    </div>

    <textarea id="processingOpinion" class="opinion-column" style="height: 72px;"></textarea>

    <div class="form-but" style="margin-top: 20px;">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="previousPage()">返回</button>
        <button type="button" class="commit-but" onclick="commit()">提交</button>
    </div>
</div>

<div class="receipt-container">
    <div class="receipt-title">
        <div class="receipt-script">回执意见（共条）</div>
    </div>

    <c:forEach items="${commentsList}" var="comments">
        <div class="comment-container">
            <div class="comment-style">
                <span class="comment-name">${comments.userName}</span>
                <span class="comment-message">${comments.message}</span>
                <span class="comment-date">${comments.timeStr}</span>
            </div>
        </div>
    </c:forEach>

    <div class="receipt-style"></div>
</div>

<!--endprint-->

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
    function commit() {
        var processingOpinion = $('#processingOpinion').val();
        $.ajax({
            type: "post",
            url: '/meals/approvalSubmit',
            data: {
                'processingOpinion': processingOpinion,
                'taskId': taskId
            },
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
    function print() {
        $('#printBut').hide();
        bdhtml = window.document.body.innerHTML;
        //开始打印标识字符串有17个字符
        sprnstr = "<!--startprint-->";
        //结束打印标识字符串
        eprnstr = "<!--endprint-->";
        //从开始打印标识之后的内容
        prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 17);
        //截取开始标识和结束标识之间的内容
        prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
        //把需要打印的指定内容赋给body.innerHTML
        window.document.body.innerHTML = prnhtml;
        //调用浏览器的打印功能打印指定区域
        window.print();
        // 最后还原页面
        window.document.body.innerHTML = bdhtml;
        $('#printBut').show();
    }

</script>
</html>

