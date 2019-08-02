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
    <title>用车审批单审批处理</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body>
<div class="table-title">
    <span>${oaActCar.title}</span>
</div>

<div class="top_toolbar">
    <div class="top_toolbar_inside" style="height: 40px;border-bottom: none;">
        <div style="line-height: 40px;margin: 0 10px;float: left;">
            <span style="float: left;margin-left: 10px;font-size: 13px;">申请时间：${oaActCar.createTimeStr}</span>
        </div>

        <div class="head_left_button" style="float: right;line-height: 40px;">
            <button type="button" class="cursor_hand" onclick="addUser()" style="font-size: 13px;">&#xea0e; 打印</button>
        </div>
    </div>
</div>

<form id="oaActCar">
    <table class="formTable" style="margin: 0">
        <tbody>
        <tr>
            <td class="tdLabel">使用人</td>
            <td class="table-td-content">
                <input type="hidden" id="id" name="id" value="${oaActCar.id}">
                ${oaActCar.user}
            </td>

            <td class="tdLabel">事由</td>
            <td colspan="5" class="table-td-reason">
                ${oaActCar.cause}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">车牌号</td>
            <td class="table-td-content">
                ${oaActCar.licensePlate}
            </td>

            <td class="tdLabel">车辆性质</td>
            <td class="table-td-content">
                <div>
                    <c:choose>
                        <c:when test="${oaActCar.properties == 0}">
                            <input type="radio" style="vertical-align: middle;margin-right: 5px;" checked disabled>
                            <span style="margin-right: 10px;">私家车</span>
                        </c:when>

                        <c:otherwise>
                            <input type="radio" style="vertical-align: middle;margin-right: 5px;" disabled>
                            <span style="margin-right: 10px;">私家车</span>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActCar.properties == 1}">
                            <input type="radio" style="vertical-align: middle;margin-right: 5px;" checked disabled>
                            <span>享车补车</span>
                        </c:when>

                        <c:otherwise>
                            <input type="radio" style="vertical-align: middle;margin-right: 5px;" disabled>
                            <span>享车补车</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">用车时间</td>
            <td class="table-td-content">
                ${oaActCar.startTimeStr}
            </td>

            <td class="tdLabel">目的地</td>
            <td class="table-td-content">
                ${oaActCar.destination}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">公里基数</td>
            <td class="table-td-content">
                ${oaActCar.cardinalNumber}
                <input type="hidden" id="cardinalNumber" value="${oaActCar.cardinalNumber}">
            </td>

            <td class="tdLabel">使用后数</td>
            <td class="table-td-content">
                <shiro:hasPermission name="lookup">
                    <input type="text" class="formInput" name="after" id="after"
                           onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" onblur="resultNum()" autocomplete="off">
                </shiro:hasPermission>
                <shiro:lacksPermission name="lookup">
                    ${oaActCar.after}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">行驶数</td>
            <td class="table-td-content">
                <shiro:hasPermission name="lookup">
                    <input type="text" class="formInput-readonly" id="drivingNumber" name="drivingNumber" readonly>
                </shiro:hasPermission>
                <shiro:lacksPermission name="lookup">
                    ${oaActCar.drivingNumber}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">计费(元)</td>
            <td class="table-td-content">
                <shiro:hasPermission name="lookup">
                    <input type="text" class="formInput-readonly" id="billing" name="billing" readonly>
                </shiro:hasPermission>
                <shiro:lacksPermission name="lookup">
                    ${oaActCar.billing}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">查表计数人</td>
            <td class="table-td-content">
                <shiro:hasPermission name="lookup">
                    <input type="text" class="formInput-readonly" value="${nickname}" readonly>
                </shiro:hasPermission>
            </td>

            <td class="tdLabel">交车时间</td>
            <td class="table-td-content">
                <shiro:hasPermission name="lookup">
                    <input type="text" class="formInput je-end-date" name="endTimeStr" onfocus="this.blur()">
                </shiro:hasPermission>
                <shiro:lacksPermission name="lookup">
                    ${oaActCar.endTimeStr}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">审核人</td>
            <td class="table-td-content">
                <shiro:hasPermission name="principal">
                    <input type="text" class="formInput-readonly" value="${nickname}" readonly>
                </shiro:hasPermission>
            </td>

            <td class="tdLabel">批准人</td>
            <td class="table-td-content">
                <shiro:hasPermission name="supervisor">
                    <input type="text" class="formInput-readonly" value="${nickname}" readonly>
                </shiro:hasPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="notice-tips">
    <span class="notice-tips-mark">*</span>
    <span class="notice-tips-script">说明：1.每公里2元。使用的车辆为享受车补待遇的，每公里1.2元。2.审核人为使用部门负责人，批准人为使用人部门主管领导。3.多人同时使用时费用均摊。4.费用按月报销或扣除。</span>
</div>


<div class="handle-container">
    <div class="handle-title">
        <div class="handle-title-script">处理意见</div>
    </div>

    <textarea id="processingOpinion" class="opinion-column" style="height: 72px;"></textarea>

    <div class="form-but" style="margin-top: 20px;">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="previousPage()">返回</button>
        <shiro:lacksPermission name="lookup">
            <button type="button" class="commit-but" onclick="commit()">提交</button>
        </shiro:lacksPermission>

        <shiro:hasPermission name="lookup">
            <button type="button" class="commit-but" onclick="commitAndUpdate()">提交</button>
        </shiro:hasPermission>
    </div>
</div>

<div class="receipt-container">
    <div class="receipt-title">
        <div class="receipt-script">回执意见（共${commentsListLength}条）</div>
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

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/jeDate/src/jedate.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //日期选择器
    jeDate(".je-end-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD hh:mm",
        zIndex: 100000,
    });

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //返回上一页
    function previousPage() {
        window.history.back();
    }

    //查表计数人提交
    function commitAndUpdate() {

        if ($.trim($("#drivingNumber").val()) === '') {
            top.window.tips("行驶数不可以为空！", 6, 5, 1000);
        } else {

            var oaActCar = $('#oaActCar').serialize()
            var processingOpinion = $('#processingOpinion').val();

            $.ajax({
                type: "POST",
                url: '${path}/car/lookupApprovalSubmit',
                data: oaActCar + "&taskId=" + taskId + "&processingOpinion=" + processingOpinion,
                error: function (request) {
                    layer.msg("出错！");
                },
                success: function (result) {
                    if (result === "success") {
                        window.location.href = "${path}/oaIndex.do";
                        layer.msg("发送成功！");
                    } else {
                        layer.msg('发送失败！');
                    }
                }
            })
        }
    }

    //提交
    function commit() {
        var processingOpinion = $('#processingOpinion').val();
        $.ajax({
            type: "post",
            url: '/car/approvalSubmit',
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

    //计算行驶数
    function resultNum() {
        var beforeNum = $('#cardinalNumber').val();
        var afterNum = $('#after').val();

        if (afterNum !== "") {
            if (parseInt(afterNum) <= parseInt(beforeNum)) {
                layer.tips('不可以小于等于公里基数', '#after', {
                    tips: 1
                });
                $('#drivingNumber').val('');
            } else {
                $('#drivingNumber').val(parseInt(afterNum) - parseInt(beforeNum));
                $('#billing').val((parseInt(afterNum) - parseInt(beforeNum)) * 2);
            }
        } else {
            $('#drivingNumber').val('');
        }
    }
</script>
</html>

