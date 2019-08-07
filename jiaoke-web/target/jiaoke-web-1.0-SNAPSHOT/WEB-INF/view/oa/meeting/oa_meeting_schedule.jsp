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
    <title>会议安排</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
</head>

<body style="padding:15px 8px 0px 8px;">

<div class="">

    <div class="revoke_mmeeting_head" style="height: 30px;width: 100%;background: #f1f1f1">
        <table width="100%" height="100%">
            <tbody>
            <tr>
                <td>
                    <div class="head_left_button" id="new_meeting" onmousemove="select_color(this)"
                         onmouseout="unselected_color(this)"
                         style="width: 70px">
                        &#xe7e9; 新建会议
                    </div>

                    <div class="separation_line"></div>

                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xeaa0; 撤销
                    </div>

                    <div class="separation_line"></div>

                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xeb9b; 编辑
                    </div>

                    <div class="separation_line"></div>

                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xe7ea; 删除
                    </div>
                </td>
                <td>
                    <div class="conditional_query">
                        <!--搜索按钮-->
                        <i class="iconfont search" id="conditional_search" onmousemove="select_color(this)"
                           onmouseout="unselected_color(this)">&#xe7e7;</i>
                        <!--会议名称-->
                        <div id="div2" class="head_right_side_input meeting_name">
                            <input type="text">
                        </div>

                        <!--会议类型-->
                        <div id="div3" class="head_right_side_select meeting_type">
                            <select>
                                <option value="1">单次会议</option>
                                <option value="2">周期会议</option>
                            </select>
                        </div>

                        <!--会议地点-->
                        <div id="div4" class="head_right_side_input meeting_initiator">
                            <input type="text">
                        </div>

                        <!--条件查询-->
                        <div id="div1" class="head_right_side">
                            <select id="condition6">
                                <option value="0">- -查询条件- -</option>
                                <option value="1">会议名称</option>
                                <option value="2">会议类型</option>
                                <option value="3">会议地点</option>
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
        <th><input type="checkbox"></th>
        <th width="40%">会议名称</th>
        <th>开始时间</th>
        <th>结束时间</th>
        <th>会议地点</th>
        <th>会议状态</th>
        <th>会议类型</th>
        <th>状态</th>
        </thead>

        <tbody>
        <tr>
            <td colspan="8">暂无数据</td>
        </tr>
        </tbody>

    </table>

</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>

</html>
