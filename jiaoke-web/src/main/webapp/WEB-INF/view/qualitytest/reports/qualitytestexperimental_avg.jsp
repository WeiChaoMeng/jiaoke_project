<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<head>
		<meta charset="utf-8">
		<title>试验平均值分析</title>
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
											<button id="btnSearch" type="button" class="layui-btn layui-btn-sm icon-btn">&nbsp;<i class="layui-icon">&#xe615;</i>&nbsp;
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id='div_avg_value' class=" layui-row layui-col-space15">
						<!-- <div class="layui-col-sm3" style=" border:1px solid #e6e6e6; border-radius:5px;box-shadow: 1px 1px 5px #e6e6e6;">
					
							<div class="layui-form-item" style="margin:0 auto;"><label class="layui-form-label" style="width: 100%;text-align: center;font-size: 18px;">粗集料台账</label></div>
							<div class="layui-form-item" style=" width:80%;margin:0 auto;">
								<label class="layui-form-label" style="text-align: left; margin-left: 1px;font-size: 14px;">试验项目</label>
								<label class="layui-form-label" style="text-align: left; margin-left: 70px;font-size: 14px;">平均值</label>
							</div>
					
							<div class="layui-form-item" style=" width:80%;margin:0 auto;margin-bottom: 10px; text-align:center; border:1px solid #e6e6e6; border-radius:5px;">
								<label class="layui-form-label" style="width:0px;margin-top: 6px;"><span class="layui-badge-dot layui-bg-green"
									 style="width:10px;height:10px"></span></label>
								<label class="layui-form-label" style="text-align: left; margin-left: 1px;font-size: 16px;">31.5</label>
								<label class="layui-form-label" style="text-align: left; margin-left: 50px;font-size: 16px;">31.5</label>
							</div>
							<div class="layui-form-item" style=" width:80%;margin:0 auto; margin-bottom: 10px; text-align:center; border:1px solid #e6e6e6; border-radius:5px;">
								<label class="layui-form-label" style="width:0px;margin-top: 6px;"><span class="layui-badge-dot layui-bg-green"
									 style="width:10px;height:10px"></span></label>
								<label class="layui-form-label" style="text-align: left; margin-left: 1px;font-size: 16px;">31.5</label>
								<label class="layui-form-label" style="text-align: left; margin-left: 50px;font-size: 16px;">31.5</label>
							</div>
						</div> -->
					</div>
				</div>
			</div>
			</div>
		</form>
		<script src="/static/js/jquery.js"></script>
		<script src="/static/layui/layui.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/dictionary.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/common.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/reports/qualitytestexperimental_avg.js" charset="utf-8"></script>
		<input id="path" value="${path}" type="hidden">
	</body>
</html>
