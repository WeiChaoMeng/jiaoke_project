<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta charset="utf-8">
		<title>沥青混合料马氏密度试验</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="/static/css/qualitytest/common.css" media="all">
		<link rel="stylesheet" href="/static/css/qualitytest/experimental/qualitytestexperimental_cjl_sf_detail.css" media="all">
		<link rel="stylesheet" href="/static/css/qualitytest/qualitytestexperimental_detail.css" media="all">
	</head>

	<body>

		<div class="layui-tab">
			<ul class="layui-tab-title">
				<li class="layui-this">基础数据</li>
				<li>试验记录</li>
			</ul>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">
					<jsp:include page="../qualitytestexperimental_detail.jsp" flush="true">
						<jsp:param name="id" value="${path}" />
					</jsp:include>
				</div>

				<div class="layui-tab-item">
					<div class="layui-fluid" style="padding: 0px 0px;">
						<div class="layui-row">
							<div class="layui-col-sm12 layui-col-md12 layui-col-lg12">
								<div class="layui-card" style="box-shadow:0 0px 0px 0 rgba(0,0,0,.05);">
									<div class="layui-card-body" style="padding: 0px 0px">
										<div class="layui-form" style="margin: 0 auto;">

											<table class="layui-table" id="mytable" lay-filter="mytable"></table>

											<div class=" layui-form-item">
												<label class="layui-form-label"style="font-size: 16px;">毛体积相对密度:</label>
												<label id="value" class="layui-form-label" style="text-align:left;font-size: 16px;"></label>
												<div id="div_button" class="div_button" style="width: 350px;  margin: 10px auto;">
													<button id="btn_compute" type="button" class="layui-btn">计算结果</button>
													<button id="btn_save" type="button" class="layui-btn" style="margin-left:100px">保存</button>
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
		</div>






		<script src="/static/js/jquery.js"></script>
		<script src="/static/layui/layui.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/common/common.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/experimental/qualitytestexperimental_lqhhl_ms_detail.js" charset="utf-8"></script>
		<script src="/static/js/qualitytest/qualitytestexperimental_detail.js" charset="utf-8"></script>

		<input id="path" value="${path}" type="hidden">


	</body>
</html>
