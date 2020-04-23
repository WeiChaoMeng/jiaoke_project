<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
    <title>编辑确认单审批单</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
    <style>
        .formTable thead tr th {
            line-height: 40px;
            border: solid 1px #e5e5e5;
            text-align: center;
            background: #f6f6f6;
            white-space: nowrap;
            font-size: 13px;
            font-weight: 600;
        }
    </style>
</head>

<body id="body">

<div class="table-title">
    <span>编辑确认单审批单</span>
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

    <%--附件列表--%>
    <c:choose>
        <c:when test="${oaActConfirm.annex != ''}">
            <div class="top_toolbar" id="annexList" style="display: block;">
                <div class="top-toolbar-annexes">

                    <div class="annexes-icon">
                        <button type="button" class="cursor_hand">&#xeac1; ：</button>
                    </div>

                    <div id="annexes">
                        <c:forTokens items="${oaActConfirm.annex}" delims="," var="annex">
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

<form id="oaActConfirm">
    <div class="form_area" id="titleArea" style="margin-bottom: 15px">
        <table>
            <tbody>
            <tr>
                <td nowrap="nowrap" style="width: 4%">
                    <button type="button" class="table-tab-send" onclick="send()">发送</button>
                </td>

                <th nowrap="nowrap" class="th_title" style="width: 4%">标题:</th>
                <td style="width: 33%">
                    <div class="common_input_frame">
                        <input type="text" id="title" name="title" placeholder="请输入标题" title="点击此处填写标题"
                               value="${oaActConfirm.title}" autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程:</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text"
                               placeholder="经营统计→财务审核→财务主管→经营主管→总经理→发起人(知会)"
                               readonly="readonly">
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div>
        <div id="addRow" style="float: right;margin-bottom: 10px">
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
    </div>

    <table class="formTable" style="margin: 0">
        <tbody>
        <tr>
            <td class="tdLabel">经办部门</td>
            <td colspan="2" class="table-td-content">
                <input type="text" class="formInput" name="department" id="department"
                       value="${oaActConfirm.department}"
                       style="background-color: #f6f6f6;" readonly>
                <input type="hidden" name="id" id="id" value="${oaActConfirm.id}">
                <input type="hidden" name="promoter" id="promoter" value="${oaActConfirm.promoter}">
            </td>

            <td class="tdLabel">经办人</td>
            <td colspan="2" class="table-td-content">
                <input type="text" class="formInput" name="operator" id="operator" value="${oaActConfirm.operator}"
                       style="background-color: #f6f6f6;" readonly>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">确认名称</td>
            <td colspan="2" class="table-td-content">
                <input type="text" class="formInput" name="name" id="name" value="${oaActConfirm.name}"
                       autocomplete="off">
            </td>

            <td class="tdLabel">确认金额（元）</td>
            <td colspan="2" class="table-td-content">
                <input type="text" class="formInput" name="money" id="money" value="${oaActConfirm.money}"
                       autocomplete="off">
            </td>
        </tr>
        </tbody>

        <tbody id="tbo">
        <c:forEach items="${oaActConfirm.oaConfirmList}" var="list" varStatus="status">
            <tr>
                <td class="tdLabel">品种</td>
                <td class="table-td-content">
                    <input type="text" class="formInput" name="variety" id="variety" value="${list.variety}" autocomplete="off">
                </td>

                <td class="tdLabel">单价（元/吨）</td>
                <td class="table-td-content">
                    <input type="text" class="formInput" name="univalent" id="univalent" value="${list.univalent}" autocomplete="off">
                </td>

                <td class="tdLabel">数量（吨）</td>
                <td class="table-td-content">
                    <input type="text" class="formInput" name="number" id="number" value="${list.number}" autocomplete="off">
                </td>
            </tr>
        </c:forEach>
        </tbody>

        <tbody>
        <tr>
            <td class="tdLabel">数量是否与ERP一致</td>
            <td colspan="5" class="table-td-content">
                <input type="text" class="formInput" name="erp" id="erp" value="${oaActConfirm.erp}" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">单价是否与合同一致</td>
            <td colspan="5" class="table-td-content">
                <input type="text" class="formInput" name="contract" id="contract" value="${oaActConfirm.contract}"
                       autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">单位（全称）</td>
            <td colspan="5" class="table-td-content">
                <input type="text" class="formInput" name="unit" id="unit" value="${oaActConfirm.unit}"
                       autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">工程名称（全称）</td>
            <td colspan="5" class="table-td-content">
                <input type="text" class="formInput" name="projectName" id="projectName"
                       value="${oaActConfirm.projectName}" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">审批时间</td>
            <td colspan="5" class="table-td-content">
                <input type="text" class="formInput apply-date" name="approvalTime" value="${oaActConfirm.approvalTime}"
                       id="approvalTime"
                       onfocus="this.blur()">
            </td>
        </tr>

        <tr>
            <td class="tdLabel" style="text-align: center">总经理</td>
            <td class="tdLabel" style="text-align: center">经营主管</td>
            <td class="tdLabel" style="text-align: center">财务主管</td>
            <td class="tdLabel" style="text-align: center">财务审核</td>
            <td class="tdLabel" style="text-align: center">经营统计</td>
            <td class="tdLabel" style="text-align: center">业务</td>
        </tr>

        <tr>
            <td class="table-td-content" style="padding: 5px 10px">
                <input type="text" class="formInput-readonly" readonly>
            </td>
            <td class="table-td-content" style="padding: 5px 10px">
                <input type="text" class="formInput-readonly" readonly>
            </td>
            <td class="table-td-content" style="padding: 5px 10px">
                <input type="text" class="formInput-readonly" readonly>
            </td>
            <td class="table-td-content" style="padding: 5px 10px">
                <input type="text" class="formInput-readonly" readonly>
            </td>
            <td class="table-td-content" style="padding: 5px 10px">
                <input type="text" class="formInput-readonly" readonly>
            </td>
            <td class="table-td-content" style="padding: 5px 10px">
                <input type="text" class="formInput-readonly" readonly>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">备注</td>
            <td colspan="5" class="table-td-textarea">
                    <textarea class="table-remark" onkeyup="value=value.replace(/\s+/g,'')" name="remarks"
                              id="remarks">${oaActConfirm.remarks}</textarea>
                <input type="hidden" id="annex">
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
    jeDate(".apply-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    //添加数据行
    function addRow(row) {
        var content = '';
        for (let i = 0; i < row; i++) {
            content +=
                '<tr>\n' +
                '            <td class="tdLabel">品种</td>\n' +
                '            <td class="table-td-content">\n' +
                '                <input type="text" class="formInput" name="variety" id="variety" autocomplete="off">\n' +
                '            </td>\n' +
                '\n' +
                '            <td class="tdLabel">单价（元/吨）</td>\n' +
                '            <td class="table-td-content">\n' +
                '                <input type="text" class="formInput" name="univalent" id="univalent" autocomplete="off">\n' +
                '            </td>\n' +
                '\n' +
                '            <td class="tdLabel">数量（吨）</td>\n' +
                '            <td class="table-td-content">\n' +
                '                <input type="text" class="formInput" name="number" id="number" autocomplete="off">\n' +
                '            </td>\n' +
                '        </tr>';
        }
        $('#tbo').append(content);
    }

    //发送
    function send() {
        var confirm = [];
        var tel = $('#tbo').find('tr');
        for (let i = 0; i < tel.length; i++) {
            var va = $(tel[i]).find('td').find('#variety').val();
            var un = $(tel[i]).find('td').find('#univalent').val();
            var nu = $(tel[i]).find('td').find('#number').val();
            confirm.push({
                variety: va,
                univalent: un,
                number: nu
            })
        }

        var array = [];
        $('#annexes').find('input').each(function () {
            array.push($(this).val());
        });

        //发送前将上传好的附件插入form中
        $('#annex').val(array);

        if ($.trim($("#title").val()) === '') {
            layer.msg("标题不可以为空！")
        } else {

            var id = $('#id').val();
            var tit = $('#title').val();
            var dep = $('#department').val();
            var ope = $('#operator').val();
            var nam = $('#name').val();
            var mon = $('#money').val();
            var erp = $('#erp').val();
            var con = $('#contract').val();
            var uni = $('#unit').val();
            var pro = $('#projectName').val();
            var app = $('#approvalTime').val();
            var rem = $('#remarks').val();
            var pmr = $('#promoter').val();
            var an = $('#annex').val();
            var oaActConfirm = {
                id: id,
                title: tit,
                department: dep,
                operator: ope,
                name: nam,
                money: mon,
                oaConfirmList: confirm,
                erp: erp,
                contract: con,
                unit: uni,
                projectName: pro,
                approvalTime: app,
                remarks: rem,
                promoter: pmr,
                annex: an
            };

            $.ajax({
                type: "POST",
                url: '${path}/confirm/editAdd',
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(oaActConfirm),
                error: function (request) {
                    layer.msg("出错！");
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

    //保存待发
    function savePending() {
        var confirm = [];
        var tel = $('#tbo').find('tr');
        for (let i = 0; i < tel.length; i++) {
            var va = $(tel[i]).find('td').find('#variety').val();
            var un = $(tel[i]).find('td').find('#univalent').val();
            var nu = $(tel[i]).find('td').find('#number').val();
            confirm.push({
                variety: va,
                univalent: un,
                number: nu
            })
        }

        var array = [];
        $('#annexes').find('input').each(function () {
            array.push($(this).val());
        });

        //发送前将上传好的附件插入form中
        $('#annex').val(array);

        if ($.trim($("#title").val()) === '') {
            layer.msg("标题不可以为空！")
        } else {

            var id = $('#id').val();
            var tit = $('#title').val();
            var dep = $('#department').val();
            var ope = $('#operator').val();
            var nam = $('#name').val();
            var mon = $('#money').val();
            var erp = $('#erp').val();
            var con = $('#contract').val();
            var uni = $('#unit').val();
            var pro = $('#projectName').val();
            var app = $('#approvalTime').val();
            var rem = $('#remarks').val();
            var an = $('#annex').val();
            var oaActConfirm = {
                id: id,
                title: tit,
                department: dep,
                operator: ope,
                name: nam,
                money: mon,
                oaConfirmList: confirm,
                erp: erp,
                contract: con,
                unit: uni,
                projectName: pro,
                approvalTime: app,
                remarks: rem,
                annex: an
            };

            $.ajax({
                type: "POST",
                url: '${path}/confirm/edit',
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(oaActConfirm),
                error: function (request) {
                    layer.msg("出错！");
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
        $('#body').css('width','100%');
        //执行打印
        window.print();
        $('#tool,#titleArea').show();
        $('#body').css('width','80%');

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

