<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<head>
		<meta charset="utf-8">
		<title>试验管理</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="/static/css/qualitytest/common.css" media="all">
	</head>
	<body>
		<div style="margin: 0 auto;"><label class="layui-form-label" style="width:90%;text-align: center;font-size: 26px;margin-bottom: 10px;">正态分布图</label></div>
		<div id="echart1" class="layui-col-sm6" style="height: 400px;  margin: 0 auto;"></div>

		<script src="/static/js/jquery.js"></script>
		<script src="/static/layui/layui.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/dictionary.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/common.js" charset="utf-8"></script>
		<script src="/static/js/echarts/echarts4.9.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/reports/qualitytestexperimental_avg_ztfbt.js" charset="utf-8"></script>


		<input id="path" value="${path}" type="hidden">
	</body>
</html>
