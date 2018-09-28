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
    <title>劳务派遣档案</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
</head>

<body style="padding:15px 8px 0px 8px;">

<div class="cursor_hand">

    <div class="page_head">
        <table width="100%" height="100%">
            <tbody>
            <tr>
                <td>
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
        <th>标记</th>
        <th>编号</th>
        <th>标题</th>
        <th>摘要</th>
        <th>经手人</th>
        <th>签署单位</th>
        <th>签署日期</th>
        <th>建档日期</th>
        </thead>

        <tbody>

        <tr></tr>
        <tr>
            <td><input type="checkbox"></td>
            <td class="iconfont" onclick="flag(this)">&#xe6f5;</td>
            <td>GLB1001</td>
            <td>2018年与xxx单位合作合同</td>
            <td>北京朝阳区xxx路，路面铺设</td>
            <td>刘喜福</td>
            <td>xxx有限公司</td>
            <td>2018-06-04</td>
            <td>2018-06-12</td>
        </tr>

        <tr>
            <td><input type="checkbox"></td>
            <td class="iconfont" onclick="flag(this)">&#xe6f5;</td>
            <td>CGB1001</td>
            <td>xxx采购合同</td>
            <td>购买xxx产品</td>
            <td>张华伦</td>
            <td>xxx有限公司</td>
            <td>2018-06-04</td>
            <td>2018-06-12</td>
        </tr>

        <tr>
            <td><input type="checkbox"></td>
            <td class="iconfont" onclick="flag(this)">&#xe6f5;</td>
            <td>AQB1001</td>
            <td>电视监控工程安装合同</td>
            <td>电视监控安装</td>
            <td>康斯莱</td>
            <td>xxx有限公司</td>
            <td>2018-06-04</td>
            <td>2018-06-12</td>
        </tr>
        </tbody>

    </table>

</div>


</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
</html>
