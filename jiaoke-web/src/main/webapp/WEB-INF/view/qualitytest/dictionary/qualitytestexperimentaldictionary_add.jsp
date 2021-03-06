<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<head>
		<meta charset="utf-8">
		<title>新增试验</title>
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
						<label class="layui-form-label" style="white-space: pre-line;">试验名称<span style="color: red;">*</span></label>
						<div class="layui-input-block">
							<input id="name" name="name" placeholder="请输入" type="text" class="layui-input" lay-verify="required" min="1" />
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">单位</label>
						<div class="layui-input-block">
							<input id="unit" name="unit" placeholder="请输入" type="text" class="layui-input"  />
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">试验方法</label>
						<div class="layui-input-block">
							<input id="method" name="method" placeholder="请输入" type="text" class="layui-input"  />
						</div>
					</div>
					<div class=" layui-form-item">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-block">
							<textarea id="remake" name="remake" placeholder="请输入备注" class="layui-textarea"></textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-filter="btnSubmit" lay-submit>&emsp;提交&emsp;</button>
							<button type="reset" class="layui-btn layui-btn-primary" id="cancel">&emsp;重置&emsp;</button>
						</div>
					</div>
				</div>
			</div>
			</div>
		</form>

		<script src="/static/js/jquery.js"></script>
		<script src="/static/layui/layui.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/dictionary/qualitytestexperimentaldictionary_add.js" charset="utf-8"></script>
		<input id="path" value="${path}" type="hidden">
	</body>
</html>
