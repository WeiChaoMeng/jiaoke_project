<%--
Created by IntelliJ IDEA.
User: Melone
Date: 2020/10/12
Time: 13:54
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
	<!--<link rel="stylesheet" href="../../../static/fonts/iconfont.css">-->
	<link href='../../../static/css/qc/pooledProduct.css' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="../../../static/layui/css/layui.css">
	<script src="../../../static/js/jquery.min.js"></script>
	<script src="../../../static/js/jquery.min.js"></script>
	<script src="../../../static/js/echarts/echarts.js"></script>
	<script src="../../../static/layui/layui.js"></script>
</head>
<style type="text/css">
	table {
		border-collapse: collapse;
		margin: 0 auto;
		text-align: center;
	}

	table td, table th {
		border: 1px solid #cad9ea;
		color: #666;
		height: 30px;
		width: 25%;
	}

	table thead th {
		background-color: #f2fdfe;
		width: 100px;
	}

	table tr:nth-child(odd) {
		background: #fff;
	}

	table tr:nth-child(even) {
		background: #F5FAFA;
	}
	h2{
		margin-left: 40%;
		font-weight: bold;
		color: #5e5a5a;
	}
	.titleDiv{
		margin: 1% 5%;
		font-weight: bold;
		color: #5e5a5a;
	}
</style>
<body>

<div class="container-content">
    <div class="top">
		<div class="count-base" >
			<ul class="use-data">
				<li>
					<p class="data-count" id="leave_factory_total">0</p>
					<span class="data-name">出厂总量</span>
				</li>
				<li>
					<p class="data-count" id="production_total" > 0</p>
					<span class="data-name">生产总量</span>
				</li>
				<li>
					<p class="data-count" id="regeneration_total"  >0</p>
					<span class="data-name">再生用量</span>
				</li>
			</ul>
			<div class="com-count-title"></div>
			<div class="com-screen-content">
				<div data-type="2"  style="height: 15%;margin-top: 10%;">
					<div class="selectDiv" >
						<input type="text" class="layui-input" autocomplete="off" placeholder = "开始日期" id="startDate">
						<input type="text" class="layui-input" autocomplete="off" placeholder = "结束日期" id="endDate">
						<input type="button" class="layui-input" autocomplete="off" value= "查看报告" onclick="showProjectStatementPage()">
					</div>
				</div>
			</div>
			<span class="left-top"></span>
			<span class="right-top"></span>
			<span class="left-bottom"></span>
			<span class="right-bottom"></span>
		</div>
		<div class="count-resource q1">
			<div class="com-count-title">每日产量统计</div>
			<div class="com-screen-content2">
				<div class="com-screen-content">
				 <div id="main1" style="margin-top:10px;width:100%;height:300px;"></div>
				</div>
				<span class="left-top"></span>
				<span class="right-top"></span>
				<span class="left-bottom"></span>
				<span class="right-bottom"></span>
			</div>
		</div>
    </div>
	
	<div class="mid">
		<div class="count-share w1" >
			<div class="com-count-title">产品类型产量统计</div>
			<div class="com-screen-content">
				    <div class="topRec_List">
						<dl>
							<dd>产品类型</dd>
							<dd>总产量(t)</dd>
							<dd>再生使用量(t)</dd>
							<dd>再生占比</dd>
						</dl>
						<div class="maquee">
							<ul  id="maquee">

							</ul>
						</div>
					</div>
			</div>
			<span class="left-top"></span>
			<span class="right-top"></span>
			<span class="left-bottom"></span>
			<span class="right-bottom"></span>
		</div>
		<div class="count-share w2" >
			<div class="com-count-title">产量前十产品柱状图</div>
			<div class="com-screen-content">
			 <div id="main5" style="width:100%;height:300px;"></div>
			</div>
			<span class="left-top"></span>
			<span class="right-top"></span>
			<span class="left-bottom"></span>
			<span class="right-bottom"></span>
		</div>
	</div>
	
	<div class="bottom">
		<div class="count-topic e1" >
			<div class="com-count-title">一号机可添加再生产品情况</div>
			<div class="com-screen-content">
			<div id="main6" style="width:100%;height:300px;"></div>
			</div>
			<span class="left-top"></span>
			<span class="right-top"></span>
			<span class="left-bottom"></span>
			<span class="right-bottom"></span>
		</div>
		<div class="count-topic e2" >
			<div class="com-count-title">二号机可添加再生产品情况</div>
			<div class="com-screen-content">
			 <div id="main7" style="width:100%;height:300px;"></div>
			</div>
			<span class="left-top"></span>
			<span class="right-top"></span>
			<span class="left-bottom"></span>
			<span class="right-bottom"></span>
		</div>
	</div>
	<div class="clearfix"></div>
</div>
<input  id="path" value="${path}" type="hidden" >
<div id="productStatement" style="width: 100%;height:95%;display: none;">
	<h2>各工程生产情况汇总</h2>
	<div style="width: 100%;">
		<div class="titleDiv">两台机组生产盘数与出厂盘数对比情况</div>
		<table width="90%" class="table">
			<thead>
			<tr>
				<th colspan="4">
					1#机组
				</th>
			</tr>
			</thead>
			<thead>
			<tr>
				<th>
					生产开始时间
				</th>
				<th>
					生产结束时间
				</th>
				<th>
					生产盘数
				</th>
				<th>
					出厂盘数
				</th>
			</tr>
			</thead>
			<tbody id="crew1Body">

			</tbody>
			<thead>
			<tr>
				<th colspan="4">
					2#机组
				</th>
			</tr>
			</thead>
			<thead>
			<tr>
				<th>
					生产开始时间
				</th>
				<th>
					生产结束时间
				</th>
				<th>
					生产盘数
				</th>
				<th>
					出厂盘数
				</th>
			</tr>
			</thead>
			<tbody  id="crew2Body">

			</tbody>
		</table>
	</div>
	<button id="print_button" style="width: 15%;margin-top:20px;margin-left: 40%;margin-bottom: 50px;height: 40px;" onclick="printReport('productStatement');">打印报告</button>
</div>
</body>
<script src="../../../static/js/qc/pooled_project.js"></script>

<script type="text/javascript">
    function autoScroll(obj){
        $(obj).find("ul").animate({
            marginTop : "-39px"
        },500,function(){
            $(this).css({marginTop : "0px"}).find("li:first").appendTo(this);
        })
    }



</script>
</html>