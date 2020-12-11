<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<head>
		<meta charset="utf-8">
		<title>新建取样单</title>
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
							<select name="materialsNum" id="materials" lay-filter="materials" lay-verify="required" required>
								<option value="">请选择</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">规格<span style="color: red;">*</span></label>
						<div class="layui-input-block">
							<select name="specificationNum" id="specification" lay-filter="specification" lay-verify="required" required>
								<option value="">请选择</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">所属厂家<span style="color: red;">*</span></label>
						<div class="layui-input-block">
							<select name="manufacturersNum" id="manufacturers" lay-filter="manufacturers" lay-verify="required" required>
								<option value="">请选择</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label" style="white-space: pre-line;">下达任务时间<span style="color: red;">*</span></label>
						<div class="layui-input-block">
							<div id="conferDept" class="xm-select-demo"></div>
							<input type="text" name="taskTime" id="taskTime" lay-verify="required" placeholder="请选择" lay-verify="required"
							 autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">代表吨数<span style="color: red;">*</span></label>
						<div class="layui-input-block">
							<div id="conferDept" class="xm-select-demo"></div>
							<input id="tunnage" name="tunnage" placeholder="请输入" type="number" class="layui-input" lay-verify="required" min="1" />
						</div>
					</div>
					<div class=" layui-form-item">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-block">
							<textarea id="remark" name="remark" placeholder="请输入备注" class="layui-textarea"></textarea>
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
		<script src="/static/js/qualitytest/common/common.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/qualitytestsamplingpage_add.js" charset="utf-8"></script>
		<input id="path" value="${path}" type="hidden">
	</body>
</html>
