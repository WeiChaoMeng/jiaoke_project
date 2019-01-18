<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="utf-8">
<title>领用记录</title>
<link href="../../../../static/css/default.css" rel="stylesheet" type="text/css">
<link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id = 'link'>
</head>

<body style="padding:0px 8px 70px 8px;">

<!--form start-->


<div class="divbox">

	<div class="">
        <div class="">
        <div class="boxtitle"></div>
        
         <div class="boxdown">
            <table class="simpletable">
            
            <thead>
            <th>申领编号</th>
            <th>申领物品名称</th>
            <th>申领日期</th>
            <th>申领人</th>
            <th>操作</th>
        	</thead>
            
            <tbody>
            
            <tr>
                <td>20171101</td>
                <td><a href="#" >办公用品</a></td>
                <td>2017-11-01 16:35:26</td>

                <td>uimaker</td>
                                <td>
					
					<a href="#" class="selected"  id="add"><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>
            
            <tr>
                <td>20171102</td>
                <td><a href="#" >办公用品</a></td>
                <td>2017-11-02 10:50:08</td>
 
                <td>admin</td>
                               <td>
					
					<a href="#" class="selected"  id="add"><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>
            
            <tr>
                <td>20171103</td>
                <td><a href="#" >办公用品</a></td>
                <td>2017-11-03 00:00:14</td>
 
                <td>nanjing</td>
                                <td>
					
					<a href="#" class="selected"  id="add"><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>
            
            <tr>
                <td>20171104</td>
                <td><a href="#" >办公用品</a></td>
                <td>2017-11-04 16:22:00</td>

                <td>office</td>
                                <td>
					
					<a href="#" class="selected"  id="add"><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>
            
            <tr>
                <td>20171105</td>
                <td><a href="#" >办公用品</a></td>
                <td>2017-11-05 04:00:00</td>
 
                <td>uimaker</td>
                                <td>
					
					<a href="#" class="selected"  id="add"><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>
            
            <tr>
                <td>20171106</td>
                <td><a href="#" >办公用品</a></td>
                <td>2017-11-06 18:20:10</td>
 
                <td>guanliyuan</td>
                                <td>
					
					<a href="#" class="selected"  id="add"><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>
            
            <tr>
                <td>20171107</td>
                <td><a href="#" >办公用品</a></td>
                <td>2017-11-07 08:34:00</td>
 
                <td>moodoc</td>
                                <td>
					
					<a href="#" class="selected"  id="add"><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>
            
            <tr>
                <td>20171108</td>
                <td><a href="#" >办公用品</a></td>
                <td>2017-11-08 19:00:14</td>
 
                <td>iphonex</td>
                                <td>
					
					<a href="#" class="selected"  id="add"><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>   
			
            <tr>
                <td>20171108</td>
                <td><a href="#" >办公用品</a></td>
                <td>2017-11-08 19:00:14</td>
 
                <td>iphonex</td>
                                <td>
					
					<a href="#" class="selected"  id="add"><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>   
			
            <tr>
                <td>20171108</td>
                <td><a href="#" >办公用品</a></td>
                <td>2017-11-08 19:00:14</td>
 
                <td>iphonex</td>
                                <td>
					
					<a href="#" class="selected"  id="add"><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>   
			
            <tr>
                <td>20171108</td>
                <td><a href="#" >办公用品</a></td>
                <td>2017-11-08 19:00:14</td>
 
                <td>iphonex</td>
                                <td>
					
					<a href="#" class="selected"  id="add"><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>   
			
            <tr>
                <td>20171108</td>
                <td><a href="#" >办公用品</a></td>
                <td>2017-11-08 19:00:14</td>
 
                <td>iphonex</td>
                                <td>
					
					<a href="#" class="selected"  id="add"><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>   
			
            <tr>
                <td>20171108</td>
                <td><a href="#" >办公用品</a></td>
                <td>2017-11-08 19:00:14</td>
 
                <td>iphonex</td>
                                <td>
					
					<a href="#" class="selected"  id="add"><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>   
			
            <tr>
			
                <td>20171108</td>
                <td><a href="#" >办公用品</a></td>
                <td>2017-11-08 19:00:14</td>
 
                <td>iphonex</td>
                                <td>
					
					<a href="#" class="selected"  id="add"><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>
            
            </tbody>
            
            </table>
        </div>
        
        </div>
    </div>
<div class="pagination">
	<ul class="pagelist">
    <li><a href="#" class="first">首页</a></li>
    <li><a href="#" class="selected pageico"><i class="iconfont">&#xe68a;</i></a></li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#">6</a></li>
    <li><a href="#">7</a></li>
    <li><a href="#">8</a></li>
    <li><a href="#">9</a></li>    
    <li><a href="#" class="pageico"><i class="iconfont">&#xe673;</i></a></li>
    <li><a href="#">尾页</a></li>
    </ul>
    
    <span class="pageinfo">共 50 条记录，每页 10 条，当前第 1 页，共 5 页</span>
</div>
</div>


</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
</html>
