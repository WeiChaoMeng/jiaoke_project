<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<head>
		<meta charset="utf-8">
		<title>试验报告</title>
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
										<div class="layui-inline">
											<label class="layui-form-label w-auto">状态：</label>
											<div class="layui-input-inline mr0">
												<select name="experimentStatus" id="experimentStatus" lay-filter="status" lay-verify="required" required>
													<option value="">请选择</option>
													<option value="1">待审核</option>
													<option value="3">已完成</option>
												</select>
											</div>
										</div>
									</div>
									<div class="layui-form-item" style="margin-bottom: 0px;">
										<div class="layui-inline">
											<label class="layui-form-label w-auto">试验结果：</label>
											<div class="layui-input-inline mr0">
												<select name="experimentResult" id="experimentResult" lay-filter="status" lay-verify="required" required>
													<option value="">请选择</option>
													<option value="1">合格</option>
													<option value="-1">不合格</option>
												</select>
											</div>
										</div>
										<div class="layui-inline">
											<button id="btnSearch" type="button" class="layui-btn layui-btn-sm icon-btn">&nbsp;<i class="layui-icon">&#xe615;</i>&nbsp;
											</button>
										</div>
									</div>
								</div>
							</div>
							<table class="layui-hide" id="mytable" lay-filter="mytable"></table>

						</div>
					</div>
				</div>
			</div>
			</div>

		</form>
		<script type="text/html" id="tableBar">
			<a class="layui-btn layui-btn-danger layui-btn-sm layui-btn-disabled1" lay-event="btn_view">试验报告</a> 
</script>

		<script type="text/html" id="experiment_result">
			{{# if(d.experimentResult ==-1){ }}
	<div>不合格</div>
	{{# } }}
	{{# if(d.experimentResult ==1){ }}
	<div>合格</div>
	{{# } }}
</script>
		<script type="text/html" id="experiment_status">
			{{# if(d.experimentStatus ==1){ }}
	<div>待审核</div>
	{{# } }}
	{{# if(d.experimentStatus ==3){ }}
	<div>已完成</div>
	{{# } }}
</script>


		<script src="/static/js/jquery.js"></script>
		<script src="/static/layui/layui.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/dictionary.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/ax.js" charset="utf-8"></script>

		<script src="/static/js/qualitytest/qualitytestlabreport.js" charset="utf-8"></script>


		<input id="path" value="${path}" type="hidden">
	</body>
</html>
