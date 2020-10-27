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
<body>

<div class="container-content">
    <div class="top">
		<div class="count-base" >
			<ul class="use-data">
				<li>
					<p class="data-count" id="total">0</p>
					<span class="data-name">生产总量</span>
				</li>
				<li>
					<p class="data-count" id="crew1_total" > 0</p>
					<span class="data-name">一号机总量</span>
				</li>
				<li>
					<p class="data-count" id="crew2_total"  >0</p>
					<span class="data-name">二号机总量</span>
				</li>
			</ul>
			<div class="com-count-title"></div>
			<div class="com-screen-content">
				<div data-type="2"  style="height: 15%;margin-top: 10%;">
					<div class="selectDiv" >
						<input type="text" class="layui-input" autocomplete="off" placeholder = "开始日期" id="startDate">
						<input type="text" class="layui-input" autocomplete="off" placeholder = "结束日期" id="endDate">
						<input type="button" class="layui-input" autocomplete="off" value= "查看报告" onclick="showProductStatement()">
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
							<dd>再生使用量(t)</dd>
							<dd>总产量(t)</dd>
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
			<div class="com-count-title">一号机各产品产量</div>
			<div class="com-screen-content">
			<div id="main6" style="width:100%;height:300px;"></div>
			</div>
			<span class="left-top"></span>
			<span class="right-top"></span>
			<span class="left-bottom"></span>
			<span class="right-bottom"></span>
		</div>
		<div class="count-topic e2" >
			<div class="com-count-title">二号机各产品产量</div>
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

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3 class="text-center">
				h3. 这是一套可视化布局系统.
			</h3>
			<table class="table table-bordered table-hover">
				<thead>
				<tr>
					<th>
						编号
					</th>
					<th>
						产品
					</th>
					<th>
						交付时间
					</th>
					<th>
						状态
					</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>
						1
					</td>
					<td>
						TB - Monthly
					</td>
					<td>
						01/04/2012
					</td>
					<td>
						Default
					</td>
				</tr>
				<tr class="success">
					<td>
						1
					</td>
					<td>
						TB - Monthly
					</td>
					<td>
						01/04/2012
					</td>
					<td>
						Approved
					</td>
				</tr>
				<tr class="error">
					<td>
						2
					</td>
					<td>
						TB - Monthly
					</td>
					<td>
						02/04/2012
					</td>
					<td>
						Declined
					</td>
				</tr>
				<tr class="warning">
					<td>
						3
					</td>
					<td>
						TB - Monthly
					</td>
					<td>
						03/04/2012
					</td>
					<td>
						Pending
					</td>
				</tr>
				<tr class="info">
					<td>
						4
					</td>
					<td>
						TB - Monthly
					</td>
					<td>
						04/04/2012
					</td>
					<td>
						Call in to confirm
					</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-6 column">
			<table class="table table-bordered table-hover">
				<thead>
				<tr>
					<th>
						编号
					</th>
					<th>
						产品
					</th>
					<th>
						交付时间
					</th>
					<th>
						状态
					</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>
						1
					</td>
					<td>
						TB - Monthly
					</td>
					<td>
						01/04/2012
					</td>
					<td>
						Default
					</td>
				</tr>
				<tr class="success">
					<td>
						1
					</td>
					<td>
						TB - Monthly
					</td>
					<td>
						01/04/2012
					</td>
					<td>
						Approved
					</td>
				</tr>
				<tr class="error">
					<td>
						2
					</td>
					<td>
						TB - Monthly
					</td>
					<td>
						02/04/2012
					</td>
					<td>
						Declined
					</td>
				</tr>
				<tr class="warning">
					<td>
						3
					</td>
					<td>
						TB - Monthly
					</td>
					<td>
						03/04/2012
					</td>
					<td>
						Pending
					</td>
				</tr>
				<tr class="info">
					<td>
						4
					</td>
					<td>
						TB - Monthly
					</td>
					<td>
						04/04/2012
					</td>
					<td>
						Call in to confirm
					</td>
				</tr>
				</tbody>
			</table>
		</div>
		<div class="col-md-6 column">
			<table class="table table-bordered table-hover">
				<thead>
				<tr>
					<th>
						编号
					</th>
					<th>
						产品
					</th>
					<th>
						交付时间
					</th>
					<th>
						状态
					</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>
						1
					</td>
					<td>
						TB - Monthly
					</td>
					<td>
						01/04/2012
					</td>
					<td>
						Default
					</td>
				</tr>
				<tr class="success">
					<td>
						1
					</td>
					<td>
						TB - Monthly
					</td>
					<td>
						01/04/2012
					</td>
					<td>
						Approved
					</td>
				</tr>
				<tr class="error">
					<td>
						2
					</td>
					<td>
						TB - Monthly
					</td>
					<td>
						02/04/2012
					</td>
					<td>
						Declined
					</td>
				</tr>
				<tr class="warning">
					<td>
						3
					</td>
					<td>
						TB - Monthly
					</td>
					<td>
						03/04/2012
					</td>
					<td>
						Pending
					</td>
				</tr>
				<tr class="info">
					<td>
						4
					</td>
					<td>
						TB - Monthly
					</td>
					<td>
						04/04/2012
					</td>
					<td>
						Call in to confirm
					</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<input  id="path" value="${path}" type="hidden" >
<script src="../../../static/js/qc/pooled_product.js"></script>

<script type="text/javascript"> 
	  function autoScroll(obj){  
			$(obj).find("ul").animate({  
				marginTop : "-39px"  
			},500,function(){  
				$(this).css({marginTop : "0px"}).find("li:first").appendTo(this);  
			})  
		}  



</script> 
</body>
</html>