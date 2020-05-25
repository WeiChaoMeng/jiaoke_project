<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2019-8-8
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm" >
<head>
    <title>基本信息</title>
    <link rel="stylesheet" type="text/css" href="../../../static/css/personnel/personnelCommon.css">
    <link href="../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet" href="../../../static/css/qc/zxf_page.css">
    <link type="text/css" rel="stylesheet" href="../../../static/css/qc/jeDate-test.css">
    <link type="text/css" rel="stylesheet" href="../../../static/css/qc/jedate.css">
    <link type="text/css" rel="stylesheet" href="../../../static/css/qc/qc_select.css">
    <script src="../../../static/new/lib/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../../../static/new/css/xadmin.css">
    <script type="text/javascript" src="../../../static/new/js/xadmin.js"></script>
</head>
<body>
<div class="x-nav">
            <span class="layui-breadcrumb">
                <%--<a href="/default.do" onclick="inv()">首页</a>--%>
                <a><cite>主页</cite></a>
                <a><cite>质量管控</cite></a>
                <a><cite>警报管理</cite></a>
            </span>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <li class="card-item active">
                        <div class="card">
                            <div class="card-content content-second">
                                <div class="main-info">
                                    <div style="width: 100%;height: 10%;" >
                                        <div class="jeitem">
                                            <div class="jeitem">
                                                <label class="jelabel" style="width: 90px;">开始日期：</label>
                                                <div class="dy_select_div"   >
                                                    <input type="text" class="dy_select_date" id="inpstart"  placeholder="选择开始日期" >
                                                </div>
                                                <label class="jelabel" style="width: 90px;">结束日期：</label>
                                                <div class="dy_select_div"   >
                                                    <input type="text" class="dy_select_date" id="warinpend" placeholder="选择开始日期" onchange="getProjectByDate()" >
                                                </div>
                                                <label class="jelabel" style="width: 90px;">工程选择:</label>
                                                <div class="dy_select_div"   >
                                                    <select  id="project_id" class="dy_select">
                                                        <option value="select" >请选择</option>
                                                    </select>
                                                </div>
                                                <button style="width: 160px;height: 36px;margin-left: 5%;border: none;" class="query-but" onclick="selectCeiticalWarning()" >查询</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </div>

                <div class="layui-card-body ">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th style="width: 8.5%;">日期</th>
                            <th style="width: 8.5%;" >时间</th>
                            <th style="width: 8.5%;" >盘号</th>
                            <th style="width: 8.5%;" >工程名称</th>
                            <th style="width: 8.5%;" >配比名称</th>
                            <th style="width: 8.5%;" >机组名称</th>
                            <th style="width: 8.5%;" >骨料1预警级别</th>
                            <th style="width: 8.5%;" >骨料1偏差比</th>
                            <th style="width: 8.5%;" >沥青预警级别</th>
                            <th style="width: 8.5%;" >沥青偏差比</th>
                            <th style="width: 8.5%;" >一仓温度预警级别</th>
                            <th style="width: 8.5%;" >一仓温度偏差比</th>
                            <th style="width: 8.5%;" >操作</th>
                        </tr>
                        </thead>

                        <tbody id="criticalBody"  >


                        </tbody>
                    </table>
                </div>

                <div class="layui-card-body" style="display: inline-block;width: 100%;">
                    <div class="zxf_pagediv"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<input  id="path" value="${path}" type="hidden" >
</body>
<script src="../../../static/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../../../static/js/paging/jqPaginator.js"></script>
<script type="text/javascript" src="/static/js/qc/zxf_page.js"></script>
<script type="text/javascript" src="/static/js/qc/datetime.js"></script>
<script src="../../../static/js/oa/layer/layer.js"></script>
<script src="../../../static/js/qc/critical_warning.js"></script>

</html>
