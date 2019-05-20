<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8">
    <title>打卡记录</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <script src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/echarts/uimaker.js"></script>
</head>

<body style="padding:10px 8px 100px 8px;">


<div class="div_dataMessage"  id="promessage" >

    <div class="">
        <div class="">
            <div class="boxtitle">
                <span>历史产品数据</span>
                <a href="#"  onclick="print()" >打印<i class="iconfont"></i></a>
            </div>

            <div class="boxdown">
                <table class="simpletable">

                    <thead>
                    <th>产品编号</th>
                    <th>生产日期</th>
                    <th>生产时间</th>
                    <th>盘号</th>
                    <th>产品名称</th>
                    <th>骨料6</th>
                    <th>骨料5</th>
                    <th>骨料4</th>
                    <th>骨料3</th>
                    <th>骨料2</th>
                    <th>骨料1</th>
                    <th>石粉1</th>
                    <th>石粉2</th>
                    <th>沥青</th>
                    <th>再生料</th>
                    <th>添加剂</th>
                    <th>总计</th>
                    <th>一仓温度</th>
                    <th>混合料温度</th>
                    <th>沥青温度</th>
                    <th>骨料温度</th>
                    <th>除尘器温度</th>
                    </thead>

                    <tbody>
                    <c:forEach items="${prolist}" var="item">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.produce_date}</td>
                            <td>${item.product_time}</td>
                            <td>${item.produce_disc_num}</td>
                            <td>${item.pro_name}</td>
                            <td>${item.material_aggregate_6}</td>
                            <td>${item.material_aggregate_5}</td>
                            <td>${item.material_aggregate_4}</td>
                            <td>${item.material_aggregate_3}</td>
                            <td>${item.material_aggregate_2}</td>
                            <td>${item.material_aggregate_1}</td>
                            <td>${item.material_stone_1}</td>
                            <td>${item.material_stone_2}</td>
                            <td>${item.material_asphalt}</td>
                            <td>${item.material_regenerate}</td>
                            <td>${item.material_additive}</td>
                            <td>${item.material_total}</td>
                            <td>${item.temperature_warehouse_1}</td>
                            <td>${item.temperature_mixture}</td>
                            <td>${item.temperature_asphalt}</td>
                            <td>${item.temperature_aggregate}</td>
                            <td>${item.temperature_duster}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
    </div>

</div>


</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>

</html>