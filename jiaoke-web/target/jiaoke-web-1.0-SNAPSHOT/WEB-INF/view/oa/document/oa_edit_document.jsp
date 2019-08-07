<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>编辑公文</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
</head>

<body style="padding: 20px">


<div class="top_toolbar">
    <div class="top_toolbar_inside">
        <div>
            <span onclick="preservationPending()">保存待发</span>
        </div>

        <em class="top_toolbar_em"></em>

        <div>
            <span>插入</span>
        </div>

        <em class="top_toolbar_em"></em>

        <div>
            <span>打印</span>
        </div>

        <div class="form-but" style="float: right">
            <button type="button" class="return-but" onclick="previousPage()">返回</button>
        </div>
    </div>
</div>
<!--  -->
<form id="oaDocument">
    <div class="form_area">
        <table style="width: 100%">
            <tbody>
            <tr>
                <td nowrap="nowrap" class="send_button_td">
                    <button type="button" class="send_button_inpt" onclick="send()">发送</button>
                </td>
                <td class="th_title" nowrap="nowrap">流程:</td>

                <td style="padding-right: 1%;">
                    <div class="common_input_frame">
                        <input type="hidden" name="id" id="id" value="${oaDocument.id}">
                        <input type="text" placeholder="发起者、[王玉秋,李宝琦,杨德秀]（会签）、总经理（审批）" readonly>
                    </div>
                </td>

                <td class="condition_select_frame">
                    <div class="common_select_frame">
                        <input type="button" value="编辑流程">
                    </div>
                </td>

                <td class="common_th">流程期限:</td>
                <td class="common_condition_select_frame">
                    <div class="common_select_frame">
                        <select name="processDeadline" id="deadline">
                            <option value="0">无</option>
                            <option value="60">1小时</option>
                            <option value="120">2小时</option>
                            <option value="240">4小时</option>
                            <option value="1440">1天</option>
                            <option value="2880">2天</option>
                            <option value="4320">3天</option>
                            <option value="7200">5天</option>
                            <option value="10080">1周</option>
                            <option value="21600">15天</option>
                            <option value="43200">1个月</option>
                            <option value="129600">3个月</option>
                        </select>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <table class="formtable">

        <tbody>
        <tr>
            <td class="tlabel">标题：</td>
            <td colspan="5">
                <input type="hidden" name="id" value="${oaDocument.id}">
                <input type="hidden" name="formState" id="formState">
                <input class="forminput inputadress" type="text" id="textTitle" name="textTitle"
                       value="${oaDocument.textTitle}" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tlabel">文号：</td>
            <td>
                <input class="forminput" type="text" name="textNumber" value="${oaDocument.textNumber}" autocomplete="off">
            </td>

            <td class="tlabel">密级：</td>
            <td>
                <select class="select swidth" name="rank">
                    <c:choose>
                        <c:when test="${oaDocument.rank == 0}">
                            <option value="0" selected="selected">普通公文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0">普通公文</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.rank == 1}">
                            <option value="1" selected="selected">秘密公文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1">秘密公文</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.rank == 2}">
                            <option value="2" selected="selected">机密公文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="2">机密公文</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.rank == 3}">
                            <option value="3" selected="selected">绝密公文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="3">绝密公文</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </td>

            <td class="tlabel">标识：</td>
            <td>
                <select class="select swidth" name="identification">
                    <c:choose>
                        <c:when test="${oaDocument.identification == 0}">
                            <option value="0" selected="selected">平行文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0">平行文</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.identification == 1}">
                            <option value="1" selected="selected">上行文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1">上行文</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.identification == 2}">
                            <option value="2" selected="selected">内部行文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="2">内部行文</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.identification == 3}">
                            <option value="3" selected="selected">外部行文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="3">外部行文</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.identification == 4}">
                            <option value="4" selected="selected">其它</option>
                        </c:when>
                        <c:otherwise>
                            <option value="4">其它</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </td>
        </tr>

        <tr>
            <td class="tlabel">公文类型：</td>
            <td>
                <select class="select swidth" name="docType">
                    <c:choose>
                        <c:when test="${oaDocument.docType == 0}">
                            <option value="0" selected="selected">公文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0">公文</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.docType == 1}">
                            <option value="1" selected="selected">会议纪要</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1">会议纪要</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.docType == 2}">
                            <option value="2" selected="selected">请示</option>
                        </c:when>
                        <c:otherwise>
                            <option value="2">请示</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.docType == 3}">
                            <option value="3" selected="selected">通知</option>
                        </c:when>
                        <c:otherwise>
                            <option value="3">通知</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.docType == 4}">
                            <option value="4" selected="selected">通告</option>
                        </c:when>
                        <c:otherwise>
                            <option value="4">通告</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.docType == 5}">
                            <option value="5" selected="selected">函</option>
                        </c:when>
                        <c:otherwise>
                            <option value="5">函</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </td>

            <td class="tlabel">发文时间：</td>
            <td colspan="tlabel">
                <input type="text" class="forminput date_picker" id="writingTime" name="writingTime"
                       value="${oaDocument.writingTime}" onfocus="this.blur()">
            </td>

            <td class="tlabel">保存期限：</td>
            <td>
                <select class="select swidth" name="storageLife">
                    <c:choose>
                        <c:when test="${oaDocument.storageLife == 0}">
                            <option value="0" selected="selected">10年</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0">10年</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.storageLife == 1}">
                            <option value="1" selected="selected">30年</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1" selected="selected">30年</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.storageLife == 2}">
                            <option value="2" selected="selected">永久</option>
                        </c:when>
                        <c:otherwise>
                            <option value="2">永久</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </td>
        </tr>

        <tr>
            <td class="tlabel">拟稿部门：</td>
            <td>
                <select class="select swidth" name="draftingDepartment" id="draftingDepartment">
                    <c:choose>
                        <c:when test="${oaDocument.draftingDepartment == 10}">
                            <option value="10" selected="selected">综合办公室</option>
                        </c:when>
                        <c:otherwise>
                            <option value="10">综合办公室</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.draftingDepartment == 11}">
                            <option value="11" selected="selected">经营开发部</option>
                        </c:when>
                        <c:otherwise>
                            <option value="11">经营开发部</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.draftingDepartment == 12}">
                            <option value="12" selected="selected">生产管理部</option>
                        </c:when>
                        <c:otherwise>
                            <option value="12">生产管理部</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.draftingDepartment == 13}">
                            <option value="13" selected="selected">财务管理部</option>
                        </c:when>
                        <c:otherwise>
                            <option value="13">财务管理部</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.draftingDepartment == 14}">
                            <option value="14" selected="selected">物资管理部</option>
                        </c:when>
                        <c:otherwise>
                            <option value="14">物资管理部</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaDocument.draftingDepartment == 15}">
                            <option value="15" selected="selected">质量技术部</option>
                        </c:when>
                        <c:otherwise>
                            <option value="15">质量技术部</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </td>

            <td class="tlabel">拟稿人：</td>
            <td>
                <input type="text" class="forminput" name="draftedPerson" value="${oaDocument.draftedPerson}"
                       onclick="selectReviewer()" id="draftedPerson" onfocus="this.blur()">
            </td>

            <td class="tlabel">核稿人：</td>
            <td><input type="text" class="forminput permissions_color" name="nuclearDrafts" disabled="disabled"></td>
        </tr>

        <tr>
            <td class="tlabel">签发：</td>
            <td colspan="2.5" style="height: 70px">
                <textarea class="textarea_style permissions_color" name="issue" disabled="disabled"></textarea>
            </td>

            <td class="tlabel">会签：</td>
            <td colspan="2.5" rowspan="1">
                <textarea class="textarea_style permissions_color" name="countersign" disabled="disabled"></textarea>
            </td>
        </tr>

        <tr>
            <td class="tlabel">抄送：</td>
            <td colspan="5">
                <input type="text" class="forminput inputadress" id="copyGive" name="copyGive"
                       onclick="carbonCopy()" value="${oaDocument.copyGive}" onfocus="this.blur()">
            </td>
        </tr>

        <tr>
            <td class="tlabel">内容：</td>
            <td colspan="5">
                <textarea class="content_textarea_style" name="content">${oaDocument.content}</textarea>
            </td>
        </tr>

        <tr>
            <td class="tlabel">印制：</td>
            <td><input type="text" class="forminput" value="${oaDocument.print}" name="print" id="print"
                       readonly></td>
            <td class="tlabel">校对：</td>
            <td><input type="text" class="forminput" value="${oaDocument.proofreading}" name="proofreading"
                       id="proofreading" readonly>
            </td>
            <td class="tlabel">份数：</td>
            <td><input type="text" class="forminput" value="${oaDocument.attachmentNumber}" name="attachmentNumber"
                       readonly="readonly"></td>
        </tr>

        <tr>
            <td class="tlabel">附件上传：</td>
            <td colspan="5">
                <input type="file" name="attachment" value="">
            </td>
        </tr>

        </tbody>

    </table>
</form>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script type="text/javascript" src="../../../../static/js/date_pickers/jquery.date_input.pack.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //设置当前页
    var currentPage = JSON.parse('${page}');

    //返回
    function previousPage() {
        window.location.href = '${path}/document/toPrimedDocument.do?page=' + currentPage;
    }

    //发送
    function send() {
        if ($.trim($("#textTitle").val()) === "") {
            layer.msg('标题不可以为空！');
        } else if ($('#draftedPerson').val() === "") {
            layer.msg('拟稿人不可以为空！');
        } else if ($('#copyGive').val() === "") {
            layer.msg('抄送人不可以为空！');
        } else {
            $("#formState").val("0");
            $.ajax({
                type: "POST",
                url: '${path}/document/addPrimedDocument',
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
    function preservationPending() {
        if ($.trim($("#textTitle").val()) === '') {
            layer.msg("标题不能为空！")
        } else {
            $("#formState").val("1");
            $.ajax({
                cache: true,
                type: "POST",
                url: '${path}/document/updatePendingDocument',
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

    //选择核稿人
    function selectReviewer() {
        var departmentKey = $('#draftingDepartment').val();
        if (departmentKey === "") {
            alert("请先选择部门！")
        } else {
            var draftedPerson = $('#draftedPerson').val();
            $.ajax({
                cache: true,
                type: "POST",
                url: '${path}/document/departmentMember',
                data: {"departmentKey": departmentKey},
                error: function (request) {
                    alert("Connection error");
                },
                success: function (result) {
                    top.window.selectReviewers(JSON.parse(result), draftedPerson,"editReviewer");
                }
            });
        }
    }

    //插入选择的核稿人
    function insertReviewerEdit(parameter) {
        $('#draftedPerson').val(parameter);
    }

    //选择抄送人员
    function carbonCopy() {
        //用户
        var userInfoList = JSON.parse('${userInfoList}');
        //部门
        var departmentList = JSON.parse('${departmentList}')
        top.selectNotifyPerson(userInfoList, departmentList);
    }

    //插入抄送
    function insertCopyGive(array) {
        $('#copyGive').val(array);
    }

    //日期选择器
    $(function () {
        $('.date_picker').date_input();
    });
</script>
</html>

