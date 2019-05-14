<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>数据汇总</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet" href="/static/css/qc/jeDate-test.css">
    <link type="text/css" rel="stylesheet" href="/static/css/qc/jedate.css">
    <link type="text/css" rel="stylesheet" href="/static/css/qc/zxf_page.css">
    <link type="text/css" rel="stylesheet" href="/static/css/qc/qc_select.css">
    <link href="/static/css/qc/jqTable.css" rel="stylesheet" type="text/css">

    <style>


    </style>
</head>

<body style="padding:15px 8px 0px 8px;">

<div class="">
    <li class="card-item active">
        <div class="card">
            <div class="card-content content-second">
                <div class="main-info">
                    <div style="width: 100%;height: 10%;" >
                            <div class="jeitem">
                                <div class="jeitem">
                                    <label class="jelabel">开始日期：</label>
                                    <div class="dy_select_div"   >
                                        <input type="text" class="dy_select_date" data-ajax="false" id="inpstart"  placeholder="选择开始日期" >
                                    </div>
                                    <label class="jelabel">结束日期：</label>
                                    <div class="dy_select_div"   >
                                        <input type="text" class="dy_select_date" data-ajax="false" id="inpend" placeholder="选择开始日期" >
                                    </div>

                                <label class="jelabel">机组选择</label>
                                <div class="dy_select_div"   >
                                    <select id="crew_num" class="dy_select" onchange="getModelByDateTimeAndCrew()" >
                                        <option value="sect">请选择</option>
                                        <option value="data1">机组一</option>
                                        <option value="data2">机组二</option>
                                    </select>
                                </div>

                                <label class="jelabel">模板选择</label>
                                <div class="dy_select_div" >
                                    <select  id="ratio_id" class="dy_select">
                                        <option value="select" >请选择</option>
                                    </select>
                                </div>
                                <button style="width: 160px;height: 36px;margin-left: 5%;" onclick="selectPromessageByRaionModel()" >查询</button>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </li>

    <div class="div_dataMessage" id="promessage">

        <div class="boxtitle">
            <span>历史产品数据</span>

        </div>
                <div class="boxdown">
                    <table class="simpletable">

                        <thead>
                        <tr>
                            <th>生产日期</th>
                            <th>生产时间</th>
                            <th>机组号</th>
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
                        </tr></thead>

                        <tbody id="productData">

                        </tbody>
                    </table>
        </div>

    </div>
</div>
<div class="zxf_pagediv"></div>
<input id="totalpage" type="hidden" >
<input  id="path" value="${path}" type="hidden" >
</body>

<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/qc/datetime.js"></script>
<script type="text/javascript" src="/static/js/qc/zxf_page.js"></script>
<script type="text/javascript" src="/static/js/layer/layer.js"></script>
<script type="text/javascript" src="/static/js/qc/dataSummary.js"></script>
<script type="text/javascript">

</script>
</html>
