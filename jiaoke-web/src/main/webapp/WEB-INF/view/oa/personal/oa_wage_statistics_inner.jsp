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
</style>
<body style="padding:15px 8px 0 8px;">

<div class="formal-workers">

    <div class="formal-workers-head">
        <table width="100%" height="100%">
            <tbody>
            <tr>
                <td>
                    <ul class="tab-switch" id="tab">
                        <li name="website" class="tabcurrent"><a href="javascript:;">外包职工</a></li>
                    </ul>

                    <ul class="tab-switch">
                        <input id="fileSelect" type="file" class="excel-upload" value="导入Excel" multiple="multiple"
                               accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"/>
                        <li name="website" class="tabcurrent"><a href="javascript:;">导入Excel</a></li>
                    </ul>
                </td>
                <td>
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

                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <table class="simpletable simpletable_color" style="margin-top: 30px;position: absolute;width: 2400px;">

        <thead>
        <th>员工编号</th>
        <th>部门</th>
        <th>姓名</th>
        <th>岗位</th>
        <th>岗位工资</th>
        <th>技术职称津贴</th>
        <th>特殊工种津贴</th>
        <th>补发工资</th>
        <th>奖金</th>
        <th>月奖</th>
        <th>补助</th>
        <th>高温津贴</th>
        <th>加班费</th>
        <th>应发工资</th>
        <th>养老险</th>
        <th>失业险</th>
        <th>医保</th>
        <th>大额</th>
        <th>公积金</th>
        <th>个人所得税</th>
        <th>会费</th>
        <th>实发金额</th>
        <th>操作</th>
        <th style="width: 10px"></th>
        </thead>

        <tbody>

        <tr></tr>
        <tr class="even">
        <tr>
            <td>B801</td>
            <td>生产经营部</td>
            <td>张三</td>
            <td>施工管理</td>
            <td>10000</td>
            <td>1000</td>
            <td>600</td>
            <td>300</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>800</td>
            <td>0</td>
            <td>12400</td>
            <td>992</td>
            <td>24.8</td>
            <td>248</td>
            <td>1488</td>
            <td>674.44</td>
            <td>172.76</td>
            <td>172.76</td>
            <td>8972.76</td>
            <td class="operation-content">
                <a>删除</a>
                <span>|</span>
                <a>编辑</a>
            </td>
        </tbody>

    </table>

</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script>

    $('#tab').on('click', function () {
        location.href = 'oa_wage_statistics_outer.jsp';
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
</script>
</html>
