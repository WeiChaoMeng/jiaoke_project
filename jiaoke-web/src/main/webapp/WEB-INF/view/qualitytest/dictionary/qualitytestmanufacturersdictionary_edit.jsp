<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<head>
		<meta charset="utf-8">
		<title>编辑材料厂家</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="/static/css/qualitytest/common.css" media="all">
	</head>
	<body>
		<form class="layui-form" id="myform" lay-filter="myform" style="padding:15px 15px;">
			<div class="layui-fluid" style="padding:10px 10px;">
				<div class="layui-card-body  innovation-form-width-ban">
					<div class="layui-form-item">
						<label class="layui-form-label">材料<span style="color: red;">*</span></label>
						<div class="layui-input-block">
							<select name="materialId" id="materialId" lay-filter="materialId" lay-verify="required" required>
								<option value="">请选择</option>
							</select>
						</div>
					</div>
					
					<div class="layui-form-item">
						<label class="layui-form-label" style="white-space: pre-line;">厂家名称<span style="color: red;">*</span></label>
						<div class="layui-input-block">
							<input id="name" name="name" placeholder="请输入" type="text" class="layui-input" lay-verify="required"/>
						</div>
					</div>
					
					<div id="div_button" class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-filter="btnSubmit" lay-submit>&emsp;提交&emsp;</button>
							<button id="btn_reset" type="reset" class="layui-btn layui-btn-primary" id="cancel">&emsp;重置&emsp;</button>
						</div>
					</div>
				</div>
			</div>
			</div>
		</form>

		<script src="/static/js/jquery.js"></script>
		<script src="/static/layui/layui.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/common.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/dictionary/qualitytestmanufacturersdictionary_edit.js" charset="utf-8"></script>
		<input id="path" value="${path}" type="hidden">
	</body>
</html>
