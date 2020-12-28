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
							<select name="materialsId" id="materials" lay-filter="materials" lay-verify="required" required>
								<option value="">请选择</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">规格</label>
						<div class="layui-input-block">
							<select name="specificationId" id="specification" lay-filter="specification"  required>
								<option value="">请选择</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">等级</label>
						<div class="layui-input-block">
							<input id="specificationLevel" name="specificationLevel" placeholder="" class="layui-input" />
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">试验名称<span style="color: red;">*</span></label>
						<div class="layui-input-block">
							<select name="experimentalId" id="experimental" lay-filter="manufacturers" lay-verify="required" required>
								<option value="">请选择</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">试验项<span style="color: red;">*</span></label>
						<div class="layui-input-block">
							<input id="experimentalItem" name="experimentalItem" placeholder="" class="layui-input" lay-verify="required" />
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">技术要求<span style="color: red;">*</span></label>
						<div class="layui-input-block">
							<input id="requirements" name="requirements" placeholder="" class="layui-input" lay-verify="required" />
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">比较方法<span style="color: red;">*</span></label>
						<div class="layui-input-block">
							<select name="comparemethod" id="comparemethod" lay-filter="comparemethod" lay-verify="required" required>
								<option value="">请选择</option>
								<option value=" ">-</option>
								<option value=">">大于</option>
								<option value="<">大于</option>
								<option value=">=">大于等于</option>
								<option value="<=">小于等于</option>
								<option value="=">等于</option>
								<option value="-">范围值</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label" id="minvalue_title">比较值<span style="color: red;">*</span></label>
						<div class="layui-input-block">
							<div id="conferDept" class="xm-select-demo"></div>
							<input id="minValue" name="minValue" placeholder="" type="number" class="layui-input" lay-verify="required"
							  />
						</div>
					</div>
					<div class="layui-form-item" id="maxvalue_item">
						<label class="layui-form-label" >最大值</label>
						<div class="layui-input-block">
							<div id="conferDept" class="xm-select-demo"></div>
							<input id="maxValue" name="maxValue" placeholder="0" type="number" class="layui-input" lay-verify="required"
							  />
						</div>
					</div>

					<div class="layui-form-item" id="div_button">
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
		<script src="/static/js/qualitytest/qualitytestexperimentalstandardvalue_detail.js" charset="utf-8"></script>
		<input id="path" value="${path}" type="hidden">
	</body>
</html>
