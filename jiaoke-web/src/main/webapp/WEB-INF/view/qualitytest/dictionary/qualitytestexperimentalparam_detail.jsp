<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<head>
		<meta charset="utf-8">
		<title>试验过程管理</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="/static/css/qualitytest/common.css" media="all">
		<link rel="stylesheet" href="/static/css/qualitytest/dictionary/qualitytestexperimentalparam_add.css" media="all">
	</head>
	<body>
		<form class="layui-form" id="myform" lay-filter="myform" style="padding:15px 15px;">
			<div class=" layui-form-item">
				<div class="layui-col-xs4">
					<label class="layui-form-label w-auto">材料名称：<span style="color: red;">*</span></label>
					<div class="layui-input-inline">
						<select name="materialId" id="materialId" lay-filter="materials" lay-verify="required" required>
							<option value="">请选择</option>
						</select>
					</div>
				</div>
				<div class="layui-col-xs4">
					<label class="layui-form-label w-auto">试验名称：<span style="color: red;">*</span></label>
					<div class="layui-input-inline mr0">
						<select name="experimental" id="experimental" lay-filter="experimental" lay-verify="required" required>
							<option value="">请选择</option>
						</select>
					</div>
				</div>
				<div class="layui-col-xs4">
					<label class="layui-form-label w-auto">计算公式：</label>
					<div class="layui-input-inline mr0">
						<input id="formula" name="formula" placeholder="请输入" type="text" class="layui-input" />

					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="div_context">
					<div class="div_context_left">
						<div id="mytree" class="demo-tree demo-tree-box" style="width: 100%; height: 100%; overflow-y: scroll;"></div>
					</div>
					<div id="div_context_right" class="div_context_right" style="overflow-y:auto;">
						<div class="layui-tab">
							<ul class="layui-tab-title">
								<li class="layui-this">配置基本信息</li>
								<li>配置选择项</li>
								<li>配置输入项</li>
							</ul>
							<div class="layui-tab-content">
								<div class="layui-tab-item layui-show">
									<div class="layui-inline layui-col-xs6">
										<label class="layui-form-label" style="white-space: pre-line;">ID<span style="color: red;">*</span></label>
										<div class="layui-input-block">
											<input id="id" name="id" placeholder="请输入" type="text" class="layui-input" lay-verify="required" />
										</div>
									</div>
									<div class="layui-inline layui-col-xs6">
										<label class="layui-form-label" style="white-space: pre-line;">名称<span style="color: red;">*</span></label>
										<div class="layui-input-block">
											<input id="caption" name="caption" placeholder="请输入" type="text" class="layui-input" lay-verify="required" />
										</div>
									</div>
									<div class="layui-form-item layui-form-text">
										<label class="layui-form-label" style="white-space: pre-line;">提示<span style="color: red;">*</span></label>
										<div class="layui-input-block">
											<textarea id="tip" name="tip" placeholder="请输入内容" class="layui-textarea" lay-verify="required"></textarea>
										</div>
									</div>
									<div class="layui-inline layui-col-xs6">
										<label class="layui-form-label" style="white-space: pre-line;">试验设备</label>
										<div class="layui-input-block">
											<input id="device" name="device" placeholder="请输入" type="text" class="layui-input" />
										</div>
									</div>
									<div class="layui-inline layui-col-xs6">
										<label class="layui-form-label" style="white-space: pre-line;">可选试验设备</label>
										<div class="layui-input-block">
											<input id="choosedevice" name="choosedevice" placeholder="请输入" type="text" class="layui-input" />
										</div>
									</div>
									<div class="layui-inline layui-col-xs6" style="margin-top: 50px;">
										<label class="layui-form-label" style="white-space: pre-line;">下一步时间(分)<span style="color: red;">*</span></label>
										<div class="layui-input-block">
											<input type="radio" name="nextimes" lay-filter="nextimes" value="0" title="立即" checked="">
											<input type="radio" name="nextimes" lay-filter="nextimes" value="1" title="固定值">
											<input id="nextimes_value" name="nextimes_value" type="number" min="1" style="margin-top: 5px;" placeholder="请输入"
											 type="text" class="layui-input" />
										</div>
									</div>
								</div>
								<div class="layui-tab-item">
									<div class="layui-inline layui-col-xs6" style="margin-top: 10px;">
										<label class="layui-form-label" style="white-space: pre-line;">设置选择项</label>
										<div class="layui-input-block">
											<input type="radio" name="setselectitem" lay-filter="setselectitem" value="0" title="&nbsp;&nbsp;无&nbsp;&nbsp;"
											 checked="true">
											<input type="radio" name="setselectitem" lay-filter="setselectitem" value="1" title="自定义">
										</div>
									</div>
									<div id="div_selectitem">
										<div class="layui-inline layui-col-xs6">
											<label class="layui-form-label" style="white-space: pre-line;">选择项名称</label>
											<div class="layui-input-block">
												<input id="selectitem_caption" name="selectitem_caption" placeholder="请输入" type="text" class="layui-input" />
											</div>
										</div>
										<div class="layui-inline layui-col-xs8">
											<label class="layui-form-label" style="white-space: pre-line;">选择项值类型</label>
											<div class="layui-input-block">
												<input type="radio" name="selectitem_type" lay-filter="selectitem_type" value="3" title="文本" checked="true">
												<input type="radio" name="selectitem_type" lay-filter="selectitem_type" value="4" title="数字">
												<input type="radio" name="selectitem_type" lay-filter="selectitem_type" value="2" title="单选">
												<input type="radio" name="selectitem_type" lay-filter="selectitem_type" value="1" title="多选">
												<input id="selectitem_value" name="selectitem_value" style="margin-top: 5px;" placeholder="请输入" type="text"
												 class="layui-input" />
											</div>
										</div>
									</div>
								</div>
								<div class="layui-tab-item">
									<div class="layui-inline layui-col-xs6" style="margin-top: 10px;">
										<label class="layui-form-label" style="white-space: pre-line;">设置输入值</label>
										<div class="layui-input-block">
											<input type="radio" name="setvalueitem" lay-filter="setvalueitem" value="0" title="&nbsp;&nbsp;无&nbsp;&nbsp;"
											 checked="true">
											<input type="radio" name="setvalueitem" lay-filter="setvalueitem" value="1" title="自定义">
										</div>
									</div>
									<div id="div_valueitem">
										<div class="layui-inline layui-col-xs6">
											<label class="layui-form-label" style="white-space: pre-line;">输入值名称</label>
											<div class="layui-input-block">
												<input id="valueitem_caption" name="valueitem_caption" placeholder="请输入" type="text" class="layui-input" />
											</div>
										</div>
										<div class="layui-inline layui-col-xs8">
											<label class="layui-form-label" style="white-space: pre-line;">输入值类型</label>
											<div class="layui-input-block">
												<input type="radio" name="valueitem_type" lay-filter="valueitem_type" value="3" title="文本">
												<input type="radio" name="valueitem_type" lay-filter="valueitem_type" value="4" title="数字" checked="true">
												<input type="radio" name="valueitem_type" lay-filter="valueitem_type" value="2" title="单选">
												<input type="radio" name="valueitem_type" lay-filter="valueitem_type" value="1" title="多选">
												<input id="valueitem_value" name="valueitem_value" style="margin-top: 5px;" placeholder="请输入" type="text"
												 class="layui-input" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>

			<div class=" layui-form-item">
				<div id="div_button" class="div_button" style="margin-top: 0px;">
					<button id="btn_addStep" type="button" class="layui-btn">新增步骤</button>
					<button id="btn_insertStep" type="button" class="layui-btn">插入步骤</button>
					
					<button id="btn_Commit" type="submit" class="layui-btn" lay-submit="" lay-filter="btnSubmit" lay-submit style="margin-left: 150px;">&nbsp;&nbsp;全部提交&nbsp;&nbsp;</button>
					<button id="btn_Save" type="button" class="layui-btn" style="margin-left: 400px;">&nbsp;&nbsp;单项保存&nbsp;&nbsp;</button>
				</div>
			</div>
		</form>

		<script src="/static/js/jquery.js"></script>
		<script src="/static/layui/layui.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/common.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/dictionary/qualitytestexperimentalparam_detail.js" charset="utf-8"></script>
		
		<input id="path" value="${path}" type="hidden">
	</body>
</html>
