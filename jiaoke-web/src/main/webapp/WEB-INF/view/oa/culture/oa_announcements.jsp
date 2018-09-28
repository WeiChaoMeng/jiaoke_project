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
    <title>公告</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
</head>

<body style="padding:15px 8px 0px 8px;">

<div class="">

    <div class="page_head">
        <table width="100%" height="100%">
            <tbody>
            <tr>
                <td>
                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xe8e5; 转发
                    </div>

                    <div class="separation_line">

                    </div>

                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xe990; 归档
                    </div>

                    <div class="separation_line">

                    </div>

                    <div id="delete" class="head_left_button" onmousemove="select_color(this)"
                         onmouseout="unselected_color(this)">
                        &#xeaa5; 删除
                    </div>

                    <div class="separation_line">

                    </div>

                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xe90f; 取回
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
                                <option value="1">未结束</option>
                                <option value="2">已结束</option>
                                <option value="3">已终止</option>
                            </select>
                        </div>

                        <!--条件查询-->
                        <div id="div1" class="head_right_side">
                            <select id="condition1">
                                <option value="0">- -查询条件- -</option>
                                <option value="1">标题</option>
                                <option value="2">重要程度</option>
                                <option value="3">流程状态</option>
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
        <th width="40%">标题</th>
        <th>发起人</th>
        <th>发起时间</th>
        <th>处理时间</th>
        <th>当前待办人</th>
        <th>处理期限</th>
        <th>跟踪状态</th>
        <th>流程日志</th>
        </thead>

        <tbody>

        <tr></tr>
        <tr>
            <td><input type="checkbox"></td>
            <td>学习调研会</td>
            <td>张三</td>
            <td>2018-06-03 14:00:00</td>
            <td>2018-06-04 11:00:00</td>
            <td>科世</td>
            <td>无</td>
            <td>全部人员</td>
            <td><i class="iconfont">&#xe64c;</i></td>
        </tr>

        <tr>
            <td><input type="checkbox"></td>
            <td>中心组第十四次扩大学习</td>
            <td>王曦</td>
            <td>2018-06-06 08:30:00</td>
            <td>2018-06-07 10:20:00</td>
            <td>如果</td>
            <td>无</td>
            <td>全部人员</td>
            <td>&#xe64c;</i></td>
        </tr>

        <tr>
            <td><input type="checkbox"></td>
            <td>2018年中心组第十四次扩大学习的通知</td>
            <td>高数</td>
            <td>2018-06-03 15:12:00</td>
            <td>2018-06-05 10:05:00</td>
            <td>亥由</td>
            <td>无</td>
            <td>全部人员</td>
            <td>&#xe64c;</i></td>
        </tr>

        <tr>
            <td><input type="checkbox"></td>
            <td>继续开展机关党总支学习活动的通知</td>
            <td>赵四</td>
            <td>2018-06-10 10:22:00</td>
            <td>2018-06-10 10:30:00</td>
            <td>鸣天</td>
            <td>无</td>
            <td>全部人员</td>
            <td><i class="iconfont">&#xe64c;</i></td>
        </tr>
        </tbody>
    </table>
</div>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
</html>
