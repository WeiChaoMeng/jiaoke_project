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
    <title>收文阅办审批单</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body>
<div class="table-title">
    <span>收文阅办审批单</span>
</div>
<div class="top_toolbar">
    <div class="top_toolbar_inside">

        <div class="head_left_button">
            <button type="button" class="cursor_hand" onclick="savePending()">&#xea97; 保存待发</button>
        </div>

        <div class="separation_line"></div>

        <div class="head_left_button">
            <button type="button" class="cursor_hand" onclick="insertFile()">&#xeac1; 插入</button>
            <%--<input type="file" id="file" onchange="fileName(this)"
                   style="width: 43px;height: 20px;display: block;position: absolute;top: 68px;z-index: 10;opacity: 0;cursor: pointer;">--%>
        </div>

        <%--<div class="separation_line"></div>

        <div class="head_left_button">
            <button type="button" class="cursor_hand" onclick="uploadFile()">&#xeac1; 上传</button>
        </div>--%>

        <div class="separation_line"></div>

        <div class="head_left_button">
            <button type="button" class="cursor_hand" onclick="print()">&#xea0e; 打印</button>
        </div>
    </div>
</div>
<!--  -->
<form id="oaActRead">

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
                        <input type="text" id="title" name="title" placeholder="<点击此处填写标题>"
                               value="收文阅办审批单(${nickname} <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>)"
                               autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程:</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="发起者部门负责人(审批)、发起者部门主管(审批)、印章主管领导(审批)、盖章人(协同)"
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
            <td class="tdLabel">来文机关：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="organ" autocomplete="off">
            </td>

            <td class="tdLabel">来文字号：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="fontSize" autocomplete="off">
            </td>

            <td class="tdLabel">编号：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="number" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">份数：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="copies" autocomplete="off">
            </td>

            <td class="tdLabel">收文日期：</td>
            <td class="table-td-content">
                <input type="text" class="formInput je-date" name="receiptTimeStr" onfocus="this.blur()">
            </td>

            <td class="tdLabel">保存期限：</td>
            <td class="table-td-content">
                <select class="select" name="deadline">
                    <option value="0">10年</option>
                    <option value="1">30年</option>
                    <option value="2">永久</option>
                </select>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">文件标题：</td>
            <td colspan="5" class="table-td-content">
                <input type="text" class="formInput" id="annexStr" readonly="readonly">
                <input type="hidden" name="annex" id="annex">
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
    jeDate(".je-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    //发送
    function send() {
        if ($.trim($("#title").val()) === '') {
            layer.msg("标题不可以为空！")
        } else {
            $.ajax({
                type: "POST",
                url: '${path}/read/add',
                data: $('#oaActRead').serialize(),
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
                url: '${path}/read/savePending',
                data: $('#oaActRead').serialize(),
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

    //插入附件
    function insertFile() {
        window.top.uploadFile();
    }

    //插入成功后写入
    function writeFile(originalName,saveFilename) {
        $('#annexStr').val(originalName);
        $('#annex').val(saveFilename);
    }

    //文件上传
    function upload() {
        var formData = new FormData();
        var f = $('#file')[0].files[0];
        console.log(f);
        formData.append("file", f);
        $.ajax({
            type: "POST",
            url: '${path}/fileUploadHandle/upload',
            data: formData,
            async: true,
            cache: false,
            contentType: false,    //不可缺
            processData: false,    //不可缺
            success: function (ret) {
                if (ret.message === "success") {
                    console.log(ret.filePaths);
                    $('#annex').val(ret.filePaths);
                } else {
                    alert("失败");
                }
            },
            error: function (res) {
                alert("上传失败，请检查网络后重试!");
            }
        });
    }

    //打印
    function print() {

    }
</script>
</html>

