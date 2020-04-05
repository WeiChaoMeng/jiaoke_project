<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>办公用品领用</title>
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
    </style>
</head>

<body id="body" style="width: 65%">

<div class="table-title">
    <span>办公用品领用</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top_toolbar_inside">

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
                               value="办公用品领用(${nickname} <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>)"
                               autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="保管员(审批)、发起人(知会)"
                               readonly="readonly">
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <table class="formTable" style="margin: 0">
        <thead>
        <tr>
            <th style="width: 10%">序号</th>
            <th style="width: 60%">办公用品名称</th>
            <th style="width: 15%">库存数量</th>
            <th style="width: 15%">领取数量</th>
        </tr>
        </thead>

        <tbody id="tbo">

        <c:choose>
            <c:when test="${assetManagementList.size() == 0}">
                <tr>
                    <td colspan="4" class="table-td-content" style="height: 40px;text-align: center;">暂无库存</td>
                </tr>
            </c:when>

            <c:otherwise>
                <c:forEach items="${assetManagementList}" var="assetManagement" varStatus="status">
                    <tr>
                        <td class="table-td-content" style="text-align: center;">${status.index+1}</td>

                        <td class="table-td-content">
                            <input type="text" class="formInput-readonly" name="name" id="name"
                                   value="${assetManagement.assetsName}" readonly>
                            <input type="hidden" name="id" id="assetId" value="${assetManagement.id}">
                        </td>

                        <td class="table-td-content" style="text-align: center">
                            <span>${assetManagement.productQuantity}</span>
                        </td>

                        <td class="table-td-content">
                            <input type="number" class="formInput" style="line-height: 28px;" name="number" id="number"
                                   onkeydown="return false;" max="${assetManagement.productQuantity}" min="0" value="0"
                                   autocomplete="off">
                        </td>

                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>

        </tbody>

        <table class="formTable">
            <tr>
                <td class="tdLabel">领用部门</td>
                <td class="table-td-content">
                    <input type="text" class="formInput-readonly" name="recipientsDepartment" id="recipientsDepartment"
                           value="${department}" readonly>
                </td>

                <td class="tdLabel">领用人签字</td>
                <td class="table-td-content">
                    <input type="text" class="formInput-readonly" name="recipientsPreparer" id="recipientsPreparer"
                           value="${nickname}" readonly>

                </td>

                <td class="tdLabel">领用日期</td>
                <td class="table-td-content">
                    <input type="text" class="formInput-readonly" name="recipientsDate" id="recipientsDate"
                           value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date())%>" readonly>
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

    //发送
    function send() {
        var officeSuppliesUse = [];
        var tel = $('#tbo').find('tr');
        for (let i = 0; i < tel.length; i++) {
            var ai = $(tel[i]).find('td').find('#assetId').val();
            var na = $(tel[i]).find('td').find('#name').val();
            var nb = $(tel[i]).find('td').find('#number').val();
            officeSuppliesUse.push({
                assetId: ai,
                name: na,
                number: nb
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
            var dep = $('#recipientsDepartment').val();
            var pp = $('#recipientsPreparer').val();
            var fd = $('#recipientsDate').val();
            var an = $('#annex').val();
            var oaActOfficeSuppliesUse = {
                title: tit,
                recipientsDepartment: dep,
                recipientsPreparer: pp,
                recipientsDate: fd,
                oaOfficeSuppliesUseList: officeSuppliesUse,
                annex: an
            };

            $.ajax({
                type: "POST",
                url: '${path}/officeSuppliesUse/add',
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(oaActOfficeSuppliesUse),
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

