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
    <title>合同审查表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="table-title">
    <span>合同审查表</span>
</div>
<div class="top_toolbar">
    <div class="top_toolbar_inside">
        <div class="head_left_button">
            <button type="button" class="cursor_hand" onclick="savePending()">&#xea97; 保存待发</button>
        </div>
    </div>
</div>
<!--  -->
<form id="oaActReview">

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
                               value="${oaActReview.title}" autocomplete="off">
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
            <td class="tdLabel">合同名称：</td>
            <td class="table-td-content">
                <input type="hidden" name="id" value="${oaActReview.id}">
                <input type="hidden" name="promoter" value="${oaActReview.promoter}">
                <input type="hidden" name="url" value="${oaActReview.url}">
                <input type="text" class="formInput" name="name" value="${oaActReview.name}" autocomplete="off">
            </td>

            <td class="tdLabel">编号：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="numbering" value="${oaActReview.title}" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">合同相对人：</td>
            <td colspan="3" class="table-td-content">
                <input type="text" class="formInput" name="relative" value="${oaActReview.relative}" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">合同金额：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="amount" value="${oaActReview.amount}" autocomplete="off">
            </td>

            <td class="tdLabel">合同编号：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="number" value="${oaActReview.number}" autocomplete="off">
            </td>
        </tr>
        </tbody>
    </table>
</form>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

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
                url: '${path}/review/editAdd',
                data: $('#oaActReview').serialize(),
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
                url: '${path}/review/edit',
                data: $('#oaActReview').serialize(),
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

