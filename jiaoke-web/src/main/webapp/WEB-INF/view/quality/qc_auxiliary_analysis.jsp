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
    <title>辅助分析</title>
    <link href="../../css/default.css" rel="stylesheet" type="text/css">
    <link href="../../css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <style>
        .nform li span {
            width: 28%;
        }

        .simpletable thead tr th {
            background: #9affe4;
            border: solid 1px #fff;
            height: 30px;
            line-height: 30px;
            font-weight: bold;
            text-align: center;
            text-indent: 0;
            white-space: nowrap;
        }

    </style>
</head>

<body style="padding:15px 8px 0px 8px;">

<div class="">

    <div class="table_top">
        <table width="100%" height="100%">
            <tbody>
            <tr>
                <td>
                    <a href="../../download/commons-io-2.4-src.zip" download="">
                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xe8e5; 导出
                    </div>
                    </a>

                    <div class="separation_line">

                    </div>
                    
                    <a  href="#" id="delect" >
                    <div class="head_left_button" onmousemove="select_color(this)" onmouseout="unselected_color(this)">
                        &#xeaa5; 删除
                    </div>
                    </a>
                    <div class="separation_line">

                    </div>

                </td>
                <td>
                    <div class="conditional_query">

                        <!--条件查询-->
                        <div id="div1" class="head_right_side">
                            <select id="condition">
                                <option value="0">- -查询条件- -</option>
                                <option value="1">预警级别一</option>
                                <option value="2">预警级别二</option>
                                <option value="3">预警级别三</option>
                            </select>
                        </div>
                    </div>

                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="content_title">

        <table class="simpletable" style="width: 100%;">

            <thead>
            <th style="width: 40px"><input type="checkbox" id="checkAll" ></th>
            <th style="width: 70px ">预警级别</th>
            <th style="width: 70px ">日期时间</th>
            <th style="width: 70px">盘号</th>
            <th style="width: 70px ">配比号</th>
            <th style="width: 70px">骨料5</th>
            <th style="width: 70px">骨料4</th>
            <th style="width: 70px">骨料3</th>
            <th style="width: 70px">骨料2</th>
            <th style="width: 70px">骨料1</th>
            <th style="width: 70px ">石粉2</th>
            <th style="width: 70px ">石粉1</th>
            <th style="width: 70px ">再生料</th>
            <th style="width: 70px ">添加剂</th>
            <th style="width: 70px ">沥青</th>
            <th style="width: 70px ">沥青温度</th>
            <th style="width: 70px ">混合料温度</th>
            <th style="width: 70px ">骨料温度</th>
            <th style="width: 100px">合计(kg)</th>

            <th style="width: 10px"></th>
            </thead>

            <tbody>
            <tr></tr>
            <tr>
                <td><input type="checkbox"></td>
                <td>3</td>
                <td>6月10日 20:13:28</td>
                <td>1</td>
                <td>2</td>
                <td>1543</td>
                <td>2783</td>
                <td>3344</td>
                <td>4636</td>
                <td>126.1</td>
                <td>235.5</td>
                <td>1543</td>
                <td>1543</td>
                <td>2783</td>
                <td>3344</td>
                <td>4636</td>
                <td>126.1</td>
                <td>235.5</td>
                <td>4997.6</td>

            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td>4</td>
                <td>6月11日 20:13:28</td>
                <td>1</td>
                <td>2</td>
                <td>1543</td>
                <td>2783</td>
                <td>3344</td>
                <td>4636</td>
                <td>126.1</td>
                <td>235.5</td>
                <td>1543</td>
                <td>1543</td>
                <td>2783</td>
                <td>3344</td>
                <td>4636</td>
                <td>126.1</td>
                <td>235.5</td>
                <td>4997.6</td>

            </tr>

            </tbody>

        </table>
    </div>

</div>

    <div class="popup_back" style="display:none;">
    </div>
    <div class="popup_window_first" style="display:none;">
        <p class="popup_cont">是否删除？</p>
        <a href="javascript:void(0)" class="popup_btn" onclick="closeWindow();">确定</a>
        <a href="javascript:void(0)" class="popup_btn" onclick="closeWindow();">取消</a>
    </div>

</body>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript" src="../../js/skin.js"></script>

<script type="text/javascript">
    (function(){

    })(jQuery)
    
    $("#checkAll").click(function(){
        $("input:checkbox").each(function () {
            this.checked = $("#checkAll").get(0).checked;
        })
    })

        //点击弹出删除按钮
    function closeWindow() {
        $('.popup_back,.popup_window_first').hide();
    }
    $('#delect').click(function() {
        $('.popup_window_first,.popup_back').show();
    });

</script>
</html>
