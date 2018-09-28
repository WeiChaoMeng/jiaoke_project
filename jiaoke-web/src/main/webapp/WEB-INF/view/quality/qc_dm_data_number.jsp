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
<title>打卡记录</title>
<link href="../../css/default.css" rel="stylesheet" type="text/css">
<link href="../../css/style/green.css" rel="stylesheet" type="text/css" id = 'link'>
<script src="../../js/echarts/echarts.js"></script>
<script src="../../js/echarts/uimaker.js"></script>
</head>

<body style="padding:10px 8px 700px 8px;">





<div class="divbox">

	<div class="">
        <div class="">
        <div class="boxtitle">
          <span>配比产品列表</span>  
        </div>
        
         <div class="boxdown">
            <table class="simpletable">
            
            <thead>
            <th>产品盘号</th>
            <th>配比号</th>
            <th>车号</th>
            <th>客户号</th>
            <th>生产时间</th>
            <th>生产人</th>
            <th>操作</th>
        	</thead>
            
            <tbody>
    
            <tr>
                <td>20171101</td>
                <td>256</td>
                <td>526845</td>
                <td>15144265588</td>
                <td>2017-11-01</td>

                <td>uimaker</td>
                                <td>
					
					<a class="selected" id="add" href="qc_dm_data_detail.jsp" target="_self" ><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
                </td>
            </tr>
            
            <tr>
                <td>20171102</td>
                <td>300</td>
                <td>526845</td>
                <td>15144265588</td>
                <td>2017-11-02</td>
 
                <td>admin</td>
                               <td>
					
					<a class="selected" id="add" href="qc_dm_data_detail.jsp" target="_self" ><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>
            
            <tr>
                <td>20171103</td>
                <td>500</td>
                <td>526845</td>
                <td>15144265588</td>
                <td>2017-11-03 </td>
 
                <td>nanjing</td>
                                <td>
					
					<a class="selected" id="add" href="qc_dm_data_detail.jsp" target="_self" ><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>
            
            <tr>
                <td>20171104</td>
                <td>1000</td>
                <td>526845</td>
                <td>15144265588</td>
                <td>2017-11-04</td>

                <td>office</td>
                                <td>
					
					<a  class="selected"  id="add"  href="#"  ><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>
            
            <tr>
                <td>20171105</td>
                <td>200</td>
                <td>526845</td>
                <td>15144265588</td>
                <td>2017-11-05</td>
 
                <td>uimaker</td>
                                <td>
					
					<a  class="selected"  id="add"  href="#"  ><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>
            
            <tr>
                <td>20171106</td>
                <td>150</td>
                <td>526845</td>
                <td>15144265588</td>
                <td>2017-11-06 </td>
 
                <td>guanliyuan</td>
                                <td>
					
					<a  class="selected"  id="add"  href="#"  ><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>
            
            <tr>
                <td>20171107</td>
                <td>450</td>
                <td>526845</td>
                <td>15144265588</td>
                <td>2017-11-07 </td>
 
                <td>moodoc</td>
                                <td>
					
					<a  class="selected"  id="add"  href="#"  ><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>
            
            <tr>
                <td>20171108</td>
                <td>500</td>
                <td>526845</td>
                <td>15144265588</td>
                <td>2017-11-08 </td>
 
                <td>iphonex</td>
                                <td>
					
					<a  class="selected"  id="add"  href="#"  ><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>   
			
            <tr>
                <td>20171108</td>
                <td>500</td>
                <td>526845</td>
                <td>15144265588</td>
                <td>2017-11-09</td>
 
                <td>iphonex</td>
                                <td>
					
					<a  class="selected"  id="add"  href="#"  ><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>   
			
            <tr>
                <td>20171108</td>
                <td>500</td>
                <td>526845</td>
                <td>15144265588</td>
                <td>2017-11-10 </td>
 
                <td>iphonex</td>
                                <td>
					
					<a  class="selected"  id="add"  href="#"  ><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>   
			
            <tr>
                <td>20171108</td>
                <td>500</td>
                <td>526845</td>
                <td>15144265588</td>
                <td>2017-11-11 </td>
 
                <td>iphonex</td>
                                <td>
					
					<a  class="selected"  id="add"  href="#"  ><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>   
			
            <tr>
                <td>20171108</td>
                <td>500</td>
                <td>526845</td>
                <td>15144265588</td>
                <td>2017-11-12 </td>
 
                <td>iphonex</td>
                                <td>
					
					<a  class="selected"  id="add"  href="#"  ><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>   
			
            <tr>
                <td>20171108</td>
                <td>500</td>
                <td>526845</td>
                <td>15144265588</td>
                <td>2017-11-13</td>
 
                <td>iphonex</td>
                                <td>
					
					<a  class="selected"  id="add"  href="#"  ><i class="toolico iconfont">&#xe970;</i>查看</a>
					<a href="#"><i class="toolico iconfont">&#xe8e5;</i>导出</a>
					
				</td>
            </tr>   
			
            <tr>
			
                <td>20171108</td>
                <td>500</td>
                <td>526845</td>
                <td>15144265588</td>
                <td>2017-11-14</td>
 
                <td>iphonex</td>
                                <td>
					
					<a  class="selected"  id="add"  href="#"  ><i class="toolico iconfont">&#xe970;</i>查看</a>
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
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript" src="../../js/skin.js"></script>
</html>
