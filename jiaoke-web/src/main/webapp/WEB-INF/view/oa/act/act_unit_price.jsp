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
    <title>单价审批单</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
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

        .checked-box-style{
            vertical-align: middle;
            margin: 0 10px 0 5px;
            zoom: 120%;
        }
    </style>
</head>

<body id="body">

<div class="table-title">
    <span>单价审批单</span>
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
                               value="单价审批单(${nickname} <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>)"
                               autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="经营部长→经营主管→总经理→发起人(知会)"
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
            <td class="tdLabel">客户名称</td>
            <td class="table-td-content" colspan="3">
                <input type="text" class="formInput" name="customer" id="customer" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">工程名称</td>
            <td class="table-td-content" colspan="3">
                <input type="text" class="formInput" name="engineering" id="engineering" autocomplete="off">
            </td>
        </tr>
        </tbody>
    </table>

    <table class="formTable" style="margin: 0">
        <thead>
        <tr>
            <th style="width: 55%">产品名称</th>
            <th style="width: 15%">数量</th>
            <th style="width: 15%">单价</th>
            <th style="width: 15%">金额(元)</th>
        </tr>
        </thead>

        <tbody id="tbo">
        <tr>
            <td class="table-td-content">
                <input type="text" class="formInput" name="item" id="item1" autocomplete="off">
            </td>

            <td class="table-td-content">
                <input type="text" class="formInput" name="number" id="number1" onchange="amountCalculation(this)"
                       oninput="value=value.replace(/[^\d]/g,'').replace(/^0{1,}/g,'')" autocomplete="off">
            </td>

            <td class="table-td-content">
                <input type="text" class="formInput" name="price" id="price1" onchange="amountCalculation(this)"
                       oninput="value=value.replace(/^\D*(\d*(?:\.\d{0,2})?).*$/g, '$1')" autocomplete="off">
            </td>

            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="money" id="money1" readonly>
            </td>
        </tr>
        </tbody>
    </table>

    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel" rowspan="6">定价依据（文号）</td>
        </tr>

        <tr id="creditRating">
            <td class="table-td-content" colspan="3">
                信用等级：
                一级客户<input type="checkbox" checked class="checked-box-style" name="creditRating" value="0">
                二级客户<input type="checkbox" class="checked-box-style" name="creditRating" value="1">
                三级客户<input type="checkbox" class="checked-box-style" name="creditRating" value="2">
            </td>
        </tr>

        <tr id="unitNature">
            <td class="table-td-content" colspan="3">
                单位性质：
                内部单位<input type="checkbox" checked class="checked-box-style" name="unitNature" value="0">
                外部单位<input type="checkbox" class="checked-box-style" name="unitNature" value="1">
            </td>
        </tr>

        <tr id="paymentMethod">
            <td class="table-td-content" colspan="3">
                支付方式：
                预付全款<input type="checkbox" checked class="checked-box-style" name="paymentMethod" value="0">
                当年支付全款<input type="checkbox" class="checked-box-style" name="paymentMethod" value="1">
                当年支付80%及以上<input type="checkbox" class="checked-box-style" name="paymentMethod" value="2">
            </td>
        </tr>

        <tr id="number">
            <td class="table-td-content" colspan="3">
                数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量：
                50000吨以上<input type="checkbox" checked class="checked-box-style" name="number" value="0">
                10000吨-50000吨<input type="checkbox" class="checked-box-style" name="number" value="1">
                5000吨-10000吨<input type="checkbox" class="checked-box-style" name="number" value="2">
            </td>
        </tr>

        <tr id="tender">
            <td class="table-td-content" colspan="3">
                投&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标：
                重大工程<input type="checkbox" checked name="tender" value="0" class="checked-box-style">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">合同总价¥</td>
            <td class="table-td-content" colspan="3">
                <input type="text" class="formInput-readonly" name="contractValue" id="contractValue" readonly>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">结清时间</td>
            <td class="table-td-content" colspan="3">
                <input type="text" class="formInput entry-date" name="settleTime" id="settleTime"
                       onfocus="this.blur()">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">预付款¥</td>
            <td class="table-td-content" colspan="3">
                <input type="text" class="formInput" name="advanceCharge" id="advanceCharge" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">联系人及电话</td>
            <td class="table-td-content" colspan="3">
                <input type="text" class="formInput" name="contactNumber" id="contactNumber" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">利润中心</td>
            <td class="table-td-content" colspan="3">
                <input type="text" class="formInput" name="profitCenter" id="profitCenter" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">运输方式及运距</td>
            <td class="table-td-content" colspan="3">
                <input type="text" class="formInput" name="modeShipping" id="modeShipping" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">经营部长审核</td>
            <td class="table-td-content" colspan="3">
                <input type="text" class="formInput-readonly" readonly>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">经营主管审核</td>
            <td class="table-td-content" colspan="3">
                <input type="text" class="formInput-readonly" readonly>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">总经理</td>
            <td class="table-td-content" colspan="3">
                <input type="text" class="formInput-readonly" readonly>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">备注</td>
            <td class="table-td-content" colspan="3">
                <input type="text" class="formInput" name="remarks" id="remarks" autocomplete="off">
            </td>
            <%--暂存附件--%>
            <input type="hidden" id="annex" name="annex">
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
    jeDate(".entry-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,                    //是否显示节日
        isinitVal: true,                    //是否初始化
        isTime: true,                        //是否开启时间选择
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD  hh:mm",
        zIndex: 100000,
    });

    var itselfFrameId;
    $(function () {
        itselfFrameId = window.frameElement && window.frameElement.id || '';
    });

    //checkbox选择事件
    $(document).ready(function () {
        $('#creditRating').find('input[type=checkbox]').bind('click', function () {
            $('#creditRating').find('input[type=checkbox]').not(this).prop("checked", false);
        });

        $('#unitNature').find('input[type=checkbox]').bind('click', function () {
            $('#unitNature').find('input[type=checkbox]').not(this).prop("checked", false);
        });

        $('#paymentMethod').find('input[type=checkbox]').bind('click', function () {
            $('#paymentMethod').find('input[type=checkbox]').not(this).prop("checked", false);
        });

        $('#number').find('input[type=checkbox]').bind('click', function () {
            $('#number').find('input[type=checkbox]').not(this).prop("checked", false);
        });
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
                '  <td class="table-td-content"><input type="text" class="formInput" name="item" id="item' + rowId + '" autocomplete="off"></td>\n' +
                '  <td class="table-td-content">\n' +
                '     <input type="text" class="formInput" name="number" id="number' + rowId + '" onchange="amountCalculation(this)"\n' +
                '           oninput="value=value.replace(/[^\\d]/g,\'\').replace(/^0{1,}/g,\'\')" autocomplete="off">\n' +
                '  </td>\n' +
                '  <td class="table-td-content">\n' +
                '       <input type="text" class="formInput" name="price" id="price' + rowId + '" onchange="amountCalculation(this)"\n' +
                '           oninput="value=value.replace(/^\\D*(\\d*(?:\\.\\d{0,2})?).*$/g, \'$1\')" autocomplete="off">\n' +
                '  </td>\n' +
                '  <td class="table-td-content">\n' +
                '       <input type="text" class="formInput-readonly" name="money" id="money' + rowId + '" readonly>\n' +
                '  </td>\n' +
                '</tr>';
        }
        $('#tbo').append(content);
    }

    //计算金额
    function amountCalculation(self) {
        var currentRowId = self.id;
        var id = currentRowId.charAt(currentRowId.length - 1);

        var s1 = $('#number' + id).val().toString();
        var s2 = $('#price' + id).val().toString();
        if (s1 !== "" & s2 !== "") {
            $('#money' + id).val(calculate(s1, s2));
            $('#contractValue').val(sum());
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
        var unitPrice = [];
        var tel = $('#tbo').find('tr');
        for (let i = 0; i < tel.length; i++) {
            var it = $(tel[i]).find('td').find('#item' + (i + 1)).val();
            var nb = $(tel[i]).find('td').find('#number' + (i + 1)).val();
            var pr = $(tel[i]).find('td').find('#price' + (i + 1)).val();
            var mo = $(tel[i]).find('td').find('#money' + (i + 1)).val();
            unitPrice.push({
                item: it,
                number: nb,
                price: pr,
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
            window.top.tips("标题不能为空！", 6, 5, 1000);
        } else {

            var tit = $('#title').val();
            var cus = $('#customer').val();
            var eng = $('#engineering').val();
            var cre = $("#creditRating input:checked").val();
            var uni = $("#unitNature input:checked").val();
            var pay = $("#paymentMethod input:checked").val();
            var num = $("#number input:checked").val();
            var ten = $("#tender input:checked").val();
            var con = $('#contractValue').val();
            var set = $('#settleTime').val();
            var adv = $('#advanceCharge').val();
            var cnb = $('#contactNumber').val();
            var pro = $('#profitCenter').val();
            var mod = $('#modeShipping').val();
            var rem = $('#remarks').val();
            var an = $('#annex').val();
            var oaActUnitPrice = {
                title: tit,
                customer: cus,
                engineering: eng,
                oaUnitPriceList: unitPrice,
                creditRating: cre,
                unitNature: uni,
                paymentMethod: pay,
                number: num,
                tender: ten,
                contractValue: con,
                settleTime: set,
                advanceCharge: adv,
                contactNumber: cnb,
                profitCenter: pro,
                modeShipping: mod,
                remarks: rem,
                annex: an
            };

            $.ajax({
                type: "POST",
                url: '${path}/unitPrice/add',
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(oaActUnitPrice),
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
        var unitPrice = [];
        var tel = $('#tbo').find('tr');
        for (let i = 0; i < tel.length; i++) {
            var it = $(tel[i]).find('td').find('#item' + (i + 1)).val();
            var nb = $(tel[i]).find('td').find('#number' + (i + 1)).val();
            var pr = $(tel[i]).find('td').find('#price' + (i + 1)).val();
            var mo = $(tel[i]).find('td').find('#money' + (i + 1)).val();
            unitPrice.push({
                item: it,
                number: nb,
                price: pr,
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
            window.top.tips("标题不能为空！", 6, 5, 1000);
        } else {

            var tit = $('#title').val();
            var cus = $('#customer').val();
            var eng = $('#engineering').val();
            var cre = $("#creditRating input:checked").val();
            var uni = $("#unitNature input:checked").val();
            var pay = $("#paymentMethod input:checked").val();
            var num = $("#number input:checked").val();
            var ten = $("#tender input:checked").val();
            var con = $('#contractValue').val();
            var set = $('#settleTime').val();
            var adv = $('#advanceCharge').val();
            var cnb = $('#contactNumber').val();
            var pro = $('#profitCenter').val();
            var mod = $('#modeShipping').val();
            var rem = $('#remarks').val();
            var an = $('#annex').val();
            var oaActUnitPrice = {
                title: tit,
                customer: cus,
                engineering: eng,
                oaUnitPriceList: unitPrice,
                creditRating: cre,
                unitNature: uni,
                paymentMethod: pay,
                number: num,
                tender: ten,
                contractValue: con,
                settleTime: set,
                advanceCharge: adv,
                contactNumber: cnb,
                profitCenter: pro,
                modeShipping: mod,
                remarks: rem,
                annex: an
            };

            $.ajax({
                type: "POST",
                url: '${path}/unitPrice/savePending',
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(oaActUnitPrice),
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

