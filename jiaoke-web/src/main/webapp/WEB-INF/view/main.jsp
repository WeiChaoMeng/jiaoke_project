<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>路驰办公系统</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="../../static/css/oa/backstage_style.css" rel="stylesheet" type="text/css">
    <link href="../../static/css/oa/document.css" rel="stylesheet" type="text/css">
    <link href="../../static/css/personnel/personnelStyle.css" rel="stylesheet" type="text/css">
    <link rel="icon" href="/static/images/favicon.ico" type="image/ico"/>
    <style>
        html {
            overflow: hidden;
        }

        .altrowstable thead, .altrowstable tr {
            border-top-width: 1px;
            border-top-style: solid;
            border-top-color: rgb(230, 189, 189);
        }

        .altrowstable {
            border-bottom-width: 1px;
            border-bottom-style: solid;
            border-bottom-color: rgb(230, 189, 189);
        }

        .altrowstable td, .altrowstable th {
            padding: 8px 5px;
            font-size: 7px;
            font-family: Verdana;
            color: rgb(177, 106, 104);
        }

        .altrowstable tr:nth-child(odd) {
            background: #FFF
        }
    </style>
</head>
<body>

<div class="header">
    <div class="headtop" style="width: 100%;">
        <div class="logo-style">
            <img src="/static/images/logo/logo-2.png" style="margin-top: 5px;padding: 0;">
        </div>

        <div class="title-nav-style">
            <div class="title-style">
                <span class="title-content">北京市政路桥建材集团有限公司路驰分公司企业管理综合平台</span>
            </div>

            <div class="navigation-style">
                <ul class="nav">
                    <li>
                        <a href="#" class="manu" id="index">首页</a>
                    </li>
                    <shiro:hasPermission name="oa:oa">
                        <li>
                            <a href="#" class="manu" id="OA">OA系统</a>
                        </li>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="quality:quality">
                        <li>
                            <a href="#" class="manu" id="quality_control">质量管控</a>
                        </li>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="experiment:experiment">
                        <li>
                            <a href="#" class="manu" id="SY">实验管理</a>
                        </li>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="personnel:personnel">
                        <li>
                            <a href="#" class="manu" id="HR">人事管理</a>
                        </li>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="party:party">
                        <li>
                            <a href="#" class="manu" id="DJ">党建工作</a>
                        </li>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="operate:operate">
                        <li>
                            <a href="#" class="manu" id="JY">经营管理</a>
                        </li>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="milieu:milieu">
                        <li>
                            <a href="#" class="manu" id="HB">环保监控</a>
                        </li>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="security:security">
                        <li>
                            <a href="#" class="manu" id="AQ">厂区安全</a>
                        </li>
                    </shiro:hasPermission>
                </ul>
            </div>
        </div>

        <div id="codeDiv" class="app-code-style">
            <a onclick="selectedCode()" href="javascript:;" class="app-code-link">
                <img id="code" class="app-code-img" src="/static/images/logo/download.png"></a>
            <span>点击下载APP</span>
        </div>

        <div class="topright">
            <div class="user">
                <a href="#">
                    <i class="userico iconfont">&#xe6cb;</i>${userInfo.nickname}
                    <i class="userdown iconfont">&#xe920;</i>
                </a>

                <ul class="userlist">
                    <li><a href="#"><i class="userxl iconfont">&#xe666;</i>用户信息</a></li>
                    <li>
                        <a href="javascript:;" onclick="editPsw()">
                            <i class="userxl iconfont">&#xe7e9;</i>修改密码
                        </a>
                    </li>
                    <li><a href="/logout"><i class="userxl iconfont">&#xeae2;</i>退出</a></li>
                </ul>
            </div>
        </div>
    </div>

</div>

<div class="rightdown">
    <iframe src="/default.do" id="iframe" name="frame" width="100%" height="100%" frameborder="0"
            scrolling="auto"></iframe>
</div>

<div class="footer">
    <span class="fleft">信息管理系统v2.5.2020.4.4</span>
    <span class="fright">路驰版权所有<i class="infoicon iconfont">&#xe620;</i></span>
</div>

<div id="layerDemo" style="width: 200px;height: 200px;display: none;">
    <img style="width:100%;height:100%;background-color: #fff" src="/static/images/logo/download.png" alt="移动端二维码">
</div>

<%--模态窗-添加用户--%>
<div id="addUser" class="window-body-add" style="display: none">
    <form id="userInfo">
        <table class="window-table">
            <tbody>
            <tr>
                <td class="form_title_check"><i class="required_mark">*</i>用户名:</td>
                <td class="form_content_check">
                    <input type="hidden" id="currentPage">
                    <input class="font_input" name="username" id="username" value="" type="text"
                           placeholder="请输入用户名" maxlength="16" onblur="checkUsername(this)"
                           onclick="clickPrompt(this)"
                           autocomplete="off">
                    <span class="prompt-span"></span>
                </td>
            </tr>

            <tr>
                <td class="form_title_check"><i class="required_mark">*</i>密&nbsp;&nbsp;&nbsp;码:</td>
                <td class="form_content_check">
                    <input class="font_input" name="password" id="password" value=""
                           placeholder="请输入密码" maxlength="16" onblur="checkPassword(this)"
                           onclick="clickPrompt(this)"
                           autocomplete="off">
                    <span class="prompt-span"></span>
                </td>
            </tr>

            <tr>
                <td class="form_title_check"><i class="required_mark">*</i>昵&nbsp;&nbsp;&nbsp;称:</td>
                <td class="form_content_check">
                    <input class="font_input" id="nickname" value="" name="nickname" type="text"
                           placeholder="请输入昵称" maxlength="16" onblur="checkNickname(this)"
                           onclick="nicknameClickPrompt(this)" autocomplete="off">
                    <span class="prompt-span"></span>
                </td>
            </tr>

            <tr>
                <td class="form_title_check">部&nbsp;&nbsp;&nbsp;门:</td>
                <td class="form_content_check">
                    <select name="department" class="font_input" id="department">
                    </select>
                </td>
            </tr>

            <tr>
                <td class="form_title_check"><i class="required_mark">*</i>岗&nbsp;&nbsp;&nbsp;位:</td>
                <td class="form_content_check">
                    <input class="font_input" id="position" value="" name="position" type="text"
                           placeholder="请输入岗位" maxlength="16" onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')" autocomplete="off" onblur="checkPosition(this)">
                    <span class="prompt-span"></span>
                </td>
            </tr>
            </tbody>
        </table>
    </form>

    <div>
        <input type="button" value="确认" onclick="confirm()" class="confirm-btn-style">
        <input type="button" value="取消" onclick="cancel()" class="cancel-btn-style left-spacing">
    </div>
</div>

<%--模态窗-修改用户--%>
<div id="modifyUser" class="window-body-add" style="display: none">
    <form id="userInformation"></form>

    <div>
        <input type="button" value="确认" onclick="submissionEdit()" class="confirm-btn-style">
        <input type="button" value="取消" onclick="cancel()" class="cancel-btn-style  left-spacing">
    </div>
</div>

<%--模态窗-用户绑定角色--%>
<div id="bindingRole" class="tab-right-div" style="display: none"></div>

<%--模态窗-添加角色--%>
<div id="addRole" class="window-body-add" style="display: none">
    <form id="roleInfo">
        <table class="window-table">
            <tbody>
            <tr>
                <td class="form_title_check"><i class="required_mark">*</i>角色名称:</td>
                <td class="form_content_check">
                    <input type="hidden" id="rolePage">
                    <input class="font_input" name="name" id="name" value="" type="text"
                           placeholder="请输入角色名称" maxlength="16" onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')"  onblur="checkRoleName(this)"
                           onclick="clickPromptRole(this)"
                           autocomplete="off">
                    <span class="prompt-span"></span>
                </td>
            </tr>

            <tr>
                <td class="form_title_check">角色说明:</td>
                <td class="form_content_check">
                        <textarea class="description-text" placeholder="请输入角色说明" name="description"
                                  id="description" onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')" ></textarea>
                    <span class="prompt-span"></span>
                </td>
            </tr>
            </tbody>
        </table>
    </form>

    <div style="padding-top: 20px">
        <input type="button" value="确认" onclick="commitRole()" class="confirm-btn-style">
        <input type="button" value="取消" onclick="cancel()" class="cancel-btn-style left-spacing">
    </div>
</div>

<%--模态窗-修改角色--%>
<div id="modifyRole" class="window-body-add" style="display: none">
    <form id="roleInformation"></form>

    <div style="padding-top: 20px">
        <input type="button" value="确认" onclick="commitRoleEdit()" class="confirm-btn-style">
        <input type="button" value="取消" onclick="cancel()" class="cancel-btn-style  left-spacing">
    </div>
</div>

<%--部门负责人选择--%>
<div id="selectPrincipal" class="window-body-add" style="display: none">
    <div id="principalContent"></div>
    <div style="padding-top: 20px">
        <input type="button" value="确认" onclick="commitPrincipal()" class="confirm-btn-style">
        <input type="button" value="取消" onclick="cancel()" class="cancel-btn-style  left-spacing">
    </div>
</div>

<%--模态窗-添加部门--%>
<div id="addDepartment" class="window-body-add"  style="display: none">
    <table class="window-table">
        <tbody>
        <tr>
            <td class="form_title_check"><i class="required_mark">*</i>部门名称:</td>
            <td class="form_content_check">
                <input type="hidden" id="departmentPage">
                <input class="font_input" id="departmentName" type="text"
                       placeholder="请输入部门名称" maxlength="16" onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')"
                       autocomplete="off">
                <span class="prompt-span"></span>
            </td>
        </tr>
        </tbody>
    </table>

    <div style="padding-top: 20px">
        <input type="button" value="确认" onclick="commitDepartment()" class="confirm-btn-style">
        <input type="button" value="取消" onclick="cancel()" class="cancel-btn-style left-spacing">
    </div>
</div>

<%--模态窗-编辑部门--%>
<div id="editDepartment" class="window-body-add" style="display: none">
    <table class="window-table">
        <tbody>
        <tr>
            <td class="form_title_check"><i class="required_mark">*</i>部门名称:</td>
            <td class="form_content_check">
                <input type="hidden" id="editDepartmentId">
                <input class="font_input" id="editDepartmentName" type="text"
                       placeholder="请输入部门名称" maxlength="16" onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')"
                       autocomplete="off">
                <span class="prompt-span"></span>
            </td>
        </tr>
        </tbody>
    </table>

    <div style="padding-top: 20px">
        <input type="button" value="确认" onclick="commitEditDepartment()" class="confirm-btn-style">
        <input type="button" value="取消" onclick="cancel()" class="cancel-btn-style left-spacing">
    </div>
</div>

<%--模态窗-绑定部门主管--%>
<div id="bindingDepartment" style="display: none;width: 96%;height: 96%;padding: 2%">
    <div class="option-window-body-head cursor_hand">
        <input type="hidden" id="departmentId">
        <input type="hidden" id="bindingTarget">
        <div id="selectDepartment" class="selection-content-inside">
            <ul id="departmentAndUser"></ul>
        </div>
    </div>
    <div class="option-window-body-bottom">
        <input type="button" value="确认" onclick="confirmDepartmentHead()" class="confirm-btn-style">
        <input type="button" value="取消" onclick="cancel()" class="cancel-btn-style left-spacing">
    </div>
</div>

<%--模态窗-OA审批单中使用--%>
<div id="selectRecipientModel" style="display: none;width: 96%;height: 96%;padding: 2%">
    <div class="option-window-body-head cursor_hand">
        <div id="selectDepartmentRecipient" class="selection-content-inside">
            <ul id="departmentAndUserRecipient"></ul>
        </div>
    </div>
    <div class="option-window-body-bottom">
        <input type="button" value="确认" onclick="confirmDepartmentRecipient()" class="confirm-btn-style">
        <input type="button" value="取消" onclick="cancel()" class="cancel-btn-style left-spacing">
    </div>
</div>

<%--模态窗-修改资产档案信息--%>
<div id="modifyAssetsInfo" class="window-body-add" style="display: none">
    <form id="oaAssetManagement"></form>

    <div>
        <input type="button" value="确认" onclick="submissionAssetEdit()" class="confirm-btn-style">
        <input type="button" value="取消" onclick="cancel()" class="cancel-btn-style  left-spacing">
    </div>
</div>

<%-- 模态窗-选择拟稿人 --%>
<div id="singleSelection" class="single-option-window" style="display: none">
    <input type="hidden" id="pendingDocumentPage">
    <input type="hidden" id="singleFlag">
    <div class="option-window-body-head">
        <ul id="singleSelectionContent"></ul>
    </div>
    <div class="option-window-body-bottom">
        <input type="button" value="确认" onclick="confirmReviewers()" class="confirm-btn-style">
        <input type="button" value="取消" onclick="cancel()" class="cancel-btn-style  left-spacing">
    </div>
</div>

<%--模态窗-选择公文主送--%>
<div id="selectMainGive" class="window-body-add" style="display: none">
    <div id="mainGiveContent"></div>
    <div style="padding-top: 20px">
        <input type="button" value="确认" onclick="commitMainGive()" class="confirm-btn-style">
        <input type="button" value="取消" onclick="cancel()" class="cancel-btn-style  left-spacing">
    </div>
</div>

<%--模态窗-选择公文抄送人--%>
<div id="selectWindow" class="option-window" style="display: none">

    <div class="option-window-body-head cursor_hand">
        <input type="hidden" id="multiFlag">
        <div class="selection-box">
            <div class="selection-box-title">
                <span>选择</span>
            </div>

            <div class="selection-content-outer">
                <div id="selectDiv" class="selection-content-inside">
                    <ul id="selectContent"></ul>
                </div>
            </div>
        </div>

        <div class="selected-box">
            <div class="selection-box-title">
                <span>已选</span>
            </div>

            <div class="selection-content-outer">
                <div id="" class="selection-content-inside">
                    <ul id="selectedNotifyPerson">

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <%--js获取路径--%>
    <input id="path" type="hidden" value="${path}"/>
    <div class="option-window-body-bottom">
        <input type="button" value="确认" onclick="consentNotifyPerson()" class="confirm-btn-style">
        <input type="button" value="取消" onclick="cancel()" class="cancel-btn-style  left-spacing">
    </div>
</div>

<div id="userDetails" style="display: none;padding: 20px;">
    <dl id="userDetailsInfoShow"></dl>
</div>

<div id="contractDetails" style="display: none;padding: 20px;">
    <dl id="contractDetailsInfoShow"></dl>
</div>

<%--文件上传--%>
<div id="uploadFile" style="display: none;">
    <div style="margin: 30px">
        <div id="addFile" style="display:inline-table;"></div>
        <ul class="file-ul" id="fileNames"></ul>
    </div>

    <div class="option-window-body-bottom" style="padding: 0;">
        <input type="button" value="确认" onclick="fileConfirm()" class="confirm-btn-style">
        <input type="button" value="取消" onclick="fileCancel()" class="cancel-btn-style  left-spacing">
    </div>
</div>

<%--关联表单--%>
<div id="relevanceForms" style="display: none;">
    <div style="padding: 10px 15px">
        <div style="height: 79%;overflow: auto;margin-bottom: 20px;">
            <table class="relevance-table">
                <thead>
                <tr>
                    <th colspan="2" style="width: 50%">表单名称</th>
                    <th style="width: 15%">部门</th>
                    <th style="width: 15%">填表日期</th>
                    <th style="width: 10%">总金额(元)</th>
                    <th style="width: 10%">填表人</th>
                </tr>
                </thead>

                <tbody id="relevanceFormsTbo">

                </tbody>
            </table>
        </div>

        <div class="confirm-modify-psw-style">
            <button onclick="confirmRelevanceForms()" class="confirm-modify-psw">确认</button>
        </div>
    </div>
</div>

<div id="relevanceFormsPreview" style="display: none;">
    <div id="relevanceFormsPreviewContent" style="padding:10px 15px"></div>
</div>

<%--修改密码--%>
<div id="editPassword" style="height:100%;display: none;">
    <div class="psw-new-style">
        <label class="psw-new-name">新密码</label>
        <div style="float: left;width: 190px;">
            <input class="psw-new-input" type="password" onfocus="this.removeAttribute('readonly')" id="newPsw"
                   autocomplete="off" onblur="checkNewPsw()" onclick="newPswTips()" readonly>
            <span id="newPswTips" class="psw-new-tips"></span>
        </div>
    </div>

    <div class="paw-confirm-style">
        <label class="paw-confirm-name">确认密码</label>
        <div style="float: left;width: 190px;">
            <input class="paw-confirm-input" type="password" onfocus="this.removeAttribute('readonly')" id="confirmPsw"
                   autocomplete="off" onblur="checkConfirmPsw()" readonly>
            <span id="confirmPswTips" class="paw-confirm-tips"></span>
        </div>
    </div>

    <div class="confirm-modify-psw-style">
        <button onclick="confirmModifyPsw()" class="confirm-modify-psw">确认修改</button>
    </div>
</div>

<%--模态窗-选择部门--%>
<div id="departmentSelector" style="display: none;width: 96%;height: 96%;padding: 2%">
    <div class="option-window-body-head cursor_hand">
        <input type="hidden" id="departmentFlag">
        <div id="selectionDep" class="selection-content-inside">
            <ul id="departmentList"></ul>
        </div>
    </div>
    <div class="option-window-body-bottom">
        <input type="button" value="确认" onclick="confirmDepartmentSelection()" class="confirm-btn-style">
        <input type="button" value="取消" onclick="cancel()" class="cancel-btn-style left-spacing">
    </div>
</div>

<!-- Table goes in the document BODY -->
<table class="altrowstable" id="showMessage" onclick="goCriticalWarningPage()" style="display: none">
    <tr>
        <th>机组:</th>
        <th>盘号:</th>
        <th>材料:</th>
        <th>模板配比:</th>
        <th>实际配比:</th>
        <th>偏差比:</th>
        <th>预警级别:</th>
    </tr>
    <tbody id="warningData">

    </tbody>
</table>

</body>

<!-- Javascript goes in the document HEAD -->
<script type="text/javascript">
    function altRows(id) {
        if (document.getElementsByTagName) {

            var table = document.getElementById(id);
            var rows = table.getElementsByTagName("tr");

            for (i = 0; i < rows.length; i++) {
                if (i % 2 == 0) {
                    rows[i].className = "evenrowcolor";
                } else {
                    rows[i].className = "oddrowcolor";
                }
            }
        }
    }

    window.onload = function () {
        altRows('alternatecolor');
    }
</script>

<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<%--<script type="text/javascript" src="/static/js/skin.js"></script>--%>
<script src="../../static/js/oa/layer/layer.js"></script>
<script>

    //菜单
    $(function () {
        $('.manu').click(function () {

            $('.selected').attr('class', 'manu');
            $(this).attr('class', 'selected');

            switch ($(this).attr('id')) {

                case 'index':

                    $("#iframe").attr("src", "/default.do");
                    break;

                case 'OA':

                    $("#iframe").attr("src", "/oaNavigation.do");
                    break;

                case 'quality_control':

                    $("#iframe").attr("src", "/qualityIndex.do");
                    break;

                case 'HR':

                    $("#iframe").attr("src", "/personnelIndex.do");
                    break;

                case 'DJ':

                    $("#iframe").attr("src", "/partyIndex.do");
                    break;

                case 'JY':

                    $("#iframe").attr("src", "/operatingManager.do");
                    break;

                case 'HB':

                    $("#iframe").attr("src", "/milieuIndex.do");
                    break;

                case 'AQ':

                    $("#iframe").attr("src", "/security.do");
                    break;
                case 'SY':

                    $("#iframe").attr("src", "/experimental_management.do");
                    break;
            }

        })
    });

    //查看二维码
    function selectedCode() {
        layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            skin: 'layui-layer-nobg', //没有背景色
            shade: [0.95, '#A8A0A1'],
            shadeClose: true,
            content: $('#layerDemo')
        });
    }

    //修改密码
    function editPsw() {
        window.lar = layer.open({
            title: '修改密码',
            type: 1,
            area: ['25%', '35%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#editPassword"),
            offset: "auto"
        });

        //重置新密码输入框
        $('#newPsw').val('');
        $('#confirmPsw').val('');
        //重置边框颜色
        $('#newPsw').css("border-color", "#cecccc")
        $('#confirmPsw').css("border-color", "#cecccc")
        //重置input为readonly
        $('#newPsw').attr('readonly', 'true');
        $('#confirmPsw').attr('readonly', 'true');
        //重置提示
        $('#newPswTips').text("");
        $('#confirmPswTips').text("");
    }

    //新密码格式规则提示
    function newPswTips() {
        $('#newPswTips').text("长度为4-20个字符,包含大小写字母及数字");
        $('#newPswTips').css("color", "#797979");
    }

    //校验新密码
    function checkNewPsw() {
        var newPas = $('#confirmPsw').val();
        var pas = $('#newPsw').val();
        if (pas === "") {
            $('#newPswTips').text("请输入新的登录密码");
            $('#newPswTips').css("color", "#ff0000");
            $('#newPsw').css("border-color", "#ff0000");
        } else if (pas.length < 4) {
            $('#newPswTips').text("长度为4-20个字符");
            $('#newPswTips').css("color", "#ff0000");
            $('#newPsw').css("border-color", "#ff0000");
        } else if (newPas === pas) {
            $('#confirmPsw').css("border-color", "#cecccc");
            $('#confirmPswTips').text("");
            $('#newPsw').css("border-color", "#cecccc");
            $('#newPswTips').text("");
        } else {
            $('#newPsw').css("border-color", "#cecccc");
            $('#newPswTips').text("");
        }
    }

    //校验确认密码
    function checkConfirmPsw() {
        var newPas = $('#newPsw').val();
        var pas = $('#confirmPsw').val();
        if (pas === "") {
            $('#confirmPswTips').text("请输入新的登录密码");
            $('#confirmPswTips').css("color", "#ff0000");
            $('#confirmPsw').css("border-color", "#ff0000");
        } else if (newPas !== pas) {
            $('#confirmPswTips').text("两次输入的密码不一致");
            $('#confirmPswTips').css("color", "#ff0000");
            $('#confirmPsw').css("border-color", "#ff0000");
        } else {
            $('#confirmPsw').css("border-color", "#cecccc");
            $('#confirmPswTips').text("");
        }
    }

    //确认修改密码
    function confirmModifyPsw() {
        var n = $('#newPsw').val();
        var c = $('#confirmPsw').val();

        if (n === '') {
            $('#newPswTips').text("请输入新的登录密码");
            $('#newPswTips').css("color", "#ff0000");
            $('#newPsw').css("border-color", "#ff0000");
        } else if (n === '') {
            $('#confirmPswTips').text("请输入新的登录密码");
            $('#confirmPswTips').css("color", "#ff0000");
            $('#confirmPsw').css("border-color", "#ff0000");
        } else if (n !== c) {
            $('#confirmPswTips').text("两次输入的密码不一致");
            $('#confirmPswTips').css("color", "#ff0000");
            $('#confirmPsw').css("border-color", "#ff0000");
        } else {
            $.ajax({
                type: "post",
                url: '/backstageManagement/modifyPassword',
                data: {'password': c},
                async: false,
                success: function (data) {
                    if (data === 'success') {
                        cancel();
                        layer.msg('密码修改成功，3秒后自动跳转登录页面', {
                            anim: 0,
                            icon: 1,
                            time: 3000,
                            shade: [0.5, '#393D49']
                        });
                        //修改成功后，3秒后跳转登录页
                        setTimeout(function () {
                            location.href = "${path}logout";
                        }, 3000)
                    } else {
                        tips('修改失败', 1, 2, 2000);
                    }
                },
                error: function (result) {
                    tips('出错', 1, 2, 2000);
                }
            });
        }
    }

    //文件选择
    function fileSelect(own) {
        $('#fileName').val(own.files[0].name);
    }

    let count = 0;

    //上传文件弹窗
    function uploadFile() {
        window.lar = layer.open({
            title: '上传本地文件',
            type: 1,
            area: ['25%', '25%'],
            shadeClose: false, //点击遮罩关闭
            content: $("#uploadFile"),
            offset: "auto",
            cancel: function () {
                //初始化上传弹窗
                fileCancel();
            }
        });
    }

    $(function () {
        addBut();
    });

    //添加按钮
    function addBut() {
        var addFile = '';
        addFile += '<div id="fileContent1" style="display:inline-table;">';
        addFile += '<button type="button" class="add-but">添加</button>';
        addFile += '<input type="file" id="file1" name="file1" class="file-input" onchange="addFile(this)">';
        addFile += '</div>';
        $('#addFile').append(addFile);
    }

    //添加
    function addFile(owm) {
        count++;

        var nameHTML = '';
        nameHTML += '<li class="file-li" id="fileName' + count + '">';
        nameHTML += '<span class="file-name" title="' + $(owm)[0].files[0].name + '">' + $(owm)[0].files[0].name + '</span>';
        nameHTML += '<em class="icon" title="删除" onclick="deleteFile(' + count + ')">&#xeabb;</em>';
        nameHTML += '</li>';
        $('#fileNames').append(nameHTML);

        $('#fileContent' + count + '').css('display', 'none');

        var addFile = '';
        addFile += '<div id="fileContent' + (count + 1) + '" style="display:inline-table;">';
        addFile += '<button type="button" class="add-but">添加</button>';
        addFile += '<input type="file" id="file' + (count + 1) + '" name="file' + (count + 1) + '" class="file-input" onchange="addFile(this)">';
        addFile += '</div>';
        $('#addFile').append(addFile);
    }

    //删除
    function deleteFile(id) {
        $('#fileName' + id).remove();
        $('#fileContent' + id).remove();
        layer.msg("删除");
    }

    //关闭弹窗并初始化
    function fileCancel() {
        $('#addFile').html("");
        $('#fileNames').html("");
        addBut();
        count = 0;
        cancel();
    }

    //确认文件上传
    function fileConfirm() {
        var formData = new FormData();
        $('#addFile').find('input').each(function () {
            formData.append("files", $(this)[0].files[0]);
        });
        $.ajax({
            type: "POST",
            url: '${path}/fileUploadHandle/uploadFile',
            data: formData,
            async: true,
            cache: false,
            contentType: false,    //不可缺
            processData: false,    //不可缺
            success: function (ret) {
                if (ret[0].message === "success") {
                    layer.msg("上传成功");
                    $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.writeFile(ret);
                } else {
                    layer.msg("上传失败");
                }
            },
            error: function (res) {
                layer.msg("上传失败，请检查网络后重试!");
            }
        });

        //初始化上传弹窗
        fileCancel();
    }

    //删除已上传文件
    function deleteUploaded(fileName) {

        var fileId = fileName.substring(fileName.indexOf("_") + 1);
        //提示窗
        layer.confirm('确定要删除"' + fileId + '"吗？', {
                btn: ['确认', '取消']
            }, function () {
                $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.delFile(fileName);
            }
        );
    }

    /**-----------------------关联表单----------------------*/
    //关联表单-选择
    function selectRelevanceForms(list) {
        window.lar = layer.open({
            title: '选择关联的表单',
            type: 1,
            area: ['60%', '60%'],
            shadeClose: false, //点击遮罩关闭
            content: $("#relevanceForms"),
            offset: "auto",
        });

        var relevanceFormsContent = '';
        for (let i = 0; i < list.length; i++) {
            relevanceFormsContent += '<tr>';
            relevanceFormsContent += '<td style="width:30px;"><input type="checkbox" value="' + list[i].id + ',' + list[i].title + '" onclick="relevanceFormsCheckbox()" style="zoom: 130%;"></td>';
            relevanceFormsContent += '<td style="text-align: left;text-indent: 8px;">'+ list[i].title +'</td>';
            relevanceFormsContent += '<td>'+ list[i].department +'</td>';
            relevanceFormsContent += '<td>'+ list[i].fillingDate +'</td>';
            relevanceFormsContent += '<td>'+ list[i].total +'</td>';
            relevanceFormsContent += '<td>'+ list[i].preparer +'</td>';
            relevanceFormsContent += '</tr>';
        }
        $('#relevanceFormsTbo').html(relevanceFormsContent)
    }

    //关联表单-复选框
    function relevanceFormsCheckbox(){
        $('#relevanceFormsTbo').find('input[type=checkbox]').bind('click', function(){
            $("#relevanceFormsTbo").find('input[type=checkbox]').not(this).attr("checked", false);
        });
    }

    //关联表单-提交
    function confirmRelevanceForms() {
        let length = $("#relevanceFormsTbo input:checked").length;
        if (length !== 1) {
            tips("请选择一条数据！！", 6, 0, 1000);
            return false;
        } else {
            var val = $("#relevanceFormsTbo input:checked").val();
            var id = val.substring(0,val.indexOf(','));
            var name = val.substring(val.indexOf(',') + 1);
            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.relevanceFormsBinding(id,name);
        }

        //关闭弹窗
        cancel()
    }

    //关联表单-预览
    function relevanceFormsDetailsPreview(id) {
        window.lar = layer.open({
            title: '预览',
            type: 1,
            area: ['60%', '60%'],
            shadeClose: false, //点击遮罩关闭
            content: $("#relevanceFormsPreview"),
            offset: "auto",
        });

        $.ajax({
            type: "POST",
            url: '${path}officeSupplies/details',
            data: {'id': id},
            cache: false,
            dataType: 'html',
            error: function (request) {
                alert("出错了");
            },
            success: function (data) {
                //截取需要展示的部分
                var newHtml = data.substring(data.indexOf('<flag>'),data.indexOf('</flag>'));
                $("#relevanceFormsPreviewContent").html(newHtml);
            }
        });
    }
    
    //关联表单-删除
    function relevanceFormsDelete(fileName,id) {
        //提示窗
        layer.confirm('确定要删除"' + fileName + '"吗？', {
                btn: ['确认', '取消']
            }, function (index) {
                $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.executeRelevanceFormsDelete(id);
                layer.close(index);
            }
        );
    }

    //删除待发公文
    function deleteDocument(id, currentPage) {
        //记录用户页面选择的页数
        $('#pendingDocumentPage').val(currentPage);

        //提示窗
        layer.confirm('确定要删除吗？', {
                btn: ['确认', '取消']
            }, function () {
                $.ajax({
                    type: "post",
                    url: '/document/delete',
                    data: {'id': id},
                    async: false,
                    success: function (data) {
                        if (data === 'success') {
                            layer.msg('删除成功！')
                            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.reloadPendingDocument($('#pendingDocumentPage').val());
                        } else {
                            layer.msg('删除失败！')
                        }
                    },
                    error: function (result) {
                        layer.msg("出错！");
                    }
                });
            }
        );
    }

    //公文-选择主送人员
    function selectMainGive(principalList) {
        window.lar = layer.open({
            title: '所在部门负责人',
            type: 1,
            area: ['20%', '30%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#selectMainGive"),
            offset: "20%"
        });

        var principal = "";
        // principal += '<div id="radioChecked" style="text-align: left;">';
        // principal += '<div style="margin: 10px;"><input type="radio" name="abc" value="'+principalList[1]+','+principalList[3]+'" checked style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>全部</span></div>';
        // principal += '<div style="margin: 10px;"><input type="radio" name="abc" value="'+principalList[1]+'" style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>'+principalList[0]+'</span></div>';
        // principal += '<div style="margin: 10px;"><input type="radio" name="abc" value="'+principalList[3]+'" style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>'+principalList[2]+'</span></div>';
        // principal += '</div>';
        principal += '<div id="radioChecked" style="text-align: left;">';
        principal += '<div style="margin: 10px;"><input type="radio" name="name" value="1" checked style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>领导班子</span></div>';
        principal += '<div style="margin: 10px;"><input type="radio" name="name" value="2" style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>各部室负责人</span></div>';
        principal += '<div style="margin: 10px;"><input type="radio" name="name" value="0" style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>无</span></div>';
        principal += '</div>';
        $('#mainGiveContent').html(principal);
    }

    //提交-表单发送前选择部门负责人
    function commitMainGive() {
        let val = $('#radioChecked input[type="radio"]:checked').val();
        var text = $('#radioChecked input[type="radio"]:checked').next('span').html();
        $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.insetMainGive(val,text);
        layer.close(window.lar);
    }

    //公文-选择抄送人员
    function selectNotifyPerson(userInfoList, departmentList, flag) {
        window.lar = layer.open({
            title: '请选择',
            type: 1,
            area: ['50%', '66%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#selectWindow"),
            offset: "20%"
        });

        $('#multiFlag').val(flag);

        //清空已选列表
        $('#selectedNotifyPerson li').remove();

        //加载部门和员工
        var department = "";
        for (let i = 0; i < departmentList.length; i++) {
            department += '<li class="selection-box-li">';
            department += '<img src="../../static/images/icon/department.png">';
            department += '<span onclick="departmentSelect(this)" id="' + departmentList[i].departmentKey + '">' + departmentList[i].departmentName + '</span>';
            department += '<div></div>';

            for (let j = 0; j < userInfoList.length; j++) {
                if (userInfoList[j].department === departmentList[i].departmentKey) {
                    department += '<ul class="submenu-ul">';
                    department += '<li onclick="addNotifyPerson(this)">';
                    department += '<img src="../../static/images/icon/personnel.png">';
                    department += '<span id="' + userInfoList[j].id + '">' + userInfoList[j].nickname + '</span>';
                    department += '<div></div>';
                    department += '</li>';
                    department += '</ul>';
                }
            }
            department += '</li>';
        }
        //添加到选择列表
        $("#selectContent").html(department);
    }

    //确认
    function consentNotifyPerson() {
        var flag = $('#multiFlag').val();
        //存储名字
        var array = new Array();
        //存储id
        var arrayId = new Array();
        $("#selectedNotifyPerson").each(function () {
            $(this).find('li').find("span").each(function () {
                array.push($(this).text());
                arrayId.push($(this).attr('id'));
            });

            if (flag === 'meetingParticipants') {
                $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.insertParticipants(array, arrayId);
            } else {
                $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.insertCopyGive(array, arrayId);
            }
            cancel();
        });
    }

    //选择框中的展开与收缩
    function departmentSelect(own) {
        if ($(own).siblings('ul').css('display') == "none") {
            //展开未展开
            $(own).siblings('ul').slideUp(300);
            $(own).siblings('ul').slideDown(300);
        } else {
            //收缩已展开
            $(own).siblings('ul').slideUp(300);
        }
        preventBubble();
    }

    //选择列表的选择与取消
    function addNotifyPerson(own) {
        var id = $(own).children('span').attr('id');
        var text = $(own).children('span').text();
        if ($(own).children('div').hasClass("selection")) {
            $(own).children('div').removeClass("selection");
            //遍历已选列表
            $("#selectedNotifyPerson").each(function () {
                $(this).find('li').each(function () {
                    if ($(this).children('span').attr('id') === id) {
                        $(this).remove();
                    }
                });
            });
        } else {
            $(own).children('div').addClass("selection");
            $('#selectedNotifyPerson').append(' <li style="padding:5px 20px">' +
                '<img src="../../static/images/icon/personnel.png" style="vertical-align:middle;">' +
                '<span style="margin-left:8px" id="' + id + '">' + text + '</span>' +
                '<img src="../../static/images/icon/delete.png" style="float:right">' +
                '</li>')
        }
        preventBubble();
    }

    //删除已选列表选中的标签并且删除选择列表中选中的样式
    $('#selectedNotifyPerson').on("click", "li", function () {
        //获取选中li的id
        var selectedId = $(this).children('span').attr('id');
        //删除选中的li
        $(this).remove();
        //遍历选择列表
        $('#selectDiv').each(function () {
            $(this).find('ul').each(function () {
                $(this).find('li').each(function () {
                    // alert($(this).children('span').attr('id'));
                    var selectId = $(this).children('span').attr('id');
                    if (selectedId === selectId) {
                        //删除选择列表对应已选列表li-div-class
                        $(this).children('span').next('div').removeClass();
                    }
                })
            })
        });
    });

    //组织冒泡
    function preventBubble(event) {
        var e = arguments.callee.caller.arguments[0] || event; //若省略此句，下面的e改为event，IE运行可以，但是其他浏览器就不兼容
        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else if (window.event) {
            window.event.cancelBubble = true;
        }
    }

    //公文-选择拟稿人
    function selectReviewers(userInfoList, draftedPerson, flag) {
        window.lar = layer.open({
            title: '请选择',
            type: 1,
            area: ['25%', '55%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#singleSelection"),
            offset: "20%"
        });
        $('#singleFlag').val(flag);
        var content = '';
        if (userInfoList.length <= 0) {
            //当前部门没有人员
            content += '<img style="padding: 28% 32%;" src="../../static/images/icon/empty.png">';
        } else {
            for (let i = 0; i < userInfoList.length; i++) {
                if (draftedPerson === userInfoList[i].nickname) {
                    content +=
                        '<li class="single-election-box-li">' +
                        '<img src="../../static/images/icon/personnel.png">' +
                        '<span id="' + userInfoList[i].id + '">' + userInfoList[i].nickname + '</span>' +
                        '<div class="selectedDrafter"></div>' +
                        '</li>';
                } else {
                    content +=
                        '<li class="single-election-box-li">' +
                        '<img src="../../static/images/icon/personnel.png">' +
                        '<span id="' + userInfoList[i].id + '">' + userInfoList[i].nickname + '</span>' +
                        '<div></div>' +
                        '</li>';
                }

            }
        }
        //添加到选择列表
        $("#singleSelectionContent").html(content);
    }

    //单选弹窗 - li选择器
    $("#singleSelectionContent").on('click', 'li', function () {
        if ($(this).find("div").hasClass("selectedDrafter")) {
            $(this).find("div").removeClass("selectedDrafter");
        } else {
            var trs = $(this).parent().find("li").find("div");
            trs.removeClass("selectedDrafter");
            $(this).find("div").addClass("selectedDrafter");
        }
    });

    //单选弹窗 - 确认
    function confirmReviewers() {
        var flag = $('#singleFlag').val();
        var lis = $("#singleSelectionContent").find("li").find("div");
        //是否包含selectedDrafter
        if (lis.hasClass("selectedDrafter")) {
            if (flag === "meetingCompere") {
                $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.insertMeetingCompere($(".selectedDrafter").prev().text());
            } else if (flag === "meetingRecorder") {
                $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.insertMeetingRecorder($(".selectedDrafter").prev().text());
            } else if (flag === "draftAuthor") {
                $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.insertReviewer($(".selectedDrafter").prev().text());
            } else if (flag === "editReviewer") {
                $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.insertReviewerEdit($(".selectedDrafter").prev().text());
            }
            cancel();
        } else {
            layer.msg('请选择拟稿人！')
        }
    }

    //表单发送前选择部门负责人
    function selectPrincipal(principalList) {
        window.lar = layer.open({
            title: '所在部门负责人',
            type: 1,
            area: ['20%', '30%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#selectPrincipal"),
            offset: "20%"
        });

        var principal = "";
        principal += '<div id="radioChecked" style="text-align: left;">';
        principal += '<div style="margin: 10px;"><input type="radio" name="abc" value="'+principalList[1]+','+principalList[3]+'" checked style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>全部</span></div>';
        principal += '<div style="margin: 10px;"><input type="radio" name="abc" value="'+principalList[1]+'" style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>'+principalList[0]+'</span></div>';
        principal += '<div style="margin: 10px;"><input type="radio" name="abc" value="'+principalList[3]+'" style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>'+principalList[2]+'</span></div>';
        principal += '</div>';
        $('#principalContent').html(principal);
    }

    //提交-表单发送前选择部门负责人
    function commitPrincipal() {
        let val = $('#radioChecked input[type="radio"]:checked').val();
        $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.selectionPrincipal(val);
        layer.close(window.lar);
    }
    /**-----------------------部门管理---------------------------*/
    //添加部门
    function addDepartment(currentPage) {
        window.lar = layer.open({
            title: '添加部门',
            type: 1,
            area: ['25%', '30%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#addDepartment"),
            offset: "20%"
        });
        //记录用户页面选择的页数
        $('#departmentPage').val(currentPage);
    }

    //提交新增部门
    function commitDepartment() {
        var departmentName = $('#departmentName').val();
        if (departmentName !== "") {
            if (departmentWhetherRegister(departmentName)) {
                layer.msg('该部门已被注册');
            } else {
                $.ajax({
                    type: "post",
                    url: '/backstageManagement/addDepartment',
                    data: {'departmentName': departmentName},
                    success: function (data) {
                        if (data === 'success') {
                            $('#departmentName').val('');
                            layer.close(window.lar);
                            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.departmentInfoPageReload($('#departmentPage').val());
                            layer.msg("添加部门成功!");
                        } else {
                            layer.msg("添加部门失败!");
                        }
                    },
                    error: function (result) {
                        layer.msg("出错！");
                    }
                })
            }
        } else {
            layer.msg("部门名称不可以为空！");
        }
    }

    //检查部门名称是否被注册
    function departmentWhetherRegister(departmentName) {
        var res = false;
        $.ajax({
            type: "post",
            url: '/backstageManagement/checkDepartmentName',
            data: {'departmentName': departmentName},
            async: false,
            success: function (data) {
                if (data === "true") {
                    res = true;
                } else {
                    res = false;
                }
            },
            error: function (result) {
                alert("出错！");
            }
        });
        return res;
    }

    //删除部门
    function deleteDepartment(id, currentPage) {
        //记录选择的页数
        $('#departmentPage').val(currentPage);
        //提示窗
        layer.confirm('确定要删除吗？', {
                btn: ['确认', '取消']
            }, function () {
                $.ajax({
                    type: "post",
                    url: '/backstageManagement/deleteDepartment',
                    data: {'id': id},
                    async: false,
                    success: function (data) {
                        if (data === 'success') {
                            layer.msg('删除成功！')
                            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.departmentInfoPageReload($('#departmentPage').val());
                        } else {
                            layer.msg('删除失败！')
                        }
                    },
                    error: function (result) {
                        layer.msg("出错！");
                    }
                })
            }
        );
    }

    //部门绑定主管
    function bindingDepartmentHead(userInfoList, departmentList, id, page, target) {
        window.lar = layer.open({
            title: '绑定负责人',
            type: 1,
            area: ['20%', '50%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#bindingDepartment"),
            offset: "20%"
        });
        //记录选择的页数
        $('#departmentPage').val(page);
        //部门id
        $('#departmentId').val(id);
        //绑定的目标：1、部门负责人，2、部门主管领导
        $('#bindingTarget').val(target);
        //加载部门和员工
        var department = "";
        for (let i = 0; i < departmentList.length; i++) {
            department += '<li class="selection-box-li">';
            department += '<img src="../../static/images/icon/department.png">';
            department += '<span onclick="departmentSelect(this)" id="' + departmentList[i].departmentKey + '">' + departmentList[i].departmentName + '</span>';
            department += '<div></div>';
            for (let j = 0; j < userInfoList.length; j++) {
                if (userInfoList[j].department === departmentList[i].departmentKey) {
                    department += '<ul class="submenu-ul">';
                    department += '<li onclick="addSelectionUser(this)">';
                    department += '<img src="../../static/images/icon/personnel.png">';
                    department += '<span id="' + userInfoList[j].id + '">' + userInfoList[j].nickname + '</span>';
                    department += '<div></div>';
                    department += '</li>';
                    department += '</ul>';
                }
            }
            department += '</li>';
        }
        $("#departmentAndUser").html(department);
    }

    //用户选择器
    function addSelectionUser(own) {
        if ($(own).children('div').hasClass("selection")) {
            $(own).children('div').removeClass("selection");
        } else {
            $('#selectDepartment').find('div').removeClass("selection");
            $(own).find("div").addClass("selection");
        }
    }

    //提交绑定
    function confirmDepartmentHead() {
        var lis = $("#selectDepartment").find("div");
        //是否包含selectedDrafter
        if (lis.hasClass("selection")) {
            //选择的用户id
            var principal = $(".selection").prev().attr('id');
            //部门id
            var id = $('#departmentId').val();
            //绑定的目标：1、部门负责人，2、部门主管领导
            var target = $('#bindingTarget').val();
            if(target == 1){
                $.ajax({
                    type: "post",
                    url: '/backstageManagement/bindingDepartmentPrincipal',
                    data: {'id': id, 'principal': principal},
                    success: function (data) {
                        if (data === 'success') {
                            layer.close(window.lar);
                            layer.msg("绑定部门负责人成功!");
                            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.departmentInfoPageReload($('#departmentPage').val());
                        } else {
                            layer.msg("绑定部门负责人失败!");
                        }
                    },
                    error: function (result) {
                        layer.msg("出错！");
                    }
                })
            }else{
                $.ajax({
                    type: "post",
                    url: '/backstageManagement/bindingDepartmentSupervisor',
                    data: {'id': id, 'supervisor': principal},
                    success: function (data) {
                        if (data === 'success') {
                            layer.close(window.lar);
                            layer.msg("绑定部门主管成功!");
                            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.departmentInfoPageReload($('#departmentPage').val());
                        } else {
                            layer.msg("绑定部门主管失败!");
                        }
                    },
                    error: function (result) {
                        layer.msg("出错！");
                    }
                })
            }
        } else {
            layer.msg('请先选择')
        }
    }

    //编辑部门
    function editDepartment(department, currentPage) {
        window.lar = layer.open({
            title: '编辑部门',
            type: 1,
            area: ['25%', '35%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#editDepartment"),
            offset: "20%"
        });
        //记录用户页面选择的页数
        $('#departmentPage').val(currentPage);
        $('#editDepartmentName').val(department.departmentName);
        $('#editDepartmentId').val(department.id);
    }

    //提交编辑后的部门
    function commitEditDepartment() {
        var id = $('#editDepartmentId').val();
        var departmentName = $('#editDepartmentName').val();
        if (departmentName !== "") {
            if (departmentWhetherRegister(departmentName)) {
                layer.msg('该部门已被注册');
            } else {
                $.ajax({
                    type: "post",
                    url: '/backstageManagement/departmentEdit',
                    data: {'id': id, 'departmentName': departmentName},
                    success: function (data) {
                        if (data === 'success') {
                            layer.close(window.lar);
                            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.departmentInfoPageReload($('#departmentPage').val());
                            layer.msg("编辑部门成功!");
                        } else {
                            layer.msg("编辑部门失败!");
                        }
                    },
                    error: function (result) {
                        layer.msg("出错！");
                    }
                })
            }
        } else {
            layer.msg("部门名称不可以为空！");
        }
    }

    /**-------------------------角色管理-------------------------*/
    //新增角色
    function addRole(currentPage) {
        window.lar = layer.open({
            title: '添加角色',
            type: 1,
            area: ['25%', '41%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#addRole"),
            offset: "20%"
        });

        //记录用户页面选择的页数
        $('#rolePage').val(currentPage);
    }

    //提交新增角色
    function commitRole() {
        if ($('#name').val() === '') {
            $('#name').next().html("请输入角色名称");
            $('#name').next().css("color", "#ff0202");
        } else {
            var name = checkRoleName($('#name'));
            if (!name) {
                return;
            } else {
                $.ajax({
                    type: "post",
                    url: '/backstageManagement/addRoleInfo',
                    data: $('#roleInfo').serialize(),
                    success: function (data) {
                        if (data === 'success') {
                            //清除from
                            document.getElementById("roleInfo").reset();
                            layer.close(window.lar);
                            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.roleInfoPageReload($('#rolePage').val());
                            layer.msg("添加角色成功!");
                        } else {
                            layer.msg("添加角色失败!");
                        }
                    },
                    error: function (result) {
                        layer.msg("出错！");
                    }
                })
            }
        }
    }

    //校验角色名输入内容
    function checkRoleName(own) {
        var name = $(own).val();
        var len = /^.{2,16}$/;
        var check = /^[\u4e00-\u9fa5a-zA-Z0-9]+$/;
        if (name === "") {
            $(own).next().html("");
            return false;
        } else if (!name.match(len)) {
            $(own).next().html("长度只能在2-16个字符之间");
            $(own).next().css("color", "#ff0202");
            return false;
        } else if (roleWhetherRegister(name)) {
            $(own).next().html("角色被占用");
            $(own).next().css("color", "#ff0202");
            return false;
        } else {
            $(own).next().html("");
            return true;
        }
    }

    //检查角色名是否被注册
    function roleWhetherRegister(name) {
        var res = false;
        $.ajax({
            type: "post",
            url: '/backstageManagement/checkRoleName',
            data: {'name': name},
            async: false,
            success: function (data) {
                if (data === "true") {
                    res = true;
                } else {
                    res = false;
                }
            },
            error: function (result) {
                alert("出错！");
            }
        });
        return res;
    }

    //角色输入提示
    function clickPromptRole(owm) {
        var name = $(owm).val();
        if (name === "") {
            $(owm).next().html("支持英文、数字的组合，2-16个字符");
            $(owm).next().css("color", "#737373");
        }
    }

    //编辑角色
    function editRole(roleInfo, currentPage) {
        window.lar = layer.open({
            title: '编辑角色',
            type: 1,
            area: ['25%', '40%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#modifyRole"),
            offset: "20%"
        });

        //记录用户页面选择的页数
        $('#rolePage').val(currentPage);

        var resultRoleInfo = '';
        resultRoleInfo += '<table class="window-table">';
        resultRoleInfo += '<tbody>';
        resultRoleInfo += '<tr>';
        resultRoleInfo += '<td class="form_title">角色名称:</td>';
        resultRoleInfo += '<td class="form_content">';
        resultRoleInfo += '<input id="roleIdEdit" value="' + roleInfo.id + '" type="hidden">';
        resultRoleInfo += '<input class="font_input" name="name" id="nameEdit" value="' + roleInfo.name + '" type="text" style="background: #e8e8e8" readonly>';
        resultRoleInfo += '</td>';
        resultRoleInfo += '</tr>';
        resultRoleInfo += '<tr>';
        resultRoleInfo += '<td class="form_title">角色说明:</td>';
        resultRoleInfo += '<td class="form_content">';
        resultRoleInfo += '<textarea class="description-text" name="description" id="descriptionEdit" placeholder="请输入角色说明" onkeyup="this.value=this.value.replace(/^\\s+|\\s+$/g,\'\')" >';
        resultRoleInfo += roleInfo.description;
        resultRoleInfo += '</textarea>';
        resultRoleInfo += '</td>';
        resultRoleInfo += '</tr>';
        resultRoleInfo += '</tbody>';
        resultRoleInfo += '</table>';

        $('#roleInformation').html(resultRoleInfo);
    }

    //提交编辑后的角色
    function commitRoleEdit() {
        //角色id
        var description = $('#descriptionEdit').val();
        var roleId = $("#roleIdEdit").val();

        $.ajax({
            type: "post",
            url: '/backstageManagement/roleEdit',
            data: {roleId: roleId, description: description},
            async: false,
            cache: false,
            traditional: true,
            success: function (data) {
                if (data === 'success') {
                    layer.close(window.lar);
                    $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.roleInfoPageReload($('#rolePage').val());
                    layer.msg('修改角色成功！');
                } else {
                    layer.msg('修改角色失败！');
                }
            },
            error: function (result) {
                layer.msg("出错！");
            }
        });
    }

    //删除角色
    function deleteRole(id, currentPage) {
        //记录用户页面选择的页数
        $('#rolePage').val(currentPage);

        //提示窗
        layer.confirm('确定要删除吗？', {
                btn: ['确认', '取消']
            }, function () {
                $.ajax({
                    type: "post",
                    url: '/backstageManagement/deleteRole',
                    data: {'id': id},
                    async: false,
                    success: function (data) {
                        if (data === 'success') {
                            layer.msg('删除成功！')
                            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.roleInfoPageReload($('#rolePage').val());
                        } else {
                            layer.msg('删除失败！')
                        }
                    },
                    error: function (result) {
                        layer.msg("出错！");
                    }
                })
            }
        );
    }

    /**-----------------------用户管理---------------------------*/
    //添加用户
    function addUser(department, currentPage) {
        window.lar = layer.open({
            title: '添加用户',
            type: 1,
            area: ['25%', '55%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#addUser"),
            offset: "20%"
        });

        //记录用户页面选择的页数
        $('#currentPage').val(currentPage);

        //解析部门list
        var dep = '';
        for (var i = 0; i < department.length; i++) {
            dep += '<option value="' + department[i].departmentKey + '">' + department[i].departmentName + '</option>';
        }
        $('#department').html(dep);
    }

    //提交新增用户
    function confirm() {
        if ($('#username').val() === '') {
            $('#username').next().html("请输入用户名");
            $('#username').next().css("color", "#ff0202");
        } else {
            var name = checkUsername($('#username'));
            if (!name) {
                return;
            } else {
                if ($('#password').val() === '') {
                    $('#password').next().html("请输入密码");
                    $('#password').next().css("color", "#ff0202");
                } else {
                    var pwd = checkPassword($('#password'));
                    if (!pwd) {
                        return;
                    } else {
                        if ($('#nickname').val() === '') {
                            $('#nickname').next().html("请输入昵称");
                            $('#nickname').next().css("color", "#ff0202");
                        } else {
                            var nick = checkNickname($('#nickname'));
                            if (!nick) {
                                return;
                            } else {
                                if ($('#position').val() === '') {
                                    $('#position').next().html("请输入岗位");
                                    $('#position').next().css("color", "#ff0202");
                                } else {
                                    $.ajax({
                                        type: "post",
                                        url: '/backstageManagement/add',
                                        data: $('#userInfo').serialize(),
                                        success: function (data) {
                                            if (data === 'success') {
                                                //清除from
                                                document.getElementById("userInfo").reset();
                                                layer.close(window.lar);
                                                $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.reloadPage($('#currentPage').val());
                                                layer.msg("添加用户成功!");
                                            } else {
                                                layer.msg("添加用户失败!");
                                            }
                                        },
                                        error: function (result) {
                                            layer.msg("出错！");
                                        }
                                    })
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    //编辑用户
    function editUser(userInfo, department, currentPage) {
        window.lar = layer.open({
            title: '编辑用户',
            type: 1,
            area: ['25%', '55%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#modifyUser"),
            offset: "20%"
        });

        //记录用户页面选择的页数
        $('#currentPage').val(currentPage);

        var resultsInfo = '';

        resultsInfo += '<table class="window-table">';
        resultsInfo += '<tbody>';
        resultsInfo += '<tr>';
        resultsInfo += '<td class="form_title">用户名:</td>';
        resultsInfo += '<td class="form_content">';
        resultsInfo += '<input name="id" value="' + userInfo.id + '" type="hidden">';
        resultsInfo += '<input class="font_input" name="username" id="usernameEdit" value="' + userInfo.username + '" type="text" style="background: #e8e8e8" readonly>';
        resultsInfo += '</td>';
        resultsInfo += '</tr>';
        resultsInfo += '<tr>';
        resultsInfo += '<td class="form_title_check" style="padding-top: 8px">密码:</td>';
        resultsInfo += '<td class="form_content_check">';
        resultsInfo += '<input class="font_input" name="password" id="passwordEdit" value="' + userInfo.password + '" type="text" autocomplete="off" onblur="checkPassword(this)">';
        resultsInfo += '<span class="prompt-span"></span>';
        resultsInfo += '</td>';
        resultsInfo += '</tr>';
        resultsInfo += '<tr>';
        resultsInfo += '<td class="form_title_check">昵称:</td>';
        resultsInfo += '<td class="form_content_check">';
        resultsInfo += '<input class="font_input" name="nickname" id="nicknameEdit" value="' + userInfo.nickname + '" type="text" autocomplete="off" onblur="checkNickname(this)">';
        resultsInfo += '<span class="prompt-span"></span>';
        resultsInfo += '</td>';
        resultsInfo += '</tr>';
        resultsInfo += '<tr>';
        resultsInfo += '<td class="form_title" style="padding-top: 0">部门:</td>';
        resultsInfo += '<td class="form_content" style="padding-top: 0">';
        resultsInfo += '<select name="department" class="font_input">';
        for (var i = 0; i < department.length; i++) {
            if (userInfo.department === department[i].departmentKey) {
                resultsInfo += '<option value="' + department[i].departmentKey + '" selected>' + department[i].departmentName + '</option>';
            } else {
                resultsInfo += '<option value="' + department[i].departmentKey + '">' + department[i].departmentName + '</option>';
            }
        }
        resultsInfo += '</select>';
        resultsInfo += '</td>';
        resultsInfo += '</tr>';
        resultsInfo += '<tr>';
        resultsInfo += '<td class="form_title_check">岗位:</td>';
        resultsInfo += '<td class="form_content_check">';
        resultsInfo += '<input class="font_input" name="position" id="positionEdit" value="' + userInfo.position + '" type="text" onkeyup="this.value=this.value.replace(/^\\s+|\\s+$/g,\'\')" autocomplete="off" onblur="checkPosition(this)">';
        resultsInfo += '<span class="prompt-span"></span>';
        resultsInfo += '</td>';
        resultsInfo += '</tr>';
        resultsInfo += '</tbody>';
        resultsInfo += '</table>';

        $('#userInformation').html(resultsInfo);
    }

    //提交编辑后的用户
    function submissionEdit() {

        if ($('#passwordEdit').val() === '') {
            $('#passwordEdit').next().html("请输入密码");
            $('#passwordEdit').next().css("color", "#ff0202");
        } else {
            var pwd = checkPassword($('#passwordEdit'));
            if (!pwd) {
                return;
            } else {
                if ($('#nicknameEdit').val() === '') {
                    $('#nicknameEdit').next().html("请输入昵称");
                    $('#nicknameEdit').next().css("color", "#ff0202");
                } else {
                    var nick = checkNickname($('#nicknameEdit'));
                    if (!nick) {
                        return;
                    } else {
                        if ($('#positionEdit').val() === '') {
                            $('#positionEdit').next().html("请输入岗位");
                            $('#positionEdit').next().css("color", "#ff0202");
                        } else {
                            $.ajax({
                                type: "post",
                                url: '/backstageManagement/edit',
                                data: $('#userInformation').serialize(),
                                success: function (data) {
                                    if (data === 'success') {
                                        layer.close(window.lar);
                                        $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.reloadPage($('#currentPage').val());
                                        layer.msg('修改用户成功！');
                                    } else {
                                        layer.msg('修改用户失败！');
                                    }
                                },
                                error: function (result) {
                                    layer.msg("出错！");
                                }
                            })
                        }
                    }
                }
            }
        }
    }

    //绑定角色
    function bindingRole(roleInfo, id, currentPage) {
        window.lar = layer.open({
            title: '绑定角色',
            type: 1,
            area: ['25%', '55%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#bindingRole"),
            offset: "20%"
        });

        //记录用户页面选择的页数
        $('#currentPage').val(currentPage);

        //角色信息
        var roleList = roleInfo.roleInfoList;
        //已绑定角色信息
        var possessRoleList = roleInfo.existingRoleInfo;

        var roleInfoList = '';
        roleInfoList += '<div id="RoleInformationTab" style="height: 80%;overflow: auto">';
        roleInfoList += '<table id="permissionList" class="table-list">';
        roleInfoList += '<tbody id="perListTbody">';
        roleInfoList += '<input id="bindingUserId" type="hidden" value="' + id + '">';
        for (var i = 0; i < roleList.length; i++) {
            roleInfoList += '<tr onclick="checkboxEvent(this)" style="height: 18px">';
            roleInfoList += '<td class="table-list-td-checkbox">';
            roleInfoList += '<input type="checkbox" value="' + roleList[i].id + '" onclick="window.event.cancelBubble=true;">';
            roleInfoList += '</td>';
            roleInfoList += '<td class="per-list-td">' + roleList[i].name + '</td>';
            roleInfoList += '</tr>';
        }
        roleInfoList += '</tbody>';
        roleInfoList += '</table>';
        roleInfoList += '</div>';
        roleInfoList += '<div style="padding-top: 20px;text-align: center">';
        roleInfoList += '<input type="button" value="确认" onclick="submissionBinding()" class="confirm-btn-style">';
        roleInfoList += '<input type="button" value="取消" onclick="cancel()" class="cancel-btn-style left-spacing">';
        roleInfoList += '</div>';

        $('#bindingRole').html(roleInfoList);

        //勾选已有角色
        for (var j = 0; j < possessRoleList.length; j++) {
            $('#perListTbody').children('tr').find('input').each(function () {
                if ($(this).val() == possessRoleList[j].id) {
                    this.checked = true;
                }
            });
        }
    }

    //提交绑定
    function submissionBinding() {
        //用户id
        var userId = $('#bindingUserId').val();
        //选中的角色列表
        var array = [];
        var list = $("#perListTbody input:checked");
        for (var i = 0; i < list.length; i++) {
            array.push(list[i].value);
        }
        $.ajax({
            type: "post",
            url: '/backstageManagement/binding',
            data: 'userId=' + userId + '&array=' + array,
            success: function (data) {
                if (data === 'success') {
                    layer.close(window.lar);
                    $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.reloadPage($('#currentPage').val());
                    layer.msg('绑定角色成功！');
                } else {
                    layer.msg('绑定角色失败！');
                }
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    //删除用户
    function deleteUser(id, currentPage) {

        //记录用户页面选择的页数
        $('#currentPage').val(currentPage);

        //提示窗
        layer.confirm('确定要删除吗？', {
                btn: ['确认', '取消']
            }, function () {
                $.ajax({
                    type: "post",
                    url: '/backstageManagement/delete',
                    data: {'id': id},
                    async: false,
                    success: function (data) {
                        if (data === 'success') {
                            layer.msg('删除成功！')
                            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.reloadPage($('#currentPage').val());
                        } else {
                            layer.msg('删除失败！')
                        }
                    },
                    error: function (result) {
                        layer.msg("出错！");
                    }
                });
            }
        );
    }

    //用户名密码输入提示
    function clickPrompt(owm) {
        var username = $(owm).val();
        if (username === "") {
            $(owm).next().html("支持英文、数字的组合，4-16个字符");
            $(owm).next().css("color", "#737373");
        }
    }

    //校验密码输入内容
    function checkPassword(own) {
        var pwd = $(own).val();
        var len = /^.{4,16}$/;
        var reg = /^[a-zA-Z0-9]{4,16}$/;
        var han = "^[\u4e00-\u9fa5]{0,}$";
        if (pwd === "") {
            $(own).next().html("");
            return false;
        } else if (pwd.match(han)) {
            $(own).next().html("只支持英文、数字的组合");
            $(own).next().css("color", "#ff0202");
            return false;
        } else if (!pwd.match(len)) {
            $(own).next().html("长度只能在4-16个字符之间");
            $(own).next().css("color", "#ff0202");
            return false;
        } else if (!pwd.match(reg)) {
            $(own).next().html("只支持英文、数字的组合");
            $(own).next().css("color", "#ff0202");
            return false;
        } else {
            $(own).next().html("");
            return true;
        }
    }

    //校验用户名输入内容
    function checkUsername(own) {
        var username = $(own).val();
        var len = /^.{4,16}$/;
        var reg = /^[a-zA-Z0-9]{4,16}$/;
        var han = "^[\u4e00-\u9fa5]{0,}$";
        if (username === "") {
            $(own).next().html("");
            return false;
        } else if (username.match(han)) {
            $(own).next().html("只支持英文、数字的组合");
            $(own).next().css("color", "#ff0202");
            return false;
        } else if (!username.match(len)) {
            $(own).next().html("长度只能在4-16个字符之间");
            $(own).next().css("color", "#ff0202");
            return false;
        } else if (!username.match(reg)) {
            $(own).next().html("只支持英文、数字的组合");
            $(own).next().css("color", "#ff0202");
            return false;
        } else if (whetherRegister(username)) {
            $(own).next().html("用户已存在");
            $(own).next().css("color", "#ff0202");
            return false;
        } else {
            $(own).next().html("");
            return true;
        }
    }

    //检查用户名是否被注册
    function whetherRegister(username) {
        var res = false;
        $.ajax({
            type: "post",
            url: '/backstageManagement/checkUsername',
            data: {'username': username},
            async: false,
            success: function (data) {
                if (data === "true") {
                    res = true;
                } else {
                    res = false;
                }
            },
            error: function (result) {
                alert("出错！");
            }
        });
        return res;
    }

    //显示昵称输入提示
    function nicknameClickPrompt(owm) {
        var username = $(owm).val();
        if (username === "") {
            $(owm).next().html("支持中文、英文、数字的组合，2-16个字符");
            $(owm).next().css("color", "#737373");
        }
    }

    //校验昵称输入内容
    function checkNickname(own) {
        var nick = $(own).val();
        var len = /^.{2,16}$/;
        var reg = /^[\u4e00-\u9fa5a-zA-Z0-9]+$/;
        if (nick === "") {
            $(own).next().html("");
            return false;
        } else if (!nick.match(len)) {
            $(own).next().html("长度只能在2-16个字符之间");
            $(own).next().css("color", "#ff0202");
            return false;
        } else if (!nick.match(reg)) {
            $(own).next().html("只支持中文、英文、数字的组合");
            $(own).next().css("color", "#ff0202");
            return false;
        } else {
            $(own).next().html("");
            return true;
        }
    }

    //校验岗位
    function checkPosition(own) {
        var position = $(own).val();
        if (position === "") {
            $(own).next().html("请输入岗位");
            $(own).next().css("color", "#ff0202");
            return false;
        } else {
            $(own).next().html("");
            return true;
        }
    }

    /**---------------OA审批表单-----------------*/
    //OA审批单，部门选择
    function selectionDepartment(departmentList, flag) {
        window.lar = layer.open({
            title: '选择部门',
            type: 1,
            area: ['20%', '50%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#departmentSelector"),
            offset: "20%"
        });
        $('#departmentFlag').val(flag);
        //加载部门
        var department = "";
        for (let i = 0; i < departmentList.length; i++) {
            department += '<li class="selection-box-li">';
            department += '<img src="../../static/images/icon/department.png">';
            department += '<span onclick="selectedDepartment(this)" id="' + departmentList[i].departmentKey + '">' + departmentList[i].departmentName + '</span>';
            department += '<div></div>';
            department += '</li>';
        }
        $("#departmentList").html(department);
    }

    //部门选择器
    function selectedDepartment(own) {
        if ($(own).nextAll('div').hasClass("selection")) {
            $(own).nextAll('div').removeClass("selection");
        } else {
            $('#selectionDep').find('div').removeClass("selection");
            $(own).nextAll("div").addClass("selection");
        }
    }

    //提交
    function confirmDepartmentSelection() {
        var lis = $("#selectionDep").find("div");
        //是否包含selectedDrafter
        if (lis.hasClass("selection")) {
            var id = $(".selection").prev().attr('id')
            var name = $(".selection").prev().text()
            var flag = $('#departmentFlag').val();
            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.selectDepartmentComplete(id, name, flag);
            layer.close(window.lar);
        } else {
            layer.msg('请选择部门！')
        }
    }

    //OA审批表中使用
    function selectRecipient(userInfoList, departmentList) {
        window.lar = layer.open({
            title: '请选择',
            type: 1,
            area: ['20%', '50%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#selectRecipientModel"),
            offset: "20%"
        });
        //加载部门和员工
        var department = "";
        for (let i = 0; i < departmentList.length; i++) {
            department += '<li class="selection-box-li">';
            department += '<img src="../../static/images/icon/department.png">';
            department += '<span onclick="departmentSelect(this)" id="' + departmentList[i].departmentKey + '">' + departmentList[i].departmentName + '</span>';
            department += '<div></div>';
            for (let j = 0; j < userInfoList.length; j++) {
                if (userInfoList[j].department === departmentList[i].departmentKey) {
                    department += '<ul class="submenu-ul">';
                    department += '<li onclick="addSelectionUserRecipient(this)">';
                    department += '<img src="../../static/images/icon/personnel.png">';
                    department += '<span id="' + userInfoList[j].id + '">' + userInfoList[j].nickname + '</span>';
                    department += '<div></div>';
                    department += '</li>';
                    department += '</ul>';
                }
            }
            department += '</li>';
        }
        $("#departmentAndUserRecipient").html(department);
    }

    //用户选择器
    function addSelectionUserRecipient(own) {
        if ($(own).children('div').hasClass("selection")) {
            $(own).children('div').removeClass("selection");
        } else {
            $('#selectDepartmentRecipient').find('div').removeClass("selection");
            $(own).find("div").addClass("selection");
        }
    }

    //提交
    function confirmDepartmentRecipient() {
        var lis = $("#selectDepartmentRecipient").find("div");
        //是否包含selectedDrafter
        if (lis.hasClass("selection")) {
            //选择的用户id
            var principal = $(".selection").prev().attr('id');
            var principalStr = $(".selection").prev().text();
            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.confirmSelectRecipient(principal, principalStr);
            layer.close(window.lar);
        } else {
            layer.msg('请选择被通知人！')
        }
    }

    /**---------------资源管理----------------*/
    //删除
    function deleteAssetsArchivs(assetsArchivsId, currentPage) {
        layer.prompt({
            formType: 2,
            value: '',
            title: '删除原因',
            area: ['300px', '150px'] //自定义文本域宽高
        }, function (value, index, elem) {
            // alert(value); //得到value
            layer.confirm('该操作不能恢复,是否进行删除操作？', {
                    btn: ['确认', '取消']
                }, function () {
                console.log(value);
                console.log(assetsArchivsId);
                    $.ajax({
                        type: "post",
                        url: "/assetsManagement/delete",
                        data: {'id': assetsArchivsId, 'deleteReason': value},
                        async: false,
                        success: function (data) {
                            if (data === 'success') {
                                layer.msg('删除成功！');
                                $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.reloadAssetsArchivs(currentPage);
                            } else {
                                layer.msg('删除失败！')
                            }
                        },
                        error: function (result) {
                            layer.msg("出错！");
                        }
                    });
                });
            layer.close(index);
        });
    }

    //编辑
    function editAssetsArchivs(assetsData) {
        window.lar = layer.open({
            title: '编辑资产信息',
            type: 1,
            area: ['25%', '45%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#modifyAssetsInfo"),
            offset: "20%"
        });

        var assetsInfo = '';

        assetsInfo += '<table class="window-table">';
        assetsInfo += '<tbody>';
        assetsInfo += '<tr>';
        assetsInfo += '<td class="form_title">资产名称:</td>';
        assetsInfo += '<td class="form_content">';
        assetsInfo += '<input name="id" value="' + assetsData.id + '" type="hidden">';
        assetsInfo += '<input class="font_input" name="assetsName" id="assetsNameEdit" value="' + assetsData.assetsName + '" type="text" autocomplete="off">';
        assetsInfo += '</td>';
        assetsInfo += '</tr>';
        assetsInfo += '<tr>';
        assetsInfo += '<td class="form_title_check" style="padding-top: 8px">库存数量:</td>';
        assetsInfo += '<td class="form_content_check">';
        assetsInfo += '<input class="font_input" name="productQuantity" id="productQuantityEdit" value="' + assetsData.productQuantity + '" type="text" onkeyup="value=value.replace(/^(-+)|[^\\d]+/g,\'\')" autocomplete="off">';
        assetsInfo += '</td>';
        assetsInfo += '</tr>';
        assetsInfo += '<tr>';
        assetsInfo += '<td class="form_title">编辑说明:</td>';
        assetsInfo += '<td class="form_content">';
        assetsInfo += '<textarea class="description-text" name="editExplain" id="editExplainEdit" onkeyup="this.value=this.value.replace(/^\\s+|\\s+$/g,\'\')" ></textarea>';
        assetsInfo += '</td>';
        assetsInfo += '</tr>';
        assetsInfo += '</tbody>';
        assetsInfo += '</table>';

        $('#oaAssetManagement').html(assetsInfo);
    }

    //提交编辑
    function submissionAssetEdit() {
        if ($.trim($("#assetsNameEdit").val()) === '') {
            window.top.tips("资产名称不能为空！", 6, 5, 1000);
        }else {
            if ($.trim($("#productQuantityEdit").val()) === '') {
                window.top.tips("库存数量不能为空！", 6, 5, 1000);
            }else {
                if ($.trim($("#editExplainEdit").val()) === '') {
                    window.top.tips("编辑说明不能为空！", 6, 5, 1000);
                }else {
                    $.ajax({
                        type: "post",
                        url: '/assetsManagement/edit',
                        data: $('#oaAssetManagement').serialize(),
                        success: function (data) {
                            if (data === 'success') {
                                layer.close(window.lar);
                                $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.reloadAssetsArchivs(1);
                                layer.msg('修改成功！');
                            } else {
                                layer.msg('修改失败！');
                            }
                        },
                        error: function (result) {
                            layer.msg("出错！");
                        }
                    })
                }
            }
        }
    }

    /**---------------档案管理----------------*/
    //删除档案数据
    function deleteArchivesData(tab, id, currentPage) {
        //记录用户页面选择的页数
        $('#currentPage').val(currentPage);
        //提示窗
        layer.confirm('确定要删除吗？', {
                btn: ['确认', '取消']
            }, function () {
                $.ajax({
                    type: "post",
                    url: tab + '/delete',
                    data: {'id': id},
                    async: false,
                    success: function (data) {
                        if (data === 'success') {
                            layer.msg('删除成功！');
                            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.reloadArchivesData($('#currentPage').val());
                        } else {
                            layer.msg('删除失败！');
                        }
                    },
                    error: function (result) {
                        layer.msg("出错！");
                    }
                });
            }
        );
    }

    /**---------------企业文化建设----------------*/
    //删除企业文化建设数据
    function cultureCorporateDelete(tab, id, currentPage) {
        layer.confirm('确定要删除吗？', {
                btn: ['确认', '取消']
            }, function () {
                $.ajax({
                    type: "post",
                    url: tab + '/delete',
                    data: {'id': id},
                    async: false,
                    success: function (data) {
                        if (data === 'success') {
                            layer.msg('删除成功！');
                            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.reloadCultureCorporateData(currentPage);
                        } else {
                            layer.msg('删除失败！')
                        }
                    },
                    error: function (result) {
                        layer.msg("出错！");
                    }
                });
            }
        );
    }

    /**---------------协同工作----------------*/
    //协同-删除已发事项
    function deleteAlreadySend(url, id, processInstanceId, currentPage) {
        //提示窗
        layer.confirm('该操作不能恢复,是否进行删除操作？', {
                btn: ['确认', '取消']
            }, function () {
                $.ajax({
                    type: "post",
                    url: url,
                    data: {'id': id, 'processInstanceId': processInstanceId},
                    async: false,
                    success: function (data) {
                        if (data === 'success') {
                            layer.msg('删除成功！');
                            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.reloadAlreadySendDocument(currentPage);
                        } else {
                            layer.msg('删除失败！')
                        }
                    },
                    error: function (result) {
                        layer.msg("出错！");
                    }
                });
            }
        );
    }

    //协同-撤销已发事项
    function rescindAlreadySend(url, id, processInstanceId, currentPage) {
        //提示窗
        layer.confirm('确定要撤销流程吗？', {
                btn: ['确认', '取消']
            }, function () {
                $.ajax({
                    type: "post",
                    url: url,
                    data: {'id': id, 'processInstanceId': processInstanceId},
                    success: function (data) {
                        if (data === 'success') {
                            layer.msg('撤销流程成功,并将数据转存到待发事项中！');
                            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.reloadAlreadySendDocument(currentPage);
                        } else if (data === 'end') {
                            layer.msg('该流程已结束,不能撤销！')
                        } else {
                            layer.msg('撤销流程失败！')
                        }
                    },
                    error: function (result) {
                        layer.msg("出错！");
                    }
                });
            }
        );
    }

    //协同-删除待发事项
    function deleteWaitSend(correlationId, table, currentPage) {
        //提示窗
        layer.confirm('该操作不能恢复,是否进行删除操作？', {
                btn: ['确认', '取消']
            }, function () {
                $.ajax({
                    type: "post",
                    url: "/collaboration/deleteWaitSend",
                    data: {'correlationId': correlationId, 'table': table},
                    async: false,
                    success: function (data) {
                        if (data === 'success') {
                            layer.msg('删除成功！');
                            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.reloadWaitSendDocument(currentPage);
                        } else {
                            layer.msg('删除失败！')
                        }
                    },
                    error: function (result) {
                        layer.msg("出错！");
                    }
                });
            }
        );
    }

    /**-------------------人事管理start-------------------*/
    //删除员工信息
    function deletePersonnel(id, currentPage) {
        //提示窗
        layer.confirm('确认后关联的合同也会被删除！', {
                btn: ['确认', '取消']
            }, function () {
                $.ajax({
                    type: "post",
                    url: '/personnel/delete',
                    data: {'id': id},
                    async: false,
                    success: function (data) {
                        if (data === 'success') {
                            layer.msg('删除成功！');
                            $("#iframe")[0].contentWindow.$("#personnel")[0].contentWindow.reloadPersonnelPage(currentPage);
                        } else {
                            layer.msg('删除失败！')
                        }
                    },
                    error: function (result) {
                        layer.msg("出错！");
                    }

                });
            }
        );
    }

    /*用户详情信息*/
    function personnelDetails(id) {
        window.lar = layer.open({
            title: false,
            type: 1,
            area: '90%',
            shadeClose: false, //点击遮罩关闭
            content: $("#userDetails"),
            offset: "20%"
        });

        $.ajax({
            type: "post",
            url: "/personnel/personnelDetails",
            data: {'id': id},
            async: false,
            dataType: "json",
            success: function (data) {

                var personnelInfo = '';

                personnelInfo += '<table class="basic-details-style-table">';
                personnelInfo += '<tbody>';
                personnelInfo += '<tr>';
                personnelInfo += '<td class="table-td-name">部门</td>';
                personnelInfo += '<td style="width: 11.9%">' + data.department + '</td>';
                personnelInfo += '<td class="table-td-name">岗位类别</td>';
                if (data.jobCategory === 0) {
                    personnelInfo += '<td style="width: 11.9%">领导班子</td>';
                } else if (data.jobCategory === 1) {
                    personnelInfo += '<td style="width: 11.9%">中层管理人员</td>';
                }
                if (data.jobCategory === 2) {
                    personnelInfo += '<td style="width: 11.9%">一般管理人员</td>';
                }
                if (data.jobCategory === 3) {
                    personnelInfo += '<td style="width: 11.9%">一线生产工人</td>';
                }
                if (data.jobCategory === 4) {
                    personnelInfo += '<td style="width: 11.9%">其它</td>';
                }
                personnelInfo += '<td class="table-td-name">职务(岗位)</td>';
                personnelInfo += '<td style="width: 11.9%">' + data.job + '</td>';
                personnelInfo += '<td class="table-td-name">副职</td>';
                personnelInfo += '<td style="width: 11.9%">' + data.viceJob + '</td>';
                personnelInfo += '<td class="table-td-name">身份证号</td>';
                personnelInfo += '<td>' + data.idCard + '</td>';
                personnelInfo += '</tr>';

                personnelInfo += '<tr>';
                personnelInfo += '<td class="table-td-name">姓名</td>';
                personnelInfo += '<td>' + data.name + '</td>';
                personnelInfo += '<td class="table-td-name">性别</td>';
                personnelInfo += '<td>' + data.sex + '</td>';
                personnelInfo += '<td class="table-td-name">出生日期</td>';
                personnelInfo += '<td>' + data.birthday + '</td>';
                personnelInfo += '<td class="table-td-name">年龄</td>';
                personnelInfo += '<td>' + data.age + '</td>';
                personnelInfo += '<td class="table-td-name">民族</td>';
                personnelInfo += '<td>' + data.nation + '</td>';
                personnelInfo += '</tr>';

                personnelInfo += '<tr>';

                personnelInfo += '<td class="table-td-name">籍贯</td>';
                personnelInfo += '<td>' + data.nativePlace + '</td>';
                personnelInfo += '<td class="table-td-name">户口所在地</td>';
                personnelInfo += '<td>' + data.registeredResidence + '</td>';
                personnelInfo += '<td class="table-td-name">户口性质</td>';
                if (data.accountNature === 0) {
                    personnelInfo += '<td>本埠城镇</td>';
                } else if (data.accountNature === 1) {
                    personnelInfo += '<td>本埠农村</td>';
                } else if (data.accountNature === 2) {
                    personnelInfo += '<td>外埠城镇</td>';
                } else if (data.accountNature === 3) {
                    personnelInfo += '<td>外埠农村</td>';
                }
                personnelInfo += '<td class="table-td-name">联系电话</td>';
                personnelInfo += '<td>' + data.phone + '</td>';
                personnelInfo += '<td class="table-td-name">政治面貌</td>';
                if (data.politicCountenance === 0) {
                    personnelInfo += '<td>群众</td>';
                } else if (data.politicCountenance === 1) {
                    personnelInfo += '<td>团员</td>';
                } else if (data.politicCountenance === 2) {
                    personnelInfo += '<td>中共党员</td>';
                }
                personnelInfo += '</tr>';

                personnelInfo += '<tr>';
                personnelInfo += '<td class="table-td-name">入党日期</td>';
                personnelInfo += '<td>' + data.joinPartyDate + '</td>';
                personnelInfo += '<td class="table-td-name">参加工作时间</td>';
                personnelInfo += '<td>' + data.joinWorkDate + '</td>';
                personnelInfo += '<td class="table-td-name">工作年限</td>';
                personnelInfo += '<td>' + data.workingYears + '</td>';
                personnelInfo += '<td class="table-td-name">入职日期</td>';
                personnelInfo += '<td>' + data.joinedDate + '</td>';
                personnelInfo += '<td class="table-td-name">转正日期</td>';
                personnelInfo += '<td>' + data.correctionDate + '</td>';
                personnelInfo += '</tr>';

                personnelInfo += '<tr>';
                personnelInfo += '<td class="table-td-name">职称级别</td>';
                if (data.titleLevel === 0) {
                    personnelInfo += '<td>未取得职称</td>';
                } else if (data.titleLevel === 1) {
                    personnelInfo += '<td>员级</td>';
                } else if (data.titleLevel === 2) {
                    personnelInfo += '<td>助理</td>';
                } else if (data.titleLevel === 3) {
                    personnelInfo += '<td>中级</td>';
                } else if (data.titleLevel === 4) {
                    personnelInfo += '<td>副高级</td>';
                } else if (data.titleLevel === 5) {
                    personnelInfo += '<td>正高级</td>';
                }
                personnelInfo += '<td class="table-td-name">职称系列</td>';
                personnelInfo += '<td>' + data.titleSeries + '</td>';
                personnelInfo += '<td class="table-td-name">职称名称</td>';
                personnelInfo += '<td>' + data.titleName + '</td>';
                personnelInfo += '<td class="table-td-name">工种名称</td>';
                personnelInfo += '<td>' + data.professionName + '</td>';
                personnelInfo += '<td class="table-td-name">工人技术等级</td>';
                if (data.technologyGrade === 0) {
                    personnelInfo += '<td>未取证</td>';
                } else if (data.technologyGrade === 1) {
                    personnelInfo += '<td>初级</td>';
                } else if (data.technologyGrade === 2) {
                    personnelInfo += '<td>中级</td>';
                } else if (data.technologyGrade === 3) {
                    personnelInfo += '<td>高级</td>';
                } else if (data.technologyGrade === 4) {
                    personnelInfo += '<td>技师</td>';
                } else if (data.technologyGrade === 5) {
                    personnelInfo += '<td>高级技师</td>';
                }
                personnelInfo += '</tr>';

                personnelInfo += '<tr>';
                personnelInfo += '<td class="table-td-name">原学历</td>';
                if (data.originalEducation === 0) {
                    personnelInfo += '<td>初中及以下</td>';
                } else if (data.originalEducation === 1) {
                    personnelInfo += '<td>高中</td>';
                } else if (data.originalEducation === 2) {
                    personnelInfo += '<td>技校</td>';
                } else if (data.originalEducation === 3) {
                    personnelInfo += '<td>中专</td>';
                } else if (data.originalEducation === 4) {
                    personnelInfo += '<td>专科</td>';
                } else if (data.originalEducation === 5) {
                    personnelInfo += '<td>本科</td>';
                } else if (data.originalEducation === 6) {
                    personnelInfo += '<td>硕士</td>';
                } else if (data.originalEducation === 7) {
                    personnelInfo += '<td>博士</td>';
                }
                personnelInfo += '<td class="table-td-name">原学位</td>';
                if (data.originalDegree === 0) {
                    personnelInfo += '<td>无</td>';
                } else if (data.originalDegree === 1) {
                    personnelInfo += '<td>学士</td>';
                } else if (data.originalDegree === 2) {
                    personnelInfo += '<td>硕士</td>';
                } else if (data.originalDegree === 3) {
                    personnelInfo += '<td>博士</td>';
                } else if (data.originalDegree === 4) {
                    personnelInfo += '<td>博士后</td>';
                }
                personnelInfo += '<td class="table-td-name">原毕业学校</td>';
                personnelInfo += '<td>' + data.originalGraduationSchool + '</td>';
                personnelInfo += '<td class="table-td-name">原专业</td>';
                personnelInfo += '<td>' + data.originalProfession + '</td>';
                personnelInfo += '<td class="table-td-name">原毕业时间</td>';
                personnelInfo += '<td>' + data.originalGraduationDate + '</td>';
                personnelInfo += '</tr>';

                personnelInfo += '<tr>';
                personnelInfo += '<td class="table-td-name">现学历</td>';
                if (data.nowEducation === 0) {
                    personnelInfo += '<td>初中及以下</td>';
                } else if (data.nowEducation === 1) {
                    personnelInfo += '<td>高中</td>';
                } else if (data.nowEducation === 2) {
                    personnelInfo += '<td>技校</td>';
                } else if (data.nowEducation === 3) {
                    personnelInfo += '<td>中专</td>';
                } else if (data.nowEducation === 4) {
                    personnelInfo += '<td>专科</td>';
                } else if (data.nowEducation === 5) {
                    personnelInfo += '<td>本科</td>';
                } else if (data.nowEducation === 6) {
                    personnelInfo += '<td>硕士</td>';
                } else if (data.nowEducation === 7) {
                    personnelInfo += '<td>博士</td>';
                }
                personnelInfo += '<td class="table-td-name">现学位</td>';
                if (data.nowDegree === 0) {
                    personnelInfo += '<td>无</td>';
                } else if (data.nowDegree === 1) {
                    personnelInfo += '<td>学士</td>';
                } else if (data.nowDegree === 2) {
                    personnelInfo += '<td>硕士</td>';
                } else if (data.nowDegree === 3) {
                    personnelInfo += '<td>博士</td>';
                } else if (data.nowDegree === 4) {
                    personnelInfo += '<td>博士后</td>';
                }
                personnelInfo += '<td class="table-td-name">现毕业学校</td>';
                personnelInfo += '<td>' + data.nowGraduationSchool + '</td>';
                personnelInfo += '<td class="table-td-name">现专业</td>';
                personnelInfo += '<td>' + data.nowProfession + '</td>';
                personnelInfo += '<td class="table-td-name">现毕业时间</td>';
                personnelInfo += '<td>' + data.nowGraduationDate + '</td>';
                personnelInfo += '</tr>';

                personnelInfo += '<tr>';
                personnelInfo += '<td class="table-td-name">用工类型</td>';
                if (data.workType === 0) {
                    personnelInfo += '<td>自有职工</td>';
                } else if (data.workType === 1) {
                    personnelInfo += '<td>外包职工</td>';
                }
                personnelInfo += '<td class="table-td-name">原职务</td>';
                personnelInfo += '<td>' + data.originalPosition + '</td>';
                personnelInfo += '<td class="table-td-name">原岗位</td>';
                personnelInfo += '<td>' + data.originalPost + '</td>';
                personnelInfo += '<td class="table-td-name">现岗位任职时间</td>';
                personnelInfo += '<td>' + data.currentPosition + '</td>';
                personnelInfo += '<td class="table-td-name">转岗时间</td>';
                personnelInfo += '<td>' + data.transfer + '</td>';
                personnelInfo += '</tr>';

                personnelInfo += '<tr>';
                personnelInfo += '<td class="table-td-name">在岗情况</td>';
                personnelInfo += '<td>' + data.postSituation + '</td>';
                personnelInfo += '<td class="table-td-name">身体情况</td>';
                personnelInfo += '<td>' + data.physicalCondition + '</td>';
                personnelInfo += '<td class="table-td-name">其他证书</td>';
                personnelInfo += '<td colspan="3">' + data.otherCertificates + '</td>';
                personnelInfo += '<td class="table-td-name">提交离职申请日期</td>';
                personnelInfo += '<td>' + data.submissionApply + '</td>';
                personnelInfo += '</tr>';

                personnelInfo += '<tr>';
                personnelInfo += '<td class="table-td-name">申请离职日期</td>';
                personnelInfo += '<td>' + data.applyLeave + '</td>';
                personnelInfo += '<td class="table-td-name">离职日期</td>';
                personnelInfo += '<td>' + data.leaveDate + '</td>';
                personnelInfo += '<td class="table-td-name">预计退休时间</td>';
                personnelInfo += '<td>' + data.estimateRetirementDate + '</td>';
                personnelInfo += '<td class="table-td-name">退休时间</td>';
                personnelInfo += '<td>' + data.retirementDate + '</td>';
                personnelInfo += '<td class="table-td-name">退休单位</td>';
                personnelInfo += '<td>' + data.retirementCompany + '</td>';
                personnelInfo += '</tr>';
                personnelInfo += '</tbody>';
                personnelInfo += '</table>';
                $('#userDetailsInfoShow').html(personnelInfo);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        });
    }

    /*人事合同详情*/
    function contractDetails(id) {
        window.lar = layer.open({
            title: false,
            type: 1,
            area: '50%',
            shadeClose: false, //点击遮罩关闭
            content: $("#contractDetails"),
            offset: "20%"
        });

        $.ajax({
            type: "post",
            url: "/personnel/contractDetails",
            data: {'id': id},
            async: false,
            dataType: "json",
            success: function (data) {
                var personnelInfo = '';
                personnelInfo += '<table class="basic-details-style-table">';
                personnelInfo += '<tbody>';
                personnelInfo += '<tr>';
                personnelInfo += '<td class="table-td-name">姓名</td>';
                personnelInfo += '<td style="width: 19.5%">' + data.name + '</td>';
                personnelInfo += '<td class="table-td-name">性别</td>';
                personnelInfo += '<td style="width: 19.5%">' + data.sex + '</td>';
                personnelInfo += '<td class="table-td-name">入职日期</td>';
                personnelInfo += '<td style="width: 19.5%">' + data.joinedDate + '</td>';
                personnelInfo += '</tr>';

                personnelInfo += '<tr>';
                personnelInfo += '<td class="table-td-name">首次签订期限</td>';
                if (data.firstTerm === 0) {
                    personnelInfo += '<td>—</td>';
                } else if (data.firstTerm === 1) {
                    personnelInfo += '<td>三年</td>';
                } else if (data.firstTerm === 2) {
                    personnelInfo += '<td>五年</td>';
                } else if (data.firstTerm === 3) {
                    personnelInfo += '<td>无固定</td>';
                } else if (data.firstTerm === 4) {
                    personnelInfo += '<td>其他</td>';
                }

                personnelInfo += '<td class="table-td-name">首次签订日期</td>';
                if (data.firstSign == undefined || data.firstSign == "") {
                    personnelInfo += '<td>—</td>';
                } else {
                    personnelInfo += '<td>' + data.firstSign + '</td>';
                }

                personnelInfo += '<td class="table-td-name">首次签订终止日期</td>';
                if (data.firstStop == undefined || data.firstStop == "") {
                    personnelInfo += '<td>—</td>';
                } else {
                    personnelInfo += '<td>' + data.firstStop + '</td>';
                }
                personnelInfo += '</tr>';

                personnelInfo += '<tr>';
                personnelInfo += '<td class="table-td-name">续签期限</td>';
                if (data.renewTerm === 0) {
                    personnelInfo += '<td>—</td>';
                } else if (data.renewTerm === 1) {
                    personnelInfo += '<td>三年</td>';
                } else if (data.renewTerm === 2) {
                    personnelInfo += '<td>五年</td>';
                } else if (data.renewTerm === 3) {
                    personnelInfo += '<td>无固定</td>';
                } else if (data.renewTerm === 4) {
                    personnelInfo += '<td>其他</td>';
                }

                personnelInfo += '<td class="table-td-name">续签签订日期</td>';
                if (data.renewSign == undefined || data.renewSign == "") {
                    personnelInfo += '<td>—</td>';
                } else {
                    personnelInfo += '<td>' + data.renewSign + '</td>';
                }

                personnelInfo += '<td class="table-td-name">续签终止日期</td>';
                if (data.renewStop == undefined || data.renewStop == "") {
                    personnelInfo += '<td>—</td>';
                } else {
                    personnelInfo += '<td>' + data.renewStop + '</td>';
                }
                personnelInfo += '</tr>';

                personnelInfo += '<tr>';
                personnelInfo += '<td class="table-td-name">最终签订期限</td>';
                if (data.lastTerm === 0) {
                    personnelInfo += '<td>—</td>';
                } else if (data.lastTerm === 1) {
                    personnelInfo += '<td>三年</td>';
                } else if (data.lastTerm === 2) {
                    personnelInfo += '<td>五年</td>';
                } else if (data.lastTerm === 3) {
                    personnelInfo += '<td>无固定</td>';
                } else if (data.lastTerm === 4) {
                    personnelInfo += '<td>其他</td>';
                }
                personnelInfo += '<td class="table-td-name">最终签订日期</td>';
                if (data.lastSign == undefined || data.lastSign == "") {
                    personnelInfo += '<td>—</td>';
                } else {
                    personnelInfo += '<td>' + data.lastSign + '</td>';
                }
                personnelInfo += '<td class="table-td-name">最终签订终止日期</td>';
                if (data.lastStop == undefined || data.lastStop == "") {
                    personnelInfo += '<td>—</td>';
                } else {
                    personnelInfo += '<td>' + data.lastStop + '</td>';
                }
                personnelInfo += '</tr>';
                personnelInfo += '</tbody>';
                personnelInfo += '</table>';
                $('#contractDetailsInfoShow').html(personnelInfo);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        });
    }

    /**-------------------人事管理end-------------------*/

    //checkbox选中事件
    function checkboxEvent(own) {
        var checkbox = $(own).children('td').children('input').prop('checked');
        if (checkbox) {
            $(own).children('td').children('input').attr("checked", false);
        } else {
            $(own).children('td').children('input').attr("checked", true);
        }
    }

    //提示
    function tips(tipsContent, anim, icon, time) {
        layer.msg(tipsContent, {
            //0平滑放大。默认 1从上掉落、2从最底部往上滑入、3从左滑入、4从左翻滚、5渐显、6抖动
            anim: anim,
            //0感叹号、1正确、2错误、3文号、4锁、5哭脸、6笑脸
            icon: icon,
            //单位毫秒
            time: time
        });
    }

    //关闭弹窗
    function cancel() {
        layer.close(window.lar);
    }

    //全局质量报警
    window.setInterval("showGlobalWarningData()", 6000);

    function showGlobalWarningData() {
        var path = $("#path").val();
        $.ajax({
            type: "GET",
            url: path + "/getGlobalWarningData.do",
            dataType: "json",
            success: function (res) {

                var crew1DiscNum = "";
                var crew2DiscNum = "";
                $("#warningData").empty();
                if (res != "" || res != null) {

                    /******************渲染基本信息**********************/
                    for (var i = 0; i < res.length; i++) {
                        var crewNum = res[i].produce_crewNum;
                        var discNum = res[i].produce_disc_num;
                        var materialName = res[i].material_name;
                        var warningLevel = res[i].warning_level;
                        var actualRatio = res[i].actual_ratio;
                        var moudleRatio = res[i].moudle_ratio;
                        var deviationRatio = res[i].deviation_ratio;


                        if (materialName != "一仓温度" || materialName != "沥青" || materialName != "骨料1") {
                            continue;
                        } else {
                            if (warningLevel <= 1) {
                                continue;
                            } else {
                                if (crewNum == 1) {
                                    crew1DiscNum = discNum;
                                } else {
                                    crew2DiscNum = discNum;
                                }
                                ;

                                var str = "";
                                if (materialName == "一仓温度") {
                                    str = "<tr>" +
                                        "<td>机组" + crewNum + "</td>" +
                                        "<td>" + discNum + "</td>" +
                                        "<td>" + materialName + "</td>" +
                                        "<td>" + moudleRatio + "℃</td>" +
                                        "<td>" + actualRatio + "℃</td>" +
                                        "<td>" + deviationRatio + "℃</td>" +
                                        "<td>" + warningLevel + "</td>" +
                                        "</tr>";
                                } else {
                                    str = "<tr>" +
                                        "<td>机组" + crewNum + "</td>" +
                                        "<td>" + discNum + "</td>" +
                                        "<td>" + materialName + "</td>" +
                                        "<td>" + moudleRatio + "%</td>" +
                                        "<td>" + actualRatio + "%</td>" +
                                        "<td>" + deviationRatio + "%</td>" +
                                        "<td>" + warningLevel + "</td>" +
                                        "</tr>";
                                }


                                $("#warningData").append(str);
                            }

                        }


                    };


                    var condition = $("#warningData").find("tr").length;
                    if (condition != 0) {
                        showWaringData(crew1DiscNum, crew2DiscNum);
                    }

                }
            }
        })
    }

    function goCriticalWarningPage() {
        var path = $("#path").val();
        $("#iframe").attr("src", "/qc_critical_warning.do");
    }

    function showWaringData(crew1DiscNum, crew2DiscNum) {

        var crew1LastDiscNum = sessionStorage.getItem("crew1LastDiscNum");
        var crew2LastDiscNum = sessionStorage.getItem("crew2LastDiscNum");


        if (crew1DiscNum == crew1LastDiscNum && crew2DiscNum == crew2LastDiscNum) {
            return;
        }

        layer.open({
            type: 1,
            title: ['生产预警', 'height:auto;line-height: 27px;font-size:11px;'],
            closeBtn: 0, //不显示关闭按钮
            shade: 0,
            area: ['340px', '215px'],
            offset: 'rb', //右下角弹出
            time: 5000, //5秒后自动关闭
            anim: 2,
            content: $('#showMessage')
        })

        sessionStorage.setItem("crew1LastDiscNum", crew1DiscNum);
        sessionStorage.setItem("crew2LastDiscNum", crew2DiscNum);
    }
</script>
</html>
