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
    <title>编辑印章借用审批单</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body style="width: 70%" id="body">

<div class="table-title">
    <span>编辑印章借用审批单</span>
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
        <c:when test="${oaActSealsBorrow.annex != ''}">
            <div class="top_toolbar" id="annexList" style="display: block;">
                <div class="top-toolbar-annexes">

                    <div class="annexes-icon">
                        <button type="button" class="cursor_hand">&#xeac1; ：</button>
                    </div>

                    <div id="annexes">
                        <c:forTokens items="${oaActSealsBorrow.annex}" delims="," var="annex">
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
<!--  -->
<form id="oaActSealsBorrow">

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
                               value="${oaActSealsBorrow.title}" autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="发起者部门负责人→印章主管领导→经办人→发起者(知会)" readonly>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <table class="formTable">
        <tbody>
        <tr>
            <td class="tdLabel">印章种类：</td>
            <td class="table-td-content">
                <select class="select" name="seal" style="width: 100%">
                    <c:choose>
                        <c:when test="${oaActSealsBorrow.seal == 0}">
                            <option value="0" selected>路驰公章</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0">路驰公章</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActSealsBorrow.seal == 1}">
                            <option value="1" selected>路驰合同章</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1">路驰合同章</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActSealsBorrow.seal == 2}">
                            <option value="2" selected>路驰党支部章</option>
                        </c:when>
                        <c:otherwise>
                            <option value="2">路驰党支部章</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActSealsBorrow.seal == 3}">
                            <option value="3" selected>路驰工会章</option>
                        </c:when>
                        <c:otherwise>
                            <option value="3">路驰工会章</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActSealsBorrow.seal == 4}">
                            <option value="4" selected>路驰法人章</option>
                        </c:when>
                        <c:otherwise>
                            <option value="4">路驰法人章</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActSealsBorrow.seal == 5}">
                            <option value="5" selected>路驰财务专用章</option>
                        </c:when>
                        <c:otherwise>
                            <option value="5">路驰财务专用章</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActSealsBorrow.seal == 6}">
                            <option value="6" selected>大兴公章</option>
                        </c:when>
                        <c:otherwise>
                            <option value="6">大兴公章</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActSealsBorrow.seal == 7}">
                            <option value="7" selected>大兴合同章</option>
                        </c:when>
                        <c:otherwise>
                            <option value="7">大兴合同章</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </td>

            <td class="tdLabel">借用时间</td>
            <td class="table-td-content">
                <input type="hidden" name="id" value="${oaActSealsBorrow.id}">
                <input type="hidden" name="promoter" value="${oaActSealsBorrow.promoter}">
                <input type="hidden" name="url" value="${oaActSealsBorrow.url}">
                <input type="hidden" id="departmentPrincipal" name="departmentPrincipal">
                <input type="text" class="formInput je-date" name="borrowTime"
                       value="${oaActSealsBorrow.borrowTime}" onfocus="this.blur()">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">盖章文件内容</td>
            <td class="table-td-content" colspan="3" style="padding: 10px">
                <textarea class="write-approval-content-textarea" oninput="value=value.replace(/\s+/g,'')" name="content">${oaActSealsBorrow.content}</textarea>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">借章人</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="borrower" value="${oaActSealsBorrow.borrower}"
                       readonly="readonly">
            </td>

            <td class="tdLabel">部门负责人</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" readonly="readonly">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">印章主管领导</td>
            <td class="table-td-content" colspan="3">
                <input type="text" class="formInput-readonly" readonly="readonly">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">经办人</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" readonly="readonly">
            </td>

            <td class="tdLabel">归还时间</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" readonly="readonly">
            </td>

            <%--暂存附件--%>
            <input type="hidden" id="annex" name="annex">
        </tr>
        </tbody>

    </table>
</form>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/jeDate/src/jedate.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //时间选择器
    jeDate(".je-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,                    //是否显示节日
        isinitVal: true,                    //是否初始化
        isTime: true,                        //是否开启时间选择
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD hh:mm",
        zIndex: 100000,
    });

    var itselfFrameId;
    $(function () {
        itselfFrameId = window.frameElement && window.frameElement.id || '';
    });

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
                    url: '${path}/sealsBorrow/editAdd',
                    data: $('#oaActSealsBorrow').serialize(),
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
            url: '${path}/sealsBorrow/editAdd',
            data: $('#oaActSealsBorrow').serialize(),
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
            window.top.tips("标题不能为空！", 6, 5, 1000);
        } else {
            //发送前将上传好的附件插入form中
            $('#annex').val(array);

            $.ajax({
                type: "POST",
                url: '${path}/sealsBorrow/edit',
                data: $('#oaActSealsBorrow').serialize(),
                error: function (request) {
                    window.top.tips("出错！", 6, 2, 1000);
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
        $('#body').css('width', '70%');

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

