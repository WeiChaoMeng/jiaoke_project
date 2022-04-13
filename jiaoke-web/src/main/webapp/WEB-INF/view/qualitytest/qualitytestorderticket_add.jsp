<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<head>
		<meta charset="utf-8">
		<title>添加试验</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="/static/css/qualitytest/common.css" media="all">
	</head>
	<body>
		<form class="layui-form" action="">
			<div id="div_main" class="layui-card-body  text-center  style=" padding: 10px 10px;height: 400px;">
				<div id="experimental">
					<fieldset class="layui-elem-field" style="margin-top: 20px;">
						<legend>已做过的试验项目</legend>
						<div id="experimental_info" style="margin-left: 30px; font-size: 18px;" class="layui-form-mid layui-text">试验A、试验B</div>
					</fieldset>
				</div>
				<fieldset class="layui-elem-field" style="margin-top: 10px; padding: 0px 25px;">
					<legend>选择试验项目</legend>
					<div id='add_experimental' style="height:300px; text-align: center;">
						<div class="layui-form-item layui-row">
							<div class="layui-col-xs6">
								<input type="checkbox" name="like[1]" title="试验1">
							</div>
							<div class="layui-col-xs6">
								<input type="checkbox" name="like[1]" title="试验2">
							</div>
						</div>
						<div class="layui-form-item layui-row">
							<div class="layui-col-xs6">
								<input type="checkbox" name="like[1]" title="试验">
							</div>
							<div class="layui-col-xs6">
								<input type="checkbox" name="like[1]" title="试验">
							</div>
						</div>
					</div>
				</fieldset>
				<div class="form-group-bottom layui-footer text-center"style="margin-top: 20px;">
					<button class="layui-btn" id ="btn_submit" lay-filter="btnSubmit" lay-submit>&emsp;提交&emsp;</button>
					<button type="reset" class="layui-btn layui-btn-primary" id="cancel">&emsp;重置&emsp;</button>
				</div>
			</div>
		</form>

		<input id="path" value="${path}" type="hidden">
		<script src="/static/js/jquery.js"></script>
		<script src="/static/layui/layui.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/common.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/qualitytestorderticket_add.js" charset="utf-8"></script>

	</body>
</html>
