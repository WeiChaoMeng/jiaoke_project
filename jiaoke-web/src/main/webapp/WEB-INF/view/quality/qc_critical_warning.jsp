<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2019-8-8
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>基本信息</title>
    <link rel="stylesheet" type="text/css" href="../../../static/css/personnel/personnelCommon.css">
    <link href="../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet" href="/static/css/qc/zxf_page.css">
</head>
<body>
<div class="table-margin">

    <div>
        <table class="simple-table">
            <thead>
            <tr>
                <th>日期</th>
                <th>时间</th>
                <th>盘号</th>
                <th>配比名称</th>
                <th>机组名称</th>
                <th>骨料1预警级别</th>
                <th>骨料1偏差比</th>
                <th>沥青预警级别</th>
                <th>沥青偏差比</th>
                <th>一仓温度预警级别</th>
                <th>一仓温度偏差比</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody id="criticalBody"  >


            </tbody>
        </table>
    </div>

</div>
<div class="zxf_pagediv"></div>
<input  id="path" value="${path}" type="hidden" >
</body>
<script src="../../../static/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../../../static/js/paging/jqPaginator.js"></script>
<script type="text/javascript" src="/static/js/qc/zxf_page.js"></script>
<script src="../../../static/js/oa/layer/layer.js"></script>
<script src="../../../static/js/qc/critical_warning.js"></script>

</html>
