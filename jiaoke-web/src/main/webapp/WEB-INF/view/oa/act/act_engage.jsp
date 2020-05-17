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
    <title>职称（技术等级）评聘申请表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body">

<div class="table-title">
    <span>职称（技术等级）评聘申请表</span>
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

<form id="oaActEngage">
    <div class="form_area" id="titleArea" style="margin-bottom: 15px">
        <table>
            <tbody>
            <tr>
                <td nowrap="nowrap" style="width: 4%">
                    <button type="button" class="table-tab-send" onclick="send()">发送</button>
                </td>

                <th nowrap="nowrap" class="th_title" style="width: 4%">标题</th>
                <td style="width: 29%">
                    <div class="common_input_frame">
                        <input type="text" id="title" name="title" placeholder="请输入标题" title="点击此处填写标题"
                               value="职称（技术等级）评聘申请表(${nickname} <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>)"
                               autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="人事(查阅)→发起者部门负责人→发起者部门主管→人事(查阅)→人事主管→总经理→评聘小组→人事→发起人、人事(知会)"
                               readonly="readonly">
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">申请人姓名</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="applicant" value="${nickname}" readonly>
                <input type="hidden" id="departmentPrincipal" name="departmentPrincipal">
            </td>

            <td class="tdLabel">所在部门及岗位</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="department" value="${department} - ${position}" readonly>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">
                <span style="display: block;line-height: 20px;font-size: 13px;">拟评聘职称</span>
                <span style="display: block;line-height: 20px;font-size: 13px;">（技术等级）名称</span>
            </td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="undoutedly" autocomplete="off">
            </td>

            <td class="tdLabel">考试时间</td>
            <td class="table-td-content">
                <input type="text" class="formInput entry-date" name="examTime" onfocus="this.blur()">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">证书取得时间</td>
            <td class="table-td-content">
                <input type="text" class="formInput certificate-date" name="certificate" onfocus="this.blur()">
            </td>

            <td class="tdLabel">本人签名</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="signature" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;width: 50%">部门负责人意见</td>
            <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;">部门主管意见</td>
        </tr>

        <tr>
            <td colspan="2" class="table-td-textarea" style="line-height: 0">
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

            <td colspan="2" class="table-td-textarea" style="line-height: 0">
                <div class="opinion-supervisor" style="width: 100%">
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
            <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;">人事主管意见</td>
            <td class="tdLabel" colspan="2" style="text-align: left;text-indent: 20px;">总经理意见</td>
        </tr>

        <tr>
            <td colspan="2" class="approval-content">
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

            <td colspan="2" class="approval-content">
                <textarea class="approval-content-textarea" readonly></textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" readonly>
                </div>

                <%--暂存附件--%>
                <input type="hidden" id="annex" name="annex">
            </td>
        </tr>

        <tr>
            <td class="tdLabel" colspan="4" style="text-align: left;text-indent: 20px;">评聘小组意见</td>
        </tr>

        <tr>
            <td colspan="4" class="approval-content" style="padding: 10px;">
                <textarea class="approval-content-textarea" readonly></textarea>
            </td>
        </tr>

        <tr>
            <td class="tdLabel" style="padding: 10px;">
                <span style="display: block;line-height: 20px;font-size: 13px;">聘用职称</span>
                <span style="display: block;line-height: 20px;font-size: 13px;">（技术等级）名称</span>
            </td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" readonly>
            </td>

            <td class="tdLabel" style="padding: 10px;">
                <span style="display: block;line-height: 20px;font-size: 13px;">享受职称</span>
                <span style="display: block;line-height: 20px;font-size: 13px;">（技术等级）津贴时间</span>
            </td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" readonly>
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

    //发送
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
                $('#departmentPrincipal').val("single");

                var array = [];
                $('#annexes').find('input').each(function () {
                    array.push($(this).val());
                });

                //发送前将上传好的附件插入form中
                $('#annex').val(array);

                $.ajax({
                    type: "POST",
                    url: '${path}/engage/add',
                    data: $('#oaActEngage').serialize(),
                    error: function (request) {
                        layer.msg("出错！");
                    },
                    success: function (result) {
                        if (result === "success") {
                            window.location.href = "${path}/oaIndex.do";
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
        $('#departmentPrincipal').val(principalId);

        var array = [];
        $('#annexes').find('input').each(function () {
            array.push($(this).val());
        });

        //发送前将上传好的附件插入form中
        $('#annex').val(array);

        $.ajax({
            type: "POST",
            url: '${path}/engage/add',
            data: $('#oaActEngage').serialize(),
            error: function (request) {
                layer.msg("出错！");
            },
            success: function (result) {
                if (result === "success") {
                    window.location.href = "${path}/oaIndex.do";
                    window.top.tips("发送成功！", 0, 1, 2000);
                } else {
                    window.top.tips('发送失败！', 0, 2, 2000);
                }
            }
        })
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
                url: '${path}/engage/savePending',
                data: $('#oaActEngage').serialize(),
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

