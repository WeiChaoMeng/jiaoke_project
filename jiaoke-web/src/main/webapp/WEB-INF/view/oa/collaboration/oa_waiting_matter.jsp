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
    <title>待发事项</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
</head>

<body style="padding:15px 8px 0px 8px;">

<div class="">

    <div class="page_head cursor_hand">
        <table width="100%" height="100%">
            <tbody>
            <tr>
                <td>
                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xe990; 发送
                    </div>

                    <div class="separation_line">

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
        <th><input type="checkbox"></th>
        <th width="65%">标题</th>
        <th>状态</th>
        <th>重要程度</th>
        <th>创建时间</th>
        <th>流程期限</th>
        </thead>

        <tbody>

        <tr></tr>
        <tr>
            <td><input type="checkbox"></td>
            <td>学习调研会</td>
            <td>草稿</td>
            <td>非常重要</td>
            <td>2018-06-03 14:00:00</td>
            <td>无</td>
        </tr>

        <tr>
            <td><input type="checkbox"></td>
            <td>中心组第十四次扩大学习</td>
            <td>草稿</td>
            <td>重要</td>
            <td>2018-06-04 09:00:00</td>
            <td>无</td>
        </tr>

        <tr>
            <td><input type="checkbox"></td>
            <td>2018年中心组第十四次扩大学习的通知</td>
            <td>撤销</td>
            <td>普通</td>
            <td>2018-06-06 10:00:00</td>
            <td>无</td>
        </tr>

        <tr>
            <td><input type="checkbox"></td>
            <td>继续开展机关党总支学习活动的通知</td>
            <td>被回退</td>
            <td>普通</td>
            <td>2018-06-06 15:00:00</td>
            <td>无</td>
        </tr>

        </tbody>

    </table>

</div>


</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
</html>
