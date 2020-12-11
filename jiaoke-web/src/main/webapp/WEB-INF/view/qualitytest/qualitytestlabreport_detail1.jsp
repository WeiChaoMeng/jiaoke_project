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
		<link rel="stylesheet" href="/static/css/qualitytest/qualitytestlabreport_detail1.css" media="all">
	</head>
	<body>
		<div class="layui-fluid">
			<div class="layui-row layui-col-space15">
				<div class="layui-col-sm12 layui-col-md12 layui-col-lg12">
					<div class="layui-card" style="box-shadow:0 0px 0px 0 rgba(0,0,0,.05);">
						<div class="layui-card-body">
							<div class="layui-form-item">
								<span class="layui-form-label" style="font-size: 25px;width: 100%;text-align: center; color:#888;">北京市路桥建材集团有限公司路驰分公司</span>
								<span class="layui-form-label" style="font-size: 23px;width: 100%;text-align: center;color:#888;text-decoration:underline;">&nbsp;试&nbsp;&nbsp;验&nbsp;&nbsp;报&nbsp;&nbsp;告&nbsp;</span>
							</div>
							<form class="layui-form" action="" lay-filter="myform">
								<input type="text" style="width: 90%; border: 0px solid #c8cccf; margin-right: 20px; text-align: right;color: #000000;"
								 name="orderTicketNum" lay-verify="title" autocomplete="off" class="layui-input" value="">
								<div style="border: 2px solid #c8cccf;">
									<div class="layui-form-item layui-row" style="margin-top: 20px;">
										<div class="layui-col-xs12">
											<label class="layui-form-label input-title">样名名称：</label>
											<div class="layui-input-inline" style="width: 83%;">
												<input type="text" name="materials" lay-verify="title" autocomplete="off" disabled=true class="layui-input">
											</div>
										</div>
										<div class="layui-col-xs12">
											<label class="layui-form-label input-title">委托单位：</label>
											<div class="layui-input-inline" style="width: 83%;">
												<input type="text" name="" lay-verify="title" autocomplete="off" disabled=true class="layui-input" value="北京市政路桥建材集团有限公司路驰分公司">
											</div>
										</div>
										<div class="layui-col-xs12">
											<label class="layui-form-label input-title">样品产地：</label>
											<div class="layui-input-inline" style="width: 83%;">
												<input type="text" name="manufacturers" lay-verify="title" autocomplete="off" disabled=true class="layui-input">
											</div>
										</div>
										<div class="layui-col-xs6">
											<label class="layui-form-label input-title">取样日期：</label>
											<div class="layui-input-inline" style="width: 65%;">
												<input type="text" name="sampling_create_time" id="sampling_create_time" disabled=true lay-verify="date"
												 placeholder="" autocomplete="off" class="layui-input">
											</div>
										</div>
										<div class="layui-col-xs6">
											<label class="layui-form-label input-title">试验日期：</label>
											<div class="layui-input-inline" style="width: 65%;">
												<input type="text" name="testDate" id="testDate" disabled=true lay-verify="date" placeholder=""
												 autocomplete="off" class="layui-input">
											</div>
										</div>
										<div class="layui-col-xs12">
											<label class="layui-form-label input-title" style="width: 108px;">要求试验项目：</label>
											<div class="layui-input-inline" style="width: 80%;">
												<input type="text" name="requiredExperimental" lay-verify="title" disabled=true autocomplete="off" class="layui-input">
											</div>
										</div>
										<div class="layui-col-xs12">
											<label class="layui-form-label input-title">试验规程：</label>
											<div class="layui-input-inline " style="width: 83%;">
												<input type="text" name="Experimental_GC" id="Experimental_GC" lay-verify="title" disabled=true
												 autocomplete="off" class="layui-input">
											</div>
										</div>
									</div>
									<hr style="height: 0px; border-width: 0.1px;border-style: solid;border-color: #c8cccf;">
									</hr>
									<div class="layui-form-item layui-row">
										<label class="layui-form-label" style="font-size: 16px;width: 100%;text-align: center; font-weight: bold;">试&nbsp;&nbsp;验&nbsp;&nbsp;结&nbsp;&nbsp;果</label>
									</div>
									<div style="padding: 0px 10px;">
										<table class="layui-hide" id="mytable" lay-filter="mytable"></table>
										<div id="div_sf">
											<table class="layui-hide" id="mytable_sf" lay-filter="mytable"></table>
										</div>
									</div>
									<hr style="height: 0px; border-width: 0.1px;border-style: solid;border-color: #c8cccf;">
									</hr>
									<div class="layui-col-xs12">
										<label class="layui-form-label" style="font-size: 16px;font-weight: bold; width: 50px;">结论：</label>
									</div>
									<input type="text" style="margin-left: 36px; width: 90%; border: 0px solid #c8cccf;  color: #888;" name="verdict"
									 lay-verify="title" disabled=true autocomplete="off" class="layui-input" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;依据《公路沥青路面施工技术规范>(JTGF40-2004),其所检项目试验结果符合规范的技术要求.">
								</div>
								<div class="layui-form-item layui-row" style="margin-top: 20px;">
									<div class="layui-inline" style="margin-left: 60px;">
										<label class="layui-form-label input-title">负责人：</label>
										<div class="layui-input-inline" style="width: 150px;">
											<input type="text" name="chargePerson" lay-verify="title" autocomplete="off" disabled=true class="layui-input">
										</div>
									</div>
									<div class="layui-inline">
										<label class="layui-form-label input-title">审核：</label>
										<div class="layui-input-inline" style="width: 150px;">
											<input type="text" name="checkPerson" id="checkPerson" lay-verify="title" autocomplete="off" disabled=true
											 class="layui-input">
										</div>
									</div>
									<div class="layui-inline">
										<label class="layui-form-label input-title">报告人：</label>
										<div class="layui-input-inline" style="width: 150px;">
											<input type="text" name="reportPerson" lay-verify="title" autocomplete="off" disabled=true class="layui-input">
										</div>
									</div>
								</div>
								<div class="layui-form-item layui-row" style="margin-left: 567px;">
									<div class="layui-inline" style="margin-left: 60px;">
										<label class="layui-form-label input-title">报告日期：</label>
										<div class="layui-input-inline" style="width: 150px;">
											<input type="text" name="reportDate" id="reportDate" lay-verify="date" autocomplete="off" disabled=true
											 class="layui-input">
										</div>
									</div>
								</div>
								<div class="layui-form-item" id="div_commit" style="display: none;">
									<div style="margin: 0 auto; display: block;width: 100px;">
										<button class="layui-btn" id="btn_commit" type="button" style="width:100px">提 交</button>
									</div>
								</div>
								<shiro:hasAnyPermission name="experimentPrincipal,experimentReviewer">
									<div class="layui-form-item" id="div_check">
										<div style="margin: 0 auto; display: block;width: 450px;">
											<input type="checkbox" id="send_cl" title="发送材料部">
											<input type="checkbox" id="send_sc" title="发送生产设备部">
											<button id="btn_check" type="button" style="margin-left: 50px; width: 100px;" class="layui-btn" style="width:100px">确
												认</button>
										</div>
									</div>
								</shiro:hasAnyPermission>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script src="/static/js/jquery.js"></script>
		<script src="/static/layui/layui.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/common.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/qualitytestlabreport_detail1.js" charset="utf-8"></script>
		<input id="path" value="${path}" type="hidden">
	</body>
</html>
