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
    <title>印章使用审批单</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body style="width: 70%">
<div class="table-title">
    <span>印章使用审批单</span>
</div>
<div class="top_toolbar">
    <div class="top_toolbar_inside">
        <div class="head_left_button">
            <button type="button" class="cursor_hand" onclick="savePending()">&#xea97; 保存待发</button>
        </div>
    </div>
</div>
<!--  -->
<form id="oaActSealsUse">

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
                               value="印章使用审批单(${nickname} <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>)"
                               autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程:</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="部门负责人(审批)、部门主管领导(审批)、印章管理部门主管领导(审批)、盖章人"
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
            <td class="tdLabel">编号：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="number" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">申请人：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="applicant" value="${nickname}" readonly="readonly">
            </td>
        </tr>
        <tr>
            <td class="tdLabel">印章种类：</td>
            <td class="table-td-content">
                <select class="select" name="seal" style="width: 100%">
                    <option value="0">路驰公章</option>
                    <option value="1">路驰合同专用章</option>
                    <option value="2">路驰党支部章</option>
                    <option value="3">路驰工会章</option>
                    <option value="4">路驰法人章</option>
                    <option value="5">路驰财务专用章</option>
                    <option value="6">大兴公章</option>
                    <option value="7">大兴合同章</option>
                </select>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">申请文件名称：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="name" autocomplete="off">
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
                url: '${path}/sealsUse/add',
                data: $('#oaActSealsUse').serialize(),
                error: function (request) {
                    layer.msg("出错！");
                },
                success: function (result) {
                    if (result === "success") {
                        layer.msg("发送成功！");
                        window.location.href = "${path}/oaIndex.do";
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
                url: '${path}/sealsUse/savePending',
                data: $('#oaActSealsUse').serialize(),
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
