<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2019-8-30
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+ "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path",basePath);
%>
<html>
<head>
    <title>添加员工信息</title>
    <style>
        body {
            padding: 0;
            margin: 0;
            border: 0;
        }

        table {
            width: 100%;
            margin: auto;
            border-collapse: collapse;
            border-spacing: 0;
            font-size: 13px;
        }

        table td {
            border: solid 1px #d6d6d6;
            text-indent: 0;
            padding: 5px 10px;
        }

        .table-td-name {
            background: #f6f6f6;
            text-align: right;
            padding-right: 1%;
            white-space: nowrap;
            width: 10%;
        }

        table tbody tr td input {
            width: 100%;
            height: 25px;
            border: 0;
            outline: none;
        }

        .title {
            width: 100%;
            margin: 20px auto 0;
            height: 40px;
            text-align: center;
            line-height: 40px;
        }

        .outer-style {
            width: 80%;
            margin: 0 auto;
        }

        .bottom-button-style {
            padding-top: 30px;
            text-align: center;
        }

        .return-but {
            padding: 7px 20px;
            border: 1px #a5a5a5 solid;
            cursor: pointer;
            background: #ffffff;
            outline: none;
            border-radius: 5px;
        }

        .commit-but {
            padding: 7px 20px;
            border: 1px #a5a5a5 solid;
            cursor: pointer;
            background: #38adff;
            outline: none;
            border-radius: 5px;
            color: #FFFFFF;
        }

        .commit-but:hover, .return-but:hover {
            background: #6dbff9;
            color: #FFFFFF;
        }

        .left-spacing {
            margin-left: 20px;
        }
    </style>
</head>
<body>
<div class="outer-style">
    <div class="title">
        <span>添加员工</span>
    </div>
    <table>
        <tbody>
        <tr>
            <td class="table-td-name">姓名</td>
            <td>
                <input type="text" autocomplete="off">
            </td>
            <td class="table-td-name">性别</td>
            <td>
                <input type="text" autocomplete="off">
            </td>
            <td class="table-td-name">出生年月</td>
            <td>
                <input type="text" autocomplete="off">
            </td>
            <td class="table-td-name">民族</td>
            <td>
                <input type="text" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="table-td-name">参加工作时间</td>
            <td>
                <input type="text" autocomplete="off">
            </td>
            <td class="table-td-name">文化程度</td>
            <td>
                <input type="text" autocomplete="off">
            </td>
            <td class="table-td-name">职称/技术等级</td>
            <td>
                <input type="text" autocomplete="off">
            </td>
            <td class="table-td-name">政治面貌</td>
            <td>
                <input type="text" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="table-td-name">身份证号</td>
            <td>
                <input type="text" autocomplete="off">
            </td>
            <td class="table-td-name">户口性质</td>
            <td>
                <input type="text" autocomplete="off">
            </td>
            <td class="table-td-name">家庭住址</td>
            <td colspan="3">
                <input type="text" autocomplete="off">
            </td>
        </tr>

        <tr>
            <td class="table-td-name">毕业时间</td>
            <td>
                <input type="text" autocomplete="off">
            </td>
            <td class="table-td-name">毕业院校</td>
            <td>
                <input type="text" autocomplete="off">
            </td>
            <td class="table-td-name">本人联系电话</td>
            <td>
                <input type="text" autocomplete="off">
            </td>
            <td class="table-td-name">紧急联系人电话</td>
            <td>
                <input type="text" autocomplete="off">
            </td>
        </tr>
        </tbody>
    </table>
    <div class="bottom-button-style">
        <input type="button" value="返回" onclick="previousPage()" class="return-but">
        <input type="button" value="确认" onclick="submission()" class="commit-but left-spacing">
    </div>
</div>
</body>
<script>
    //返回上一页
    function previousPage() {
        window.history.back();
    }
</script>
</html>
