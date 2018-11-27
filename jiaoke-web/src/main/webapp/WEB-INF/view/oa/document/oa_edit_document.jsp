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
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <link href="../../../../static/js/datepicker/css/bootstrap-datepicker.css" rel="stylesheet">
</head>
<style>
    .swidth {
        width: 265px;
        margin: 0;
    }

    .forminput, .search {
        text-align: left;
    }

</style>

<body style="padding: 20px">


<div class="top_toolbar">
    <div class="top_toolbar_inside">
        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <i></i>
            <span id="edit">保存待发</span>
        </a>
        <em class="top_toolbar_em"></em>

        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <i></i>
            <span>调用模板</span>
        </a>
        <em class="top_toolbar_em"></em>

        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <i></i>
            <span>插入</span>
        </a>
        <em class="top_toolbar_em"></em>

        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <i></i>
            <span>正文类型</span>
        </a>
        <em class="top_toolbar_em"></em>

        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <i></i>
            <span>存为模板</span>
        </a>
        <em class="top_toolbar_em"></em>

        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <i></i>
            <span>打印</span>
        </a>
    </div>
</div>
<!--  -->
<form action="${path}/document/add" name="oaDocumentProcessing" id="oaDocumentProcessing" method="post" onsubmit="">
    <div class="form_area">
        <table style="width: 100%">
            <tbody>
            <tr>
                <td rowspan="2" nowrap="nowrap" style="width: 1px">
                    <input type="submit" value="发送" style="padding: 15px;margin: 5px 10px;background-color: #00a6f570">
                </td>

                <th nowrap="nowrap" class="th_title">标题:</th>

                <td>
                    <div class="common_input_frame">
                        <input type="hidden" name="id" id="id" value="${oaDocument.id}">
                        <input type="text" name="formTitle" id="formTitle" value="${oaDocument.formTitle}"
                               placeholder="<点击此处填写标题>" required>
                    </div>
                </td>

                <td class="condition_select_frame">
                    <div class="common_select_frame">
                        <select name="importance">
                            <c:choose>
                                <c:when test="${oaDocument.importance == 0}">
                                    <option value="0" selected="selected">普通</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="0">普通</option>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${oaDocument.importance == 1}">
                                    <option value="1" selected="selected">重要</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="1">重要</option>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${oaDocument.importance == 2}">
                                    <option value="2" selected="selected">非常重要</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="2">非常重要</option>
                                </c:otherwise>
                            </c:choose>
                        </select>
                    </div>
                </td>

                <th class="common_th">关联项目:</th>

                <td class="common_condition_select_frame">
                    <div class="common_select_frame">
                        <select name="associatedProject" id="">
                            <option value="0">无</option>
                        </select>
                    </div>
                </td>

                <th class="common_th">预归档到:</th>

                <td class="common_condition_select_frame">
                    <div class="common_select_frame">
                        <select name="preArchiving">
                            <option value="0">无</option>
                        </select>
                    </div>
                </td>
            </tr>

            <tr>
                <th class="th_title" nowrap="nowrap">流程:</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" value="" name="flow" placeholder="公文、[张三、李四、王五]、总经理" readonly="readonly">
                    </div>
                </td>
                <td class="condition_select_frame">
                    <div class="common_select_frame">
                        <input type="button" value="编辑流程">
                    </div>
                </td>

                <th class="common_th">流程期限:</th>

                <td class="common_condition_select_frame">
                    <div class="common_select_frame">
                        <select name="processDeadline" id="deadline">
                            <c:choose>
                                <c:when test="${oaDocument.processDeadline == 0}">
                                    <option value="0" selected="selected">无</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="0">无</option>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${oaDocument.processDeadline == 60}">
                                    <option value="60" selected="selected">1小时</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="60">1小时</option>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${oaDocument.processDeadline == 120}">
                                    <option value="120" selected>2小时</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="120">2小时</option>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${oaDocument.processDeadline == 240}">
                                    <option value="240" selected="selected">4小时</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="240">4小时</option>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${oaDocument.processDeadline == 1440}">
                                    <option value="1440" selected="selected">1天</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="1440">1天</option>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${oaDocument.processDeadline == 2880}">
                                    <option value="2880" selected="selected">2天</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="2880">2天</option>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${oaDocument.processDeadline == 4320}">
                                    <option value="4320" selected="selected">3天</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="4320">3天</option>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${oaDocument.processDeadline == 7200}">
                                    <option value="7200" selected="selected">5天</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="7200">5天</option>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${oaDocument.processDeadline == 10080}">
                                    <option value="10080" selected="selected">1周</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="10080">1周</option>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${oaDocument.processDeadline == 21600}">
                                    <option value="21600" selected="selected">15天</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="21600">15天</option>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${oaDocument.processDeadline == 43200}">
                                    <option value="43200" selected="selected">1个月</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="43200">1个月</option>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${oaDocument.processDeadline == 129600}">
                                    <option value="129600" selected="selected">3个月</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="129600">3个月</option>
                                </c:otherwise>
                            </c:choose>

                        </select>
                    </div>
                </td>

                <th class="common_th">
                    <div>
                        <label for="canTrack">
                            <input id="canTrack" type="checkbox" checked="checked" onclick="choice()">跟踪
                        </label>
                    </div>
                </th>
                <td colspan="3">
                    <div class="common_radio">
                        <label for="radioall">
                            <input type="radio" id="radioall" name="track" value="1" checked="checked">全部人员
                        </label>
                        <label for="radiopart">
                            <input type="radio" id="radiopart" name="track" value="2">指定人员
                        </label>
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
                <input class="forminput inputstyle inputadress" type="text" name="textTitle"
                       value="${oaDocument.textTitle}" required>
            </td>
        </tr>

        <tr>
            <td class="tlabel">文号：</td>
            <td>
                <input class="forminput inputstyle" type="text" name="textNumber" value="${oaDocument.textNumber}"
                       required>
            </td>
            <td class="tlabel">密级：</td>
            <td>
                <select class="select swidth" name="rank" data-value="0" required>
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
                <select class="select swidth" name="identification" data-value="0" required>
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
                <select class="select swidth" name="docType" data-value="0">
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
                <input type="text" class="forminput inputstyle" id="writingTime" name="writingTime"
                       value="${oaDocument.writingTime}" onfocus="this.blur()" required>
            </td>
            <td class="tlabel">保存期限：</td>
            <td>
                <select class="select swidth" name="storageLife" data-value="0" required>
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
                <select class="select swidth" name="draftingDepartment" id="draftingDepartment" data-value="0" required>
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
            <td><input type="text" class="forminput inputstyle" name="draftedPerson" value="${oaDocument.draftedPerson}"
                       onclick="selectReviewer()" id="draftedPerson" onfocus="this.blur()" required></td>
            <td class="tlabel">核稿人：</td>
            <td><input type="text" class="forminput inputstyle" name="nuclearDrafts" value="" disabled="disabled"
                       style="background: #f4f4f4;"></td>
        </tr>

        <tr>
            <td class="tlabel">签发：</td>
            <td colspan="2.5" style="height: 70px">
                <textarea rows="10" name="issue" disabled="disabled"
                          style="background: #f4f4f4;resize:none;width: 87%;margin: 10px 0; border: 1px #bdbdbd solid;padding:5px;font-size: 14px;height: 74px;outline: none"
                          required></textarea>
            </td>

            <td class="tlabel">会签：</td>
            <td colspan="2.5" rowspan="1">
                <textarea rows="10" name="countersign" disabled="disabled"
                          style="background: #f4f4f4;resize:none;width: 87%;margin: 10px 0; border: 1px #bdbdbd solid;padding:5px;font-size: 14px;height: 74px;outline: none"
                          required></textarea>
            </td>
        </tr>

        <tr>
            <td class="tlabel">主送：</td>
            <td colspan="5"><input type="text" class="forminput inputstyle inputadress" name="mainGive"
                                   value="${oaDocument.mainGive}"></td>
        </tr>

        <tr>
            <td class="tlabel">抄送：</td>
            <td colspan="5"><input type="text" class="forminput inputstyle inputadress" name="copyGive"
                                   value="${oaDocument.copyGive}"></td>
        </tr>

        <tr>
            <td class="tlabel">内容：</td>
            <td colspan="5"><textarea rows="10" name="content"
                                      style=" resize:none;width: 95%;margin: 10px 0; border: 1px #bdbdbd solid;padding:5px;font-size: 14px;height: 106px;">${oaDocument.content}</textarea>
            </td>
        </tr>

        <tr>
            <td class="tlabel">印制：</td>
            <td><input type="text" class="forminput inputstyle" value="${oaDocument.print}" name="print" id="print"
                       readonly></td>
            <td class="tlabel">校对：</td>
            <td><input type="text" class="forminput inputstyle" value="${oaDocument.proofreading}" name="proofreading"
                       id="proofreading" readonly>
            </td>
            <td class="tlabel">份数：</td>
            <td><input readonly="readonly" value="" name="attachmentNumber"></td>
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
<script type="text/javascript" src="../../../../static/js/datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript"
        src="../../../../static/js/datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script>
    //保存待发
    $("#edit").on("click", function () {
        var formTitle = $("#formTitle").val();
        if ($.trim(formTitle) == '') {
            alert("标题不能为空！")
        } else {
            $("#formState").val("1");
            $.ajax({
                cache: true,
                type: "POST",
                url: '${path}/document/edit',
                data: $("#oaDocumentProcessing").serialize(),
                error: function (request) {
                    alert("Connection error");
                },
                success: function (result) {
                    if (result == "success") {
                        window.location.href = "primedDocument.do";
                    } else {
                        alert("保存失败")
                    }
                }
            })
        }

    });

    //跟踪选择切换
    var flag = false;

    function choice() {
        $("#radioall").attr("checked", flag);
        flag = !flag;
    }

    //日期选择器
    $("#writingTime").datepicker({
        "language": "zh-CN",
        "format": 'yyyy-mm-dd'
    });

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
            $.ajax({
                cache: true,
                type: "POST",
                url: '${path}/document/departmentMember',
                data: {"departmentKey": departmentKey},
                error: function (request) {
                    alert("Connection error");
                },
                success: function (result) {
                    console.log(JSON.parse(result))
                    parent.openBack(JSON.parse(result));
                }
            });
        }
    }

    //插入选择的核稿人
    function insertReviewer(parameter) {
        $('#draftedPerson').val(parameter);
    }
</script>
</html>

