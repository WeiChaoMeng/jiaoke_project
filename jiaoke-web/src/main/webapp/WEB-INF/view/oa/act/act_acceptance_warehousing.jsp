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
    <title>验收入库单</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <style>
        .table-td-content {
            padding: 10px;
        }

        .formTable td {
            line-height: 0;
        }

        .tdLabel {
            text-align: right;
            padding-left: 10px;
        }

        .formTable thead tr th {
            line-height: 40px;
            border: solid 1px #e5e5e5;
            text-align: center;
            background: #f6f6f6;
            white-space: nowrap;
            font-size: 13px;
            font-weight: 600;
        }

        .relevance-tool {
            background: #f7f6f6;
            padding: 0;
            margin: 0;
            width: 100%;
        }

        .relevance-tool-padding {
            padding: 5px 0;
            border: solid 1px #eaeaea;

        }

        .relevance-file-content {
            display: inline-block;
            padding: 5px;
            cursor: pointer;
        }

        .relevance-content-link {
            color: #38adff;
            text-decoration: none;
            display: inline-block;
            vertical-align: middle;
        }
    </style>
</head>

<body id="body">

<div class="table-title">
    <span>验收入库单</span>
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

        <div class="separation_line"></div>

        <div class="head_left_button">
            <button type="button" class="cursor_hand" onclick="relevanceForms()">&#xea67; 关联</button>
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


<%--关联表--%>
<div class="relevance-tool" id="relevanceList" style="display: none;">
    <div class="relevance-tool-padding">

        <div class="annexes-icon">
            <button type="button" class="cursor_hand" style="line-height: 20px">&#xea67; ：</button>
        </div>

        <div id="relevance"></div>

    </div>
</div>


<form id="oaActOfficeSupplies">

    <div class="form_area" id="titleArea">
        <table>
            <tbody>
            <tr>
                <td nowrap="nowrap" style="width: 4%">
                    <button type="button" class="table-tab-send" onclick="send()">发送</button>
                </td>

                <th nowrap="nowrap" class="th_title" style="width: 4%">标题</th>
                <td style="width: 44%">
                    <div class="common_input_frame">
                        <input type="text" id="title" name="title" placeholder="请输入标题" title="点击此处填写标题"
                               value="验收入库单(${nickname} <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>)"
                               autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="验收人→发起人(知会)"
                               readonly="readonly">
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div id="addRow" style="float: right;margin-bottom: 10px;">
        <div style="float: right">
            <input type="button" value="添加数据行(10)" onclick="addRow(10)" class="table-tab-send">
        </div>

        <div style="margin-right: 10px;float: right">
            <input type="button" value="添加数据行(3)" onclick="addRow(3)" class="table-tab-send">
        </div>

        <div style="margin-right: 10px;float: right">
            <input type="button" value="添加数据行(1)" onclick="addRow(1)" class="table-tab-send">
        </div>
    </div>

    <table class="formTable" style="margin: 0">
        <thead>
        <tr>
            <th style="width: 7%">序号</th>
            <th style="width: 40%">物品名称</th>
            <th style="width: 16%">数量</th>
            <th style="width: 16%">验收时间</th>
            <th style="width: 21%">备注</th>
        </tr>
        </thead>

        <tbody id="tbo">
        <tr>
            <td class="table-td-content" style="text-align: center;">1</td>

            <td class="table-td-content">
                <input type="text" class="formInput" name="name" id="name" oninput="value=value.replace(/\s+/g,'')" autocomplete="off">
            </td>

            <td class="table-td-content">
                <input type="text" class="formInput" name="number" id="number" oninput="value=value.replace(/^(0+)|[^\d]+/g,'')" autocomplete="off">
            </td>

            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="date" id="date" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">
            </td>

            <td class="table-td-content">
                <input type="text" class="formInput" name="remark" id="remark" autocomplete="off">
            </td>
        </tr>
        </tbody>

        <table class="formTable">
            <tr>
                <td class="tdLabel" style="width: 10%">购买人</td>
                <td class="table-td-content">
                    <input type="text" class="formInput-readonly" name="purchaser" id="purchaser" value="${nickname}"
                           readonly>
                </td>

                <td class="tdLabel" style="width: 10%">签字时间</td>
                <td class="table-td-content">
                    <input type="text" class="formInput-readonly" name="purchaserDate" id="purchaserDate"
                           value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly>
                </td>

                <td class="tdLabel" style="width: 10%">验收人</td>
                <td class="table-td-content">
                    <input type="text" class="formInput-readonly" readonly>
                </td>

                <td class="tdLabel" style="width: 10%">签字时间</td>
                <td class="table-td-content">
                    <input type="text" class="formInput-readonly" readonly>
                </td>

                <%--暂存附件--%>
                <input type="hidden" id="annex" name="annex">
            </tr>
        </table>
    </table>
</form>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    var itselfFrameId;
    $(function () {
        itselfFrameId = window.frameElement && window.frameElement.id || '';
    });

    //数据行id递增
    let rowId = 1;

    //添加数据行
    function addRow(row) {
        var content = '';
        for (let i = 0; i < row; i++) {
            rowId++;
            content +=
                '<tr>\n' +
                '            <td class="table-td-content" style="text-align: center;">' + rowId + '</td>\n' +
                '            <td class="table-td-content">\n' +
                '                <input type="text" class="formInput" name="name" id="name" oninput="value=value.replace(/\\s+/g,\'\')" autocomplete="off">\n' +
                '            </td>\n' +
                '            <td class="table-td-content">\n' +
                '                <input type="text" class="formInput" name="number" id="number" oninput="value=value.replace(/^(0+)|[^\\d]+/g,\'\')" autocomplete="off">\n' +
                '            </td>\n' +
                '            <td class="table-td-content">\n' +
                '                <input type="text" class="formInput-readonly" name="date" id="date" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">\n' +
                '            </td>\n' +
                '            <td class="table-td-content">\n' +
                '                <input type="text" class="formInput" name="remark" id="remark" autocomplete="off">\n' +
                '            </td>\n' +
                '        </tr>';
        }
        $('#tbo').append(content);
    }

    //发送
    function send() {
        var acceptanceWarehousing = [];
        var tel = $('#tbo').find('tr');
        for (let i = 0; i < tel.length; i++) {
            var na = $(tel[i]).find('td').find('#name').val();
            var nb = $(tel[i]).find('td').find('#number').val();
            var da = $(tel[i]).find('td').find('#date').val();
            var re = $(tel[i]).find('td').find('#remark').val();
            acceptanceWarehousing.push({
                name: na,
                number: nb,
                date: da,
                remark: re
            })
        }

        var array = [];
        $('#annexes').find('input').each(function () {
            array.push($(this).val());
        });

        //发送前将上传好的附件插入form中
        $('#annex').val(array);

        var associatedId = $('#relevance').find('input').val();

        if ($.trim($("#title").val()) === '') {
            window.top.tips("标题不能为空！", 6, 5, 1000);
        } else {

            var tit = $('#title').val();
            var pu = $('#purchaser').val();
            var pud = $('#purchaserDate').val();
            var an = $('#annex').val();
            var oaActAcceptanceWarehousing = {
                title: tit,
                purchaser: pu,
                purchaserDate: pud,
                associatedId: associatedId,
                oaAcceptanceWarehousingList: acceptanceWarehousing,
                annex: an
            };

            $.ajax({
                type: "POST",
                url: '${path}/acceptanceWarehousing/add',
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(oaActAcceptanceWarehousing),
                error: function (request) {
                    window.top.tips("出错！", 6, 2, 1000);
                },
                success: function (result) {
                    if (result === "success") {
                        <%--window.location.href = "${path}/oaIndex.do";--%>
                        window.history.back();
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
        var acceptanceWarehousing = [];
        var tel = $('#tbo').find('tr');
        for (let i = 0; i < tel.length; i++) {
            var na = $(tel[i]).find('td').find('#name').val();
            var nb = $(tel[i]).find('td').find('#number').val();
            var da = $(tel[i]).find('td').find('#date').val();
            var re = $(tel[i]).find('td').find('#remark').val();
            acceptanceWarehousing.push({
                name: na,
                number: nb,
                date: da,
                remark: re
            })
        }

        var array = [];
        $('#annexes').find('input').each(function () {
            array.push($(this).val());
        });

        //发送前将上传好的附件插入form中
        $('#annex').val(array);

        var associatedId = $('#relevance').find('input').val();

        if ($.trim($("#title").val()) === '') {
            window.top.tips("标题不能为空！", 6, 5, 1000);
        } else {

            var tit = $('#title').val();
            var pu = $('#purchaser').val();
            var pud = $('#purchaserDate').val();
            var an = $('#annex').val();
            var oaActAcceptanceWarehousing = {
                title: tit,
                purchaser: pu,
                purchaserDate: pud,
                associatedId: associatedId,
                oaAcceptanceWarehousingList: acceptanceWarehousing,
                annex: an
            };

            $.ajax({
                type: "POST",
                url: '${path}/acceptanceWarehousing/savePending',
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(oaActAcceptanceWarehousing),
                error: function (request) {
                    window.top.tips("出错！", 6, 2, 1000);
                },
                success: function (result) {
                    if (result === "success") {
                        <%--window.location.href = "${path}/oaIndex.do";--%>
                        window.history.back();
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
        window.top.uploadFile(itselfFrameId);
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
        window.top.deleteUploaded(fileName,itselfFrameId);
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


    //关联办公用品需求计划表
    function relevanceForms() {
        $.ajax({
            type: "POST",
            url: '${path}/acceptanceWarehousing/associationTableList',
            error: function (request) {
                window.top.tips("出错！", 6, 2, 1000);
            },
            success: function (data) {
                window.top.selectRelevanceForms(JSON.parse(data),itselfFrameId);
            }
        });
    }

    //绑定已选择的
    function relevanceFormsBinding(id, name) {
        $('#relevanceList').css("display", "block");
        var annex = '';
        annex += '<div id="' + id + '" class="table-file">';
        annex += '<div class="relevance-file-content">';
        annex += '<span class="relevance-content-link" onclick="relevanceFormsDetails(\'' + id + '\')">' + name + '</span>';
        annex += '<span class="delete-file" title="删除" onclick="relevanceFormsDelete(\'' + name + '\',\'' + id + '\')">&#xeabb;</span>';
        annex += '<input type="hidden" value="' + id + '">';
        annex += '</div>';
        annex += '</div>';
        $('#relevance').html(annex);
    }

    //跳转办公用品需求计划表
    function relevanceFormsDetails(id) {
        window.top.relevanceFormsDetailsPreview(id);
    }

    //删除已关联文件
    function relevanceFormsDelete(fileName, id) {
        window.top.relevanceFormsDelete(fileName, id, itselfFrameId);
    }

    //执行删除关联文件
    function executeRelevanceFormsDelete(id) {
        $('#' + id).remove();
        let relevanceLen = $('#relevance').children().length;
        if (relevanceLen === 0) {
            $('#relevanceList').css("display", "none");
        }
    }

    //打印
    function printContent() {
        $('#tool,#titleArea,#annexList,#addRow,#relevanceList').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool,#titleArea,#addRow').show();
        $('#body').css('width', '80%');

        //附件列表
        let annexesLen = $('#annexes').children().length;
        if (annexesLen === 0) {
            $('#annexList').css("display", "none");
        } else {
            $('#annexList').css("display", "block");
        }

        //关联表列表
        let relevanceLen = $('#relevance').children().length;
        if (relevanceLen === 0) {
            $('#relevanceList').css("display", "none");
        } else {
            $('#relevanceList').css("display", "block");
        }
    }
</script>
</html>

