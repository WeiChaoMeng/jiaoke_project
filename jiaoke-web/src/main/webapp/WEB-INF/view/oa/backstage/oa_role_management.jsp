<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>角色管理</title>
    <link href="../../../../static/css/oa/backstage_role.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <link href="../../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<!--弹窗背景-->
<div id='windowBackgroundColor'></div>

<%--新增--%>
<div id="newRole" class="add-user-window">

    <div class="window-head">添加角色
    </div>

    <div class="window-body">
        <form id="roleInfo">
            <table class="window-table">
                <tbody>
                <tr>
                    <td class="form_title_check"><i class="required_mark">*</i>角色名称:</td>
                    <td class="form_content_check">
                        <input class="font_input" name="name" id="name" value="" type="text"
                               placeholder="请输入角色名称" maxlength="16" onblur="checkName(this)"
                               onclick="clickPrompt(this)"
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

        <div style="padding-bottom: 15px">
            <input type="button" value="确认" onclick="confirm()" class="body-bottom-button">
            <input type="button" value="取消" onclick="cancel()" class="body-bottom-button left-spacing">
        </div>
    </div>
</div>

<%--修改--%>
<div id="modifyRole" class="add-user-window">

    <div class="window-head">编辑角色</div>

    <div class="tab-style">
        <div id="div1" style="margin-left: 3%;background: #fff">
            <span onclick="basicInformation()">基础信息</span>
        </div>

        <div id="div2">
            <span onclick="permissionInformation()">权限信息</span>
        </div>
    </div>

    <div class="window-body basic-information-div" id="basicInformationTab">
        <form id="roleMessage">

        </form>

        <div class="option-window-body-bottom">
            <input type="button" value="确认" onclick="submissionEdit()" class="body-bottom-button">
            <input type="button" value="取消" onclick="cancel()" class="body-bottom-button left-spacing">
        </div>
    </div>

    <div class="tab-right-div">
        <div class="window-body permission-information-div" id="permissionInformationTab">
            <table id="permissionList" class="table-list">
                <tbody id="perListTbody">
                <c:forEach var="permission" items="${permissionList}">
                    <tr onclick="checkboxEvent(this)">
                        <td class="table-list-td-checkbox">
                            <input type="checkbox" value="${permission.id}" onclick="window.event.cancelBubble=true;">
                        </td>

                        <td class="per-list-td">
                                ${permission.description}
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
                    <div class="head_left_button" id="addRole" onmousemove="select_color(this)"
                         onmouseout="unselected_color(this)">
                        &#xeb86; 添加
                    </div>

                    <div class="separation_line">

                    </div>

                    <div class="head_left_button" id="editRole" onmousemove="select_color(this)"
                         onmouseout="unselected_color(this)">
                        &#xe7e9; 编辑
                    </div>

                    <div class="separation_line">

                    </div>

                    <div class="head_left_button" id="deleteRole" onmousemove="select_color(this)"
                         onmouseout="unselected_color(this)" style="width: 70px;">
                        &#xeaa5; 删除
                    </div>

                </td>
                <td>
                    <div>
                        <div class="conditional-query">
                            <input type="text" id="roleName" class="search-bar" placeholder="角色名称">
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
        <th style="width: 38%;">角色名称</th>
        <th style="width: 38%;">角色说明</th>
        <th style="width: 18%;">创建时间</th>
        </thead>

        <tbody id="tbody">
        <tr>
            <td><input type="checkbox"></td>
            <td>1</td>
            <td>admin</td>
            <td>管理员</td>
            <td>其他</td>
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
<script type="text/javascript" src="../../../../static/js/oa/backstage_role.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script type="text/javascript" src="../../../../static/js/paging/jqPaginator.js"></script>
</html>