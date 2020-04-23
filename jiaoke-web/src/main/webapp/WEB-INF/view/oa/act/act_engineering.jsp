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
    <title>工程名称变更记录表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body" style="width: 70%">

<div class="table-title">
    <span>工程名称变更记录表</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top_toolbar_inside">
        <div class="head_left_button">
            <button type="button" class="cursor_hand" onclick="savePending()">&#xea97; 保存待发</button>
        </div>
        <div class="separation_line"></div>

        <div class="head_left_button">
            <button type="button" class="cursor_hand" onclick="insertFile()">&#xeac1; 插入</button>
        </div>

        <div class="separation_line"></div>

        <div class="head_left_button">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>
</div>

<%--附件列表--%>
<div class="top_toolbar" id="annexList" style="display: none;">
    <div class="top-toolbar-annexes">

        <div class="annexes-icon">
            <button type="button" class="cursor_hand">&#xeac1; ：</button>
        </div>

        <div id="annexes"></div>

    </div>
</div>

<form id="oaActEngineering">
    <div class="form_area" id="titleArea">
        <table>
            <tbody>
            <tr>
                <td nowrap="nowrap" style="width: 4%">
                    <button type="button" class="table-tab-send" onclick="send()">发送</button>
                </td>

                <th nowrap="nowrap" class="th_title" style="width: 4%">标题 </th>
                <td style="width: 44%">
                    <div class="common_input_frame">
                        <input type="text" id="title" name="title" placeholder="请输入标题" title="点击此处填写标题"
                               value="工程名称变更记录表(${nickname} <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>)"
                               autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程 </th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="经营负责人→经营部长→发起人(知会)" readonly="readonly">
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">变更前工程名称</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="beforeName" autocomplete="off">
            </td>

            <td class="tdLabel">变更后工程名称</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="afterName" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">变更前用料单位</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="beforeCompany" autocomplete="off">
            </td>

            <td class="tdLabel">变更后用料单位</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="afterCompany" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">变更前所用混合料品种</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="beforeVariety" autocomplete="off">
            </td>

            <td class="tdLabel">变更后所用混合料品种</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="afterVariety" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">变更前用料日期</td>
            <td class="table-td-content">
                <input type="text" class="formInput je-start-date" name="beforeData" onfocus="this.blur()">
            </td>

            <td class="tdLabel">变更后用料日期</td>
            <td class="table-td-content">
                <input type="text" class="formInput je-end-date" name="afterData" onfocus="this.blur()">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">变更前用料数量</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="beforeNumber" autocomplete="off">
            </td>

            <td class="tdLabel">变更后用料数量</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="afterNumber" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">用料单位</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="useCompany" autocomplete="off">
            </td>

            <td class="tdLabel">业务员</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="salesman" value="${nickname}" readonly>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">经营负责人</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" readonly>
            </td>

            <td class="tdLabel">经营部长</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" readonly>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">备注</td>
            <td colspan="3" class="table-td-content" style="padding: 5px 10px">
                <textarea class="write-approval-content-textarea" oninput="value=value.replace(/\s+/g,'')" name="remark" style="width: 99%;height: 46px"></textarea>
            </td>
        </tr>

        <%--暂存附件--%>
        <input type="hidden" id="annex" name="annex">
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
        isinitVal: false,                    //是否初始化
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
        isinitVal: false,                    //是否初始化
        isTime: false,                       //是否开始时间选择
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    //发送
    function send() {
        var array = [];
        $('#annexes').find('input').each(function () {
            array.push($(this).val());
        });

        if ($.trim($("#title").val()) === '') {
            window.top.tips("标题不能为空！", 6, 5, 1000);
        } else {
            //发送前将上传好的附件插入form中
            $('#annex').val(array);

            $.ajax({
                type: "POST",
                url: '${path}/engineering/add',
                data: $('#oaActEngineering').serialize(),
                error: function (request) {
                    window.top.tips("出错！", 6, 2, 1000);
                },
                success: function (result) {
                    if (result === "success") {
                        window.location.href = "${path}/oaIndex.do";
                        window.top.tips("发送成功！", 0, 1, 1000);
                    } else {
                        window.top.tips("发送失败！", 0, 2, 1000);
                    }
                }
            })
        }
    }

    //保存待发
    function savePending() {
        var array = [];
        $('#annexes').find('input').each(function () {
            array.push($(this).val());
        });

        if ($.trim($("#title").val()) === '') {
            window.top.tips("标题不能为空！", 6, 5, 1000);
        } else {
            //发送前将上传好的附件插入form中
            $('#annex').val(array);

            $.ajax({
                type: "POST",
                url: '${path}/engineering/savePending',
                data: $('#oaActEngineering').serialize(),
                error: function (request) {
                    window.top.tips("出错！", 6, 2, 1000);
                },
                success: function (result) {
                    if (result === "success") {
                        window.location.href = "${path}/oaIndex.do";
                        window.top.tips("保存成功！", 0, 1, 1000);
                    } else {
                        window.top.tips("保存失败！", 0, 2, 1000);
                    }
                }
            })
        }
    }

    //插入附件
    function insertFile() {
        window.top.uploadFile();
    }

    //上传附件成功后插入form
    function writeFile(ret) {
        $('#annexList').css("display", "block");
        for (let i = 0; i < ret.length; i++) {
            var annex = '';
            var fileId = ret[i].filePaths.substring(0, ret[i].filePaths.indexOf("_"));
            annex += '<div id="file' + fileId + '" class="table-file">';
            annex += '<div class="table-file-content">';
            annex += '<a class="table-file-title" href="/fileDownloadHandle/download?fileName=' + ret[i].filePaths + '" title="' + ret[i].originalName + '">' + ret[i].originalName + '</a>';
            annex += '<span class="delete-file" title="删除" onclick="whether(\'' + ret[i].filePaths + '\')">&#xeabb;</span>';
            annex += '<input type="hidden" value="' + ret[i].filePaths + '">';
            annex += '</div>';
            annex += '</div>';
            $('#annexes').append(annex);
        }
    }


    //删除已上传附件
    function whether(fileName) {
        window.top.deleteUploaded(fileName);
    }


    //执行删除附件
    function delFile(fileName) {
        $.ajax({
            type: "POST",
            url: '${path}/fileUploadHandle/deleteFile',
            data: {"fileName": fileName},
            error: function (request) {
                window.top.tips("出错！", 6, 2, 1000);
            },
            success: function (result) {
                if (result === "success") {
                    $('#file' + fileName.substring(0, fileName.indexOf("_"))).remove();
                    window.top.tips("删除成功！", 0, 1, 1000);

                    let annexesLen = $('#annexes').children().length;
                    if (annexesLen === 0) {
                        $('#annexList').css("display", "none");
                    }
                } else {
                    window.top.tips("文件不存在！", 6, 5, 1000);
                }
            }
        });
    }

    //打印
    function printContent() {
        $('#tool,#titleArea,#annexList').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool,#titleArea').show();
        $('#body').css('width', '70%');

        //附件列表
        let annexesLen = $('#annexes').children().length;
        if (annexesLen === 0) {
            $('#annexList').css("display", "none");
        } else {
            $('#annexList').css("display", "block");
        }
    }
</script>
</html>

