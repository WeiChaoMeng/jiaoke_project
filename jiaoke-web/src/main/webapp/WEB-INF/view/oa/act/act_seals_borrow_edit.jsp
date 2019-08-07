<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<body style="width: 70%">
<div class="table-title">
    <span>编辑印章借用审批单</span>
</div>
<div class="top_toolbar">
    <div class="top_toolbar_inside">
        <div class="head_left_button">
            <button type="button" class="cursor_hand" onclick="savePending()">&#xea97; 保存待发</button>
        </div>
    </div>
</div>
<!--  -->
<form id="oaActSealsBorrow">

    <div class="form_area">
        <table>
            <tbody>
            <tr>
                <td nowrap="nowrap" style="width: 4%">
                    <button type="button" class="table-tab-send" onclick="send()">发送</button>
                </td>

                <th nowrap="nowrap" class="th_title" style="width: 4%">标题:</th>
                <td style="width: 44%">
                    <div class="common_input_frame">
                        <input type="text" id="title" name="title" placeholder="请输入标题" title="点击此处填写标题"
                               value="${oaActSealsBorrow.title}" autocomplete="off">
                    </div>
                </td>

                <th class="th_title" nowrap="nowrap" style="width: 4%">流程:</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="部门负责人(审批)、印章主管领导(审批)、公司负责人(审批)、经办人"
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
        </tr>

        <tr>
            <td class="tdLabel">借用时间：</td>
            <td class="table-td-content">
                <input type="hidden" name="id" value="${oaActSealsBorrow.id}">
                <input type="hidden" name="promoter" value="${oaActSealsBorrow.promoter}">
                <input type="hidden" name="url" value="${oaActSealsBorrow.url}">
                <input type="text" class="formInput je-date" name="borrowTimeStr" value="${oaActSealsBorrow.borrowTimeStr}" onfocus="this.blur()">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">盖章文件内容：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="content" value="${oaActSealsBorrow.content}" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="tdLabel">借章人：</td>
            <td class="table-td-content">
                <input type="text" class="formInput" name="borrower" value="${oaActSealsBorrow.borrower}" readonly="readonly">
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

    //时间选择器
    jeDate(".je-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,                    //是否显示节日
        isinitVal: true,                    //是否初始化
        isTime:true,                        //是否开启时间选择
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD hh",
        zIndex: 100000,
    });

    function selectFile(own) {
        $('#fileName').html(own.files[0].name);
    }

    //发送
    function send() {
        if ($.trim($("#title").val()) === '') {
            layer.msg("标题不可以为空！")
        } else {
            $.ajax({
                type: "POST",
                url: '${path}/sealsBorrow/editAdd',
                data: $('#oaActSealsBorrow').serialize(),
                error: function (request) {
                    layer.msg("出错！");
                },
                success: function (result) {
                    if (result === "success") {
                        window.location.href = "${path}/oaIndex.do";
                        layer.msg("发送成功！");
                    } else {
                        layer.msg('发送失败！');
                    }
                }
            })
        }
    }

    //保存待发
    function savePending() {
        if ($.trim($("#title").val()) === '') {
            layer.msg("标题不可以为空！")
        } else {
            $.ajax({
                type: "POST",
                url: '${path}/sealsBorrow/edit',
                data: $('#oaActSealsBorrow').serialize(),
                error: function (request) {
                    layer.msg("出错！");
                },
                success: function (result) {
                    if (result === "success") {
                        window.location.href = "${path}/collaboration/waitSend?page=1";
                        layer.msg("保存成功！");
                    } else {
                        layer.msg('保存失败！');
                    }
                }
            })
        }
    }
</script>
</html>
