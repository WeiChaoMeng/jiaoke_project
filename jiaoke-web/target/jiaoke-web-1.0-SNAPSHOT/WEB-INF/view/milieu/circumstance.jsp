<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>环境监测</title>
    <link href="../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <link href="../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    .text_style {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
</style>

<body style="padding:15px 8px 0 8px;width: 100%;height: 100%;float: right">

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

                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
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

                        <!--发起人-->
                        <div id="div4" class="head_right_side_input Initiator">
                            <input type="text">
                        </div>

                        <!--状态-->
                        <div id="div5" class="head_right_side_select matter_status">
                            <select>
                                <option value="1">未读</option>
                                <option value="2">已读</option>
                                <option value="3">暂存待办</option>
                                <option value="4">被回退</option>
                                <option value="5">指定回退</option>
                            </select>
                        </div>

                        <!--条件查询-->
                        <div id="div1" class="head_right_side">
                            <select id="condition2">
                                <option value="0">- -查询条件- -</option>
                                <option value="1">标题</option>
                            </select>
                        </div>
                    </div>

                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="simpletable simpletable_color">

        <table class="simpletable simpletable_color" style="table-layout: fixed">

            <thead>
            <th style="width: 5%"><input type="checkbox"></th>
            <th>标题</th>
            <th>日期</th>
            </thead>
            <tbody>

            <tr></tr>
            <tr>
                <td><input type="checkbox"></td>
                <td class="text_style" title="2018年11月9日环境监控日志">2018年11月9日环境监控日志
                </td>
                <td>2018-06-04 11:00:00</td>
            </tr>

            </tbody>


        </table>
    </div>

</div>

<div id="fenye" style="width: 100%;height: 40px;padding-top: 10px;">
    <div class="">
        <div class="" style="float: right;">
            <ul class="pagination" id="pagination" style="margin: 0"></ul>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../static/js/oa/oa_common.js"></script>
<script type="text/javascript" src="../../../static/js/paging/jqPaginator.js"></script>
</html>
