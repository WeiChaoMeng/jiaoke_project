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
<html class="x-admin-sm">
<head>
    <meta charset="utf-8">
    <title>数据汇总</title>
    <link href="../../../static/css/default.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet" href="../../../static/css/qc/jeDate-test.css">
    <link type="text/css" rel="stylesheet" href="../../../static/css/qc/jedate.css">
    <link type="text/css" rel="stylesheet" href="../../../static/css/qc/zxf_page.css">
    <link type="text/css" rel="stylesheet" href="../../../static/css/qc/qc_select.css">
    <link href="../../../static/css/qc/jqTable.css" rel="stylesheet" type="text/css">
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
                <a><cite>数据汇总</cite></a>
            </span>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <div class="jeitem" style="margin: 0;padding-top: 0;">
                        <div class="jeitem">
                            <label class="jelabel">开始日期：</label>
                            <div class="dy_select_div"   >
                                <input type="text" class="dy_select_date" data-ajax="false" id="inpstart"  placeholder="选择开始日期" >
                            </div>
                            <label class="jelabel">结束日期：</label>
                            <div class="dy_select_div"   >
                                <input type="text"  class="dy_select_date"  id="inpend" placeholder="选择开始日期"  >
                            </div>

                            <label class="jelabel">机组选择：</label>
                            <div class="dy_select_div"   >
                                <select id="crew_num" class="dy_select" onchange="getModelByDateTimeAndCrew()" >
                                    <option value="select">请选择</option>
                                    <option value="data1">机组一</option>
                                    <option value="data2">机组二</option>
                                </select>
                            </div>

                            <label class="jelabel">模板选择：</label>
                            <div class="dy_select_div" >
                                <select  id="ratio_id" class="dy_select" onchange="getProjectByDateTimeAndCrewAndRation()">
                                    <option value="select" >请选择</option>
                                </select>
                            </div>
                            <label class="jelabel">工程选择：</label>
                            <div class="dy_select_div" >
                                <select  id="project_id" class="dy_select">
                                    <option value="select" >请选择</option>
                                </select>
                            </div>
                            <button style="width: 100px;height: 36px;margin-left: 1%;" class="query-but" onclick="selectPromessageByRaionModel()" >查询</button>
                            <button style="width: 100px;height: 36px;margin-left: 1%;" class="query-but" onclick="method5('proExcel')" >导出excel</button>
                        </div>
                    </div>
                </div>

                <div class="layui-card-body " style='overflow:auto'>
                    <table class="layui-table layui-form" id="proExcel" style='white-space: nowrap'>
                        <thead>
                        <tr>
                            <th>生产日期</th>
                            <th>生产时间</th>
                            <th>机组号</th>
                            <th>盘号</th>
                            <th>车号</th>
                            <th>工程名称</th>
                            <th>产品名称</th>
                            <th>骨料10</th>
                            <th>骨料9</th>
                            <th>骨料8</th>
                            <th>骨料7</th>
                            <th>骨料6</th>
                            <th>骨料5</th>
                            <th>骨料4</th>
                            <th>骨料3</th>
                            <th>骨料2</th>
                            <th>骨料1</th>
                            <th>石粉4</th>
                            <th>石粉3</th>
                            <th>石粉2</th>
                            <th>石粉1</th>
                            <th>沥青</th>
                            <th>再生料</th>
                            <th>添加剂1</th>
                            <th>添加剂2</th>
                            <th>添加剂3</th>
                            <th>添加剂4</th>
                            <th>总计</th>
                            <th>一仓温度</th>
                            <th>混合料温度</th>
                            <th>沥青温度</th>
                            <th>骨料温度</th>
                            <th>除尘器温度</th>
                        </thead>
                        <tbody id="productData" >
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
