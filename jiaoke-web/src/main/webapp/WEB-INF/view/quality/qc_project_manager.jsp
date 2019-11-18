<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>

<html>
<head>
    <meta charset="utf-8">
    <title>工程管理</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/js/datepicker/css/bootstrap-datepicker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/static/css/qc/zxf_page.css">
</head>

<body style="padding:0px 8px 100px 8px;">


    <ul class="toolbar">
        <li><a href="#" id="addPro" ><i class="toolico iconfont">&#xe7e9;</i>新建工程</a></li>
        <li><a href="#" onclick="delectUserProject();" id="btn_click"><i class="toolico iconfont">&#xe7ea;</i>删除</a></li>
    </ul>
    <!--toolbar end-->

    <!--tablebox start-->
    <div class="tablebox">
        <table>

            <thead>
                <th class="num"></th>
                <th>客户号</th>
                <th>工程名称</th>
                <th>业主名称</th>
                <th>上传时间</th>
                <th>上传人</th>
                <th>备注</th>
                <th>操作</th>
            </thead>

            <tbody id="userProjectList">

            </tbody>

        </table>
    </div>
    <!--tablebox end-->

    <!--pagination start-->
    <div class="zxf_pagediv"></div>
    <!--pagination end-->

    <!--删除弹出-->
    <div class="popup_back" style="display:none;">
    </div>
    <div class="popup_window_first" style="display:none;">
        <p class="popup_cont">是否删除？</p>
        <a href="javascript:void(0)" class="popup_btn" onclick="delectGrading();">确定</a>
        <a href="javascript:void(0)" class="popup_btn" onclick="closeWindow();">取消</a>
    </div>



    <!--级配模板相关弹出-->

    <!--展示级配模板弹出-->
    <table class="formtable" style="display: none;" id="showtable" >

        <tbody>
        <form id="showload">
            <tr>
                <td class="tlabel">客户号：</td>
                <td><input type="number" id="clientNum" style="height:20px;width:98%;outline: none;" required="required" readonly="readonly"  ></input></td>
            </tr>
            <tr>
                <td class="tlabel">工程名称：</td>
                <td colspan="3" ><input type="text" id="projectName" style="height:20px;width:98%;outline: none;" required="required"  readonly="readonly" ></td>
            </tr>
            <tr>
                <td class="tlabel">业主名称：</td>
                <td colspan="3" ><input type="text" id="clientName" style="height:20px;width:98%;outline: none;" required="required" readonly="readonly"  ></td>
            </tr>

            <tr>
                <td class="tlabel">上传日期：</td>
                <td><input type="text"  id="update" style="height:20px;width:98%;outline: none;" required="required" readonly="readonly"  ></input></td>
            </tr>
            <tr>
                <td class="tlabel">上传人：</td>
                <td><input type="text"  id="upUser" style="height:20px;width:98%;outline: none;" required="required"  readonly="readonly" ></input></td>
            </tr>
            <tr>
                <td class="tlabel">备注：</td>
                <td colspan="3"  ><p class="formtext">
					<textarea  id="remaker" readonly="readonly" class="text-adaption" rows="1">
					</textarea>
                </p>
                </td>
            </tr>
        </form>
        </tbody>

    </table>
    <!--上传级配模板弹出-->
    <table class="formtable" style="display: none;" id="uptable" >

        <tbody>
        <form id="upload">
            <tr>
                <td class="tlabel">客户号：</td>
                <td><input type="number" name="clientNum" style="height:20px;width:98%;outline: none;" required="required"  ></input></td>
            </tr>
            <tr>
                <td class="tlabel">工程名称：</td>
                <td colspan="3" ><input type="text" name="projectName" style="height:20px;width:98%;outline: none;" required="required"   ></td>
            </tr>
            <tr>
                <td class="tlabel">业主名称：</td>
                <td colspan="3" ><input type="text" name="clientName" style="height:20px;width:98%;outline: none;" required="required"  ></td>
            </tr>

            <tr>
                <td class="tlabel">上传日期：</td>
                <td><input type="text" id="upDate_upload" name="update" style="height:20px;width:98%;outline: none;" required="required"  ></input></td>
            </tr>
            <tr>
                <td class="tlabel">上传人：</td>
                <td><input type="text" id="upUser_upload" name="upUser" style="height:20px;width:98%;outline: none;" required="required"  ></input></td>
            </tr>
            <tr>
                <td class="tlabel">备注：</td>
                <td colspan="3"  ><p class="formtext">
					<textarea  name="remaker" class="text-adaption" rows="1">
					</textarea>
                </p>
                </td>
            </tr>
            <tr>
                <td class="tlabel">操作：</td>
                <td align="center" colspan="3" >
                    <input class="button-click" type="button" onclick="uploadProject();" value="发布">
                </td>
            </tr>
        </form>
        </tbody>

    </table>

    <!--编辑机组模板弹出-->
    <!--编辑级配模板弹出-->
    <table class="formtable" style="display: none;" id="editTable" >

        <tbody>
        <form id="eidt">
            <input type="number" id="id_edit" name="id" style="height:20px;width:98%;outline: none;display: none;" required="required"  >
            <tr>
                <td class="tlabel">客户号：</td>
                <td><input type="number" id="clientNum_edit" name="clientNum" style="height:20px;width:98%;outline: none;" required="required"  ></input></td>
            </tr>
            <tr>
                <td class="tlabel">工程名称：</td>
                <td colspan="3" ><input type="text" id="projectName_edit" name="projectName" style="height:20px;width:98%;outline: none;" required="required"   ></td>
            </tr>
            <tr>
                <td class="tlabel">业主名称：</td>
                <td colspan="3" ><input type="text" id="clientName_edit"  name="clientName" style="height:20px;width:98%;outline: none;" required="required"  ></td>
            </tr>

            <tr>
                <td class="tlabel">上传日期：</td>
                <td><input type="text" id="update_edit" name="update" style="height:20px;width:98%;outline: none;" required="required" readonly="readonly" ></input></td>
            </tr>
            <tr>
                <td class="tlabel">上传人：</td>
                <td><input type="text" id="upUser_edit" name="upUser" style="height:20px;width:98%;outline: none;" required="required" readonly="readonly" ></input></td>
            </tr>
            <tr>
                <td class="tlabel">备注：</td>
                <td colspan="3"  ><p class="formtext">
					<textarea id="remaker_edit"  name="remaker" class="text-adaption" rows="1">
					</textarea>
                </p>
                </td>
            </tr>
            <tr>
                <td class="tlabel">操作：</td>
                <td align="center" colspan="3" >
                    <input class="button-click" type="button" onclick="editUserProject();" value="修改">
                </td>
            </tr>
        </form>
        </tbody>

    </table>

    <input type="text" value="${path}" id="path" style="display: none" >

</body>

<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/jquery.select.js"></script>
<script src="/static/js/layer/layer.js"></script>


<script type="text/javascript" src="/static/js/datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/static/js/datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript" src="/static/js/qc/zxf_page.js"></script>
<script type="text/javascript" src="/static/js/qc/project_manager.js"></script>
<script type="text/javascript" src="/static/js/qc/xlsx.core.min.js"></script>

</html>