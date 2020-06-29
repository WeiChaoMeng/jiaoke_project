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
    <title>毕业生见习期满考核鉴定表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
    <style>
        .tdLabel{
            width: 10%;
        }

        .opinion-column-Juxtaposition{
            height: 70%;
        }
    </style>
</head>

<body id="body">

<div class="table-title">
    <span>毕业生见习期满考核鉴定表</span>
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

<form id="oaActTrainee">
    <div class="form_area" id="titleArea" style="margin-bottom: 15px">
        <table>
            <tbody>
            <tr>
                <td nowrap="nowrap" style="width: 4%">
                    <button type="button" class="table-tab-send" onclick="send()">发送</button>
                </td>

                <th nowrap="nowrap" class="th_title" style="width: 4%">标题</th>
                <td style="width: 35%">
                    <div class="common_input_frame">
                        <input type="text" id="title" name="title" placeholder="请输入标题" title="点击此处填写标题"
                               value="毕业生见习期满考核鉴定表(${nickname} <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>)"
                               autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="人事(查阅)→总经理→发起人、人事(知会)" readonly="readonly">
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <span class="filling-date" style="float: left">单位（部门）名称：</span>
    <input type="text" style="float: left;width: 200px;" class="filling-date-content" name="corporation" value="北京市政路桥建材集团有限公司路驰分公司" readonly>

    <input type="text" class="filling-date-content" name="fillingTime"
           value="<%=new SimpleDateFormat("yyyy年MM月dd日").format(new Date())%>" readonly>
    <span class="filling-date">填表日期：</span>


    <table class="formTable" style="margin: 0">
        <tbody>
        <tr>
            <td class="tdLabel">姓名</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="name" value="${nickname}" readonly>
            </td>

            <td class="tdLabel">性别</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="sex" value="${sex}" readonly>
            </td>

            <td class="tdLabel">出生年月</td>
            <td class="table-td-content">
                <input type="text" class="formInput entry-date" name="birthday" onfocus="this.blur()">
            </td>

            <td class="tdLabel">参加工作时间</td>
            <td class="table-td-content">
                <input type="text" class="formInput certificate-date" name="workingHours" onfocus="this.blur()">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">学历</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="education" autocomplete="off">
            </td>

            <td class="tdLabel">何时毕业于何校</td>
            <td class="table-td-content" colspan="3">
                <input type="text" class="formInput" name="school" autocomplete="off">
            </td>

            <td class="tdLabel">学制</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="schoolSystem" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel" style="width: 5%;text-align: center;padding: 15px 0;line-height: normal;">本<br/>人<br/>简<br/>(学)<br/>历</td>
            <td colspan="7" class="approval-content" style="padding: 10px;">
                <textarea class="write-approval-content-textarea" name="resume" style="height: 100%;"></textarea>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" colspan="8" style="padding: 0;text-align: center;">大中专院校毕业见习期：从
                <input type="text" class="formInput graduation-date" style="width: 10%" name="internship" onfocus="this.blur()">
                见习期工资<input type="text" class="formInput" style="width: 10%" name="wages" autocomplete="off">元/月</td>
        </tr>

        <tr>
            <td class="tdLabel" style="width: 5%;text-align: center;padding: 15px 0;line-height: normal;">自<br/>我<br/>鉴<br/>定</td>
            <td colspan="7" class="approval-content" style="padding: 10px;">
                <textarea class="write-approval-content-textarea" style="height: 100%;" name="selfAccreditation"></textarea>
            </td>
        </tr>
        </tbody>
    </table>

    <table class="formTable" style="margin: 0">
        <tbody>
        <tr>
            <td class="tdLabel" rowspan="2" style="width: 5%;text-align: center;padding: 15px 0;line-height: normal;">定<br/>级</td>
            <td class="tdLabel" style="line-height: normal;width: 5%;text-align: center;padding: 15px 0;">单<br/>位<br/>或<br/>部<br/>门<br/>意<br/>见</td>
            <td colspan="6" class="table-td-textarea" style="line-height: 0">
                <div class="opinion-principal" style="width: 100%">
                    <textarea class="opinion-column-Juxtaposition" readonly></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" readonly>
                    </div>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" style="line-height: normal;width: 5%;text-align: center;padding: 15px 0;">单<br/>位<br/>审<br/>批<br/>意<br/>见</td>
            <td colspan="6" class="table-td-textarea" style="line-height: 0">
                <div class="opinion-principal" style="width: 100%">
                    <textarea class="opinion-column-Juxtaposition" readonly></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" readonly>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" readonly>
                    </div>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" colspan="2">备注</td>
            <td class="table-td-content" colspan="6" style="padding: 10px;">
                <textarea class="write-approval-content-textarea" name="remarks"></textarea>
                <input type="hidden" id="annex" name="annex">
            </td>
        </tr>
        </tbody>
    </table>
    <div style="margin-bottom: 20px;">
        <span>注：本表一式二份，归入本人档案一份，本单位人事部门留存一份。</span>
        <span style="display: block;text-align: right;">控股公司组织人事部制</span>
    </div>
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
    jeDate(".certificate-date", {
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
    jeDate(".graduation-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY年MM月DD日",
        zIndex: 100000,
    });

    var itselfFrameId;
    $(function () {
        itselfFrameId = window.frameElement && window.frameElement.id || '';
    });

    //发送
    function send() {
        if ($.trim($("#title").val()) === '') {
            window.top.tips("标题不可以为空！", 6, 5, 2000);
        } else {
            var array = [];
            $('#annexes').find('input').each(function () {
                array.push($(this).val());
            });

            //发送前将上传好的附件插入form中
            $('#annex').val(array);

            $.ajax({
                type: "POST",
                url: '${path}/trainee/add',
                data: $('#oaActTrainee').serialize(),
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

    //保存待发
    function savePending() {
        if ($.trim($("#title").val()) === '') {
            layer.msg("标题不可以为空！")
        } else {
            var array = [];
            $('#annexes').find('input').each(function () {
                array.push($(this).val());
            });

            //发送前将上传好的附件插入form中
            $('#annex').val(array);

            $.ajax({
                type: "POST",
                url: '${path}/trainee/savePending',
                data: $('#oaActTrainee').serialize(),
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

