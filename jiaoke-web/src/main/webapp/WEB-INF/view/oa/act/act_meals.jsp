<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
    <title>客饭审批单</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body>
<div class="table-title">
    <span>客饭审批单</span>
</div>
<div class="top_toolbar">
    <div class="top_toolbar_inside">

        <div class="head_left_button">
            <button type="button" class="cursor_hand" onclick="savePending()">&#xea97; 保存待发</button>
        </div>
    </div>
</div>
<!--  -->
<form id="oaActMeals">

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
                               value="客饭审批单(${nickname} <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>)"
                               autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程:</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="审批人(王玉秋)"
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
            <td class="tdLabel">点菜人：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="applicant" value="${nickname}" readonly="readonly">
            </td>

            <td class="tdLabel">招待事由：</td>
            <td colspan="3" class="table-td-content">
                <input type="text" class="formInput" name="entertain" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">用餐时间：</td>
            <td class="table-td-content">
                <input type="text" class="formInput je-date" name="diningTimeStr" onfocus="this.blur()">
            </td>

            <td class="tdLabel">标准：</td>
            <td class="table-td-content">
                <select class="select" name="standard">
                    <option value="0">10元</option>
                    <option value="1">20元</option>
                    <option value="2">30元</option>
                    <option value="3">40元</option>
                    <option value="4">50元</option>
                    <option value="5">60元</option>
                </select>
            </td>

            <td class="tdLabel">厨师选择：</td>
            <td class="table-td-content">
                <select class="select" name="chef">
                    <option value="0">大厨</option>
                    <option value="1">二厨</option>
                </select>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">人数：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="number" autocomplete="off">
            </td>

            <td class="tdLabel">地点：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="place" autocomplete="off">
            </td>

            <td class="tdLabel">桌数：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="tableNumber" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">菜品：</td>
            <td class="table-td-content">
                <select class="select" name="dishes">
                    <option value="0">A类</option>
                    <option value="1">B类</option>
                    <option value="2">C类</option>
                    <option value="3">D类</option>
                    <option value="4">E类</option>
                    <option value="5">F类</option>
                    <option value="6">G类</option>
                    <option value="7">其他菜品</option>
                </select>
            </td>

            <td class="tdLabel">菜品内容：</td>
            <td colspan="3" class="table-td-content">
                <input type="text" class="formInput" name="dishesContent" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">备注：</td>
            <td colspan="5" class="table-td-textarea">
                <textarea class="opinion-column" name="remarks"></textarea>
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
    jeDate(".je-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD hh:mm",
        zIndex: 100000,
    });

    function selectFile(own) {
        $('#fileName').html(own.files[0].name);
    }

    //发送
    function send() {
        if ($.trim($("#title").val()) === '') {
            layer.msg("标题不可以为空！")
        } else {
            $.ajax({
                type: "POST",
                url: '${path}/meals/add',
                data: $('#oaActMeals').serialize(),
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
                url: '${path}/meals/savePending',
                data: $('#oaActMeals').serialize(),
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

