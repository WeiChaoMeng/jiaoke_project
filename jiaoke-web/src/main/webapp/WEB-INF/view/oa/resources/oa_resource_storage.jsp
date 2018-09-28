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

<body style="padding:15px 8px 0px 8px;">
	<form>
    <table class="formtable">
    
    <tbody>
    
    	<tr>
        <td class="tlabel">资源名称：</td>
                        <td>
                            <input type="text" class="forminput inputstyle" value="A4打印纸">
                        </td>
        </tr>
        
        <tr>
        <td class="tlabel">资产类别：</td>
                <td>
                    <input type="text" class="forminput inputstyle" value="办公用品">
                </td>
        </tr>
        <tr>
                    <td class="tlabel">规格型号：</td>
                    <td>
                        <input type="text" class="forminput inputstyle" value="A4">
                    </td>
        </tr>
        
        <tr>
        <td class="tlabel">录入人：</td>
        <td><input type="text" class="forminput inputstyle" value="张三"></td>
        </tr>

        <tr>
                    <td class="tlabel">资产单价：</td>
                    <td>
                        <input type="text" class="forminput inputstyle" value="0.5">
                    </td>
        </tr>
        
        <tr>
        <td class="tlabel">来源：</td>
        <td>
        <select class="select swidth" name="state" data-value="0" >
            <option value ="0">请选择</option>
            <option value ="1" >行政购置</option>
            <option value ="2" >设备购置</option>
        </select>
        </td>
        </tr>

        <tr>
                    <td class="tlabel">存放地点：</td>
                    <td>
                        <input type="text" class="forminput inputstyle" value="办公室">
                    </td>
        </tr>
        
        <tr>
        <td class="tlabel">保管人：</td>
        <td><input type="text" class="forminput inputstyle" value="小王"></td>
        </tr>

        <tr>
                    <td class="tlabel">保管人电话：</td>
                    <td>
                        <input type="text" class="forminput inputstyle" value="025-85423587">
                    </td>
        </tr>
                
        
    </tbody>
    
    </table>
    
    <div class="formbtn">
    <input type="button" value="保存"  class="btnsave">
    <input type="button" value="重置"  class="btncancel">
    </div>
    
</form>
</body>
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

