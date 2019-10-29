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
    <link type="text/css" rel="stylesheet" href="/static/css/qc/jeDate-test.css">
    <link type="text/css" rel="stylesheet" href="/static/css/qc/jedate.css">
    <link type="text/css" rel="stylesheet" href="/static/css/qc/qc_select.css">
</head>
<body>
<li class="card-item active">
    <div class="card">
        <div class="card-content content-second">
            <div class="main-info">
                <div style="width: 100%;height: 10%;" >
                    <div class="jeitem">
                        <div class="jeitem">
                            <label class="jelabel">开始日期：</label>
                            <div class="dy_select_div"   >
                                <input type="text" class="dy_select_date" id="inpstart"  placeholder="选择开始日期" >
                            </div>
                            <label class="jelabel">结束日期：</label>
                            <div class="dy_select_div"   >
                                <input type="text" class="dy_select_date" id="inpend" placeholder="选择开始日期" >
                            </div>
                            <button style="width: 160px;height: 36px;margin-left: 5%;" onclick="selectCeiticalWarning()" >查询</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</li>
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
                <th style="color: #a94442;" >骨料1预警级别</th>
                <th>骨料1偏差比</th>
                <th style="color: #a94442;"  >沥青预警级别</th>
                <th>沥青偏差比</th>
                <th style="color: #a94442;" >一仓温度预警级别</th>
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
<script type="text/javascript" src="/static/js/qc/datetime.js"></script>
<script src="../../../static/js/oa/layer/layer.js"></script>
<script src="../../../static/js/qc/critical_warning.js"></script>

</html>
