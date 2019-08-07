<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>工资统计</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
</head>
<style>
    .simpletable thead tr th {
        text-align: center;
        text-indent: 0;
        width: 100px;
    }

    .simpletable tbody tr td {
        text-align: center;
        text-indent: 0;
    }

    #tabs {
        width: 100%;
        margin: 0;
        padding: 0;
        list-style: none;
    }

    #tabs li {
        float: left;
        margin: 0 .5em 0 0;
    }

    #tabs a {
        position: relative;
        background: #ddd;
        background-image: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ddd));
        background-image: -webkit-linear-gradient(top, #fff, #ddd);
        background-image: -moz-linear-gradient(top, #fff, #ddd);
        background-image: -ms-linear-gradient(top, #fff, #ddd);
        background-image: -o-linear-gradient(top, #fff, #ddd);
        background-image: linear-gradient(to bottom, #fff, #ddd);
        padding: .7em 3.5em;
        float: left;
        text-decoration: none;
        color: #444;
        text-shadow: 0 1px 0 rgba(255, 255, 255, .8);
        -webkit-border-radius: 5px 0 0 0;
        -moz-border-radius: 5px 0 0 0;
        border-radius: 5px 0 0 0;
        -moz-box-shadow: 0 2px 2px rgba(0, 0, 0, .4);
        -webkit-box-shadow: 0 2px 2px rgba(0, 0, 0, .4);
        box-shadow: 0 2px 2px rgba(0, 0, 0, .4);
    }

    #tabs a:hover, #tabs a:hover::after, #tabs a:focus, #tabs a:focus::after {
        background: #fff;
    }

    #tabs a:focus {
        outline: 0;
    }

    #tabs a::after {
        content: '';
        position: absolute;
        z-index: 1;
        top: 0;
        right: -.5em;
        bottom: 0;
        width: 1em;
        background: #ddd;
        background-image: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ddd));
        background-image: -webkit-linear-gradient(top, #fff, #ddd);
        background-image: -moz-linear-gradient(top, #fff, #ddd);
        background-image: -ms-linear-gradient(top, #fff, #ddd);
        background-image: -o-linear-gradient(top, #fff, #ddd);
        background-image: linear-gradient(to bottom, #fff, #ddd);
        -moz-box-shadow: 2px 2px 2px rgba(0, 0, 0, .4);
        -webkit-box-shadow: 2px 2px 2px rgba(0, 0, 0, .4);
        box-shadow: 2px 2px 2px rgba(0, 0, 0, .4);
        -webkit-transform: skew(10deg);
        -moz-transform: skew(10deg);
        -ms-transform: skew(10deg);
        -o-transform: skew(10deg);
        transform: skew(10deg);
        -webkit-border-radius: 0 5px 0 0;
        -moz-border-radius: 0 5px 0 0;
        border-radius: 0 5px 0 0;
    }

    #tabs #current a, #tabs #current a::after {
        background: #fff;
        z-index: 3;
    }
</style>
<body style="padding:15px 8px 0 8px;">

<div class="formal-workers">

    <div class="formal-workers-head" style="background-color: #fff;">
        <table width="100%" height="100%">
            <tbody>
            <tr>
                <td>
                    <ul id="tabs">
                        <li><a href="#" title="tab1" id="regularEmployee">正式职工</a></li>
                        <li><a href="#" title="tab2" id="outsourcedStaff">外包职工</a></li>
                    </ul>

                    <%--<ul class="tab-switch" style="margin-left: 20px">
                        <input id="fileSelect" type="file" class="excel-upload" value="" onchange="readExcel(this)"
                               multiple="multiple"
                               accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"/>
                        <li name="website" class="tabcurrent"><a href="javascript:;">导入Excel</a></li>
                    </ul>--%>
                </td>
                <%--<td>
                    <div class="conditional_query">

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
                            <select id="condition5">
                                <option value="0">- -查询条件- -</option>
                                <option value="1">会议室名称</option>
                                <option value="2">审核状态</option>
                            </select>
                        </div>
                    </div>

                </td>--%>
            </tr>
            </tbody>
        </table>
    </div>

    <iframe id="tabSwitch" name="tabSwitch" src="wageStatistics/toRegularEmployee"
            style="width: 100%;height: 88%;"></iframe>

</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script>
    $(document).ready(function () {
        $("#content div").hide(); // Initially hide all content
        $("#tabs li:first").attr("id", "current"); // Activate first tab
        $("#content table:first").fadeIn(); // Show first tab content

        $('#tabs a').click(function (e) {
            e.preventDefault();
            $("#content div").hide(); //Hide all content
            $("#tabs li").attr("id", ""); //Reset id's
            $(this).parent().attr("id", "current"); // Activate this
            $('#' + $(this).attr('title')).fadeIn(); // Show content for current tab
        });
    });

    //tab切换
    $("#regularEmployee").on("click", function () {
        $('#tabSwitch').attr("src", "wageStatistics/toRegularEmployee");
    });

    $("#outsourcedStaff").on("click", function () {
        $('#tabSwitch').attr("src", "wageStatistics/toOutsourcedStaff");
    });

    /* 预定撤销 - 查询条件*/
    $("#condition5").on("change", function () {
        var opt = $("#condition5").val();
        if (opt == 2) {
            $(".head_right_side_select").css("display", "block");
            $(".head_right_side_input").css("display", "none");
        } else if (opt == 1) {
            $(".head_right_side_input").css("display", "block");
            $(".head_right_side_select").css("display", "none");
        } else {
            $(".head_right_side_input").css("display", "none");
            $(".head_right_side_select").css("display", "none");
        }
    });

    function readExcel(obj) {
        //调用子页面方法
        tabSwitch.importExcel(obj);
    }

</script>
</html>
