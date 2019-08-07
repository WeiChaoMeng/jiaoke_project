<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();

    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>会议纪要</title>
    <link href="../../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
</head>

<body style="padding:15px 8px 0px 8px;">

<div class="cursor_hand">

    <div class="page_head">
        <table style="width:100%;height:100%">
            <tbody>
            <tr>
                <td>
                    <div class="head_left_button" id="newCompanyWriting" onmousemove="select_color(this)"
                         onmouseout="unselected_color(this)">
                        &#xeb86; 新建
                    </div>

                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xe7e9; 编辑
                    </div>

                    <div class="separation_line">

                    </div>

                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xe8e5; 转发
                    </div>

                    <div class="separation_line">

                    </div>

                    <div id="delete" class="head_left_button" onmousemove="select_color(this)"
                         onmouseout="unselected_color(this)">
                        &#xeaa5; 删除
                    </div>
                </td>
                <td>
                    <div class="conditional_query">
                        <!--搜索按钮-->
                        <i class="iconfont search" id="conditional_search" onmousemove="select_color(this)"
                           onmouseout="unselected_color(this)">&#xe7e7;</i>
                        <!--标题-->
                        <div id="div2" class="head_right_side_input matter_title">
                            <input type="text">
                        </div>

                        <!--重要程度-->
                        <div id="div3" class="head_right_side_select matter_importance">
                            <select>
                                <option value="1">普通</option>
                                <option value="2">重要</option>
                                <option value="3">非常重要</option>
                            </select>
                        </div>

                        <!--状态-->
                        <div id="div4" class="head_right_side_select matter_status">
                            <select>
                                <option value="1">撤销</option>
                                <option value="2">草稿</option>
                                <option value="3">被回退</option>
                            </select>
                        </div>

                        <!--条件查询-->
                        <div id="div1" class="head_right_side">
                            <select id="condition">
                                <option value="0">- -查询条件- -</option>
                                <option value="1">标题</option>
                                <option value="2">重要程度</option>
                                <option value="3">状态</option>
                            </select>
                        </div>
                    </div>

                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <table class="simpletable">

        <thead>
        <th style="width: 3%;"><input type="checkbox"></th>
        <th style="width: 10%;">发文编号</th>
        <th style="width: 25%;">文件类别</th>
        <th style="width: 15%;">文件名称</th>
        <th style="width: 20%;">访问日期</th>
        <th style="width: 15%;">主送部门</th>
        <th style="width: 10%;">备注</th>
        </thead>

        <tbody>

        <tr></tr>
        <%--<c:forEach var="oaContractArchives" items="${list}" varStatus="status">
            <tr onclick="particulars(${oaContractArchives.id})">
                <td><input type="checkbox" onclick="window.event.cancelBubble=true;"></td>
                <td>${oaContractArchives.serialNumber}</td>
                <td>${oaContractArchives.title}</td>
                <td>${oaContractArchives.archivesAbstract}</td>
                <td>${oaContractArchives.operator}</td>
                <td>${oaContractArchives.signingUnit}</td>
                <td>${oaContractArchives.signingDate}</td>
                <td>${oaContractArchives.createdDateStr}</td>
            </tr>
        </c:forEach>--%>

        </tbody>

    </table>

</div>


</body>
<script type="text/javascript" src="../../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../../static/js/oa/oa_common.js"></script>
<script>
    //新建公司发文
    $("#newCompanyWriting").on("click", function () {
        window.location.href = '${path}/office/newCompanyWriting';
    });

    //详情公司发文
    function particulars(id) {
        window.location.href = "${path}/office/particularsCompanyWriting?id=" + id;
    }
</script>
</html>
