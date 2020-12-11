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
		<link rel="stylesheet" href="/static/css/qualitytest/qualitytestexperimental_detail.css" media="all">
	</head>
	<body>

		<div class="layui-fluid">
			<div class="layui-row layui-col-space15">
				<div class="layui-col-sm12 layui-col-md12 layui-col-lg12">
					<div class="layui-card" style="box-shadow:0 0px 0px 0 rgba(0,0,0,.05);">
						<div class="layui-card-body">

							<form class="layui-form" action="" lay-filter="experimental">
								<div class="layui-form-item layui-row">
									<div class="layui-col-xs6">
										<label class="layui-form-label w-auto">材料名称：</label>
										<div class="layui-input-inline">
											<input type="text" name="materials" lay-verify="title" autocomplete="off" disabled=true class="layui-input">
										</div>
									</div>
									<div class="layui-col-xs6">
										<label class="layui-form-label w-auto">材料规格：</label>
										<div class="layui-input-inline mr0">
											<input type="text" name="specification" lay-verify="title" autocomplete="off" disabled=true class="layui-input">
										</div>
									</div>
									<div class="layui-col-xs6">
										<label class="layui-form-label w-auto">材料厂家：</label>
										<div class="layui-input-inline mr0">
											<input type="text" name="manufacturers" lay-verify="title" autocomplete="off" disabled=true class="layui-input">
										</div>
									</div>
									<div class="layui-col-xs6">
										<label class="layui-form-label w-auto">取样时间：</label>
										<div class="layui-input-inline mr0">
											<input type="text" name="sampling_create_time" id="sampling_create_time" disabled=true lay-verify="date"
											 placeholder="" autocomplete="off" class="layui-input">

										</div>
									</div>
									<div class="layui-col-xs6">
										<label class="layui-form-label w-auto">试验编号：</label>
										<div class="layui-input-inline mr0">
											<input type="text" name="experimental_num" lay-verify="title" disabled=true autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-col-xs6">
										<label class="layui-form-label w-auto">试验名称：</label>
										<div class="layui-input-inline mr0">
											<input type="text" name="experimental_name" lay-verify="title" disabled=true autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-col-xs12" style="display: none;">
										<label class="layui-form-label w-auto">试验结果：</label>
										<div class="layui-input-inline mr0">
											<input type="text" name="result_show" lay-verify="title" disabled=true autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-col-xs12">
										<label class="layui-form-label w-auto" >试验值：</label>
										<div class="layui-input-inline mr0" style="width:770px;">
											<input class="layui-input" type="text" id="experimental_value" name="experimental_value" lay-verify="title"
											 disabled=true autocomplete="off">
										</div>
									</div>
								</div>
							</form>

							<hr style="height: 0px; border-width: 0.1px;border-style: solid;border-color: #c8cccf;">
							</hr>

							<div id="btn_expStep" class="layui-btn-group" style="margin-top: 5px;">
								<button type="button" class="layui-btn" name="1" id="btn-step">1</button> <button type="button" class="layui-btn"
								 name="2" id="btn-step">2</button>
								<button type="button" class="layui-btn" name="3" id="btn-step">3</button>
							</div>
							<div style=" margin-top:10px;background-color : #FFFFFF;" id="div_expStepValue">
								<div id="div_value_tip" class="layui-form-item">
									<label class="layui-form-label layui-form-label-tip" id="stepvalue_tip">1.开始试验</label>
								</div>

								<div class="layui-col-xs7 stepValue">
									<div id="div_value_device" class="layui-form-item  ">
										<label class="layui-form-label">试验设备:</label>
										<div class="layui-input-block">
											<input type="text" id="stepvalue_device" name="stepvalue_device" lay-verify="title" disabled=true
											 autocomplete="off" class="layui-input">
										</div>
									</div>
									<div id="div_value_select" class="layui-form-item">
										<label id="div_value_select_name" class="layui-form-label">选择项目:</label>
										<div class="layui-input-block">
											<input type="text" id="div_value_select_value" name="div_value_select_value" lay-verify="title" disabled=true
											 autocomplete="off" class="layui-input">
										</div>
									</div>
									<div id="div_value_input" class="layui-form-item">
										<label id="div_value_input_name" class="layui-form-label">输入项目:</label>
										<div class="layui-input-block">
											<input type="text" id="div_value_input_value" name="div_value_input_value" lay-verify="title" disabled=true
											 autocomplete="off" class="layui-input">
										</div>
									</div>
									<div id="div_record_time" class="layui-form-item">
										<label class="layui-form-label">记录人:</label>
										<div class="layui-input-block">
											<label class="layui-form-label layui-form-label-value" id="record_user">wanghao</label>
										</div>
									</div>
									<div id="div_record_user" class="layui-form-item">
										<label class="layui-form-label">记录时间:</label>
										<div class="layui-input-block">
											<label class="layui-form-label layui-form-label-value" id="record_time">2019-10-02 12:00:22</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>





		<script src="/static/js/jquery.js"></script>
		<script src="/static/layui/layui.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/common.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/qualitytestexperimental_detail.js" charset="utf-8"></script>


		<input id="path" value="${path}" type="hidden">
	</body>
</html>
