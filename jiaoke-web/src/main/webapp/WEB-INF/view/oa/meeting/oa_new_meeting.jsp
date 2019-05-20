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
<body>
<%
    Date d = new Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    String now = df.format(d);
%>
<div class="table-container">
    <form id="oaMeeting">
        <div class="table-title">
            <span>新建会议</span>
        </div>

        <table class="form-table">
            <tbody>
            <tr>
                <td class="table-td-width">会议名称：</td>
                <td colspan="5" class="table-content">
                    <input type="text" class="form-input" name="name" id="name"
                           onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')" autocomplete="off">
                </td>

                <td class="table-td-width">会议分类：</td>
                <td class="table-content">
                    <select name="type" class="form-select">
                        <option value="1">普通会议</option>
                        <option value="2">重要会议</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td class="table-td-width">开始时间：</td>
                <td class="table-content">
                    <input type="text" class="form-input jeinput je-start-date" name="startTimeStr" id="startTime"
                           onfocus="this.blur()">
                </td>

                <td class="table-td-width">结束时间：</td>
                <td class="table-content">
                    <input type="text" class="form-input jeinput je-end-date" name="endTimeStr" id="endTime"
                           onfocus="this.blur()">
                </td>

                <td class="table-td-width">主持人：</td>
                <td class="table-content">
                    <input type="text" class="form-input" name="compere" id="compere" value="${nickname}"
                           onclick="selectCompere()" onfocus="this.blur()">
                </td>

                <td class="table-td-width">记录人：</td>
                <td class="table-content">
                    <input type="text" class="form-input" name="recorder" id="recorder" value="${nickname}"
                           onclick="selectRecorder()" onfocus="this.blur()">
                </td>
            </tr>

            <tr>
                <td class="table-td-width">与会人员：</td>
                <td colspan="5" class="table-content">
                    <input type="text" class="form-input" id="participantsStr"
                           onclick="selectParticipants()" onfocus="this.blur()">
                    <input type="hidden" name="participants" id="participants">
                </td>

                <td class="table-td-width">会议地点：</td>
                <td class="table-content">
                    <input type="text" class="form-input" name="place" autocomplete="off">
                </td>
            </tr>

            <tr>
                <td class="table-td-width">附件：</td>
                <td colspan="7" class="table-content">
                    <input type="text" class="form-input" name="attachment" autocomplete="off">
                    <input type="hidden" name="richText" id="editorHTNL">
                </td>
            </tr>
        </table>

        <div id="editor" class="editor-container"></div>

        <div class="form-but">
            <button type="button" class="commit-but" onclick="send()">发送</button>
        </div>
    </form>
</div>
</body>

<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/editor/release/wangEditor.min.js"></script>
<script type="text/javascript" src="../../../../static/js/jeDate/src/jedate.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script type="text/javascript">
    var E = window.wangEditor;
    var editor = new E('#editor');

    // 自定义菜单配置
    editor.customConfig.menus = [
        'head',  // 标题
        'bold',  // 粗体
        'fontSize',  // 字号
        'fontName',  // 字体
        'italic',  // 斜体
        'underline',  // 下划线
        'strikeThrough',  // 删除线
        'foreColor',  // 文字颜色
        'backColor',  // 背景颜色
        'link',  // 插入链接
        'list',  // 列表
        'justify',  // 对齐方式
        // 'quote',  // 引用
        'emoticon',  // 表情
        'image',  // 插入图片
        'table',  // 表格
        // 'video',  // 插入视频
        // 'code',  // 插入代码
        'undo',  // 撤销
        'redo'  // 重复
    ];

    // 限制一次最多上传 1 张图片
    editor.customConfig.uploadImgMaxLength = 1;

    editor.customConfig.customUploadImg = function (files, insert) {
        // files 是 input 中选中的文件列表
        // insert 是获取图片 url 后，插入到编辑器的方法
        var formData = new FormData();
        formData.append('file', files[0]);
        $.ajax({
            type: "POST",
            url: '${path}/uploadPic/uploadImg',
            data: formData,
            async: true,
            cache: false,
            contentType: false,    //不可缺
            processData: false,    //不可缺
            success: function (ret) {
                if (ret.message == "success") {
                    // 上传代码返回结果之后，将图片插入到编辑器中
                    insert(ret.imageFilePaths);
                    $("#editorHTNL").val(editor.txt.html());
                } else {
                    alert("失败");
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("上传失败，请检查网络后重试");
            }
        });
    };

    editor.create();

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

    //日期选择器
    /*$(function () {
        $('.date_picker').date_input();
    });*/

</script>
</html>