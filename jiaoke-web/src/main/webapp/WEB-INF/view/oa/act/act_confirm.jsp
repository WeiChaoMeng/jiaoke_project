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
    <title>确认单审批单</title>
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
    <span>确认单审批单</span>
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
                               value="确认单审批单(${nickname} <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>)"
                               autocomplete="off">
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
                <input type="text" class="formInput" name="department" id="department" value="${department}"
                       style="background-color: #f6f6f6;" readonly>
            </td>

            <td class="tdLabel">经办人</td>
            <td colspan="2" class="table-td-content">
                <input type="text" class="formInput" name="operator" id="operator" value="${nickname}"
                       style="background-color: #f6f6f6;" readonly>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">确认名称</td>
            <td colspan="2" class="table-td-content">
                <input type="text" class="formInput" name="name" id="name" autocomplete="off">
            </td>

            <td class="tdLabel">确认金额（元）</td>
            <td colspan="2" class="table-td-content">
                <input type="text" class="formInput-readonly" name="total" id="total" readonly>
            </td>
        </tr>
        </tbody>
    </table>

    <table class="formTable" style="margin: 0">
        <tbody id="tbo">
        <tr>
            <td class="tdLabel" style="width: 10%">品种</td>
            <td class="table-td-content" style="width: 20%">
                <input type="text" class="formInput" name="variety" id="variety1" autocomplete="off">
            </td>

            <td class="tdLabel" style="width: 10%">单价（元/吨）</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="univalent" id="univalent1" onchange="amountCalculation(this)"
                       oninput="value=value.replace(/^\D*(\d*(?:\.\d{0,2})?).*$/g, '$1')" autocomplete="off">
            </td>

            <td class="tdLabel" style="width: 10%">数量（吨）</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="number" id="number1" onchange="amountCalculation(this)"
                       oninput="value=value.replace(/^\D*(\d*(?:\.\d{0,2})?).*$/g, '$1')" autocomplete="off">
            </td>

            <td class="tdLabel" style="width: 10%">金额（元）</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="money" id="money1" readonly>
            </td>
        </tr>
        </tbody>
    </table>

    <table class="formTable" style="margin: 0">
        <tbody>
        <tr>
            <td class="tdLabel">数量是否与ERP一致</td>
            <td colspan="5" class="table-td-content">
                <input type="text" class="formInput" name="erp" id="erp" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">单价是否与合同一致</td>
            <td colspan="5" class="table-td-content">
                <input type="text" class="formInput" name="contract" id="contract" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">单位（全称）</td>
            <td colspan="5" class="table-td-content">
                <input type="text" class="formInput" name="unit" id="unit" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">工程名称（全称）</td>
            <td colspan="5" class="table-td-content">
                <input type="text" class="formInput" name="projectName" id="projectName" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">审批时间</td>
            <td colspan="5" class="table-td-content">
                <input type="text" class="formInput apply-date" name="approvalTime" id="approvalTime"
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
                              id="remarks"></textarea>
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

    var itselfFrameId;
    $(function () {
        itselfFrameId = window.frameElement && window.frameElement.id || '';
    });

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

    //数据行id递增
    let rowId = 1;

    //添加数据行
    function addRow(row) {
        var content = '';
        for (let i = 0; i < row; i++) {
            rowId++;
            content +=
                '<tr>\n' +
                '            <td class="tdLabel" style="width: 10%;">品种</td>\n' +
                '            <td class="table-td-content" style="width: 20%;">\n' +
                '                <input type="text" class="formInput" name="variety" id="variety' + rowId + '" autocomplete="off">\n' +
                '            </td>\n' +
                '\n' +
                '            <td class="tdLabel" style="width: 10%;">单价（元/吨）</td>\n' +
                '            <td class="table-td-content">\n' +
                '                <input type="text" class="formInput" name="univalent" id="univalent' + rowId + '" onchange="amountCalculation(this)" oninput="value=value.replace(/^\\D*(\\d*(?:\\.\\d{0,2})?).*$/g, \'$1\')" autocomplete="off">\n' +
                '            </td>\n' +
                '\n' +
                '            <td class="tdLabel" style="width: 10%;">数量（吨）</td>\n' +
                '            <td class="table-td-content">\n' +
                '                <input type="text" class="formInput" name="number" id="number' + rowId + '" onchange="amountCalculation(this)" oninput="value=value.replace(/^\\D*(\\d*(?:\\.\\d{0,2})?).*$/g, \'$1\')" autocomplete="off">\n' +
                '            </td>\n' +
                '           <td class="tdLabel" style="width: 10%">金额（元）</td>\n' +
                '                <td class="table-td-content">\n' +
                '                    <input type="text" class="formInput-readonly" name="money" id="money' + rowId + '" readonly>\n' +
                '           </td>\n' +
                '        </tr>';
        }
        $('#tbo').append(content);
    }

    //计算金额
    function amountCalculation(self) {
        var currentRowId = self.id;
        var id = currentRowId.charAt(currentRowId.length - 1);
        var s1 = $('#univalent' + id).val().toString();
        var s2 = $('#number' + id).val().toString();
        if (s1 !== "" & s2 !== "") {
            $('#money' + id).val(calculate(s1, s2));
            $('#total').val(sum());
        }
    }

    //计算金额
    function calculate(number, money) {
        var m = 0;
        try {
            m += number.split(".")[1].length
        } catch (e) {
        }

        try {
            m += money.split(".")[1].length
        } catch (e) {
        }

        return Number(number.replace(".", "")) * Number(money.replace(".", "")) / Math.pow(10, m);
    }

    //总和
    function sum() {
        var sum = 0;
        for (let i = 1; i <= rowId; i++) {
            var money = $('#money' + i).val();
            sum = (money * 1000 + sum * 1000) / 1000;
        }
        return sum;
    }

    //发送
    function send() {
        var confirm = [];
        var tel = $('#tbo').find('tr');
        for (let i = 0; i < tel.length; i++) {
            var va = $(tel[i]).find('td').find('#variety' + (i + 1)).val();
            var un = $(tel[i]).find('td').find('#univalent' + (i + 1)).val();
            var nu = $(tel[i]).find('td').find('#number' + (i + 1)).val();
            var mo = $(tel[i]).find('td').find('#money' + (i + 1)).val();
            confirm.push({
                variety: va,
                univalent: un,
                number: nu,
                money: mo
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

            var tit = $('#title').val();
            var dep = $('#department').val();
            var ope = $('#operator').val();
            var nam = $('#name').val();
            var tot = $('#total').val();
            var erp = $('#erp').val();
            var con = $('#contract').val();
            var uni = $('#unit').val();
            var pro = $('#projectName').val();
            var app = $('#approvalTime').val();
            var rem = $('#remarks').val();
            var an = $('#annex').val();
            var oaActConfirm = {
                title: tit,
                department: dep,
                operator: ope,
                name: nam,
                total: tot,
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
                url: '${path}/confirm/add',
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(oaActConfirm),
                error: function (request) {
                    layer.msg("出错！");
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

    //保存待发
    function savePending() {
        var confirm = [];
        var tel = $('#tbo').find('tr');
        for (let i = 0; i < tel.length; i++) {
            var va = $(tel[i]).find('td').find('#variety' + (i + 1)).val();
            var un = $(tel[i]).find('td').find('#univalent' + (i + 1)).val();
            var nu = $(tel[i]).find('td').find('#number' + (i + 1)).val();
            var mo = $(tel[i]).find('td').find('#money' + (i + 1)).val();
            confirm.push({
                variety: va,
                univalent: un,
                number: nu,
                money: mo
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

            var tit = $('#title').val();
            var dep = $('#department').val();
            var ope = $('#operator').val();
            var nam = $('#name').val();
            var tot = $('#total').val();
            var erp = $('#erp').val();
            var con = $('#contract').val();
            var uni = $('#unit').val();
            var pro = $('#projectName').val();
            var app = $('#approvalTime').val();
            var rem = $('#remarks').val();
            var an = $('#annex').val();
            var oaActConfirm = {
                title: tit,
                department: dep,
                operator: ope,
                name: nam,
                total: tot,
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
                url: '${path}/confirm/savePending',
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(oaActConfirm),
                error: function (request) {
                    layer.msg("出错！");
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
            annex += '<a class="table-file-title" href="javascript:location.href=encodeURI(\'' + "/fileDownloadHandle/download?fileName=" + ret[i].filePaths + '\')" title="' + ret[i].originalName + '">' + ret[i].originalName + '</a>';
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
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool,#titleArea').show();
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

