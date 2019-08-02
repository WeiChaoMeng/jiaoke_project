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
    <title>劳动合同终止通知书</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body">

<div class="table-title">
    <span>劳动合同终止通知书</span>
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

<form id="oaActLaborContractStop">
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
                        <input type="text" id="title" name="title" placeholder="请输入标题" title="点击此处填写标题" value="${oaActLaborContractStop.title}" autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程:</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="接收人、通知人(协同)" readonly="readonly">
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div>
        <div class="notice-personnel">
            <input type="text" class="notice-personnel-field" name="name" value="${oaActLaborContractStop.name}" autocomplete="off">:
        </div>

        <div class="notice-content">
            你与我公司签订的合同期为
            <input class="agreement-start-end start-date" type="text" name="startDate" value="${oaActLaborContractStop.startDate}" onfocus="this.blur()">至
            <input class="agreement-start-end end-date" type="text" name="endDate" value="${oaActLaborContractStop.endDate}" onfocus="this.blur()">的劳动合同将于
            <input type="text" class="agreement-days" name="number" value="${oaActLaborContractStop.number}" autocomplete="off"
                   oninput="value=value.replace(/^(0+)|[^\d]/g,'')">天后到期。（附《劳动合同续订个人意向》）
            <input type="hidden" id="annex" name="annex">
            <input type="hidden" id="id" name="id" value="${oaActLaborContractStop.id}">
        </div>

        <div class="notice-content">特此通知。</div>

        <div class="notice-sign">
            <div class="notice-sign-position">
                <label>通知人：</label>
                <input class="notice-relevant-personnel" type="text" value="${oaActLaborContractStop.promoterStr}" readonly>
                <input class="notice-date" type="text" name="noticeDate" value="${oaActLaborContractStop.noticeDate}" readonly>
            </div>
        </div>

        <div class="notice-sign">
            <div class="notice-seal">
                <span>(盖章)</span>
            </div>
        </div>

        <div class="notice-sign">
            <div class="notice-sign-position">
                <label>接收人：</label>
                <input class="notice-relevant-personnel" type="text" disabled>
                <input class="notice-date" type="text"
                       value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日"
                       disabled>
            </div>
        </div>
    </div>

    <table class="form-table">
        <tbody>
        <tr>
            <td colspan="6" class="tdLabel" style="padding: 0;text-align: center">劳动合同续订个人意向</td>
        </tr>

        <tr>
            <td class="td-column-three" colspan="2">不续订劳动合同</td>
            <td class="td-column-three" colspan="2">与公司续订有固定期劳动合同</td>
            <td class="td-column-three" colspan="2">申请与公司续订无固定期劳动合同</td>
        </tr>

        <tr id="renewal">
            <c:choose>
                <c:when test="${oaActLaborContractStop.renewal == 0}">
                    <td colspan="2" style="height: 30px;text-align: center">
                        <input type="checkbox" name="renewal" value="0" style="vertical-align: middle;margin-left: 5px" checked>
                    </td>
                </c:when>
                <c:otherwise>
                    <td colspan="2" style="height: 30px;text-align: center">
                        <input type="checkbox" name="renewal" value="0" style="vertical-align: middle;margin-left: 5px">
                    </td>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${oaActLaborContractStop.renewal == 1}">
                    <td colspan="2" style="height: 30px;text-align: center">
                        <input type="checkbox" name="renewal" value="1" style="vertical-align: middle;margin-left: 5px" checked>
                    </td>
                </c:when>
                <c:otherwise>
                    <td colspan="2" style="height: 30px;text-align: center">
                        <input type="checkbox" name="renewal" value="1" style="vertical-align: middle;margin-left: 5px">
                    </td>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${oaActLaborContractStop.renewal == 2}">
                    <td colspan="2" style="height: 30px;text-align: center">
                        <input type="checkbox" name="renewal" value="2" style="vertical-align: middle;margin-left: 5px" checked>
                    </td>
                </c:when>
                <c:otherwise>
                    <td colspan="2" style="height: 30px;text-align: center">
                        <input type="checkbox" name="renewal" value="2" style="vertical-align: middle;margin-left: 5px">
                    </td>
                </c:otherwise>
            </c:choose>
        </tr>

        <tr>
            <td class="notice-td-label">其他需要补充的内容</td>
            <td colspan="5" class="table-td-evaluation">
                <textarea class="evaluation-content" style="height: 90px" name="supplementDetails">${oaActLaborContractStop.supplementDetails}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期:</label>
                    <input class="approval-date-input" type="text" value="${oaActLaborContractStop.createTimeStr}" disabled="disabled">
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">本人签字:</label>
                    <input class="approval-signature-input" type="text" value="${oaActLaborContractStop.createTimeStr}" disabled="disabled">
                </div>
            </td>
        </tr>
        </tbody>
    </table>

    <div class="notice-tips">
        <span class="notice-tips-mark">*</span>
        <span class="notice-tips-script">此通知一式两份，接收人、公司各执一份。</span>
    </div>
</form>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/jeDate/src/jedate.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //日期选择器
    jeDate(".start-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY年MM月DD日",
        zIndex: 100000,
    });

    jeDate(".end-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY年MM月DD日",
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
                url: '${path}/laborContractStop/editAdd',
                data: $('#oaActLaborContractStop').serialize(),
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
                url: '${path}/laborContractStop/edit',
                data: $('#oaActLaborContractStop').serialize(),
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
                        url: '${path}/laborContractStop/deleteAnnexes',
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

