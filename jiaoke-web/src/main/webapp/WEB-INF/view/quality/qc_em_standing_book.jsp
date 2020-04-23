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
        <li class="yyui_tab_title" id="2" onclick="getCoarseStandingBook(this.id)">粗集料台账</li>
        <li class="yyui_tab_title" id="1" onclick="getFineStandingBook(this.id)">细集料台账</li>
        <li class="yyui_tab_title" id="3" onclick="getBreezeStandingBook(this.id)">矿料台账</li>
        <li class="yyui_tab_title" id="4" onclick="getAsphaltStandingBook(this.id)">沥青原材台账</li>
        <li class="yyui_tab_title" id="search" onclick="searchStandingBook()">台账检索 </li>
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
            <button style="width: 160px;height: 36px;margin-left: 10%;" onclick="table2excel('testTable','sheet1','试验检测台账')">生成Excel</button>
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


    <%--原材料--%>
    <div class="yyui_tab_content" id="rawMaterialDiv">

    </div>

    <%--沥青--%>
    <div class="yyui_tab_content" id="asphaltDiv">

    </div>

    <%--检索--%>
    <div class="yyui_tab_content" id="searchDiv" >
        <form id="searchFrom">
        <div class="jeitem">
            <label class="jelabel" >开始日期：</label>
            <div class="dy_select_div"   >
                <input type="text" class="dy_select_date" id="searchStart" name="startDate" data-ajax="false"   placeholder="选择开始日期" required >
            </div>
            <label class="jelabel">结束日期：</label>
            <div class="dy_select_div"   >
                <input type="text" class="dy_select_date"  data-ajax="false" name="endDate"  id="searchEnd"  placeholder="选择开始日期" required >
            </div>
            <label class="jelabel">材料：</label>
            <div class="dy_select_div"   >
                <select  class="my_select" id="materials" name="materials" required>
                    <option value="Job Inquiry">Job Inquiry</option>
                    <option value="General Question">General Question</option>
                </select>
            </div>
            <label class="jelabel">规格：</label>
            <div class="dy_select_div"   >
                <select class="my_select" id="specification" name="specification" required>
                    <option value="Job Inquiry">Job Inquiry</option>
                    <option value="General Question">General Question</option>
                </select>
            </div>
            <label class="jelabel">厂家：</label>
            <div class="dy_select_div"   >
                <select class="my_select" id="manufacturers" name="manufacturers" required>
                    <option value="Job Inquiry">Job Inquiry</option>
                    <option value="General Question">General Question</option>
                </select>
            </div>
            <button  style="width: 120px;height: 36px;margin-left: 2%;" onclick="searchFrom()" >查询</button>
            <button style="width: 120px;height: 36px;margin-left: 2%;" onclick="table2excel('searchTable','sheet1','试验检测台账')">生成Excel</button>

        </div>
        </form>
        <table  class="standingBookTable" border="1" id="searchTable" >

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