<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
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
    <title>转岗审批表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
    <style>
        .tdLabel {
            width: 10%;
        }
    </style>
</head>

<body id="body">

<div class="table-title">
    <span>转岗审批表</span>
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

    <%--附件列表--%>
    <c:choose>
        <c:when test="${oaActTransfer.annex != ''}">
            <div class="top_toolbar" id="annexList" style="display: block;">
                <div class="top-toolbar-annexes">

                    <div class="annexes-icon">
                        <button type="button" class="cursor_hand">&#xeac1; ：</button>
                    </div>

                    <div id="annexes">
                        <c:forTokens items="${oaActTransfer.annex}" delims="," var="annex">
                            <div id="file${fn:substring(annex,0,annex.indexOf("_"))}" class="table-file">
                                <div class="table-file-content">
                                    <a class="table-file-title" href="javascript:location.href=encodeURI('/fileDownloadHandle/download?fileName=${annex}')"
                                       title="${fn:substring(annex,annex.indexOf("_")+1,annex.length())}">${fn:substring(annex,annex.indexOf("_")+1,annex.length())}
                                    </a>
                                    <span class="delete-file" title="删除"
                                          onclick="whether('${annex}')"></span>
                                    <input type="hidden" value="${annex}">
                                </div>
                            </div>
                        </c:forTokens>
                    </div>

                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="top_toolbar" id="annexList" style="display: none;">
                <div class="top-toolbar-annexes">

                    <div class="annexes-icon">
                        <button type="button" class="cursor_hand">&#xeac1; ：</button>
                    </div>

                    <div id="annexes"></div>

                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<form id="oaActTransfer">
    <div class="form_area" id="titleArea" style="margin-bottom: 15px">
        <table>
            <tbody>
            <tr>
                <td nowrap="nowrap" style="width: 4%">
                    <button type="button" class="table-tab-send" onclick="send()">发送</button>
                </td>

                <th nowrap="nowrap" class="th_title" style="width: 4%">标题</th>
                <td style="width: 25%">
                    <div class="common_input_frame">
                        <input type="text" id="title" name="title" placeholder="请输入标题" title="点击此处填写标题"
                               value="${oaActTransfer.title}" autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" style="font-size: 11px" readonly
                               placeholder="人事(查阅)→发起者部门负责人→发起者部门主管领导→转入部门负责人→转入部门主管领导→人事部门→总经理→发起人、人事(知会)">
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <input type="text" class="filling-date-content" name="fillingDate"
           value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>" readonly>
    <span class="filling-date">填表日期 </span>

    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">姓名</td>
            <td class="table-td-content" colspan="2">
                <input type="text" class="formInput-readonly" name="name" value="${oaActTransfer.name}" readonly>
                <input type="hidden" id="id" name="id" value="${oaActTransfer.id}">
                <input type="hidden" id="departmentPrincipal" name="departmentPrincipal">
            </td>

            <td class="tdLabel">年龄</td>
            <td class="table-td-content" colspan="2">
                <input type="text" class="formInput" name="age" oninput="value=value.replace(/^(0+)|[^\d]/g,'')"
                       value="${oaActTransfer.age}" maxlength="2" autocomplete="off">
            </td>

            <td class="tdLabel">入职时间</td>
            <td class="table-td-content">
                <input type="text" class="formInput entry-date" name="entryDate" value="${oaActTransfer.entryDate}"
                       onfocus="this.blur()">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">现部门</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly"  name="presentDepartment" value="${department}" readonly>
            </td>

            <td class="tdLabel">现岗位</td>
            <td class="table-td-content" style="width: 15%">
                <input type="text" class="formInput-readonly" name="presentPost" value="${job}" readonly>
            </td>

            <td class="tdLabel">拟转入部门</td>
            <td class="table-td-content">
                <input type="text" class="formInput" id="newDepartmentStr" value="${oaActTransfer.newDepartmentStr}" onclick="selectDepartment(1)" readonly>
                <input type="hidden" name="newDepartment" id="newDepartment" value="${oaActTransfer.newDepartment}">
            </td>

            <td class="tdLabel">拟转入岗位</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="newPost" autocomplete="off" value="${oaActTransfer.newPost}">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">转岗事由</td>
            <td colspan="7" class="table-td-evaluation">
                <textarea class="evaluation-content" style="height: 73px" oninput="value=value.replace(/\s+/g,'')" name="cause">${oaActTransfer.cause}</textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" value="${oaActTransfer.createTimeStr}" disabled>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">本人签字 </label>
                    <input class="approval-signature-input" type="text" value="${oaActTransfer.promoterStr}" disabled>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">所在部门评价</td>
            <td colspan="7" class="table-td-textarea" style="line-height: 0">
                <div class="opinion-principal">
                    <label class="opinion-principal-title">部长</label>
                    <textarea class="opinion-column-Juxtaposition" disabled></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" disabled>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" disabled>
                    </div>
                </div>

                <div class="opinion-supervisor">
                    <label class="opinion-principal-title">主管</label>
                    <textarea class="opinion-column-Juxtaposition" disabled></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" disabled>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" disabled>
                    </div>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">转入部门意见</td>
            <td colspan="7" class="table-td-textarea" style="line-height: 0">
                <div class="opinion-principal">
                    <label class="opinion-principal-title">部长</label>
                    <textarea class="opinion-column-Juxtaposition" disabled></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" disabled>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" disabled>
                    </div>
                </div>

                <div class="opinion-supervisor">
                    <label class="opinion-principal-title">主管</label>
                    <textarea class="opinion-column-Juxtaposition" disabled></textarea>
                    <div class="approval-date">
                        <label class="approval-date-label">日期 </label>
                        <input class="approval-date-input" type="text" disabled>
                    </div>
                    <div class="approval-signature">
                        <label class="approval-signature-label">签字 </label>
                        <input class="approval-signature-input" type="text" disabled>
                    </div>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">组织人事部意见</td>
            <td colspan="7" class="approval-content">
                <textarea class="approval-content-textarea" disabled></textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" disabled>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" disabled>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">总经理审批</td>
            <td colspan="7" class="approval-content">
                <textarea class="approval-content-textarea" disabled></textarea>
                <div class="approval-date">
                    <label class="approval-date-label">日期 </label>
                    <input class="approval-date-input" type="text" disabled>
                </div>
                <div class="approval-signature">
                    <label class="approval-signature-label">签字 </label>
                    <input class="approval-signature-input" type="text" disabled>
                </div>
            </td>
        </tr>
        </tbody>

        <%--暂存附件--%>
        <input type="hidden" id="annex" name="annex">
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

    var itselfFrameId;
    $(function () {
        itselfFrameId = window.frameElement && window.frameElement.id || '';
    });

    //部门选择
    function selectDepartment(flag) {
        var departmentList = JSON.parse('${departmentList}');
        window.top.selectionDepartment(departmentList, flag, itselfFrameId);
    }

    function selectDepartmentComplete(id, name, flag) {
        if (flag === "0") {
            $('#presentDepartment').val(id);
            $('#presentDepartmentStr').val(name);
        }else{
            $('#newDepartment').val(id);
            $('#newDepartmentStr').val(name);
        }
    }

    //发送
    function send() {
        if ($.trim($("#title").val()) === '') {
            window.top.tips("标题不可以为空！", 6, 5, 2000);
        } else {
            var principalGroup = '${principalGroup}';
            //部门负责人是多个
            if (principalGroup !== '') {
                var principalList = JSON.parse(principalGroup);
                window.top.selectPrincipal(principalList,itselfFrameId);

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
                    url: '${path}/transfer/editAdd',
                    data: $('#oaActTransfer').serialize(),
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
            url: '${path}/transfer/editAdd',
            data: $('#oaActTransfer').serialize(),
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
                url: '${path}/transfer/edit',
                data: $('#oaActTransfer').serialize(),
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

