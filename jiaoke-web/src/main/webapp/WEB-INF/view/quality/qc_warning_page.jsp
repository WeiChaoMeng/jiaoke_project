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
    <title>警告弹出页</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <style>
        table.altrowstable {
            font-family: verdana,arial,sans-serif;
            font-size:11px;
            color:#333333;
            border-width: 1px;
            border-color: #a9c6c9;
            border-collapse: collapse;
        }
        table.altrowstable th {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
        }
        table.altrowstable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
        }
        .oddrowcolor{
            background-color:#d4e3e5;
        }
        .evenrowcolor{
            background-color:#c3dde0;
        }
    </style>
</head>

<body >

<!-- Table goes in the document BODY -->
<table class="altrowstable" id="showMessage">
    <tr>
        <th>机组</th>
        <th>盘号</th>
        <th>材料</th>
        <th>模板配比</th>
        <th>实际配比</th>
        <th>偏差比</th>
        <th>预警级别</th>
    </tr>
    <tr>
        <td id="crewNum"></td>
        <td id="discNum"></td>
        <td id="materialName"></td>
        <td id="moudleRatio"></td>
        <td id="actualRatio"></td>
        <td id="deviationRatio"></td>
        <td id="warningLevel"></td>
    </tr>
</table>

</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>

<script type="text/javascript">

    window.onload=function(){
        var crewNum = localStorage.getItem("crewNum");
        var discNum = localStorage.getItem("discNum");
        var materialName = localStorage.getItem("materialName");
        var warningLevel = localStorage.getItem("warningLevel");
        var actualRatio = localStorage.getItem("actualRatio");
        var moudleRatio = localStorage.getItem("moudleRatio");
        var deviationRatio = localStorage.getItem("deviationRatio");

        $("#crewNum").text("机组" + crewNum);
        $("#discNum").text(discNum);
        $("#materialName").text(materialName);
        $("#warningLevel").text(warningLevel + "级预警");
        if (materialName == "一仓温度"){
            $("#actualRatio").text(actualRatio + "℃");
            $("#moudleRatio").text(moudleRatio + "℃");
            $("#deviationRatio").text(deviationRatio + "℃");
        }else {
            $("#actualRatio").text(actualRatio + "%");
            $("#moudleRatio").text(moudleRatio + "%");
            $("#deviationRatio").text(deviationRatio + "%");
        }
    }
</script>

</html>