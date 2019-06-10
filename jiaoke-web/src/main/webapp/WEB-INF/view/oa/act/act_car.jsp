<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>用车审批单</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body>
<div class="table-title">
    <span>用车审批单</span>
</div>
<div class="top_toolbar">
    <div class="top_toolbar_inside">

        <div class="head_left_button">
            <button type="button" class="cursor_hand" onclick="savePending()">&#xea97; 保存待发</button>
        </div>
    </div>
</div>
<!--  -->
<form id="oaActCar">

    <div class="form_area">
        <table>
            <tbody>
            <tr>
                <td nowrap="nowrap" style="width: 4%">
                    <button type="button" class="table-tab-send" onclick="send()">发送</button>
                </td>

                <th nowrap="nowrap" class="th_title" style="width: 4%">标题:</th>
                <td style="width: 44%">
                    <div class="common_input_frame">
                        <input type="text" id="title" name="title" placeholder="请输入标题" title="点击此处填写标题"
                               value="用车审批单(${nickname} <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>)"
                               autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程:</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="查表计数人(芦静)、发起者部门负责人(审批)、发起者部门主管领导(审批)"
                               readonly="readonly">
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">使用人：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="user" value="${nickname}" readonly="readonly">
            </td>

            <td class="tdLabel">车牌号：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="licensePlate" autocomplete="off">
            </td>

            <td class="tdLabel">车辆性质：</td>
            <td class="table-td-content">
                <select class="select" name="properties">
                    <option value="0">私家车</option>
                    <option value="1">享车补车</option>
                </select>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">事由：</td>
            <td colspan="5" class="table-td-textarea">
                <textarea class="opinion-column" name="cause"></textarea>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">目的地：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="destination" autocomplete="off">
            </td>

            <td class="tdLabel">开始时间：</td>
            <td class="table-td-content">
                <input type="text" class="formInput je-start-date" name="startTimeStr" onfocus="this.blur()">
            </td>

            <td class="tdLabel">结束时间：</td>
            <td class="table-td-content">
                <input type="text" class="formInput je-end-date" name="endTimeStr" onfocus="this.blur()">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">公里基数：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="cardinalNumber" autocomplete="off">
            </td>

            <td class="tdLabel">使用后数：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="after" autocomplete="off">
            </td>

            <td class="tdLabel">行驶数：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="drivingNumber" autocomplete="off">
            </td>
        </tr>
        </tbody>

    </table>
</form>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/jeDate/src/jedate.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //日期选择器
    jeDate(".je-start-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD hh:mm",
        zIndex: 100000,
    });

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

    //发送
    function send() {
        if ($.trim($("#title").val()) === '') {
            layer.msg("标题不可以为空！")
        } else {
            $.ajax({
                type: "POST",
                url: '${path}/car/add',
                data: $('#oaActCar').serialize(),
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

    //保存待发
    function savePending() {
        if ($.trim($("#title").val()) === '') {
            layer.msg("标题不可以为空！")
        } else {
            $.ajax({
                type: "POST",
                url: '${path}/car/savePending',
                data: $('#oaActCar').serialize(),
                error: function (request) {
                    layer.msg("出错！");
                },
                success: function (result) {
                    if (result === "success") {
                        window.location.href = "${path}/oaIndex.do";
                        layer.msg("保存成功！");
                    } else {
                        layer.msg('保存失败！');
                    }
                }
            })
        }
    }
</script>
</html>

