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

<form id="oaActCar">
    <div class="form_area" id="titleArea" style="margin-bottom: 15px">
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

    <table class="formTable" style="margin: 0">
        <tbody>
        <tr>
            <td class="tdLabel">使用人</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="user" value="${nickname}" readonly>
            </td>

            <td class="tdLabel">事由</td>
            <td colspan="5" class="table-td-reason">
                <textarea class="table-reason" name="cause"></textarea>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">车牌号</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="licensePlate" autocomplete="off">
            </td>

            <td class="tdLabel">车辆性质</td>
            <td class="table-td-content">
                <div>
                    <input type="radio" name="properties" value="0" class="table-radio-two" checked>
                    <span style="margin-right: 10px;">私家车</span>

                    <input type="radio" name="properties" value="1" class="table-radio-two">
                    <span>享车补车</span>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">用车时间</td>
            <td class="table-td-content">
                <input type="text" class="formInput je-start-date" name="startTimeStr" onfocus="this.blur()">
            </td>

            <td class="tdLabel">目的地</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="destination" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">公里基数</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="cardinalNumber" id="cardinalNumber"
                       onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" autocomplete="off">
            </td>

            <td class="tdLabel">使用后数</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="after" readonly>
                <%--<input type="text" class="formInput-readonly" name="after" id="after" autocomplete="off"
                       onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" onblur="resultNum()" readonly>--%>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">行驶数</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="drivingNumber" readonly>
            </td>

            <td class="tdLabel">计费(元)</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="billing" readonly>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">查表计数人</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" readonly>
            </td>

            <td class="tdLabel">交车时间</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="endTimeStr" readonly>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">审核人</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" readonly>
            </td>

            <td class="tdLabel">批准人</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" readonly>
                <input type="hidden" name="annex" id="annex">
            </td>
        </tr>
        </tbody>
    </table>

    <div class="notice-tips">
        <span class="notice-tips-mark">*</span>
        <span class="notice-tips-script">说明：1.每公里2元。使用的车辆为享受车补待遇的，每公里1.2元。2.审核人为使用部门负责人，批准人为使用人部门主管领导。3.多人同时使用时费用均摊。4.费用按月报销或扣除。</span>
    </div>
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

    //发送
    function send() {

        /*else if ($.trim($("#drivingNumber").val()) === '') {
            top.window.tips("行驶数不可以为空！", 6, 5, 1000);
        }*/

        var array = [];
        $('#annexes').find('input').each(function () {
            array.push($(this).val());
        });

        if ($.trim($("#title").val()) === '') {
            top.window.tips("标题不可以为空！", 6, 5, 1000);
        } else {

            //发送前将上传好的附件插入form中
            $('#annex').val(array);

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
                layer.msg("出错！");
            },
            success: function (result) {
                if (result === "success") {
                    $('#file' + fileName.substring(0, fileName.indexOf("_"))).remove();
                    window.top.tips("删除成功！", 0, 1, 2000);

                    let annexesLen = $('#annexes').children().length;
                    if (annexesLen === 0) {
                        $('#annexList').css("display", "none");
                    }
                } else {
                    window.top.tips("文件不存在！", 6, 5, 2000);
                }
            }
        });
    }

    //打印
    function printContent() {
        $('#tool,#titleArea,#annexList').hide();
        //执行打印
        window.print();
        $('#tool,#titleArea').show();

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
