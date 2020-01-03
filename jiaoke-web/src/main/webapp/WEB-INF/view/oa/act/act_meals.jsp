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

<form id="oaActMeals">
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
                               value="客饭审批单(${nickname} <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>)"
                               autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程 </th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="审批人(王玉秋)、发起者(协同)"
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
            <td class="tdLabel">点菜人</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="applicant" value="${nickname}" readonly="readonly">
            </td>

            <td class="tdLabel">招待事由</td>
            <td colspan="3" class="table-td-content">
                <input type="text" class="formInput" name="entertain" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">用餐时间</td>
            <td class="table-td-content">
                <input type="text" class="formInput je-date" name="diningTimeStr" onfocus="this.blur()">
            </td>

            <td class="tdLabel">标准</td>
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

            <td class="tdLabel">厨师选择</td>
            <td class="table-td-content">
                <select class="select" name="chef">
                    <option value="0">大厨</option>
                    <option value="1">二厨</option>
                </select>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">人数</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="number" autocomplete="off">
            </td>

            <td class="tdLabel">地点</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="place" autocomplete="off">
            </td>

            <td class="tdLabel">桌数</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="tableNumber" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">菜品</td>
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

            <td class="tdLabel">菜品内容</td>
            <td colspan="3" class="table-td-content">
                <input type="text" class="formInput" name="dishesContent" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">附件</td>
            <td colspan="5" id="annexes"></td>
            <input type="hidden" name="annex" id="annex">
        </tr>

        <tr>
            <td class="tdLabel">备注</td>
            <td colspan="5" class="table-td-textarea">
                <textarea class="opinion-column" style="width: 100%" name="remarks"></textarea>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">审批人意见</td>
            <td colspan="5" class="approval-content">
                <textarea disabled="disabled" class="approval-content-textarea"></textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期:</label>
                    <input class="approval-date-input" type="text" disabled="disabled">
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字:</label>
                    <input class="approval-signature-input" type="text" disabled="disabled">
                </div>
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

    //发送
    function send() {
        var array = [];
        $('#annexes').find('input').each(function () {
            array.push($(this).val());
        });

        if ($.trim($("#title").val()) === '') {
            window.top.tips("标题不可以为空！", 6, 5, 2000);
        } else {
            //发送前将上传好的附件插入form中
            $('#annex').val(array);

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
                        window.top.tips("发送成功！", 0, 1, 2000);
                    } else {
                        window.top.tips('发送失败！', 0, 2, 2000);
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
                        window.top.tips("保存成功！");
                    } else {
                        window.top.tips("保存失败！");
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
                } else {
                    window.top.tips("文件不存在！", 6, 5, 2000);
                }
            }
        });
    }

    //打印
    function printContent() {
        $('#tool,#titleArea').hide();
        window.print();
        $('#tool,#titleArea').show();
    }
</script>
</html>

