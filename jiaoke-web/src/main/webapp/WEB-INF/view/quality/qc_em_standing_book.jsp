<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>台账管理</title>
    <link type="text/css" rel="stylesheet" href="/static/css/qc/jeDate-test.css">
    <link type="text/css" rel="stylesheet"  href="/static/css/qc/sample_management.css" >

</head>


<body style="padding:10px; ">

<div class="yyui_tab">

    <ul>
        <li class="yyui_tab_title_this" onclick="getTestStandingBook()">试验检测台账</li>
        <li class="yyui_tab_title" onclick="getRawMaterialStandingBook()">原材料台账</li>
        <li class="yyui_tab_title" onclick="getAsphaltStandingBook()">沥青原材台账</li>
    </ul>
<%--取样单台账--%>
    <div class="yyui_tab_content_this" id="testDiv">
        <div class="jeitem">
            <label class="jelabel" >开始日期：</label>
            <div class="dy_select_div"   >
                <input type="text" class="dy_select_date" id="testStart" data-ajax="false"   placeholder="选择开始日期" >
            </div>
            <label class="jelabel">结束日期：</label>
            <div class="dy_select_div"   >
                <input type="text" class="dy_select_date"  data-ajax="false" id="testEnd" placeholder="选择开始日期" >
            </div>
            <button style="width: 160px;height: 36px;margin-left: 10%;" onclick="getTestStandingBookByDate()" >查询</button>
            <button style="width: 160px;height: 36px;margin-left: 10%;" onclick="table2excel('testTable','sheet1','试验检测台账')">生产Excel</button>
        </div>
        <table  class="standingBookTable" border="1" id="testTable" >

            <thead>
            <tr class="firstHead">
                <th colspan="8">试验检测台账</th>
            </tr>
            <tr class="firstHead">
                <th >日期</th>
                <th >委托编号</th>
                <th>样品名称</th>
                <th>试样编号</th>
                <th>试验编号</th>
                <th>工程名称</th>
                <th>试验项目</th>
                <th>备注</th>
            </tr>
            </thead>

            <tbody id="testTbody">
            <tr>
                <td>1</td>
                <td>2018-11-11取样单台账</td>
                <td>2018-11-11</td>
                <td>2018-11-11</td>
                <td>2018-11-11</td>
                <td>2018-11-11</td>
                <td>2018-11-11</td>
                <td>2018-11-11</td>
            </tr>
            </tbody>
        </table>
    </div>


<%--原材--%>
    <div class="yyui_tab_content" id="rawMaterialDiv">
        <div class="jeitem">
            <label class="jelabel"  style="padding: 10px 0px;">开始日期：</label>
            <div class="dy_select_div"   >
                <input type="text" id="rawMaterialStartDate" class="dy_select_date" data-ajax="false"   placeholder="选择开始日期" >
            </div>
            <label class="jelabel" style="padding: 10px 0px;">结束日期：</label>
            <div class="dy_select_div"   >
                <input type="text" id="rawMaterialEndDate" class="dy_select_date" data-ajax="false"  placeholder="选择开始日期" >
            </div>
            <button style="width: 160px;height: 36px;margin-left: 10%;" onclick="getRawMaterialStandingBookByDate()" >查询</button>
            <button style="width: 160px;height: 36px;margin-left: 10%;" onclick="table2excel('rawMaterialTable','sheet1','原材料台账')" >生产Excel</button>
        </div>
        <table class="standingBookTable" id="rawMaterialTable" border="1" >

            <thead>
            <tr class="firstHead">
                <th colspan="19">原材试验台账</th>
            </tr>
            <tr class="firstHead">
                <th rowspan="2">实验日期</th>
                <th rowspan="2">试样名称</th>
                <th rowspan="2">试验项目</th>
                <th rowspan="2">试验编号</th>
                <th colspan="14">试验结果</th>
                <th rowspan="2">备注</th>
            </tr>
            <tr class="twoHead">
                <th>37.5</th>
                <th>31.5</th>
                <th>26.5</th>
                <th>19</th>
                <th>16</th>
                <th>13.2</th>
                <th>9.5</th>
                <th>4.75</th>
                <th>2.36</th>
                <th>1.18</th>
                <th>0.6</th>
                <th>0.3</th>
                <th>0.15</th>
                <th>0.075</th>
            </tr>
            </thead>
            <tbody id="rawMaterial">
            <tr>
                <td>
                    压碎值   %
                </td>
                <td>
                    ≯26
                </td>
                <td>
                    11.0
                </td>
                <td>
                    T0316
                </td>
                <td colspan="14">
                    T0316
                </td>
                <td>
                    asdadas
                </td>
            </tr>
            </tbody>
        </table>

    </div>

    <%--沥青--%>
    <div class="yyui_tab_content" id="asphaltDiv">
        <div class="jeitem">
            <label class="jelabel" style="padding: 10px 0px;">开始日期：</label>
            <div class="dy_select_div"   >
                <input type="text"  class="dy_select_date" data-ajax="false" id="asphaltStartDate"  placeholder="选择开始日期" >
            </div>
            <label class="jelabel" style="padding: 10px 0px;">结束日期：</label>
            <div class="dy_select_div"   >
                <input type="text" class="dy_select_date" data-ajax="false" id="asphaltEndDate" placeholder="选择开始日期" >
            </div>
            <button style="width: 160px;height: 36px;margin-left: 10%;" onclick="getAsphaltStandingBookByDate()" >查询</button>
            <button style="width: 160px;height: 36px;margin-left: 10%;" onclick="table2excel('asphaltTable','沥青','沥青原材试验台账')" >生产Excel</button>
        </div>
        <table class="standingBookTable" border="1" id="asphaltTable" >

                <thead>
                <tr class="firstHead">
                    <th colspan="7">沥青试验台账</th>
                </tr>
                <tr class="twoHead">
                    <th>日期</th>
                    <th>品种</th>
                    <th>试验名称</th>
                    <th>试验编号</th>
                    <th>试验结果</th>
                    <th>产地</th>
                    <th>备注</th>
                </tr>
                </thead>
                <tbody id="asphaltTbody">
                <tr>
                    <td>
                        压碎值   %
                    </td>
                    <td>
                        ≯26
                    </td>
                    <td>
                        11.0
                    </td>
                    <td>
                        T0316
                    </td>
                    <td>
                        T0316
                    </td>
                    <td>
                        asdadas
                    </td>
                    <td >
                    T0316
                    </td>
                    <td>
                        T0316
                    </td>
                    <td>
                        T0316
                    </td>
                    <td>
                        T0316
                    </td>
                    <td>
                        asdadas
                    </td>
                </tr>
                </tbody>
            </table>

    </div>

</div>
<input  id="path" value="${path}" type="hidden" >
</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/layer/layer.js"></script>
<script type="text/javascript" src="/static/js/qc/datetime.js"></script>
<script type="text/javascript" src="/static/js/qc/standing_book.js"></script>


</html>