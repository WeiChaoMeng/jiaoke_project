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
    <title>历史公文</title>
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

                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xeaa5; 删除
                    </div>

                    <div class="separation_line">

                    </div>

                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xe90f;  取回
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

    <table class="simpletable simpletable_color">

        <thead>
        <th><input type="checkbox"></th>
        <th>标题</th>
        <th>公文文号</th>
        <th>发起时间</th>
        <th>当前待办人</th>
        <th>处理期限</th>
        <th>跟踪状态</th>
        <th>流程日志</th>
        </thead>

        <tbody class="tbodys">

        <tr></tr>
        <tr>
            <td class="tdnum"><input type="checkbox"></td>
            <td class="text_style"
                title="北京市政路桥建材集团有限公司关于印发《北京市政路桥建材集团有限公司原材料管理办法》的通知">北京市政路桥建材集团有限公司关于印发《北京市政路桥建材集团有限公司原材料管理办法》的通知
            </td>
            <td>建材集团生发[2017]170号</td>
            <td>2017-12-05 14:01</td>
            <td>张三</td>
            <td>无</td>
            <td>是</td>
            <td style="text-align: center"><i class="iconfont">&#xe64c;</i></td>
        </tr>

        <tr>
            <td class="tdnum">2</td>
            <td class="text_style"
                title="北京市政路桥建材集团有限公司关于印发《北京市政路桥建材集团有限公司沥青混合料运费管理办法》的通知">
                北京市政路桥建材集团有限公司关于印发《北京市政路桥建材集团有限公司沥青混合料运费管理办法》的通知
            </td>
            <td>建材集团生发[2017]171号</td>
            <td>2017-12-05 11:32</td>
            <td>李四</td>
            <td>无</td>
            <td>是</td>
            <td style="text-align: center"><i class="iconfont">&#xe64c;</i></td>
        </tr>

        <tr >
            <td class="tdnum">3</td>
            <td class="text_style"
                title="北京市政路桥建材集团有限公司应收账款管理办法">北京市政路桥建材集团有限公司应收账款管理办法
            </td>
            <td>建材集团生发[2017]172号</td>
            <td>2017-11-05 16:22</td>
            <td>王五</td>
            <td>无</td>
            <td>是</td>
            <td style="text-align: center"><i class="iconfont">&#xe64c;</i></td>
        </tr>

        <tr >
            <td class="tdnum">4</td>
            <td class="text_style"
                title="北京市政路桥建材集团有限公司统计工作管理办法">北京市政路桥建材集团有限公司统计工作管理办法
            </td>
            <td>建材集团生发[2017]173号</td>
            <td>2017-02-05 09:44</td>
            <td>赵六</td>
            <td>无</td>
            <td>是</td>
            <td style="text-align: center"><i class="iconfont">&#xe64c;</i></td>
        </tr>

        <tr >
            <td class="tdnum">5</td>
            <td class="text_style"
                title="关于印发《北京市政路桥建材集团有限公司统计工作管理办法》的通知">关于印发《北京市政路桥建材集团有限公司统计工作管理办法》的通知
            </td>
            <td>建材集团生发[2017]174号</td>
            <td>2017-11-21 09:44</td>
            <td>高七</td>
            <td>无</td>
            <td>是</td>
            <td style="text-align: center"><i class="iconfont">&#xe64c;</i></td>
        </tr>

        </tbody>

    </table>

</div>


</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
</html>
