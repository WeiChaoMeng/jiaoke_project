<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>新建会议</title>
    <link href="../../../../static/css/oa/oa_meeting.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>
<body id="body">

<div class="table-title">
    <span>新建会议</span>
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

<form id="oaMeeting">

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
                               value="印章使用审批单(${nickname} <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>)"
                               autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="部门负责人(审批)、部门主管领导(审批)、印章管理部门主管领导(审批)、盖章人"
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
            <td class="tdLabel">会议名称：</td>
            <td colspan="5" class="table-td-content">
                <input type="text" class="formInput" name="name" id="name"
                       onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')" autocomplete="off">
            </td>

            <td class="tdLabel">会议分类：</td>
            <td class="table-td-content">
                <select name="type" class="select">
                    <option value="1">普通会议</option>
                    <option value="2">重要会议</option>
                </select>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">开始时间：</td>
            <td class="table-td-content">
                <input type="text" class="formInput jeinput je-start-date" name="startTimeStr" id="startTime"
                       onfocus="this.blur()">
            </td>

            <td class="tdLabel">结束时间：</td>
            <td class="table-td-content">
                <input type="text" class="formInput jeinput je-end-date" name="endTimeStr" id="endTime"
                       onfocus="this.blur()">
            </td>

            <td class="tdLabel">主持人：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="compere" id="compere" value="${nickname}"
                       onclick="selectCompere()" onfocus="this.blur()">
            </td>

            <td class="tdLabel">记录人：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="recorder" id="recorder" value="${nickname}"
                       onclick="selectRecorder()" onfocus="this.blur()">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">与会人员：</td>
            <td colspan="5" class="table-td-content">
                <input type="text" class="formInput" id="participantsStr"
                       onclick="selectParticipants()" onfocus="this.blur()">
                <input type="hidden" name="participants" id="participants">
            </td>

            <td class="tdLabel">会议地点：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="place" autocomplete="off">
                <%--暂存附件--%>
                <input type="hidden" id="annex" name="annex">
            </td>
        </tr>
        </tbody>
    </table>
</form>
</body>

<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/jeDate/src/jedate.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script type="text/javascript">

    jeDate(".je-start-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD hh:mm",
        zIndex: 100000,
        donefun: function (obj) {
            var currentTime = new Date();
            var selectionTime = new Date(obj.val);
            if (selectionTime < currentTime) {
                layer.msg("开始时间不可以小于当前系统时间!");
            }
        }
    });

    jeDate(".je-end-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD hh:mm",
        zIndex: 100000,
        donefun: function (obj) {
            var startTime = new Date($('#startTime').val());
            var selectionTime = new Date(obj.val);
            if (selectionTime < startTime) {
                layer.msg("结束时间不可以小于开始时间!");
            }
        }
    });

    //用户列表
    var userInfoList = JSON.parse('${userInfoList}');
    //部门列表
    var departmentList = JSON.parse('${departmentList}');

    //提交from
    function send() {
        //会议名称
        var name = $('#name').val();
        //当前时间
        var date = new Date();
        //开始时间
        var startTime = $('#startTime').val();
        //结束时间
        var endTime = $('#endTime').val();
        //与会人员
        var participants = $('#participants').val();

        if (name === "") {
            layer.msg("会议名称不可以为空！");
        } else if (new Date(startTime) < date) {
            layer.msg("开始时间不可以小于当前系统时间！");
        } else if (new Date(startTime) > new Date(endTime)) {
            layer.msg("开始时间不可以大于结束时间！");
        } else if (participants === "") {
            layer.msg("请至少选择一位与会人员！");
        } else {
            $("#editorHTNL").val(editor.txt.html());

            $.ajax({
                type: "POST",
                url: '${path}/meeting/add',
                data: $('#oaMeeting').serialize(),
                error: function (request) {
                    layer.msg("出错！");
                },
                success: function (result) {
                    if (result === "success") {
                        window.location.href = "${path}/meeting/toAdd";
                        layer.msg("发送成功！");
                    } else {
                        layer.msg('发送失败！');
                        $("#editorHTNL").val('');
                    }
                }
            })
        }
    }

    //选择主持人
    function selectCompere() {
        var compere = $('#compere').val();
        window.top.selectReviewers(userInfoList, compere, 'meetingCompere');
    }

    //插入选中的主持人
    function insertMeetingCompere(name) {
        $('#compere').val(name);
    }

    //选择记录人
    function selectRecorder() {
        var compere = $('#recorder').val();
        window.top.selectReviewers(userInfoList, compere, 'meetingRecorder');
    }

    //插入选中的记录人
    function insertMeetingRecorder(name) {
        $('#recorder').val(name);
    }

    //选择与会人员
    function selectParticipants() {
        window.top.selectNotifyPerson(userInfoList, departmentList, 'meetingParticipants');
    }

    //插入选中的记录人
    function insertParticipants(array, arrayId) {
        //只作为展示使用
        $('#participantsStr').val(array);
        //传入后台
        $('#participants').val(arrayId);
    }

</script>
</html>