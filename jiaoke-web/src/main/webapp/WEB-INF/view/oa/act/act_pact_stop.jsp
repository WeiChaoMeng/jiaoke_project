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
    <title>劳务协议终止通知书</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body" style="width: 70%">

<div class="table-title">
    <span>劳务协议终止通知书</span>
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

<form id="oaActPactStop">
    <div class="form_area" id="titleArea" style="margin-bottom: 15px">
        <table>
            <tbody>
            <tr>
                <td nowrap="nowrap" style="width: 4%">
                    <button type="button" class="table-tab-send" onclick="send()">发送</button>
                </td>

                <th nowrap="nowrap" class="th_title" style="width: 5%">标题</th>
                <td style="width: 40%">
                    <div class="common_input_frame">
                        <input type="text" id="title" name="title" placeholder="请输入标题" title="点击此处填写标题"
                               value="劳务协议终止通知书(${nickname} <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>)"
                               autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 5%">流程</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="人事发起,接收人填写意见,通知人、人事(协同)" readonly>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div>
        <div class="notice-personnel">
            <input type="text" class="notice-personnel-field" id="recipientName" name="notifiedPerson" onclick="recipientSelect()" readonly>:
            <input type="hidden" id="recipientId" name="notifiedPersonId">
        </div>

        <div class="notice-content">
            你与我公司签订的协议期为
            <input class="agreement-start-end start-date" type="text" name="startDate" onfocus="this.blur()">至
            <input class="agreement-start-end end-date" type="text" name="endDate" onfocus="this.blur()">的劳务协议将于
            <input type="text" class="agreement-days" name="number" oninput="value=value.replace(/^(0+)|[^\d]/g,'')"
                   autocomplete="off">天后到期。（附《劳务协议续签个人意向》）
            <input type="hidden" id="annex" name="annex">
        </div>

        <div class="notice-content">特此通知。</div>

        <div class="notice-sign">
            <div class="notice-sign-position">
                <label>通知人：</label>
                <input class="notice-relevant-personnel" type="text" value="${nickname}" readonly>
                <input class="notice-date" type="text" name="noticeDate"
                       value="<%=new SimpleDateFormat("yyyy 年 MM 月 dd 日").format(new Date())%>" readonly>
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
            <td colspan="6" class="tdLabel" style="padding: 0;text-align: center">劳务协议续签个人意向</td>
        </tr>

        <tr>
            <td class="td-column-two" colspan="3">不续签劳务协议</td>
            <td class="td-column-two" colspan="3">申请与公司续签劳务协议</td>
        </tr>

        <tr>
            <td colspan="3" style="height: 30px;text-align: center">
                <input type="checkbox" style="vertical-align: middle;" disabled>
            </td>
            <td colspan="3" style="height: 30px;text-align: center">
                <input type="checkbox" style="vertical-align: middle;" disabled>
            </td>
        </tr>

        <tr>
            <td class="notice-td-label">其他需要补充的内容</td>
            <td colspan="5" class="table-td-evaluation">
                <textarea class="evaluation-content-disabled" style="height: 90px" readonly></textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" readonly>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">本人签字 </label>
                    <input class="approval-signature-input" type="text" readonly>
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

    var itselfFrameId;
    $(function () {
        itselfFrameId = window.frameElement && window.frameElement.id || '';
    });

    //发送
    function send() {
        var array = [];
        $('#annexes').find('input').each(function () {
            array.push($(this).val());
        });

        if ($.trim($("#title").val()) === '') {
            window.top.tips("标题不可以为空！", 6, 5, 2000);
        } else if ($.trim($("#recipientName").val()) === '') {
            window.top.tips("请选择要通知的人！", 6, 5, 2000);
        } else {
            //发送前将上传好的附件插入form中
            $('#annex').val(array);

            $.ajax({
                type: "POST",
                url: '${path}/pactStop/add',
                data: $('#oaActPactStop').serialize(),
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
                url: '${path}/pactStop/savePending',
                data: $('#oaActPactStop').serialize(),
                error: function (request) {
                    layer.msg("出错！");
                },
                success: function (result) {
                    if (result === "success") {
                        <%--window.location.href = "${path}/oaIndex.do";--%>
                        window.history.back();
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
        window.top.selectRecipient(userInfoList, departmentList,itselfFrameId);
    }

    //确认接收人
    function confirmSelectRecipient(id, name) {
        $('#recipientId').val(id);
        $('#recipientName').val(name);
    }
</script>
</html>

