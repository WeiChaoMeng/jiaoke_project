<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>用户管理</title>
    <link href="../../../../static/css/oa/backstage_user.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <link href="../../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<!--弹窗背景-->
<div id='windowBackgroundColor'></div>

<%--新增--%>
<div id="newUser" class="add-user-window">

    <div class="window-head">添加用户
    </div>

    <div class="window-body-add">
        <form id="userInfo">
            <table class="window-table">
                <tbody>
                <tr>
                    <td class="form_title_check"><i class="required_mark">*</i>用户名:</td>
                    <td class="form_content_check">
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
                        <select name="department" class="font_input">
                            <c:forEach items="${departmentList}" var="department">
                                <option value="${department.departmentKey}">${department.departmentName}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td class="form_title_check">手机号:</td>
                    <td class="form_content_check">
                        <input class="font_input" id="phone" name="phone" value="" type="text" placeholder="请输入正确的手机号"
                               autocomplete="off">
                    </td>
                </tr>

                <tr>
                    <td class="form_title_check">邮&nbsp;&nbsp;&nbsp;箱:</td>
                    <td class="form_content_check">
                        <input class="font_input" value="" name="email" id="email" type="text" placeholder="请输入正确的邮箱号"
                               autocomplete="off">
                    </td>
                </tr>
                </tbody>
            </table>
        </form>

        <div style="padding-bottom: 15px">
            <input type="button" value="确认" onclick="confirm()" class="body-bottom-button">
            <input type="button" value="取消" onclick="cancel()" class="body-bottom-button left-spacing">
        </div>
    </div>
</div>

<%--修改--%>
<div id="modifyUser" class="add-user-window">

    <div class="window-head">编辑用户</div>

    <div class="tab-style">
        <div id="div1" style="margin-left: 3%;background: #fff">
            <span onclick="basicInformation()">基础信息</span>
        </div>

        <div id="div2">
            <span onclick="roleInformation()">权限信息</span>
        </div>
    </div>

    <div class="window-body basic-information-div" id="basicInformationTab">
        <form id="userInformation">

        </form>

        <div class="option-window-body-bottom">
            <input type="button" value="确认" onclick="submissionEdit()" class="body-bottom-button">
            <input type="button" value="取消" onclick="cancel()" class="body-bottom-button left-spacing">
        </div>
    </div>

    <div class="tab-right-div">
        <div class="window-body permission-information-div" id="RoleInformationTab">
            <table id="permissionList" class="table-list">
                <tbody id="perListTbody">
                <c:forEach var="roleInfo" items="${roleInfoList}">
                    <tr onclick="checkboxEvent(this)">
                        <td class="table-list-td-checkbox">
                            <input type="checkbox" value="${roleInfo.id}" onclick="window.event.cancelBubble=true;">
                        </td>

                        <td class="per-list-td">
                                ${roleInfo.name}
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="cursor_hand">
    <div class="page_head">
        <table>
            <tbody>
            <tr>
                <td>
                    <shiro:hasPermission name="userManage/add">
                        <div class="head_left_button" id="addUser" onmousemove="select_color(this)"
                             onmouseout="unselected_color(this)">
                            &#xeb86; 添加
                        </div>

                        <div class="separation_line">

                        </div>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="userManage/edit">
                        <div class="head_left_button" id="editUser" onmousemove="select_color(this)"
                             onmouseout="unselected_color(this)">
                            &#xe7e9; 编辑
                        </div>

                        <div class="separation_line">

                        </div>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="userManage/delete">
                        <div class="head_left_button" id="deleteUser" onmousemove="select_color(this)"
                             onmouseout="unselected_color(this)" style="width: 70px;">
                            &#xeaa5; 删除
                        </div>
                    </shiro:hasPermission>

                </td>
                <td>
                    <div>
                        <div class="conditional-query">
                            <input type="text" id="logonName" class="search-bar" placeholder="登录名">
                            <i onclick="searchButton(1,2)" class="iconfont search-icon-size" id="conditional_search">&#xe7e7;</i>
                            <i onclick="resetButton()" class="iconfont reset-icon-size" id="resetButton">&#xe69d;</i>
                        </div>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <table class="simple_table">

        <thead>
        <th style="width: 3%;"><input type="checkbox"></th>
        <th style="width: 3%;">序号</th>
        <th style="width: 20%;">登录名</th>
        <th style="width: 20%;">显示名称</th>
        <th style="width: 18%;">部门</th>
        <th style="width: 18%;">联系方式</th>
        <th style="width: 18%;">邮箱</th>
        </thead>

        <tbody id="tbody">
        <tr>
            <td><input type="checkbox"></td>
            <td>1</td>
            <td>admin</td>
            <td>管理员</td>
            <td>其他</td>
            <td>16526376273</td>
            <td>admin@163.com</td>
        </tr>
        </tbody>

    </table>
</div>

<div id="paging" class="paging-div">
    <div class="">
        <div class="" style="float: right;">
            <ul class="pagination" id="pagination" style="margin: 0"></ul>
            <input type="hidden" id="PageCount" runat="server"/>
            <input type="hidden" id="PageSize" runat="server"/>
            <input type="hidden" id="countindex" runat="server"/>
            <!--设置最多显示的页码数 可以手动设置 默认为10-->
            <input type="hidden" id="visiblePages" runat="server" value="10"/>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/backstage_user.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script type="text/javascript" src="../../../../static/js/paging/jqPaginator.js"></script>
<script>
    //编辑
    $('#editUser').on('click', function () {
        let length = $("#tbody input:checked").length;
        if (length != 1) {
            alert("请选择一条数据！");
            return false;
        } else {
            var id = $("#tbody input:checked").val();
            $.ajax({
                type: "post",
                url: '/backstageManagement/toEdit',
                data: {'id': id},
                success: function (data) {
                    var userInfo = JSON.parse(data);
                    for (var key in userInfo) {
                        if (key === 'userInfo') {
                            var resultsInfo = '';

                            resultsInfo += '<table class="window-table">';
                            resultsInfo += '<tbody>';
                            resultsInfo += '<tr>';
                            resultsInfo += '<td class="form_title">用户名:</td>';
                            resultsInfo += '<td class="form_content">';
                            resultsInfo += '<input name="id" value="' + userInfo[key].id + '" type="hidden">';
                            resultsInfo += '<input class="font_input" name="username" id="usernameEdit" value="' + userInfo[key].username + '" type="text" style="background: #e8e8e8" readonly>';
                            resultsInfo += '</td>';
                            resultsInfo += '</tr>';
                            resultsInfo += '<tr>';
                            resultsInfo += '<td class="form_title_check" style="padding-top: 8px">密码:</td>';
                            resultsInfo += '<td class="form_content_check" style="padding-top: 8px">';
                            resultsInfo += '<input class="font_input" name="password" id="passwordEdit" value="' + userInfo[key].password + '" type="text" autocomplete="off">';
                            resultsInfo += '<span class="prompt-span"></span>';
                            resultsInfo += '</td>';
                            resultsInfo += '</tr>';
                            resultsInfo += '<tr>';
                            resultsInfo += '<td class="form_title_check">昵称:</td>';
                            resultsInfo += '<td class="form_content_check">';
                            resultsInfo += '<input class="font_input" name="nickname" id="nicknameEdit" value="' + userInfo[key].nickname + '" type="text" autocomplete="off">';
                            resultsInfo += '<span class="prompt-span"></span>';
                            resultsInfo += '</td>';
                            resultsInfo += '</tr>';
                            resultsInfo += '<tr>';
                            resultsInfo += '<td class="form_title" style="padding-top: 0">部门:</td>';
                            resultsInfo += '<td class="form_content" style="padding-top: 0">';
                            resultsInfo += '<select name="department" class="font_input">';
                            resultsInfo += '<c:forEach items="${departmentList}" var="department">';
                            if (userInfo[key].department == ${department.departmentKey}) {
                                resultsInfo += '<option value="${department.departmentKey}" selected>${department.departmentName}</option>';
                            }else {
                                resultsInfo += '<option value="${department.departmentKey}">${department.departmentName}</option>';
                            }
                            resultsInfo += '</c:forEach>';
                            resultsInfo += '</select>';
                            resultsInfo += '</td>';
                            resultsInfo += '</tr>';
                            resultsInfo += '<tr>';
                            resultsInfo += '<td class="form_title">性别:</td>';
                            resultsInfo += '<td class="form_content">';
                            resultsInfo += '<select name="sex" class="font_input">';
                            if (userInfo[key].sex === 0) {
                                resultsInfo += '<option value="0" selected>男</option>';
                                resultsInfo += '<option value="1">女</option>';
                            } else {
                                resultsInfo += '<option value="1" selected>女</option>';
                                resultsInfo += '<option value="0">男</option>';
                            }
                            resultsInfo += '</select>';
                            resultsInfo += '</td>';
                            resultsInfo += '</tr>';
                            resultsInfo += '<tr>';
                            resultsInfo += '<td class="form_title">手机号:</td>';
                            resultsInfo += '<td class="form_content">';
                            resultsInfo += '<input class="font_input" name="phone" value="' + userInfo[key].phone + '" type="text" autocomplete="off">';
                            resultsInfo += '</td>';
                            resultsInfo += '</tr>';
                            resultsInfo += '<tr>';
                            resultsInfo += '<td class="form_title">邮箱:</td>';
                            resultsInfo += '<td class="form_content">';
                            resultsInfo += '<input class="font_input" value="' + userInfo[key].email + '" name="email" type="text" autocomplete="off">';
                            resultsInfo += '</td>';
                            resultsInfo += '</tr>';
                            resultsInfo += '</tbody>';
                            resultsInfo += '</table>';

                            $('#userInformation').html(resultsInfo);

                            $('#windowBackgroundColor').css("display", "block");
                            $("#modifyUser").css("display", "block");
                        } else {
                            //勾选已有权限
                            for (var i = 0; i < userInfo[key].length; i++) {
                                $('#perListTbody').children('tr').find('input').each(function () {
                                    if ($(this).val() == userInfo[key][i].id) {
                                        this.checked = true;
                                    }
                                });
                            }
                        }
                    }
                },
                error: function (result) {
                    alert("出错！");
                }
            })
        }
    });
</script>
</html>