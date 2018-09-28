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
    <title>已开会议</title>
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
                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xe650; 归档
                    </div>

                    <div class="separation_line">

                    </div>

                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xe690; 删除
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

                        <!--会议发起人-->
                        <div id="div4" class="head_right_side_input meeting_initiator">
                            <input type="text">
                        </div>

                        <!--会议发起部门-->
                        <div id="div5" class="head_right_side_input meeting_initiating_department">
                            <input type="text">
                        </div>

                        <!--条件查询-->
                        <div id="div1" class="head_right_side">
                            <select id="condition5">
                                <option value="0">- -查询条件- -</option>
                                <option value="1">会议名称</option>
                                <option value="2">会议类型</option>
                                <option value="3">发起人</option>
                                <option value="4">发起部门</option>
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
        <th>发起人</th>
        <th>发起部门</th>
        <th>会议地点</th>
        <th>开始时间</th>
        <th>结束时间</th>
        <th>会议类型</th>
        <th>归档</th>
        </thead>

        <tbody>

        <tr></tr>
        <tr>
            <td><input type="checkbox"></td>
            <td>学习调研会</td>
            <td>张三</td>
            <td>办公室</td>
            <td>201</td>
            <td>2018-06-03 14:00:00</td>
            <td>2018-06-03 15:00:00</td>
            <td>周期会议</td>
            <td>部门会议</td>
        </tr>

        <tr>
            <td><input type="checkbox"></td>
            <td>中心组第十四次扩大学习</td>
            <td>赵武</td>
            <td>生产经营部</td>
            <td>201</td>
            <td>2018-06-04 09:00:00</td>
            <td>2018-06-04 10:00:00</td>
            <td>单次会议</td>
            <td>单位会议</td>
        </tr>

        <tr>
            <td><input type="checkbox"></td>
            <td>2018年中心组第十四次扩大学习的通知</td>
            <td>黄岐</td>
            <td>安全管理部</td>
            <td>201</td>
            <td>2018-06-06 10:00:00</td>
            <td>2018-06-06 11:00:00</td>
            <td>单次会议</td>
            <td>单位会议</td>
        </tr>

        <tr>
            <td><input type="checkbox"></td>
            <td>继续开展机关党总支学习活动的通知</td>
            <td>王英</td>
            <td>企业管理部</td>
            <td>201</td>
            <td>2018-06-06 15:00:00</td>
            <td>2018-06-06 17:00:00</td>
            <td>单次会议</td>
            <td>单位会议</td>
        </tr>

        <tr>
            <td><input type="checkbox"></td>
            <td>关于进行内部控制专题讲座的通知</td>
            <td>高希</td>
            <td>生产经营部</td>
            <td>201</td>
            <td>2018-06-07 09:00:00</td>
            <td>2018-06-07 10:00:00</td>
            <td>单次会议</td>
            <td>单位会议</td>
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
