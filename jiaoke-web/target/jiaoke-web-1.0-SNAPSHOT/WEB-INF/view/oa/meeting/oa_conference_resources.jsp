<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>会议资源</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
</head>

<body style="padding:15px 8px 0px 8px;">

<ul class="tab" id="tab">
    <li name="website" class="tabcurrent"><a href="javascript:;">申请会议室</a></li>
    <li name="userinfo"><a href="javascript:;">预定撤销</a></li>
</ul>

<div class="website">
    <form>
        <ul class="nform">
            <li><span><span style="color: #FF0000;padding-right: 0px ; width: 83%;">*</span>会议室：</span><input
                    type="text" class="forminput nforminput"
                    value="<点击此处选择会议室>"></li>
            <li><span><span style="color: #FF0000;padding-right: 0px ; width: 83%;">*</span>申请人：</span><input
                    type="text" class="forminput nforminput"></li>
            <li><span><span style="color: #FF0000;padding-right: 0px ; width: 78%;">*</span>申请部门：</span><input
                    type="text" class="forminput nforminput"></li>
            <li>
                <span>
                    <span style="color: #FF0000;padding-right: 0px ; width: 78%;">
                        *
                    </span>开始时间：
                </span>
                <input type="text" class="forminput nforminput">
            </li>
            <li><span><span style="color: #FF0000;padding-right: 0px ; width: 78%;">*</span>结束时间：</span><input
                    type="text"
                    class="forminput nforminput">
            </li>
            <li class="areali"><span>用途：</span><textarea class="formarea"></textarea></li>
            <li><a href="javascript:;" class="pre" style="margin-left: 40%">确认</a><a href="javascript:;"
                                                                                     class="nextlink">取消</a></li>
        </ul>
    </form>

</div>

<div class="userinfo">

    <div class="revoke_mmeeting_head" style="height: 30px;width: 100%;background: #f1f1f1">
        <table width="100%" height="100%">
            <tbody>
            <tr>
                <td>
                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xeaa0; 撤销
                    </div>
                </td>
                <td>
                    <div class="conditional_query">
                        <!--搜索按钮-->
                        <i class="iconfont search" id="conditional_search" onmousemove="select_color(this)"
                           onmouseout="unselected_color(this)">&#xe7e7;</i>
                        <div id="div2" class="head_right_side_input">
                            <input type="text">
                        </div>

                        <div id="div3" class="head_right_side_select">
                            <select>
                                <option value="1">待审核</option>
                                <option value="2">审核通过</option>
                                <option value="3">审核未通过</option>
                            </select>
                        </div>

                        <div id="div1" class="head_right_side">
                            <select id="condition8">
                                <option value="0">- -查询条件- -</option>
                                <option value="1">会议室名称</option>
                                <option value="2">审核状态</option>
                            </select>
                        </div>
                    </div>

                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <table class="simpletable simpletable_color">

        <thead>
        <th><input type="checkbox"></th>
        <th width="15%">会议室名称</th>
        <th>管理员</th>
        <th width="20%">会议名称</th>
        <th>申请时间</th>
        <th>开始使用时间</th>
        <th>结束使用时间</th>
        <th>审核状态</th>
        </thead>

        <tbody>
        <tr>
            <td colspan="9">暂无数据</td>
        </tr>
        </tbody>

    </table>

</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
</html>
