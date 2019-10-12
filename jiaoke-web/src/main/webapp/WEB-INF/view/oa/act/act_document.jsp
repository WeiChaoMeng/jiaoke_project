<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);%>
<html>
<head>
    <meta charset="utf-8">
    <title>发布公文</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body">

<div class="table-title">
    <span>发布公文</span>
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

<!-- 公文form -->
<form id="oaDocument">
    <div class="form_area" id="titleArea" style="margin-bottom: 15px">
        <table>
            <tbody>
            <tr>
                <td nowrap="nowrap" style="width: 4%">
                    <button type="button" class="table-tab-send" onclick="send()">发送</button>
                </td>

                <th nowrap="nowrap" class="th_title" style="width: 4%">标题:</th>
                <td style="width: 35%">
                    <div class="common_input_frame">
                        <input type="text" id="title" name="title" placeholder="请输入标题" title="点击此处填写标题"
                               value="发布公文(${nickname} <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>)"
                               autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程:</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="发起者、[王玉秋,李宝琦,杨德秀]（会签）、总经理（审批）" readonly>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <table class="formTable">

        <tbody>
        <tr>
            <td class="tdLabel">标题：</td>
            <td class="table-td-content" colspan="5">
                <input class="formInput inputadress" type="text" id="textTitle" name="textTitle" autocomplete="off"
                       onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">文号：</td>
            <td class="table-td-content">
                <input class="formInput" type="text" name="textNumber" autocomplete="off">
            </td>

            <td class="tdLabel">密级：</td>
            <td class="table-td-content">
                <select class="select" name="rank">
                    <option value="">---请选择---</option>
                    <option value="0">普通公文</option>
                    <option value="1">秘密公文</option>
                    <option value="2">机密公文</option>
                    <option value="3">绝密公文</option>
                </select>
            </td>

            <td class="tdLabel">标识：</td>
            <td class="table-td-content">
                <select class="select" name="identification">
                    <option value="">---请选择---</option>
                    <option value="0">平行文</option>
                    <option value="1">上行文</option>
                    <option value="2">内部行文</option>
                    <option value="3">外部行文</option>
                    <option value="4">其它</option>
                </select>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">公文类型：</td>
            <td class="table-td-content">
                <select class="select" name="docType">
                    <option value="">---请选择---</option>
                    <option value="0">公文</option>
                    <option value="1">会议纪要</option>
                    <option value="2">请示</option>
                    <option value="3">通知</option>
                    <option value="4">通告</option>
                    <option value="5">函</option>
                </select>
            </td>

            <td class="tdLabel">发文时间：</td>
            <td class="table-td-content">
                <input type="text" class="formInput dispatch-date" id="writingTime" name="writingTime"
                       onfocus="this.blur()">
            </td>

            <td class="tdLabel">保存期限：</td>
            <td class="table-td-content">
                <select class="select" name="storageLife">
                    <option value="">---请选择---</option>
                    <option value="0">10年</option>
                    <option value="1">30年</option>
                    <option value="2">永久</option>
                </select>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">拟稿部门：</td>
            <td class="table-td-content">
                <select class="select" name="draftingDepartment" id="draftingDepartment">
                    <option value="">---请选择---</option>
                    <c:forEach items="${departmentList}" var="department">
                        <option value="${department.departmentKey}">${department.departmentName}</option>
                    </c:forEach>
                </select>
            </td>

            <td class="tdLabel">拟稿人：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" onclick="selectReviewer()" name="draftedPerson"
                       id="draftedPerson" onfocus="this.blur()">
            </td>

            <td class="tdLabel">核稿人：</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="nuclearDrafts" disabled="disabled">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">签发：</td>
            <td colspan="2.5" class="table-td-content">
                <textarea class="textarea-style" name="issue" disabled="disabled"></textarea>
            </td>

            <td class="tdLabel">会签：</td>
            <td colspan="2.5" class="table-td-content">
                <textarea class="textarea-style" name="countersign" disabled="disabled"></textarea>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">抄送：</td>
            <td class="table-td-content" colspan="5">
                <input type="text" class="formInput inputadress" name="copyGive" id="copyGive"
                       onclick="carbonCopy()" onfocus="this.blur()">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">内容：</td>
            <td class="table-td-content" colspan="5">
                <textarea class="content-textarea-style" name="content"></textarea>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">印制：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" value="${departmentName}" name="print" readonly>
            </td>

            <td class="tdLabel">校对：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" value="${nickName}" name="proofreading" readonly>
            </td>

            <td class="tdLabel">份数：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="attachmentNumber" readonly>
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
<script>

    //日期选择器
    jeDate(".dispatch-date", {
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
        var array = [];
        $('#annexes').find('input').each(function () {
            array.push($(this).val());
        });

        if ($('#textTitle').val() === "") {
            layer.msg('标题不可以为空！');
        } else if ($('#draftedPerson').val() === "") {
            layer.msg('拟稿人不可以为空！');
        } else if ($('#copyGive').val() === "") {
            layer.msg('抄送人不可以为空！');
        } else {
            //发送前将上传好的附件插入form中
            $('#annex').val(array);

            $("#formState").val("0");

            $.ajax({
                type: "POST",
                url: '${path}/document/add',
                data: $('#oaDocument').serialize(),
                error: function (request) {
                    layer.msg("出错！");
                },
                success: function (result) {
                    if (result === "success") {
                        window.location.href = "${path}/document/toIssuedDocument.do?page=1";
                        layer.msg("发送成功！");
                    } else {
                        layer.msg('发送失败！');
                        $("#editorHTNL").val('');
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

        var textTitle = $("#textTitle").val();
        if ($.trim(textTitle) === '') {
            layer.msg("标题不能为空！")
        } else {
            //发送前将上传好的附件插入form中
            $('#annex').val(array);

            $("#formState").val("1");
            $.ajax({
                cache: true,
                type: "POST",
                url: '${path}/document/preservationPending',
                data: $("#oaDocument").serialize(),
                error: function (request) {
                    layer.msg("出错！");
                },
                success: function (result) {
                    if (result === "success") {
                        window.location.href = "${path}/document/toPrimedDocument.do?page=1";
                    } else {
                        layer.msg("保存失败")
                    }
                }
            })
        }
    }

    //拟稿部门发生改变则清空拟稿人
    $('#draftingDepartment').change(function () {
        $('#draftedPerson').val('');
    });

    //选择拟稿人
    function selectReviewer() {
        var departmentKey = $('#draftingDepartment').val();
        if (departmentKey === "") {
            layer.msg("请先选择部门！")
        } else {
            var draftedPerson = $('#draftedPerson').val();
            $.ajax({
                cache: true,
                type: "POST",
                url: '${path}/document/departmentMember',
                data: {"departmentKey": departmentKey},
                error: function (request) {
                    layer.msg("连接错误！");
                },
                success: function (result) {
                    // parent.openBack(JSON.parse(result));
                    top.window.selectReviewers(JSON.parse(result), draftedPerson, "draftAuthor");
                }
            });
        }
    }

    //插入选择的核稿人
    function insertReviewer(parameter) {
        $('#draftedPerson').val(parameter);
    }

    //选择抄送人员
    function carbonCopy() {
        //用户
        var userInfoList = JSON.parse('${userInfoList}');
        //部门
        var departmentList = JSON.parse('${departmentListJson}')
        top.selectNotifyPerson(userInfoList, departmentList);
        // parent.openMultiSelectWindows();
    }

    //插入已选抄送人员
    function insertCopyGive(array) {
        $('#copyGive').val(array);
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

