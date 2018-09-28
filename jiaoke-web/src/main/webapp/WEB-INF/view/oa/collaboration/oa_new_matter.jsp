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
    <title>新建事项</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <link href="../../../../static/js/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
</head>

<body>
<div class="top_toolbar">
    <div class="top_toolbar_inside">
        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <span><i class="header_i">&#xea97;</i>保存待发</span>
        </a>
        <em class="top_toolbar_em"></em>

        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <span><i class="header_i">&#xea29;</i>调用模板</span>
        </a>
        <em class="top_toolbar_em"></em>

        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <span><i class="header_i">&#xeac1;</i>插入</span>
        </a>
        <em class="top_toolbar_em"></em>

        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <span><i class="header_i">&#xea23;</i>正文类型</span>
        </a>
        <em class="top_toolbar_em"></em>

        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <span><i class="header_i">&#xea97;</i>存为模板</span>
        </a>
        <em class="top_toolbar_em"></em>

        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <span><i class="header_i">&#xea0e;</i>打印</span>
        </a>

    </div>
</div>
<!--  -->
<div class="form_area">
    <table style="width: 100%">
        <tbody>
        <tr>
            <td rowspan="2" nowrap="nowrap" class="send_button_margin">
                <a class="send_button">
                    <i class="menuico iconfont send_i">&#xe764;</i>
                    <p class="send_p">发送</p>
                </a>
            </td>

            <th nowrap="nowrap" class="new_meeting_common" width="1%">标题:</th>

            <td colspan="4">
                <div class="common_input_frame">
                    <input type="text">
                </div>
            </td>

            <td class="condition_select_frame">
                <div class="common_select_frame">
                    <select name="">
                        <option>普通</option>
                        <option>重要</option>
                        <option>非常重要</option>
                    </select>
                </div>
            </td>

            <th class="new_meeting_common" width="5%">关联项目:</th>

            <td class="common_condition_select_frame">
                <div class="common_select_frame">
                    <select name="" id="">
                        <option>无</option>
                    </select>
                </div>
            </td>

            <th class="new_meeting_common" width="6%">预归档到:</th>

            <td class="archiving_selection">
                <div class="common_select_frame">
                    <select name="">
                        <option>无</option>
                    </select>
                </div>
            </td>
            <td></td>
        </tr>

        <tr>
            <th class="new_meeting_common" nowrap="nowrap">流程:</th>
            <td colspan="4">
                <div class="common_input_frame">
                    <input type="text">
                </div>
            </td>
            <td class="condition_select_frame">
                <div class="common_select_frame">
                    <input type="button" value="编辑流程">
                </div>
            </td>
            <th class="common_th">
                <div>
                    <label for="canTrack">
                        <input id="canTrack" type="checkbox">跟踪
                    </label>
                </div>
            </th>
            <td colspan="3">
                <div class="common_radio">
                    <label for="radioall">
                        <input type="radio" id="radioall" checked="checked">全部人员
                    </label>
                    <label for="radiopart">
                        <input type="radio" id="radiopart">指定人员
                    </label>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<form>
    <table class="formtable">
        <tbody>
        <tr>
            <td colspan="3" class="rich_text_margin">
                <div id="editor-state" class="formeditor">
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</form>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/jquery.select.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script type="text/javascript" charset="utf-8" src="../../../../static/js/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="../../../../static/js/umeditor/umeditor.min.js"></script>
<script type="text/javascript" src="../../../../static/js/umeditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">

    // 富文本
    var state = UM.getEditor('editor-state');
    state.setWidth("100%");
    $(".edui-body-container").css("background", "#FFF");
    $(".edui-body-container").css("height", "450px");

    $('select.select').select();
</script>
</html>

