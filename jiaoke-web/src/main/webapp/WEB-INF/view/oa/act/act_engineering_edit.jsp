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
    <title>编辑工程名称变更记录表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body>
<div class="table-title">
    <span>编辑工程名称变更记录表</span>
</div>
<div class="top_toolbar">
    <div class="top_toolbar_inside">
        <div class="head_left_button">
            <button type="button" class="cursor_hand" onclick="savePending()">&#xea97; 保存待发</button>
        </div>
    </div>
</div>
<!--  -->
<form id="oaActEngineering">

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
                               value="${oaActEngineering.title}" autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程:</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="发起者关联部门负责人(审批)、发起者关联部门领导主管(审批)、主管部门负责人(审批)"
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
            <td class="tdLabel">变更前工程名称：</td>
            <td class="table-td-content">
                <input type="hidden" name="id" value="${oaActEngineering.id}">
                <input type="hidden" name="promoter" value="${oaActEngineering.promoter}">
                <input type="hidden" name="url" value="${oaActEngineering.url}">
                <input type="text" class="formInput" name="beforeName" value="${oaActEngineering.beforeName}" autocomplete="off">
            </td>

            <td class="tdLabel">变更后工程名称：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="afterName" value="${oaActEngineering.afterName}" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">变更前用料单位：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="beforeCompany" value="${oaActEngineering.beforeCompany}" autocomplete="off">
            </td>

            <td class="tdLabel">变更后用料单位：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="afterCompany" value="${oaActEngineering.afterCompany}" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">变更前所用混合料品种：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="beforeVariety" value="${oaActEngineering.beforeVariety}" autocomplete="off">
            </td>

            <td class="tdLabel">变更后所用混合料品种：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="afterVariety" value="${oaActEngineering.afterVariety}" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">变更前用料日期：</td>
            <td class="table-td-content">
                <input type="text" class="formInput je-start-date" name="beforeDataStr" value="${oaActEngineering.beforeDataStr}" onfocus="this.blur()">
            </td>

            <td class="tdLabel">变更后用料日期：</td>
            <td class="table-td-content">
                <input type="text" class="formInput je-end-date" name="afterDataStr" value="${oaActEngineering.afterDataStr}" onfocus="this.blur()">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">变更前用料数量：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="beforeNumber" value="${oaActEngineering.beforeNumber}" autocomplete="off">
            </td>

            <td class="tdLabel">变更后用料数量：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="afterNumber" value="${oaActEngineering.afterNumber}" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">用料单位：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="useCompany" value="${oaActEngineering.useCompany}" autocomplete="off">
            </td>

            <td class="tdLabel">业务员：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="salesman" value="${oaActEngineering.salesman}" readonly="readonly">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">备注：</td>
            <td colspan="3" class="table-td-content">
                <input type="text" class="formInput" name="remark" value="${oaActEngineering.remark}" autocomplete="off">
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

    //申请时间选择器
    jeDate(".je-start-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,                    //是否显示节日
        isinitVal: true,                    //是否初始化
        isTime: false,                       //是否开始时间选择
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    //申请时间选择器
    jeDate(".je-end-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,                    //是否显示节日
        isinitVal: true,                    //是否初始化
        isTime: false,                       //是否开始时间选择
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
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
                url: '${path}/engineering/editAdd',
                data: $('#oaActEngineering').serialize(),
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
                url: '${path}/engineering/edit',
                data: $('#oaActEngineering').serialize(),
                error: function (request) {
                    layer.msg("出错！");
                },
                success: function (result) {
                    if (result === "success") {
                        window.location.href = "${path}/collaboration/waitSend?page=1";
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
