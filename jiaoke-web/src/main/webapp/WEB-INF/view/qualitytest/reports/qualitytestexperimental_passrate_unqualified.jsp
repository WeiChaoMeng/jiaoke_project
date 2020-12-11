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


		<form>
			<div class="layui-fluid">
				<div class="layui-row layui-col-space15">
					<div class="layui-col-sm12 layui-col-md12 layui-col-lg12">
						<div class="layui-card">
							<div class="layui-card-body">
								<div id="echart1" class="layui-col-sm12" style="height: 300px; "></div>
								<div class="layui-col-sm12">
									<table class="layui-hide" id="mytable" lay-filter="mytable"></table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</form>
		<script type="text/html" id="toolbarButton">
			<div class="customToolbar">
		        <button id="btnPrint" lay-event="btnPrint" class="layui-btn layui-btn-sm icon-btn ">打印</button>
				<button id="btnExcel" lay-event="btnExcel" class="layui-btn layui-btn-sm icon-btn ">导出</button>
		    </div>
		</script>



		<script src="/static/js/jquery.js"></script>
		<script src="/static/layui/layui.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/dictionary.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/ax.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/common.js" charset="utf-8"></script>
		<script src="/static/js/echarts/echarts4.9.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/reports/qualitytestexperimental_passrate_unqualified.js" charset="utf-8"></script>


		<input id="path" value="${path}" type="hidden">
	</body>
</html>
