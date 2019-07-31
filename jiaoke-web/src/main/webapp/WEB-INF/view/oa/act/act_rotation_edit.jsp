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
    <title>员工轮岗审批表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body">

<div class="table-title">
    <span>员工轮岗审批表</span>
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

<form id="oaActRotation">
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
                               value="${oaActRotation.title}" autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程:</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text"
                               placeholder="发起者部门(审批)、分管部门(审批)、劳资部门(审批)、总经理(审批)、发起人(协同)"
                               readonly>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <span class="fill-in-date">填表日期：${oaActRotation.createTimeStr}</span>

    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">姓名</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="name" value="${oaActRotation.name}" readonly>
                <input type="hidden" id="annex" name="annex">
                <input type="hidden" id="id" name="id" value="${oaActRotation.id}">
            </td>

            <td class="tdLabel">性别</td>
            <td class="table-td-content">
                <select class="select" name="sex">
                    <c:choose>
                        <c:when test="${oaActRotation.sex == 0}">
                            <option value="0" selected>男</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0">男</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaActRotation.sex == 1}">
                            <option value="1" selected>女</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1">女</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </td>

            <td class="tdLabel">出生年月</td>
            <td class="table-td-content">
                <input type="text" class="formInput entry-date" name="birthdayStr" value="${oaActRotation.birthdayStr}"
                       onfocus="this.blur()">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">名族</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="ethnic" value="${oaActRotation.ethnic}" autocomplete="off">
            </td>

            <td class="tdLabel">学历</td>
            <td class="table-td-content">
                <select class="select" name="education">
                    <c:choose>
                        <c:when test="${oaActRotation.education == 0}">
                            <option value="0" selected>初中及以下</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0">初中及以下</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaActRotation.education == 1}">
                            <option value="1" selected>中专/中技</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1">中专/中技</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaActRotation.education == 2}">
                            <option value="2" selected>高中</option>
                        </c:when>
                        <c:otherwise>
                            <option value="2">高中</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaActRotation.education == 3}">
                            <option value="3" selected>大专</option>
                        </c:when>
                        <c:otherwise>
                            <option value="3">大专</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaActRotation.education == 4}">
                            <option value="4" selected>本科</option>
                        </c:when>
                        <c:otherwise>
                            <option value="4">本科</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaActRotation.education == 5}">
                            <option value="5" selected>硕士</option>
                        </c:when>
                        <c:otherwise>
                            <option value="5">硕士</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaActRotation.education == 6}">
                            <option value="6" selected>博士</option>
                        </c:when>
                        <c:otherwise>
                            <option value="6">博士</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </td>

            <td class="tdLabel">专业</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="major" value="${oaActRotation.major}" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">所在部门</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="department" value="${oaActRotation.department}"
                       readonly>
            </td>

            <td class="tdLabel">现工作岗位</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="presentPost" value="${oaActRotation.presentPost}"
                       autocomplete="off">
            </td>

            <td class="tdLabel">担任本岗位起始时间</td>
            <td class="table-td-content">
                <input type="text" class="formInput starting-time" name="startingTime"
                       value="${oaActRotation.startingTime}" onfocus="this.blur()">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">调整原因</td>
            <td colspan="5" class="table-td-content" id="adjustReasons">
                <c:choose>
                    <c:when test="${oaActRotation.adjust == 0}">
                        <span>关键岗位工作满5年
                            <input type="checkbox" name="adjust" value="0"
                                   style="vertical-align: middle;margin-left: 5px" checked>
                        </span>
                    </c:when>
                    <c:otherwise>
                        <span>关键岗位工作满5年
                            <input type="checkbox" name="adjust" value="0"
                                   style="vertical-align: middle;margin-left: 5px">
                        </span>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${oaActRotation.adjust == 1}">
                        <span style="margin-left: 50px">自愿申请
                            <input type="checkbox" name="adjust" value="1"
                                   style="vertical-align: middle;margin-left: 5px"
                                   checked>
                        </span>
                    </c:when>
                    <c:otherwise>
                        <span style="margin-left: 50px">自愿申请
                            <input type="checkbox" name="adjust" value="1"
                                   style="vertical-align: middle;margin-left: 5px">
                        </span>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${oaActRotation.adjust == 2}">
                        <span style="margin-left: 50px">工作需要
                            <input type="checkbox" name="adjust" value="2"
                                   style="vertical-align: middle;margin-left: 5px" checked>
                        </span>
                    </c:when>
                    <c:otherwise>
                        <span style="margin-left: 50px">工作需要
                            <input type="checkbox" name="adjust" value="2"
                                   style="vertical-align: middle;margin-left: 5px">
                        </span>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">所在部门意见</td>
            <td colspan="5" class="approval-content">
                <textarea readonly class="approval-content-textarea"></textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期:</label>
                    <input class="approval-date-input" type="text" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字:</label>
                    <input class="approval-signature-input" type="text" readonly>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">分管部门意见</td>
            <td colspan="5" class="approval-content">
                <textarea readonly class="approval-content-textarea"></textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期:</label>
                    <input class="approval-date-input" type="text" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字:</label>
                    <input class="approval-signature-input" type="text" readonly>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">劳资部门意见</td>
            <td colspan="5" class="approval-content">
                <textarea readonly class="approval-content-textarea"></textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期:</label>
                    <input class="approval-date-input" type="text" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字:</label>
                    <input class="approval-signature-input" type="text" readonly>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">总经理意见</td>
            <td colspan="5" class="approval-content">
                <textarea readonly class="approval-content-textarea"></textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期:</label>
                    <input class="approval-date-input" type="text" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字:</label>
                    <input class="approval-signature-input" type="text" readonly>
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
    jeDate(".entry-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    //日期选择器
    jeDate(".starting-time", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        multiPane: false,
        range: " 至 ",
        zIndex: 100000,
    });

    $(document).ready(function () {
        $('#adjustReasons').find('input[type=checkbox]').bind('click', function () {
            $('#adjustReasons').find('input[type=checkbox]').not(this).prop("checked", false);
        });
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
                url: '${path}/rotation/editAdd',
                data: $('#oaActRotation').serialize(),
                error: function (request) {
                    layer.msg("出错！");
                },
                success: function (result) {
                    if (result === "success") {
                        window.location.href = "${path}/oaIndex.do";
                        window.top.tips("发送成功！", 0, 1, 1000);
                    } else {
                        window.top.tips('发送失败！', 0, 2, 1000);
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
            layer.msg("标题不可以为空！")
        } else {
            //发送前将上传好的附件插入form中
            $('#annex').val(array);

            $.ajax({
                type: "POST",
                url: '${path}/rotation/edit',
                data: $('#oaActRotation').serialize(),
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

    //附件列表
    $(function () {
        var annexList = JSON.parse('${annexList}');
        if (annexList !== "") {
            var ret = annexList.split(',');
            $('#annexList').css("display", "block");
            for (let i = 0; i < ret.length; i++) {

                var annex = '';
                var uuid = ret[i].substring(0, ret[i].indexOf("_"));
                var originalName = ret[i].substring(ret[i].lastIndexOf("_") + 1, ret[i].length);

                annex += '<div id="file' + uuid + '" class="table-file">';
                annex += '<div class="table-file-content">';
                annex += '<a class="table-file-title" href="/fileDownloadHandle/download?fileName=' + ret[i] + '" title="' + originalName + '">' + originalName + '</a>';
                annex += '<span class="delete-file" title="删除" onclick="whether(\'' + ret[i] + '\')">&#xeabb;</span>';
                annex += '<input type="hidden" value="' + ret[i] + '">';
                annex += '</div>';
                annex += '</div>';
                $('#annexes').append(annex);
            }
        }
    });


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
            async: false,
            type: "POST",
            url: '${path}/fileUploadHandle/deleteFile',
            data: {"fileName": fileName},
            error: function (request) {
                layer.msg("出错！");
            },
            success: function (result) {
                if (result === "success") {

                    //删除页面中文件
                    $('#file' + fileName.substring(0, fileName.indexOf("_"))).remove();

                    //影藏页面中附件列表
                    let annexesLen = $('#annexes').children().length;
                    if (annexesLen === 0) {
                        $('#annexList').css("display", "none");
                    }

                    //删除数据库中附件
                    var array = [];
                    $('#annexes').find('input').each(function () {
                        array.push($(this).val());
                    });

                    var id = $('#id').val();

                    $.ajax({
                        type: "POST",
                        url: '${path}/rotation/deleteAnnexes',
                        data: {'array': array, 'id': id},
                        traditional: true,
                        async: false,
                        error: function (request) {
                            layer.msg("出错！");
                        },
                        success: function (result) {
                            if (result === "success") {
                                window.top.tips("删除成功！", 0, 1, 2000);
                            } else {
                                window.top.tips("删除失败！", 0, 2, 1000);
                            }
                        }
                    });
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

