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
    <title>办公用品需求计划</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <style>
        .table-td-content {
            padding: 10px;
        }

        .formTable td{
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
    </style>
</head>

<body id="body" style="width: 70%">

<div class="table-title">
    <span>办公用品需求计划</span>
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
                               value="办公用品需求计划(${nickname} <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>)"
                               autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="审核→发起者部门负责人→办公室主管领导→发起人、审核人(知会)" readonly>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div>
        <span class="form-number-left" style="margin-top: 0">部门
            <input type="text" class="form-number-content" style="cursor: no-drop" name="department" id="department"
                   value="${department}" readonly>
        </span>

        <div id="addRow" style="float: right;">
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
        <thead>
        <tr>
            <th style="width: 7%">序号</th>
            <th style="width: 45%">项目</th>
            <th style="width: 16%">数量</th>
            <th style="width: 16%">单价</th>
            <th style="width: 16%">金额(元)</th>
        </tr>
        </thead>

        <tbody id="tbo">
        <tr>
            <td class="table-td-content" style="text-align: center;"><span class="order-number-style">1</span></td>

            <td class="table-td-content">
                <input type="text" class="formInput" name="item" id="item1" autocomplete="off">
            </td>

            <td class="table-td-content">
                <input type="text" class="formInput" name="number" id="number1" onchange="amountCalculation(this)"
                       oninput="value=value.replace(/^(0+)|[^\d]/g,'')" autocomplete="off">
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

        <table class="formTable">
            <tr>
                <td class="tdLabel">填表人</td>
                <td class="table-td-content">
                    <input type="text" class="formInput-readonly" name="preparer" id="preparer" value="${nickname}" readonly>
                </td>

                <td class="tdLabel">填表日期</td>
                <td class="table-td-content">
                    <input type="text" class="formInput-readonly" name="fillingDate" id="fillingDate"
                           value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date())%>" readonly>
                </td>

                <td class="tdLabel">合计(元)</td>
                <td class="table-td-content">
                    <input type="text" class="formInput-readonly" name="total" id="total" readonly>
                </td>

                <%--暂存附件--%>
                <input type="hidden" id="annex" name="annex">
            </tr>

            <tr>
                <td class="tdLabel">审核</td>
                <td colspan="5" class="approval-content">
                    <textarea class="approval-content-textarea" readonly></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" readonly>
                    </div>
                </td>
            </tr>

            <tr>
                <td class="tdLabel">部门负责人</td>
                <td colspan="5" class="approval-content">
                    <textarea class="approval-content-textarea" readonly></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" readonly>
                    </div>
                </td>
            </tr>

            <tr>
                <td class="tdLabel">审批</td>
                <td colspan="5" class="approval-content">
                    <textarea class="approval-content-textarea" readonly></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" readonly>
                    </div>
                </td>
            </tr>
        </table>
    </table>
</form>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //数据行id递增
    let rowId = 1;

    //添加数据行
    function addRow(row) {
        var content = '';
        for (let i = 0; i < row; i++) {
            rowId++;
            content +=
                '<tr>\n' +
                '  <td class="table-td-content" style="text-align: center;"><span class="order-number-style">' + rowId + '</span></td>' +
                '  <td class="table-td-content"><input type="text" class="formInput" name="item" id="item' + rowId + '" autocomplete="off"></td>\n' +
                '  <td class="table-td-content">\n' +
                '     <input type="text" class="formInput" name="number" id="number' + rowId + '" onchange="amountCalculation(this)"\n' +
                '           oninput="value=value.replace(/^(0+)|[^\\d]/g,\'\')" autocomplete="off">\n' +
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

    function send() {
        if ($.trim($("#title").val()) === '') {
            window.top.tips("标题不可以为空！", 6, 5, 2000);
        } else {
            var principalGroup = '${principalGroup}';
            //部门负责人是多个
            if (principalGroup !== '') {
                var principalList = JSON.parse(principalGroup);
                window.top.selectPrincipal(principalList);

                //部门负责人是单个
            } else {
                var officeSupplies = [];
                var tel = $('#tbo').find('tr');
                for (let i = 0; i < tel.length; i++) {
                    var it = $(tel[i]).find('td').find('#item' + (i + 1)).val();
                    var nb = $(tel[i]).find('td').find('#number' + (i + 1)).val();
                    var pr = $(tel[i]).find('td').find('#price' + (i + 1)).val();
                    var mo = $(tel[i]).find('td').find('#money' + (i + 1)).val();
                    officeSupplies.push({
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

                var tit = $('#title').val();
                var dep = $('#department').val();
                var pp = $('#preparer').val();
                var fd = $('#fillingDate').val();
                var tt = $('#total').val();
                var an = $('#annex').val();
                var oaActOfficeSupplies = {
                    title: tit,
                    department: dep,
                    preparer: pp,
                    fillingDate: fd,
                    total: tt,
                    oaOfficeSuppliesList: officeSupplies,
                    annex: an,
                    departmentPrincipal:"single"
                };

                $.ajax({
                    type: "POST",
                    url: '${path}/officeSupplies/add',
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify(oaActOfficeSupplies),
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
    }

    //根据勾选的部门负责人发送
    function selectionPrincipal(principalId) {
        var officeSupplies = [];
        var tel = $('#tbo').find('tr');
        for (let i = 0; i < tel.length; i++) {
            var it = $(tel[i]).find('td').find('#item' + (i + 1)).val();
            var nb = $(tel[i]).find('td').find('#number' + (i + 1)).val();
            var pr = $(tel[i]).find('td').find('#price' + (i + 1)).val();
            var mo = $(tel[i]).find('td').find('#money' + (i + 1)).val();
            officeSupplies.push({
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

        var tit = $('#title').val();
        var dep = $('#department').val();
        var pp = $('#preparer').val();
        var fd = $('#fillingDate').val();
        var tt = $('#total').val();
        var an = $('#annex').val();
        var oaActOfficeSupplies = {
            title: tit,
            department: dep,
            preparer: pp,
            fillingDate: fd,
            total: tt,
            oaOfficeSuppliesList: officeSupplies,
            annex: an,
            departmentPrincipal:principalId
        };

        $.ajax({
            type: "POST",
            url: '${path}/officeSupplies/add',
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify(oaActOfficeSupplies),
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

    //保存待发
    function savePending() {
        var officeSupplies = [];
        var tel = $('#tbo').find('tr');
        for (let i = 0; i < tel.length; i++) {
            var it = $(tel[i]).find('td').find('#item' + (i + 1)).val();
            var nb = $(tel[i]).find('td').find('#number' + (i + 1)).val();
            var pr = $(tel[i]).find('td').find('#price' + (i + 1)).val();
            var mo = $(tel[i]).find('td').find('#money' + (i + 1)).val();
            officeSupplies.push({
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
            var dep = $('#department').val();
            var pp = $('#preparer').val();
            var fd = $('#fillingDate').val();
            var tt = $('#total').val();
            var an = $('#annex').val();
            var oaActOfficeSupplies = {
                title: tit,
                department: dep,
                preparer: pp,
                fillingDate: fd,
                total: tt,
                oaOfficeSuppliesList: officeSupplies,
                annex: an
            };

            $.ajax({
                type: "POST",
                url: '${path}/officeSupplies/savePending',
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(oaActOfficeSupplies),
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
        $('#tool,#titleArea,#annexList,#addRow').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool,#titleArea,#addRow').show();
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

