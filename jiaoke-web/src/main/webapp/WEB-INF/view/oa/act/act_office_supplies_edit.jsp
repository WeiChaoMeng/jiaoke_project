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
    <title>办公用品需求计划</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <style>
        .table-td-content {
            padding: 10px;
        }

        .tdLabel {
            text-align: left;
            padding-left: 10px;
        }

        .approval-div-style {
            width: 100%;
            margin-bottom: 10px;
            display: inline-block;
        }

        .approval-input {
            width: 20%;
            float: left;
        }

        .approval-input-span {
            font-size: 13px;
            width: 40%;
            display: inline-block;
            float: left;
            line-height: 29px;
            text-align: right;
            text-indent: 5px;
        }

        .approval-input-input {
            border: 0;
            border-bottom: 1px #000 solid;
            width: 60%;
            outline: none;
            height: 28px;
            text-align: left;
            font-weight: 500;
            color: #000;
            text-indent: 5px;
            font-size: 13px;
            float: left;
            cursor: no-drop;
        }

        .order-number-style{
            height: 28px;display: inline-block;line-height: 28px;font-size: 14px;
        }
    </style>
</head>

<body id="body">

<div class="table-title">
    <span>编辑设备维修申请单</span>
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
        <c:when test="${oaActOfficeSupplies.annex != ''}">
            <div class="top_toolbar" id="annexList" style="display: block;">
                <div class="top-toolbar-annexes">

                    <div class="annexes-icon">
                        <button type="button" class="cursor_hand">&#xeac1; ：</button>
                    </div>

                    <div id="annexes">
                        <c:forTokens items="${oaActOfficeSupplies.annex}" delims="," var="annex">
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
                               value="${oaActOfficeSupplies.title}" autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="王玉秋(审批)、发起者部门负责人(审批)、卢静(审批)"
                               readonly="readonly">
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div>
        <span class="form-number-left" style="margin-top: 0">部门
            <input type="text" class="form-number-content" style="cursor: no-drop" name="department"
                   value="${oaActOfficeSupplies.department}" readonly>
        </span>
    </div>

    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel" style="width: 7%">序号</td>
            <td class="tdLabel" style="width: 45%">项目</td>
            <td class="tdLabel" style="width: 16%">数量</td>
            <td class="tdLabel" style="width: 16%">单价</td>
            <td class="tdLabel" style="width: 16%">金额(元)</td>
        </tr>

        <tr>
            <td class="table-td-content" style="text-align: center;"><span class="order-number-style">1</span></td>
            <td class="table-td-content"><input type="text" class="formInput" name="itemOne" value="${oaActOfficeSupplies.itemOne}" autocomplete="off"></td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="numberOne" value="${oaActOfficeSupplies.numberOne}" id="numberOne" onchange="dataOne()"
                       onkeyup="value=value.replace(/[^\d]/g,'').replace(/^0{1,}/g,'')" autocomplete="off">
            </td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="priceOne" value="${oaActOfficeSupplies.priceOne}" id="priceOne" onchange="dataOne()"
                       onkeyup="value=value.replace(/^\D*(\d*(?:\.\d{0,2})?).*$/g, '$1')" autocomplete="off">
            </td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="moneyOne" value="${oaActOfficeSupplies.moneyOne}" id="moneyOne" readonly>
            </td>
        </tr>

        <tr>
            <td class="table-td-content" style="text-align: center;"><span class="order-number-style">2</span></td>
            <td class="table-td-content"><input type="text" class="formInput" name="itemTwo" value="${oaActOfficeSupplies.itemTwo}" autocomplete="off"></td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="numberTwo" value="${oaActOfficeSupplies.numberTwo}" id="numberTwo" onchange="dataTwo()"
                       onkeyup="value=value.replace(/[^\d]/g,'').replace(/^0{1,}/g,'')" autocomplete="off">
            </td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="priceTwo" value="${oaActOfficeSupplies.priceTwo}" id="priceTwo" onchange="dataTwo()"
                       onkeyup="value=value.replace(/^\D*(\d*(?:\.\d{0,2})?).*$/g, '$1')" autocomplete="off">
            </td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="moneyTwo" value="${oaActOfficeSupplies.moneyTwo}" id="moneyTwo" readonly>
            </td>
        </tr>

        <tr>
            <td class="table-td-content" style="text-align: center;"><span class="order-number-style">3</span></td>
            </td>
            <td class="table-td-content"><input type="text" class="formInput" name="itemThree" value="${oaActOfficeSupplies.itemThree}" autocomplete="off"></td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="numberThree" value="${oaActOfficeSupplies.numberThree}" id="numberThree" onchange="dataThree()"
                       onkeyup="value=value.replace(/[^\d]/g,'').replace(/^0{1,}/g,'')" autocomplete="off">
            </td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="priceThree" value="${oaActOfficeSupplies.priceThree}" id="priceThree" onchange="dataThree()"
                       onkeyup="value=value.replace(/^\D*(\d*(?:\.\d{0,2})?).*$/g, '$1')" autocomplete="off">
            </td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="moneyThree" value="${oaActOfficeSupplies.moneyThree}" id="moneyThree" readonly>
            </td>
        </tr>

        <tr>
            <td class="table-td-content" style="text-align: center;"><span class="order-number-style">4</span></td>
            <td class="table-td-content"><input type="text" class="formInput" name="itemFour" value="${oaActOfficeSupplies.itemFour}" autocomplete="off"></td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="numberFour" value="${oaActOfficeSupplies.numberFour}" id="numberFour" onchange="dataFour()"
                       onkeyup="value=value.replace(/[^\d]/g,'').replace(/^0{1,}/g,'')" autocomplete="off">
            </td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="priceFour" value="${oaActOfficeSupplies.priceFour}" id="priceFour" onchange="dataFour()"
                       onkeyup="value=value.replace(/^\D*(\d*(?:\.\d{0,2})?).*$/g, '$1')" autocomplete="off">
            </td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="moneyFour" value="${oaActOfficeSupplies.moneyFour}" id="moneyFour" readonly>
            </td>
        </tr>

        <tr>
            <td class="table-td-content" style="text-align: center;"><span class="order-number-style">5</span></td>
            <td class="table-td-content"><input type="text" class="formInput" value="${oaActOfficeSupplies.itemFive}" name="itemFive" autocomplete="off"></td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="numberFive" value="${oaActOfficeSupplies.numberFive}" id="numberFive" onchange="dataFive()"
                       onkeyup="value=value.replace(/[^\d]/g,'').replace(/^0{1,}/g,'')" autocomplete="off">
            </td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="priceFive" value="${oaActOfficeSupplies.priceFive}" id="priceFive" onchange="dataFive()"
                       onkeyup="value=value.replace(/^\D*(\d*(?:\.\d{0,2})?).*$/g, '$1')" autocomplete="off">
            </td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="moneyFive" value="${oaActOfficeSupplies.moneyFive}" id="moneyFive" readonly>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" style="width: 0;text-align: right;">合计</td>
            <td class="table-td-content" colspan="4">
                <input type="text" class="formInput-readonly" name="total" value="${oaActOfficeSupplies.total}" id="total" readonly>
                <input type="hidden" name="id" value="${oaActOfficeSupplies.id}">
                <input type="hidden" name="promoter" value="${oaActOfficeSupplies.promoter}">
                <input type="hidden" name="url" value="${oaActOfficeSupplies.url}">
            </td>
            <%--暂存附件--%>
            <input type="hidden" id="annex" name="annex">
        </tr>
        </tbody>
    </table>

    <div class="approval-div-style">
        <div class="approval-input">
            <span class="approval-input-span">审批</span>
            <input type="text" class="approval-input-input" readonly>
        </div>

        <div class="approval-input">
            <span class="approval-input-span">部门主管</span>
            <input type="text" class="approval-input-input" readonly>
        </div>

        <div class="approval-input">
            <span class="approval-input-span">填表人</span>
            <input type="text" class="approval-input-input" value="${oaActOfficeSupplies.preparer}" name="preparer" readonly>
        </div>

        <div class="approval-input">
            <span class="approval-input-span">验收</span>
            <input type="text" class="approval-input-input" readonly>
        </div>

        <div class="approval-input">
            <span class="approval-input-span">验收时间</span>
            <input type="text" class="approval-input-input" readonly>
        </div>
    </div>
</form>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    function dataOne() {
        var s1 = $('#numberOne').val().toString();
        var s2 = $('#priceOne').val().toString();
        if (s1 !== "" & s2 !== "") {
            $('#moneyOne').val(calculate(s1, s2));
            $('#total').val(sum());
        }
    }

    function dataTwo() {
        var s1 = $('#numberTwo').val().toString();
        var s2 = $('#priceTwo').val().toString();
        if (s1 !== "" & s2 !== "") {
            $('#moneyTwo').val(calculate(s1, s2));
            $('#total').val(sum());
        }
    }

    function dataThree() {
        var s1 = $('#numberThree').val().toString();
        var s2 = $('#priceThree').val().toString();
        if (s1 !== "" & s2 !== "") {
            $('#moneyThree').val(calculate(s1, s2));
            $('#total').val(sum());
        }
    }

    function dataFour() {
        var s1 = $('#numberFour').val().toString();
        var s2 = $('#priceFour').val().toString();
        if (s1 !== "" & s2 !== "") {
            $('#moneyFour').val(calculate(s1, s2));
            $('#total').val(sum());
        }
    }

    function dataFive() {
        var s1 = $('#numberFive').val().toString();
        var s2 = $('#priceFive').val().toString();
        if (s1 !== "" & s2 !== "") {
            $('#moneyFive').val(calculate(s1, s2));
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

    //合计
    function sum() {
        var m1 = $('#moneyOne').val();
        var m2 = $('#moneyTwo').val();
        var m3 = $('#moneyThree').val();
        var m4 = $('#moneyFour').val();
        var m5 = $('#moneyFive').val();

        var r1, r2, r3, r4, r5, m;

        try {
            r1 = m1.toString().split(".")[1].length
        } catch (e) {
            r1 = 0
        }

        try {
            r2 = m2.toString().split(".")[1].length
        } catch (e) {
            r2 = 0
        }

        try {
            r3 = m3.toString().split(".")[1].length
        } catch (e) {
            r3 = 0
        }

        try {
            r4 = m4.toString().split(".")[1].length
        } catch (e) {
            r4 = 0
        }

        try {
            r5 = m5.toString().split(".")[1].length
        } catch (e) {
            r5 = 0
        }

        m = Math.pow(10, Math.max(r1, r2, r3, r4, r5));
        return (m1 * m + m2 * m + m3 * m + m4 * m + m5 * m) / m
    }

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
                url: '${path}/officeSupplies/editAdd',
                data: $('#oaActOfficeSupplies').serialize(),
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
                url: '${path}/officeSupplies/edit',
                data: $('#oaActOfficeSupplies').serialize(),
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

