<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>加班统计表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
    <style>
        .formTable thead tr th {
            width: 10%;
            height: 30px;
            text-align: center;
            white-space: nowrap;
            border: solid 1px #e5e5e5;
            font-size: 13px;
            font-weight: 600;
            background: #f6f6f6;
            line-height: 40px;
        }

        .formTable tbody tr td {
            padding: 5px 10px;
        }

        .approval-div-style {
            width: 70%;
            margin-bottom: 10px;
            display: inline-block;
        }

        .approval-input {
            width: 33%;
            float: left;
        }

        .approval-input-span {
            font-size: 13px;
            width: 45%;
            display: inline-block;
            float: left;
            line-height: 29px;
            text-align: right;
            text-indent: 5px;
        }

        .approval-input-input {
            border: 0;
            border-bottom: 1px #000 solid;
            width: 35%;
            outline: none;
            height: 28px;
            text-align: left;
            font-weight: 500;
            color: #000;
            text-indent: 10px;
            font-size: 13px;
            float: left;
            cursor: no-drop;
        }
    </style>
</head>

<body id="body">

<div class="table-title">
    <span>加班统计表</span>
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

    <c:choose>
        <c:when test="${oaActOvertime.annex != ''}">
            <div class="top_toolbar" id="annexList" style="display: block;">
                <div class="top-toolbar-annexes">

                    <div class="annexes-icon">
                        <button type="button" class="cursor_hand">&#xeac1; ：</button>
                    </div>

                    <div id="annexes">
                        <c:forTokens items="${oaActOvertime.annex}" delims="," var="annex">
                            <div id="file${fn:substring(annex,0,annex.indexOf("_"))}" class="table-file">
                                <div class="table-file-content">
                                    <a class="table-file-title" href="/fileDownloadHandle/download?fileName=${annex}"
                                       title="${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}">${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}
                                    </a>
                                    <span class="delete-file" title="删除"
                                          onclick="whether('${annex}')"></span>
                                    <input type="hidden" value="${annex}">
                                </div>
                            </div>
                        </c:forTokens>
                    </div>

                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="top_toolbar" id="annexList" style="display: none;">
                <div class="top-toolbar-annexes">

                    <div class="annexes-icon">
                        <button type="button" class="cursor_hand">&#xeac1; ：</button>
                    </div>

                    <div id="annexes"></div>

                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<form id="oaActOvertime">
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
                               value="${oaActOvertime.title}" autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="部门负责人→部门主管领导→发起者(知会)" readonly>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div>
        <span class="fill-in-date" style="margin-top: 0;float: left;">部门
            <input type="text" class="form-number-content" name="department" id="department" style="cursor: no-drop;"
                   value="${oaActOvertime.department}" readonly>
        </span>

        <span class="form-number-left" style="float: right;margin-top: 0;">日期
            <input type="text" class="form-number-content je-date" name="statisticalDate" id="statisticalDate"
                   value="${oaActOvertime.statisticalDate}" onfocus="this.blur()">
            <input type="hidden" id="annex" name="annex">
            <input type="hidden" id="id" name="id" value="${oaActOvertime.id}">
        </span>
    </div>

    <table class="formTable">
        <thead>
        <tr>
            <th style="width: 10%">姓名</th>
            <th style="width: 35%">周六、周日</th>
            <th style="width: 15%">法定节假日</th>
            <th style="width: 10%">倒休</th>
            <th style="width: 15%">周六日加班合计</th>
            <th style="width: 15%">法定节假日加班合计</th>
        </tr>
        </thead>

        <tbody id="tbo">
        <c:forEach items="${oaActOvertime.oaOvertimeStatisticsList}" var="list">
            <tr>
                <td><input type="text" class="formInput" name="name" id="name" value="${list.name}" autocomplete="off">
                </td>
                <td><input type="text" class="formInput" name="weekend" id="weekend" value="${list.weekend}"
                           autocomplete="off"></td>
                <td><input type="text" class="formInput" name="legalHolidays" id="legalHolidays"
                           value="${list.legalHolidays}" autocomplete="off"></td>
                <td><input type="text" class="formInput" name="restDown" id="restDown" value="${list.restDown}"
                           autocomplete="off"></td>
                <td><input type="text" class="formInput" name="weekendTotal" id="weekendTotal"
                           value="${list.weekendTotal}" autocomplete="off"></td>
                <td><input type="text" class="formInput" name="legalTotal" id="legalTotal" value="${list.legalTotal}"
                           autocomplete="off"></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="approval-div-style">
        <div class="approval-input">
            <span class="approval-input-span">主管领导</span>
            <input type="text" class="approval-input-input" readonly>
        </div>

        <div class="approval-input">
            <span class="approval-input-span">部门负责人</span>
            <input type="text" class="approval-input-input" readonly>
        </div>

        <div class="approval-input">
            <span class="approval-input-span">考勤员</span>
            <input type="text" class="approval-input-input" value="${oaActOvertime.preparer}" name="preparer"
                   id="preparer" readonly>
        </div>
    </div>

    <div id="addRow" style="width: 30%;float: right;">
        <div style="width: 33%;float: right">
            <input type="button" value="添加数据行(10)" onclick="addRow(10)" class="table-tab-send">
        </div>

        <div style="width: 33%;float: right">
            <input type="button" value="添加数据行(3)" onclick="addRow(3)" class="table-tab-send">
        </div>

        <div style="width: 33%;float: right">
            <input type="button" value="添加数据行(1)" onclick="addRow(1)" class="table-tab-send">
        </div>
    </div>
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
        format: "YYYY年MM月",
        zIndex: 100000,
    });

    var itselfFrameId;
    $(function () {
        itselfFrameId = window.frameElement && window.frameElement.id || '';
    });

    //添加数据行
    function addRow(row) {

        var content = '';
        for (let i = 0; i < row; i++) {
            content += '<tr>\n' +
                '            <td><input type="text" class="formInput" name="name" id="name" autocomplete="off"></td>\n' +
                '            <td><input type="text" class="formInput" name="weekend" id="weekend" autocomplete="off"></td>\n' +
                '            <td><input type="text" class="formInput" name="legalHolidays" id="legalHolidays" autocomplete="off"></td>\n' +
                '            <td><input type="text" class="formInput" name="restDown" id="restDown" autocomplete="off"></td>\n' +
                '            <td><input type="text" class="formInput" name="weekendTotal" id="weekendTotal" autocomplete="off"></td>\n' +
                '            <td><input type="text" class="formInput" name="legalTotal" id="legalTotal" autocomplete="off"></td>\n' +
                '        </tr>'
        }
        $('#tbo').append(content);
    }

    //发送
    function send() {
        if ($.trim($("#title").val()) === '') {
            window.top.tips("标题不可以为空！", 6, 5, 2000);
        } else {
            var principalGroup = '${principalGroup}';
            //部门负责人是多个
            if (principalGroup !== '') {
                var principalList = JSON.parse(principalGroup);
                window.top.selectPrincipal(principalList,itselfFrameId);

                //部门负责人是单个
            } else {

                var actOvertimeList = [];
                var tel = $('#tbo').find('tr');
                for (let i = 0; i < tel.length; i++) {
                    var n = $(tel[i]).find('td').find('#name').val();
                    var w = $(tel[i]).find('td').find('#weekend').val();
                    var lh = $(tel[i]).find('td').find('#legalHolidays').val();
                    var r = $(tel[i]).find('td').find('#restDown').val();
                    var wt = $(tel[i]).find('td').find('#weekendTotal').val();
                    var lt = $(tel[i]).find('td').find('#legalTotal').val();
                    actOvertimeList.push({
                        name: n,
                        weekend: w,
                        legalHolidays: lh,
                        restDown: r,
                        weekendTotal: wt,
                        legalTotal: lt
                    })
                }

                var array = [];
                $('#annexes').find('input').each(function () {
                    array.push($(this).val());
                });

                //发送前将上传好的附件插入form中
                $('#annex').val(array);

                var tit = $('#title').val();
                var id = $('#id').val();
                var dep = $('#department').val();
                var sd = $('#statisticalDate').val();
                var pp = $('#preparer').val();
                var an = $('#annex').val();
                var oaActOvertime = {
                    title: tit,
                    id: id,
                    department: dep,
                    statisticalDate: sd,
                    oaOvertimeStatisticsList: actOvertimeList,
                    preparer: pp,
                    annex: an,
                    departmentPrincipal: "single"
                };

                $.ajax({
                    type: "POST",
                    url: '${path}/overtime/editAdd',
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify(oaActOvertime),
                    error: function (request) {
                        layer.msg("出错！");
                    },
                    success: function (result) {
                        if (result === "success") {
                            <%--window.location.href = "${path}/oaIndex.do";--%>
                            window.history.back();
                            window.top.tips("发送成功！", 0, 1, 2000);
                        } else {
                            window.top.tips('发送失败！', 0, 2, 2000);
                        }
                    }
                })
            }
        }
    }

    //根据勾选的部门负责人发送
    function selectionPrincipal(principalId) {
        var actOvertimeList = [];
        var tel = $('#tbo').find('tr');
        for (let i = 0; i < tel.length; i++) {
            var n = $(tel[i]).find('td').find('#name').val();
            var w = $(tel[i]).find('td').find('#weekend').val();
            var lh = $(tel[i]).find('td').find('#legalHolidays').val();
            var r = $(tel[i]).find('td').find('#restDown').val();
            var wt = $(tel[i]).find('td').find('#weekendTotal').val();
            var lt = $(tel[i]).find('td').find('#legalTotal').val();
            actOvertimeList.push({
                name: n,
                weekend: w,
                legalHolidays: lh,
                restDown: r,
                weekendTotal: wt,
                legalTotal: lt
            })
        }

        var array = [];
        $('#annexes').find('input').each(function () {
            array.push($(this).val());
        });

        //发送前将上传好的附件插入form中
        $('#annex').val(array);

        var tit = $('#title').val();
        var id = $('#id').val();
        var dep = $('#department').val();
        var sd = $('#statisticalDate').val();
        var pp = $('#preparer').val();
        var an = $('#annex').val();
        var oaActOvertime = {
            title: tit,
            id: id,
            department: dep,
            statisticalDate: sd,
            oaOvertimeStatisticsList: actOvertimeList,
            preparer: pp,
            annex: an,
            departmentPrincipal: principalId
        };

        $.ajax({
            type: "POST",
            url: '${path}/overtime/editAdd',
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify(oaActOvertime),
            error: function (request) {
                layer.msg("出错！");
            },
            success: function (result) {
                if (result === "success") {
                    <%--window.location.href = "${path}/oaIndex.do";--%>
                    window.history.back();
                    window.top.tips("发送成功！", 0, 1, 2000);
                } else {
                    window.top.tips('发送失败！', 0, 2, 2000);
                }
            }
        })
    }

    //保存待发
    function savePending() {

        var actOvertimeList = [];
        var tel = $('#tbo').find('tr');
        for (let i = 0; i < tel.length; i++) {
            var n = $(tel[i]).find('td').find('#name').val();
            var w = $(tel[i]).find('td').find('#weekend').val();
            var lh = $(tel[i]).find('td').find('#legalHolidays').val();
            var r = $(tel[i]).find('td').find('#restDown').val();
            var wt = $(tel[i]).find('td').find('#weekendTotal').val();
            var lt = $(tel[i]).find('td').find('#legalTotal').val();
            actOvertimeList.push({
                name: n,
                weekend: w,
                legalHolidays: lh,
                restDown: r,
                weekendTotal: wt,
                legalTotal: lt
            })
        }

        var array = [];
        $('#annexes').find('input').each(function () {
            array.push($(this).val());
        });

        //发送前将上传好的附件插入form中
        $('#annex').val(array);

        if ($.trim($("#title").val()) === '') {
            window.top.tips("标题不可以为空！", 6, 5, 2000);
        } else {
            var tit = $('#title').val();
            var id = $('#id').val();
            var dep = $('#department').val();
            var sd = $('#statisticalDate').val();
            var pp = $('#preparer').val();
            var an = $('#annex').val();
            var oaActOvertime = {
                id: id,
                title: tit,
                department: dep,
                statisticalDate: sd,
                oaOvertimeStatisticsList: actOvertimeList,
                preparer: pp,
                annex: an
            };

            $.ajax({
                type: "POST",
                url: '${path}/overtime/edit',
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(oaActOvertime),
                error: function (request) {
                    layer.msg("出错！");
                },
                success: function (result) {
                    if (result === "success") {
                        <%--window.location.href = "${path}/oaIndex.do";--%>
                        window.history.back();
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

    //打印
    function printContent() {
        $('#tool,#titleArea,#annexList,#addRow').hide();
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
    }
</script>
</html>

