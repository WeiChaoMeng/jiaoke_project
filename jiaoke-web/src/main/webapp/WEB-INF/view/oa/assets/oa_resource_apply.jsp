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
<title>无标题文档</title>
<link href="../../../../static/css/default.css" rel="stylesheet" type="text/css">
<link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id = 'link'>
<link href="../../../../static/js/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
</head>

<body style="padding:0px 0px 0px 8px;">
	<form>
    <table class="formtable">
    
    <tbody>
    
    	<tr>
        <td class="tlabel">申领部门：</td>
        <td>
            <select class="select swidth" name="state" data-value="0" >
                <option value ="0">请选择</option>
                <option value ="1" >江苏省</option>
                <option value ="2" >山东省</option>
                <option value ="3" >北京市</option>
                <option value ="4" >上海市</option>
            </select>
        </td>
        </tr>
        
        <tr>
            <td class="tlabel">申领人：</td>
            <td><input type="text" class="forminput inputstyle" value="孙中山"></td>
        </tr>

        <tr>
            <td class="tlabel">申领日期：</td>
           <td class="data" ><input type="text" class="forminput inputstyle" id="start"><i class="iconfont">&#xe6bf;</i></td> 
        </tr>
        
         <tr>
         <td class="tlabel">申领物品名称：</td>
           <td><input type="text" class="forminput inputstyle" value="孙中山"></td>


        </tr>

        <tr>
                     <td class="tlabel">申领物品型号：</td>
           <td><input type="text" class="forminput inputstyle" value="孙中山"></td>
        </tr>

         <tr>
         <td class="tlabel">申领物品数量：</td>
           <td><input type="text" class="forminput inputstyle" value="孙中山"></td>
        </tr>
        

        
        <tr>
            <td class="tlabel">申领部门领导审核意见：</td>
           <td><input type="text" class="forminput inputstyle" value="孙中山"></td>
        </tr>

        <tr>
        <td class="tlabel">备注信息：</td>        
        <td colspan="3" style="padding:10px;line-height:15px;">
        <div id="editor-state" class="formeditor">
        
        </div>	
        </td>
        </tr>
        
    </tbody>
    
    </table>
    
    <div class="formbtn">
    <input type="button" value="申请"  class="btnsave">
    <input type="button" value="重置"  class="btncancel">
    </div>
    
</form>
</body>
<script type="text/javascript" src="../../../../static/js/datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
    <script type="text/javascript" src="../../../../static/js/common.js"></script>
    <script type="text/javascript" src="../../../../static/js/skin.js"></script>
    <script type="text/javascript" src="../../../../static/js/jquery.select.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../../../static/js/umeditor/umeditor.config.js"></script>
        <script type="text/javascript" charset="utf-8" src="../../../../static/js/umeditor/umeditor.min.js"></script>
        <script type="text/javascript" src="../../../../static/js/umeditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript">
         var state = UM.getEditor('editor-state');
         state.setWidth("99.91%");
         $(".edui-body-container").css("width", "99.91%");  
		 $('select.select').select(); 
    </script>
</html>

