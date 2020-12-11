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
								<div class="layui-form toolbar">
									<div class="layui-form-item" style="margin-bottom: 0px;">
										<div class="layui-inline">
											<label class="layui-form-label w-auto">材料：</label>
											<div class="layui-input-inline mr0">
												<select name="materials" id="materials" lay-filter="materials" lay-verify="required" required>
													<option value="">请选择</option>
												</select>
											</div>
										</div>
										<div class="layui-inline">
											<label class="layui-form-label w-auto">规格：</label>
											<div class="layui-input-inline mr0">
												<select name="specification" id="specification" lay-filter="specification" lay-verify="required" required>
													<option value="">请选择</option>
												</select>

											</div>
										</div>
										<div class="layui-inline">
											<label class="layui-form-label w-auto">所属厂家：</label>
											<div class="layui-input-inline mr0">
												<select name="manufacturers" id="manufacturers" lay-filter="manufacturers" lay-verify="required" required>
													<option value="">请选择</option>
												</select>
											</div>
										</div>
										<!-- <div class="layui-inline">
											<label class="layui-form-label w-auto">试验项目：</label>
											<div class="layui-input-inline mr0">
												<select name="experimental" id="experimental" lay-filter="experimental" lay-verify="required" required>
													<option value="">请选择</option>
												</select>
											</div>
										</div> -->
									</div>
									<div class="layui-form-item" style="margin-bottom: 0px;">
										<div class="layui-inline">
											<label class="layui-form-label w-auto">开始日期：</label>
											<div class="layui-input-inline mr0">
												<input type="text" name="begindate" id="begindate" lay-verify="date" placeholder="" autocomplete="off"
												 class="layui-input">
											</div>
										</div>
										<div class="layui-inline">
											<label class="layui-form-label w-auto">结束日期：</label>
											<div class="layui-input-inline mr0">
												<input type="text" name="enddate" id="enddate" lay-verify="date" placeholder="" autocomplete="off" class="layui-input">
											</div>
										</div>
										<div class="layui-inline">
											<button id="btnSearch" class="layui-btn layui-btn-sm icon-btn">&nbsp;<i class="layui-icon">&#xe615;</i>&nbsp;
											</button>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="echart">
						<div id="echart1" class="layui-col-sm6" style="height: 300px; "></div>
						<div id="echart2" class="layui-col-sm6" style="height: 300px;"></div>
						<div id="echart3" class="layui-col-sm6" style="height: 300px;"></div>
						<div id="echart4" class="layui-col-sm6" style="height: 300px;"></div>
						<div id="echart5" class="layui-col-sm6" style="height: 300px;"></div>
						<div id="echart6" class="layui-col-sm6" style="height: 300px;"></div>
						<div id="echart7" class="layui-col-sm6" style="height: 300px;"></div>
						<div id="echart8" class="layui-col-sm6" style="height: 300px;"></div>
						<div id="echart9" class="layui-col-sm6" style="height: 300px;"></div>
						<div id="echart10" class="layui-col-sm6" style="height: 300px;"></div>
					</div>
				</div>
			</div>
			</div>

		</form>






		<script src="/static/js/jquery.js"></script>
		<script src="/static/layui/layui.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/dictionary.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/common.js" charset="utf-8"></script>
		<script src="/static/js/echarts/echarts4.9.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/reports/qualitytestexperimental_passrate.js" charset="utf-8"></script>


		<input id="path" value="${path}" type="hidden">
	</body>
</html>
