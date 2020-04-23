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
    <title>劳动合同签订、续订、变更、终止审批表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body" style="width: 70%">

<div class="table-title">
    <span>劳动合同签订、续订、变更、终止审批表</span>
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

<form id="oaActLaborContractRenewal">
    <div class="form_area" id="titleArea" style="margin-bottom: 15px">
        <table>
            <tbody>
            <tr>
                <td nowrap="nowrap" style="width: 4%">
                    <button type="button" class="table-tab-send" onclick="send()">发送</button>
                </td>

                <th nowrap="nowrap" class="th_title" style="width: 4%">标题</th>
                <td style="width: 39%">
                    <div class="common_input_frame">
                        <input type="text" id="title" name="title" placeholder="请输入标题" title="点击此处填写标题"
                               value="劳动合同签订、续订、变更、终止审批表(${nickname} <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>)"
                               autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="发起者部门负责人→发起者部门主管领导→人事部门→总经理→通知人、被通知人(知会)" readonly>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div>
        <div class="notice-content">
            <input type="text" class="notice-personnel-field" onclick="recipientSelect()" id="recipientName" readonly>与我公司签订的劳动合同将于
            <input class="agreement-start-end start-date" type="text" name="startDate" onfocus="this.blur()">到期，请各部门（领导）于
            <input class="agreement-start-end end-date" type="text" name="endDate" onfocus="this.blur()">前签署意见。
            <input type="hidden" id="recipientId" name="notifiedPerson">
            <input type="hidden" id="annex" name="annex">
            <input type="hidden" id="departmentPrincipal" name="departmentPrincipal">
        </div>
    </div>

    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">所在部门意见</td>
            <td colspan="5" class="approval-content">
                <textarea disabled="disabled" class="approval-content-textarea"></textarea>
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
            <td class="tdLabel">主管领导意见</td>
            <td colspan="5" class="approval-content">
                <textarea disabled="disabled" class="approval-content-textarea"></textarea>
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
            <td class="tdLabel">组织人事部门意见</td>
            <td colspan="5" class="approval-content">
                <textarea disabled="disabled" class="approval-content-textarea"></textarea>
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
            <td class="tdLabel">总经理意见</td>
            <td colspan="5" class="approval-content">
                <textarea disabled="disabled" class="approval-content-textarea"></textarea>
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
        </tbody>
    </table>
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
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    jeDate(".end-date", {
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
            if ($.trim($("#recipientId").val()) === '') {
                window.top.tips("请选择要通知的人！", 6, 5, 1000);
            } else {

                var notifiedPerson = $('#recipientId').val();
                $.ajax({
                    type: "POST",
                    url: '${path}/laborContractRenewal/getNotifiedPersonPrincipal',
                    data: {'notifiedPerson':notifiedPerson},
                    error: function (request) {
                        layer.msg("出错！");
                    },
                    success: function (result) {
                        var data = JSON.parse(result);
                        if (data === "noData") {
                            $('#departmentPrincipal').val("single");

                            var array = [];
                            $('#annexes').find('input').each(function () {
                                array.push($(this).val());
                            });

                            //发送前将上传好的附件插入form中
                            $('#annex').val(array);

                            $.ajax({
                                type: "POST",
                                url: '${path}/laborContractRenewal/add',
                                data: $('#oaActLaborContractRenewal').serialize(),
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
                        } else {
                            window.top.selectPrincipal(data);
                        }
                    }
                });
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
            url: '${path}/laborContractRenewal/add',
            data: $('#oaActLaborContractRenewal').serialize(),
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

    //发送
    <%--function send() {--%>
        <%--if ($.trim($("#title").val()) === '') {--%>
            <%--window.top.tips("标题不可以为空！", 6, 5, 2000);--%>
        <%--} else {--%>
            <%--if ($.trim($("#recipientId").val()) === '') {--%>
                <%--window.top.tips("请选择要通知的人！", 6, 5, 2000);--%>
            <%--} else {--%>
                <%--var array = [];--%>
                <%--$('#annexes').find('input').each(function () {--%>
                    <%--array.push($(this).val());--%>
                <%--});--%>

                <%--//发送前将上传好的附件插入form中--%>
                <%--$('#annex').val(array);--%>

                <%--$.ajax({--%>
                    <%--type: "POST",--%>
                    <%--url: '${path}/laborContractRenewal/add',--%>
                    <%--data: $('#oaActLaborContractRenewal').serialize(),--%>
                    <%--error: function (request) {--%>
                        <%--layer.msg("出错！");--%>
                    <%--},--%>
                    <%--success: function (result) {--%>
                        <%--if (result === "success") {--%>
                            <%--window.location.href = "${path}/oaIndex.do";--%>
                            <%--window.top.tips("发送成功！", 0, 1, 2000);--%>
                        <%--} else {--%>
                            <%--window.top.tips('发送失败！', 0, 2, 2000);--%>
                        <%--}--%>
                    <%--}--%>
                <%--})--%>
            <%--}--%>

        <%--}--%>
    <%--}--%>

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
                url: '${path}/laborContractRenewal/savePending',
                data: $('#oaActLaborContractRenewal').serialize(),
                error: function (request) {
                    layer.msg("出错！");
                },
                success: function (result) {
                    if (result === "success") {
                        window.location.href = "${path}/oaIndex.do";
                        window.top.tips("保存成功！");
                    } else {
                        window.top.tips("保存失败！");
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
        $('#body').css('width', '70%');

        //附件列表
        let annexesLen = $('#annexes').children().length;
        if (annexesLen === 0) {
            $('#annexList').css("display", "none");
        } else {
            $('#annexList').css("display", "block");
        }
    }

    //选择接收人
    function recipientSelect() {
        //用户
        var userInfoList = JSON.parse('${userInfoList}');
        //部门
        var departmentList = JSON.parse('${departmentList}');
        window.top.selectRecipient(userInfoList, departmentList);
    }

    //确认接收人
    function confirmSelectRecipient(id, name) {
        $('#recipientId').val(id);
        $('#recipientName').val(name);
    }
</script>
</html>

