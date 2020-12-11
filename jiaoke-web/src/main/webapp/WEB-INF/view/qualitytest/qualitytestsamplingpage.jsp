<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<head>
		<meta charset="utf-8">
		<title>取样管理</title>
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
									<div class="layui-form-item">
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
											<label class="layui-form-label w-auto">状态：</label>
											<div class="layui-input-inline mr0">
												<select name="status" id="status" lay-filter="status" lay-verify="required" required>
													<option value="">请选择</option>
													<option value="0">未完成</option>
													<option value="1">已完成</option>
												</select>
											</div>
										</div>
										<div class="layui-inline">
											<button id="btnSearch" class="layui-btn layui-btn-sm icon-btn">&nbsp;<i class="layui-icon">&#xe615;</i>&nbsp;
											</button>
										</div>
									</div>
								</div>
								<table class="layui-hide" id="mytable" lay-filter="mytable"></table>
							</div>
						</div>
					</div>
				</div>
			</div>

		</form>
		<script type="text/html" id="tableBar">
			<a class="layui-btn layui-btn-sm" lay-event="btn_delete">删除</a>
	{{# if(d.status ==0){ }}
	<a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="btn_confirm">生成取样单</a>
	   {{# } }}
    {{# if(d.status != 0){ }}
    <a class="layui-btn layui-btn-danger layui-btn-sm layui-btn-disabled" lay-event="btn_confirm">生成取样单</a>
       {{# } }}

</script>
		<script type="text/html" id="createTime">
			{{# if(d.createTime !=null){ }}
	<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>
	{{# } }}
</script>

		<script type="text/html" id="toolbarButton">
			<div class="customToolbar">
        <button id="btnAdd" lay-event="btnAdd" class="layui-btn layui-btn-sm icon-btn ">新增</button>
    </div>
</script>


		<script src="/static/js/jquery.js"></script>
		<script src="/static/layui/layui.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/dictionary.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/qualitytestsamplingpage.js" charset="utf-8"></script>


		<input id="path" value="${path}" type="hidden">
	</body>
</html>