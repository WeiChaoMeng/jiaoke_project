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
			<ul class="use-data" style="height: 32%;">
				<li style="width: 30%;">
					<p class="data-count" id="crew1_WCZ">0</p>
					<span class="data-name">王长忠组产量</span>
				</li>
				<li style="width: 30%;">
					<p class="data-count" id="crew1_DJM" > 0</p>
					<span class="data-name">杜健民组产量</span>
				</li>
				<li style="width: 30%;">
					<p class="data-count" id="crew1_WH"  >0</p>
					<span class="data-name">王欢组产量</span>
				</li>
				<li style="width: 30%;">
					<p class="data-count" id="crew2_ZDQ"  >0</p>
					<span class="data-name">张德全组产量</span>
				</li>
				<li style="width: 30%;">
					<p class="data-count" id="crew2_FYB"  >0</p>
					<span class="data-name">范玉彬组产量</span>
				</li>
				<li style="width: 30%;">
					<p class="data-count" id="crew2_ZWM"  >0</p>
					<span class="data-name">赵文明组产量</span>
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
			<div class="com-count-title">各组可添加产品添加情况</div>
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
			<div class="com-count-title">各组生产量情况</div>
			<div class="com-screen-content">
				    <div class="topRec_List">
						<dl>
							<dd >小组</dd>
							<dd >机组号</dd>
							<dd >总产量(t)</dd>
							<dd >再生使用量(t)</dd>
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
			<div class="com-count-title">各组生产量情况柱状图</div>
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
			<div class="com-count-title">1#机王长忠组生产情况</div>
			<div class="com-screen-content">
			<div id="main6" style="width:100%;height:300px;"></div>
			</div>
			<span class="left-top"></span>
			<span class="right-top"></span>
			<span class="left-bottom"></span>
			<span class="right-bottom"></span>
		</div>
		<div class="count-topic e2" >
			<div class="com-count-title">1#机杜健民组生产情况</div>
			<div class="com-screen-content">
			 <div id="main7" style="width:100%;height:300px;"></div>
			</div>
			<span class="left-top"></span>
			<span class="right-top"></span>
			<span class="left-bottom"></span>
			<span class="right-bottom"></span>
		</div>
	</div>
	<div class="bottom">
		<div class="count-topic e1" >
			<div class="com-count-title">1#机王欢组生产情况</div>
			<div class="com-screen-content">
				<div id="main8" style="width:100%;height:300px;"></div>
			</div>
			<span class="left-top"></span>
			<span class="right-top"></span>
			<span class="left-bottom"></span>
			<span class="right-bottom"></span>
		</div>
		<div class="count-topic e2" >
			<div class="com-count-title">2#机张德全组生产情况</div>
			<div class="com-screen-content">
				<div id="main9" style="width:100%;height:300px;"></div>
			</div>
			<span class="left-top"></span>
			<span class="right-top"></span>
			<span class="left-bottom"></span>
			<span class="right-bottom"></span>
		</div>
	</div>
	<div class="bottom">
		<div class="count-topic e1" >
			<div class="com-count-title">2#机范玉彬组生产情况</div>
			<div class="com-screen-content">
				<div id="main10" style="width:100%;height:300px;"></div>
			</div>
			<span class="left-top"></span>
			<span class="right-top"></span>
			<span class="left-bottom"></span>
			<span class="right-bottom"></span>
		</div>
		<div class="count-topic e2" >
			<div class="com-count-title">2#机赵文明组生产情况</div>
			<div class="com-screen-content">
				<div id="main11" style="width:100%;height:300px;"></div>
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
<script src="../../../static/js/qc/pooled_squad.js"></script>

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