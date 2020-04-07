<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);%>
<html>
<head>
    <meta charset="utf-8">
    <title>编辑公文</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body">

<div class="table-title">
    <span>编辑公文</span>
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
        <c:when test="${oaActDocument.annex != ''}">
            <div class="top_toolbar" id="annexList" style="display: block;">
                <div class="top-toolbar-annexes">

                    <div class="annexes-icon">
                        <button type="button" class="cursor_hand">&#xeac1; ：</button>
                    </div>

                    <div id="annexes">
                        <c:forTokens items="${oaActDocument.annex}" delims="," var="annex">
                            <div id="file${fn:substring(annex,0,annex.indexOf("_"))}" class="table-file">
                                <div class="table-file-content">
                                    <a class="table-file-title" href="/fileDownloadHandle/download?fileName=${annex}"
                                       title="${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}">${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}
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

<!-- 公文form -->
<form id="oaActDocument">
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
                               value="${oaActDocument.title}" autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="发起者部门主管领导、[王玉秋,李保奇,杨德秀,李达维]（会签）、总经理（审批）" readonly>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <table class="formTable">

        <tbody>
        <tr>
            <td class="tdLabel">标题</td>
            <td class="table-td-content" colspan="5">
                <input class="formInput" type="text" id="textTitle" name="textTitle" value="${oaActDocument.textTitle}" autocomplete="off">
                <input type="hidden" name="id" value="${oaActDocument.id}">
                <input type="hidden" name="promoter" value="${oaActDocument.promoter}">
                <input type="hidden" name="url" value="${oaActDocument.url}">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">文号</td>
            <td class="table-td-content">
                <input class="formInput" type="text" name="textNumber" value="${oaActDocument.textNumber}" autocomplete="off">
            </td>

            <td class="tdLabel">密级</td>
            <td class="table-td-content">
                <select class="select" name="secretLevel">
                    <c:choose>
                        <c:when test="${oaActDocument.secretLevel == 0}">
                            <option value="0" selected>普通公文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0">普通公文</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.secretLevel == 1}">
                            <option value="1" selected>秘密公文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1">秘密公文</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.secretLevel == 2}">
                            <option value="2" selected>机密公文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="2">机密公文</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.secretLevel == 3}">
                            <option value="3" selected>绝密公文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="3">绝密公文</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </td>

            <td class="tdLabel">标识</td>
            <td class="table-td-content">
                <select class="select" name="identification">
                    <c:choose>
                        <c:when test="${oaActDocument.identification == 0}">
                            <option value="0" selected>内部行文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0">内部行文</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.identification == 1}">
                            <option value="1" selected>平行文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1">平行文</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.identification == 2}">
                            <option value="2" selected>上行文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="2">普通公文</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.identification == 3}">
                            <option value="3" selected>外部行文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="3">外部行文</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.identification == 4}">
                            <option value="4" selected>其它</option>
                        </c:when>
                        <c:otherwise>
                            <option value="4">其它</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">公文类型</td>
            <td class="table-td-content">
                <select class="select" name="docType">
                    <c:choose>
                        <c:when test="${oaActDocument.docType == 0}">
                            <option value="0" selected>公文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0">公文</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.docType == 1}">
                            <option value="1" selected>会议纪要</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1">会议纪要</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.docType == 2}">
                            <option value="2" selected>请示</option>
                        </c:when>
                        <c:otherwise>
                            <option value="2">请示</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.docType == 3}">
                            <option value="3" selected>通知</option>
                        </c:when>
                        <c:otherwise>
                            <option value="3">通知</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.docType == 4}">
                            <option value="4" selected>通告</option>
                        </c:when>
                        <c:otherwise>
                            <option value="4">通告</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.docType == 5}">
                            <option value="5" selected>函</option>
                        </c:when>
                        <c:otherwise>
                            <option value="5">函</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </td>

            <td class="tdLabel">发文时间</td>
            <td class="table-td-content">
                <input type="text" class="formInput dispatch-date" id="writingTime" name="writingTime"
                       value="${oaActDocument.writingTime}" onfocus="this.blur()">
            </td>

            <td class="tdLabel">保存期限</td>
            <td class="table-td-content">
                <select class="select" name="storageLife">
                    <c:choose>
                        <c:when test="${oaActDocument.storageLife == 0}">
                            <option value="0" selected>10年</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0">10年</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.storageLife == 1}">
                            <option value="1" selected>30年</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1">30年</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.storageLife == 2}">
                            <option value="2" selected>永久</option>
                        </c:when>
                        <c:otherwise>
                            <option value="2">永久</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">拟稿部门</td>
            <td class="table-td-content">
                <select class="select" name="draftingDepartment" id="draftingDepartment">
                    <c:choose>
                        <c:when test="${oaActDocument.draftingDepartment == 10}">
                            <option value="10" selected="selected">综合办公室</option>
                        </c:when>
                        <c:otherwise>
                            <option value="10">综合办公室</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.draftingDepartment == 11}">
                            <option value="11" selected="selected">经营开发部</option>
                        </c:when>
                        <c:otherwise>
                            <option value="11">经营开发部</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.draftingDepartment == 12}">
                            <option value="12" selected="selected">生产管理部</option>
                        </c:when>
                        <c:otherwise>
                            <option value="12">生产管理部</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.draftingDepartment == 13}">
                            <option value="13" selected="selected">财务管理部</option>
                        </c:when>
                        <c:otherwise>
                            <option value="13">财务管理部</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.draftingDepartment == 14}">
                            <option value="14" selected="selected">物资管理部</option>
                        </c:when>
                        <c:otherwise>
                            <option value="14">物资管理部</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.draftingDepartment == 15}">
                            <option value="15" selected="selected">质量技术部</option>
                        </c:when>
                        <c:otherwise>
                            <option value="15">质量技术部</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.draftingDepartment == 16}">
                            <option value="16" selected="selected">领导班子</option>
                        </c:when>
                        <c:otherwise>
                            <option value="16">领导班子</option>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActDocument.draftingDepartment == 17}">
                            <option value="17" selected="selected">其他</option>
                        </c:when>
                        <c:otherwise>
                            <option value="17">其他</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </td>

            <td class="tdLabel">拟稿人</td>
            <td class="table-td-content">
                <input type="text" class="formInput" onclick="selectReviewer()" name="draftedPerson"
                       id="draftedPerson" value="${oaActDocument.draftedPerson}" onfocus="this.blur()">
            </td>

            <td class="tdLabel">核稿人</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" readonly>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">签发</td>
            <td colspan="2.5" class="table-td-content">
                <textarea class="textarea-style" readonly></textarea>
            </td>

            <td class="tdLabel">会签</td>
            <td colspan="2.5" class="table-td-content">
                <textarea class="textarea-style" readonly></textarea>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">抄送</td>
            <td class="table-td-content" colspan="5">
                <input type="text" class="formInput" name="copyGive" id="copyGive" onclick="carbonCopy()" value="${oaActDocument.copyGive}"  onfocus="this.blur()">
                <input type="hidden" name="copyGiveId" id="copyGiveId" value="${oaActDocument.copyGiveId}">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">内容</td>
            <td class="table-td-content" colspan="5">
                <textarea class="content-textarea-style" onkeyup="value=value.replace(/\s+/g,'')" name="content">${oaActDocument.content}</textarea>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">印制</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly"  value="${oaActDocument.print}" name="print" readonly>
            </td>

            <td class="tdLabel">校对</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" value="${oaActDocument.proofreading}" name="proofreading" readonly>
            </td>

            <td class="tdLabel">份数</td>
            <td class="table-td-content">
                <input type="text" class="formInput-readonly" name="attachmentNumber" id="attachmentNumber" value="${oaActDocument.attachmentNumber}" readonly>
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
            window.top.tips("标题不能为空！", 6, 5, 1000);
        } else if ($('#draftedPerson').val() === "") {
            window.top.tips("拟稿人不可以为空！", 6, 5, 1000);
        } else if ($('#copyGive').val() === "") {
            window.top.tips("抄送人不可以为空！", 6, 5, 1000);
        } else {
            //发送前将上传好的附件插入form中
            $('#annex').val(array);

            $.ajax({
                type: "POST",
                url: '${path}/document/editAdd',
                data: $('#oaActDocument').serialize(),
                error: function (request) {
                    window.top.tips("出错！", 6, 2, 1000);
                },
                success: function (result) {
                    if (result === "success") {
                        window.top.tips("发送成功！", 0, 1, 1000);
                        window.location.href = "${path}/oaIndex.do";
                    } else {
                        layer.msg('发送失败！');
                        window.top.tips("发送失败！", 0, 2, 1000);
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
            window.top.tips("标题不能为空！", 6, 5, 1000);
        } else {
            //发送前将上传好的附件插入form中
            $('#annex').val(array);

            $.ajax({
                cache: true,
                type: "POST",
                url: '${path}/document/edit',
                data: $("#oaActDocument").serialize(),
                error: function (request) {
                    window.top.tips("出错！", 6, 2, 1000);
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
                    window.top.tips("出错！", 6, 2, 1000);
                },
                success: function (result) {
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

        var annexesNum = $('#annexes').children("div").length;
        $('#attachmentNumber').val(annexesNum);
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
                    var annexesNum = $('#annexes').children("div").length;
                    $('#attachmentNumber').val(annexesNum);
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

