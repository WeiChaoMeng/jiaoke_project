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
    <title>路驰办公系统</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css">
    <link href="../../static/css/oa/backstage_style.css" rel="stylesheet" type="text/css">
    <link href="../../static/css/oa/document.css" rel="stylesheet" type="text/css">
    <link rel="icon" href="/static/images/favicon.ico" type="image/ico"/>
    <style>
        html {
            overflow: hidden;
        }
        /* Border styles */
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

        /* Padding and font style */
        .altrowstable td, .altrowstable th {
            padding: 8px 5px;
            font-size: 7px;
            font-family: Verdana;
            color: rgb(177, 106, 104);
        }

        /* Alternating background colors */
        /*.altrowstable tr:nth-child(even) {*/
            /*background: rgb(238, 211, 210)*/
        /*}*/
        .altrowstable tr:nth-child(odd) {
            background: #FFF
        }
    </style>
</head>
<body style="background:url(../../static/images/line.gif) repeat-y 0 0;">


<div id="flag"></div>
<!--弹窗背景变暗-->
<!--<div id="window_background_color"></div>-->

<!-- 未选中时弹窗-->
<!--<div id="log_window" class="log_popup">
    <div class="window_head log_popup_width">
        <div class="log_popup_window_head">
            <span>查看明细日志</span>
            <i class="iconfont cursor_hand window_closing" id="unselected_windows_close">&#xe68d;</i></div>
        <div class="log_window_son">
            <iframe src="process_log/index.jsp" id="" name="right" width="100%" height="100%" frameborder="0"
                    scrolling="auto"></iframe>
        </div>
        <div class="window_foot">
            <span>
                <a id="unselected_windows_confirm" class="cursor_hand window_confirmation">确定</a>
            </span>
        </div>
    </div>
</div>-->

<div class="header">
    <div class="headtop">
        <span class="logo" id="logo"><img src="/static/images/logo/logo-2.png"></span>
        <ul class="nav">
            <li>
                <a href="#" class="manu" id="index">首页</a>
            </li>
            <li>
                <a href="#" class="manu" id="OA">OA系统</a>
            </li>
            <li>
                <a href="#" class="manu" id="quality_control">质量管控</a>
            </li>
            <li>
                <a href="#" class="manu" id="HR">人事管理</a>
            </li>

            <li>
                <a href="#" class="manu" id="DJ">党建工作</a>
            </li>
            <li>
                <a href="#" class="manu" id="JY">经营管理</a>
            </li>

            <li>
                <a href="#" class="manu" id="HB">环保监控</a>
            </li>
            <li>
                <a href="#" class="manu" id="AQ">厂区安全</a>
            </li>
        </ul>

        <div class="topright">
            <div class="user">
                <span><a href="#"><i class="userico iconfont">&#xe6cb;</i>${userInfo.nickname}<i
                        class="userdown iconfont">&#xe920;</i></a></span>
                <ul class="userlist">
                    <li><a href="#"><i class="userxl iconfont">&#xe666;</i>用户信息</a></li>
                    <li><a href="#" id="about"><i class="userxl iconfont">&#xe7e9;</i>修改密码</a></li>
                    <li><a href="/logout"><i class="userxl iconfont">&#xeae2;</i>退出</a></li>
                </ul>
            </div>

            <div class="skin">
                <a href="#">设置</a>
                <ul class="skinlist">
                    <li><a href="#" data-value="green" class="targetElem green"></a></li>
                    <li><a href="#" data-value="darkblue" class="targetElem darkblue"></a></li>
                    <li><a href="#" data-value="orange" class="targetElem orange"></a></li>
                    <li><a href="#" data-value="lightgreen" class="targetElem lightgreen"></a></li>
                    <li><a href="#" data-value="black" class="targetElem black"></a></li>
                    <li><a href="#" data-value="darkgrey" class="targetElem darkgrey"></a></li>
                    <li><a href="#" data-value="lightblue" class="targetElem lightblue"></a></li>
                    <li><a href="#" data-value="red" class="targetElem red"></a></li>
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
    <span class="fleft">信息管理系统v1.0</span>
    <span class="fright">路驰版权所有<i class="infoicon iconfont">&#xe620;</i></span>
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
                           placeholder="请输入岗位" maxlength="16" autocomplete="off" onblur="checkPosition(this)">
                    <span class="prompt-span"></span>
                </td>
            </tr>
            </tbody>
        </table>
    </form>

    <div>
        <input type="button" value="确认" onclick="confirm()" class="body-bottom-button">
        <input type="button" value="取消" onclick="cancel()" class="body-bottom-button left-spacing">
    </div>
</div>

<%--模态窗-修改用户--%>
<div id="modifyUser" class="window-body-add" style="display: none">
    <form id="userInformation"></form>

    <div style="padding-top: 30px">
        <input type="button" value="确认" onclick="submissionEdit()" class="body-bottom-button">
        <input type="button" value="取消" onclick="cancel()" class="body-bottom-button left-spacing">
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
                           placeholder="请输入角色名称" maxlength="16" onblur="checkRoleName(this)"
                           onclick="clickPromptRole(this)"
                           autocomplete="off">
                    <span class="prompt-span"></span>
                </td>
            </tr>

            <tr>
                <td class="form_title_check">角色说明:</td>
                <td class="form_content_check">
                        <textarea class="description-text" placeholder="请输入角色说明" name="description"
                                  id="description"></textarea>
                    <span class="prompt-span"></span>
                </td>
            </tr>
            </tbody>
        </table>
    </form>

    <div style="padding-top: 20px">
        <input type="button" value="确认" onclick="commitRole()" class="body-bottom-button">
        <input type="button" value="取消" onclick="cancel()" class="body-bottom-button left-spacing">
    </div>
</div>

<%--模态窗-修改角色--%>
<div id="modifyRole" class="window-body-add" style="display: none">
    <form id="roleInformation"></form>

    <div style="padding-top: 20px">
        <input type="button" value="确认" onclick="commitRoleEdit()" class="body-bottom-button">
        <input type="button" value="取消" onclick="cancel()" class="body-bottom-button left-spacing">
    </div>
</div>

<%--模态窗-角色绑定权限--%>
<div id="bindingPermission" class="tab-right-div" style="display: none"></div>

<%-- 模态窗-选择拟稿人 --%>
<div id="singleSelection" class="single-option-window" style="display: none">
    <input type="hidden" id="pendingDocumentPage">
    <div class="option-window-body-head">

        <ul id="singleSelectionContent">

        </ul>
    </div>

    <div class="option-window-body-bottom">
        <input type="button" value="确认" onclick="confirmReviewers()" class="body-bottom-button">
        <input type="button" value="取消" onclick="cancel()" class="body-bottom-button left-spacing">
    </div>
</div>

<%--模态窗-选择公文抄送人--%>
<div id="selectWindow" class="option-window" style="display: none">

    <div class="option-window-body-head cursor_hand">
        <div class="selection-box">
            <div class="selection-box-title">
                <span>选择</span>
            </div>

            <div class="selection-content-outer">
                <div id="selectDiv" class="selection-content-inside">
                    <ul id="selectContent">
                        <li class="selection-box-li">
                            <img src="../../static/images/icon/department.png">
                            <span id="123" class="department">综合办公室</span>
                            <div></div>

                            <ul class="submenu-ul">
                                <li onclick="addNotifyPerson(this)">
                                    <img src="../../static/images/icon/personnel.png">
                                    <span id="1234">张三</span>
                                    <div></div>
                                </li>
                            </ul>

                            <ul class="submenu-ul">
                                <li onclick="addNotifyPerson(this)">
                                    <img src="../../static/images/icon/personnel.png">
                                    <span id="1235">李四</span>
                                    <div></div>
                                </li>
                            </ul>
                        </li>
                    </ul>
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

    <div class="option-window-body-bottom">
        <input type="button" value="确认" onclick="consentNotifyPerson()" class="body-bottom-button">
        <input type="button" value="取消" onclick="cancel()" class="body-bottom-button left-spacing">
    </div>
</div>
</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>
<script src="../../static/js/oa/layer/layer.js"></script>
<script>

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

    //公文-选择拟稿人
    function selectNotifyPerson(userInfoList, departmentList) {
        window.lar = layer.open({
            title: '选择抄送人员',
            type: 1,
            area: ['50%', '66%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#selectWindow"),
            offset: "20%"
        });

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
        $("#selectedNotifyPerson").each(function () {
            var size = $(this).find('li').size();
            var array = new Array();
            $(this).find('li').each(function () {
                //调用子页面方式
                array.push($(this).text());
            });
            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.insertCopyGive(array);
            cancel();
        });
    }

    //知会人选择框
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
        var e = arguments.callee.caller.arguments[0] || event; //若省略此句，下面的e改为event，IE运行可以，但是其他浏览器就不兼容  
        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else if (window.event) {
            window.event.cancelBubble = true;
        }
    }

    //公文-选择拟稿人
    function selectReviewers(userInfoList, draftedPerson) {
        window.lar = layer.open({
            title: '选择拟稿人',
            type: 1,
            area: ['25%', '55%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#singleSelection"),
            offset: "20%"
        });

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
                }
                content +=
                    '<li class="single-election-box-li">' +
                    '<img src="../../static/images/icon/personnel.png">' +
                    '<span id="' + userInfoList[i].id + '">' + userInfoList[i].nickname + '</span>' +
                    '<div></div>' +
                    '</li>';
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
        var lis = $("#singleSelectionContent").find("li").find("div");
        //是否包含selectedDrafter
        if (lis.hasClass("selectedDrafter")) {
            $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.insertReviewer($(".selectedDrafter").prev().text());
            cancel();
        } else {
            layer.msg('请选择拟稿人！')
        }
    }

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

                    $("#iframe").attr("src", "/construction.do");
                    break;

                case 'DJ':

                    $("#iframe").attr("src", "/construction.do");
                    break;

                case 'JY':

                    $("#iframe").attr("src", "/construction.do");
                    break;

                case 'HB':

                    $("#iframe").attr("src", "/milieuIndex.do");
                    break;

                case 'AQ':

                    $("#iframe").attr("src", "/security.do");
                    break;
            }

        })
    });

    /**-------------------------角色管理-------------------------*/
    //新增角色
    function addRole(currentPage) {
        window.lar = layer.open({
            title: '添加角色',
            type: 1,
            area: ['25%', '40%'],
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
        } else if (!name.match(check)) {
            $(own).next().html("只支持汉字、英文、数字的组合");
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
        resultRoleInfo += '<textarea class="description-text" name="description" id="descriptionEdit" placeholder="请输入角色说明">';
        resultRoleInfo += roleInfo.description;
        resultRoleInfo += '</textarea>';
        resultRoleInfo += '</td>';
        resultRoleInfo += '</tr>';
        resultRoleInfo += '</tbody>';
        resultRoleInfo += '</table>';

        $('#roleInformation').html(resultRoleInfo);
    }

    //提交编辑后的用户
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

    //绑定权限
    function bindingPower(permissionInfo, id, currentPage) {
        window.lar = layer.open({
            title: '绑定权限',
            type: 1,
            area: ['25%', '55%'],
            shadeClose: true, //点击遮罩关闭
            content: $("#bindingPermission"),
            offset: "20%"
        });

        //记录用户页面选择的页数
        $('#rolePage').val(currentPage);

        //角色信息
        var permissionList = permissionInfo.permissionList;
        //已绑定角色信息
        var possessPermissionList = permissionInfo.existingPermission;

        var permissionInfoList = '';
        permissionInfoList += '<div id="RoleInformationTab" style="height: 80%;overflow: auto">';
        permissionInfoList += '<table id="permissionList" class="table-list">';
        permissionInfoList += '<tbody id="powerListTbody">';
        permissionInfoList += '<input id="bindingPermissionId" type="hidden" value="' + id + '">';
        for (var i = 0; i < permissionList.length; i++) {
            permissionInfoList += '<tr onclick="checkboxEvent(this)" style="height: 18px">';
            permissionInfoList += '<td class="table-list-td-checkbox">';
            permissionInfoList += '<input type="checkbox" value="' + permissionList[i].id + '" onclick="window.event.cancelBubble=true;">';
            permissionInfoList += '</td>';
            permissionInfoList += '<td class="per-list-td">' + permissionList[i].description + '</td>';
            permissionInfoList += '</tr>';
        }
        permissionInfoList += '</tbody>';
        permissionInfoList += '</table>';
        permissionInfoList += '</div>';
        permissionInfoList += '<div style="padding-top: 20px;text-align: center">';
        permissionInfoList += '<input type="button" value="确认" onclick="submissionBindingPower()" class="body-bottom-button">';
        permissionInfoList += '<input type="button" value="取消" onclick="cancel()" class="body-bottom-button left-spacing">';
        permissionInfoList += '</div>';

        $('#bindingPermission').html(permissionInfoList);

        //勾选已有角色
        for (var j = 0; j < possessPermissionList.length; j++) {
            $('#powerListTbody').children('tr').find('input').each(function () {
                if ($(this).val() == possessPermissionList[j].id) {
                    this.checked = true;
                }
            });
        }
    }

    //提交绑定
    function submissionBindingPower() {
        //用户id
        var roleId = $('#bindingPermissionId').val();
        //选中的角色列表
        var array = [];
        var list = $("#powerListTbody input:checked");
        for (var i = 0; i < list.length; i++) {
            array.push(list[i].value);
        }
        $.ajax({
            type: "post",
            url: '/backstageManagement/bindingPower',
            data: 'roleId=' + roleId + '&array=' + array,
            success: function (data) {
                if (data === 'success') {
                    layer.close(window.lar);
                    layer.msg('绑定角色成功！');
                    $("#iframe")[0].contentWindow.$("#oa-iframe")[0].contentWindow.roleInfoPageReload($('#rolePage').val());
                } else {
                    layer.msg('绑定角色失败！');
                }
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
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
        resultsInfo += '<td class="form_content_check" style="padding-top: 8px">';
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
        resultsInfo += '<input class="font_input" name="position" id="positionEdit" value="' + userInfo.position + '" type="text" autocomplete="off" onblur="checkPosition(this)">';
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
                        if ($('#position').val() === '') {
                            $('#position').next().html("请输入岗位");
                            $('#position').next().css("color", "#ff0202");
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
        roleInfoList += '<input type="button" value="确认" onclick="submissionBinding()" class="body-bottom-button">';
        roleInfoList += '<input type="button" value="取消" onclick="cancel()" class="body-bottom-button left-spacing">';
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

    //checkbox选中事件
    function checkboxEvent(own) {
        var checkbox = $(own).children('td').children('input').prop('checked');
        if (checkbox) {
            $(own).children('td').children('input').attr("checked", false);
        } else {
            $(own).children('td').children('input').attr("checked", true);
        }
    }

    //关闭弹窗
    function cancel() {
        layer.close(window.lar);
    }

</script>
</html>
