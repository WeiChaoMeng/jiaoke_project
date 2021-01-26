<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<head>
		<meta charset="utf-8">
		<title>试验台账</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="/static/css/qualitytest/common.css" media="all">
		<link rel="stylesheet" href="/static/css/qualitytest/reports/qualitytestexperimental_reports.css" media="all">
	</head>
	<body>


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
										<label class="layui-form-label w-auto">试验项目：</label>
										<div class="layui-input-inline mr0">
											<select name="experimental" id="experimental" lay-filter="experimental" lay-verify="required" required>
												<option value="">请选择</option>
											</select>
										</div>
									</div>
								</div>
								<div class="layui-form-item" style="margin-bottom: 0px;">
									<div class="layui-inline">
										<label class="layui-form-label w-auto">开始日期：</label>
										<div class="layui-input-inline mr0">
											<input type="text" name="begindate" id="begindate" lay-verify="date" placeholder="" autocomplete="off" class="layui-input">
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
						<div id="div_talbe">
							<table class="layui-hide" id="mytable" lay-filter="mytable"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<script type="text/html" id="tableBar">
			<a class="layui-btn layui-btn-sm" lay-event="btn_report">试验报告</a>


</script>


		<script type="text/html" id="toolbarButton">
			<div class="customToolbar">
        <button id="btnPrint" lay-event="btnPrint" class="layui-btn layui-btn-sm icon-btn ">打印</button>
		<button id="btnExcel" lay-event="btnExcel" class="layui-btn layui-btn-sm icon-btn ">导出</button>
    </div>
</script>
		<!--	{{# if(d.requiredStatus ==0){ }}
	<div>未完成</div>
	{{# } }}
	{{# if(d.requiredStatus ==1){ }}
	<div>待审批</div>
	{{# } }}
	{{# if(d.requiredStatus ==3){ }}
	<div>已完成</div>
	{{# } }} -->
		<script type="text/html" id="experiment_status">


			{{# if(d.requiredStatus ==1){ }}
	    <div>待审批</div>
	  {{# if(d.requiredStatus ==3){} }}
		<div>已完成</div>
	  {{#  } else { }}
	   <div>未完成</div>
	  {{#  } }}  
	
</script>


		<script src="/static/js/jquery.js"></script>
		<script src="/static/layui/layui.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/dictionary.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/common.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/reports/qualitytestexperimental_reports.js" charset="utf-8"></script>


		<input id="path" value="${path}" type="hidden">
	</body>
</html>
