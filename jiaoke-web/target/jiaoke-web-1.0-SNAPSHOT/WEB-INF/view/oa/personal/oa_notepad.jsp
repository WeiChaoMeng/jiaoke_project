<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>待办记事</title>

<link rel="stylesheet" type="text/css" href="../../../../static/css/date.css">

<script src="../../../../static/js/jquery.min.js"></script>
<script src="../../../../static/js/date.js"></script>
<script>
$(function () {
	$("#monitor td button").click(function(){
		$(this).addClass('mark1')
		.parent().siblings().children('button').removeClass('mark1');
	 });

})
</script>

</head>
<body>
<center style="padding-left: 90px;" >
<!--我的记事 start-->
<div id="rightPart2" class="box rightPart2">
	<div class="title2">我的记事<span class="today">今天</span></div>
	<div class="schedule">
		<div id="calendar" class="dateShow">
			<table id="dayshow" class="dates">
				<tr>
					<th><button id="lastM" class="lastM" title="上一月"></button></th>
					<th class="tl"><button id="last-week" class="lastW" title="上一周"></button></th>
					<th id="curday" style="text-align:right" colspan="2">2017年3月19</th>
					<th>-</th>
					<th id="curday7" style="text-align:left" colspan="2">2017年3月25日</th>
					<th class="tr"><button id="next-week" class="nextW" title="下一周"></button></th>
					<th><button id="nextM" class="nextM" title="下一月"></button></th>
				</tr>
				<tr>
					<td class="padleft" colspan="2"><button>日</button></td>
					<td><button>一</button></td>
					<td><button>二</button></td>
					<td><button>三</button></td>
					<td><button>四</button></td>
					<td><button>五</button></td>
					<td class="padright" colspan="2"><button>六</button></td>
				</tr>
				<tr id="monitor">
					<td class="padleft" colspan="2"><button>19</button></td>
					<td class="mark2"><button>20</button></td>
					<td><button>21</button></td>
					<td><button>22</button></td>
					<td class="mark2"><button>23</button></td>
					<td><button>24</button></td>
					<td class="padright" colspan="2"><button>25</button></td>
				</tr>
			</table>
		</div>
		<div class="detailed">
			<ul class="rclist">
				<li><span class="time">10:30</span><span class="explain">我的记事表上已经排满了很多的事情。</span></li>
				<li><span class="time">11:30</span><span class="explain">我抱怨我的记事表、我的家庭、我的处境和可能抱怨的一切，认为是它们让我陷入困境。</span></li>
				<li><span class="time">12:30</span><span class="explain">把每周回顾列入我的记事表中是我要做的第一步.</span></li>
				<li><span class="time">13:30</span><span class="explain">我一般在每周五下午做每周回顾.</span></li>
				<li><span class="time">14:30</span><span class="explain">因为在周末之前让我感觉到一周就要结束了(应该总结一下了).</span></li>
				<li><span class="time">15:30</span><span class="explain">有些人习惯于周日晚上作回顾,这样在下周一时对刚刚总结过的事情印象比较深刻.</span></li>
				<li><span class="time">16:30</span><span class="explain">作好回顾的关键是把它列入记事表</span></li>
				
			</ul>
			<!--<a class="downBtn" href="#" style="display:none;">显示更多</a>-->
		</div>
	</div>


</center>
</div>
<div id="rightPart2"  class="box rightPart2">
<div class="title2">我的记事
	<span class="today">今天</span>
</div>
	<div class="schedule">
<li>
	<span class="time">10:30</span>
	<span class="explain">我的记事表上已经排满了很多的事情。</span>
</li>
<li>
	<span class="time">11:30</span>
	<span class="explain">我抱怨我的记事表、我的家庭、我的处境和可能抱怨的一切，认为是它们让我陷入困境。</span>
</li>
<li>
	<span class="time">12:30</span>
	<span class="explain">把每周回顾列入我的记事表中是我要做的第一步.</span>
</li>
<li>
	<span class="time">13:30</span>
	<span class="explain">我一般在每周五下午做每周回顾.</span>
</li>
<li>
	<span class="time">14:30</span>
	<span class="explain">因为在周末之前让我感觉到一周就要结束了(应该总结一下了).</span>
</li>
<li>
	<span class="time">15:30</span>
	<span class="explain">有些人习惯于周日晚上作回顾,这样在下周一时对刚刚总结过的事情印象比较深刻.</span>
</li>
<li>
	<span class="time">16:30</span>
	<span class="explain">作好回顾的关键是把它列入记事表</span>
</li>
	</div>
</div>

</div>
</body>
</html>
