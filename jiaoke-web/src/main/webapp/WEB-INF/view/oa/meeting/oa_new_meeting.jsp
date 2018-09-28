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
    <title>新建会议</title>
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
            <i></i>
            <span><i class="header_i">&#xea29;</i>调用模板</span>
        </a>
        <em class="top_toolbar_em"></em>

        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <i></i>
            <span><i class="header_i">&#xeac1;</i>插入</span>
        </a>
        <em class="top_toolbar_em"></em>

        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <i></i>
            <span><i class="header_i">&#xea23;</i>正文类型</span>
        </a>
        <em class="top_toolbar_em"></em>

        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <i></i>
            <span><i class="header_i">&#xea97;</i>存为模板</span>
        </a>

    </div>
</div>
<!--  -->
<div class="form_area">
    <table cellpadding="0" cellspacing="0" border="0" align="center" width="100%">
        <tbody>
        <tr>
            <td rowspan="3" nowrap="nowrap" style="width: 5%;padding: 10px">
                <a class="send_button">
                    <i class="send_i iconfont">&#xe764;</i>
                    <p class="send_p">发送</p>
                </a>
            </td>

            <th nowrap="nowrap" class="new_meeting_common" width="1%">会议名称:</th>

            <td colspan="3">
                <div class="common_input_frame">
                    <input type="text">
                </div>
            </td>

            <th nowrap="nowrap" class="new_meeting_common" width="8%">开始时间:</th>

            <td width="20%">
                <div class="common_input_frame">
                    <input type="text" class="cursor_hand">
                </div>
            </td>

            <th nowrap="nowrap" class="new_meeting_common" width="8%">结束时间:</th>

            <td width="20%">
                <div class="common_input_frame">
                    <input type="text" class="cursor_hand">
                </div>
            </td>
            <td></td>
        </tr>

        <tr>
            <th class="new_meeting_common" nowrap="nowrap">主持人:</th>
            <td width="13%">
                <div class="common_input_frame">
                    <input type="text" class="cursor_hand">
                </div>
            </td>

            <th class="new_meeting_common" style="width: 5%" nowrap="nowrap">记录人:</th>
            <td width="13%">
                <div class="common_input_frame">
                    <input type="text" class="cursor_hand">
                </div>
            </td>

            <th class="new_meeting_common" nowrap="nowrap">会议地点:</th>
            <td>
                <div class="common_input_frame">
                    <input type="text">
                </div>
            </td>

            <th class="new_meeting_common" nowrap="nowrap">提前提醒:</th>
            <td>
                <div class="common_select_frame">
                    <select name="" id="">
                        <option value="0">无</option>
                        <option value="1">5分钟</option>
                        <option value="2">10分钟</option>
                        <option value="3">15分钟</option>
                        <option value="4">30分钟</option>
                        <option value="5">1小时</option>
                        <option value="6">2小时</option>
                        <option value="7">3小时</option>
                        <option value="8">8小时</option>
                        <option value="9">0.5天</option>
                        <option value="10">1天</option>
                        <option value="11">2天</option>
                        <option value="12">3天</option>
                        <option value="13">1周</option>
                    </select>
                </div>
            </td>

        </tr>

        <tr>
            <th class="new_meeting_common" nowrap="nowrap">与会人员:</th>
            <td colspan="3">
                <div class="common_input_frame">
                    <input type="text" class="cursor_hand" readonly="readonly" onclick="participant_selection()"
                           value="<点击此处选择与会人员>">
                </div>
            </td>

            <th class="new_meeting_common" nowrap="nowrap">告知:</th>
            <td>
                <div class="common_input_frame">
                    <input type="text" class="cursor_hand" readonly="readonly" onclick="participant_selection()"
                           value="<点击此处选择告知>">
                </div>
            </td>

            <th nowrap="nowrap" class="new_meeting_common">所属项目:</th>

            <td>
                <div class="common_input_frame">
                    <input type="text">
                </div>
            </td>
            <td></td>
        </tr>


        </tbody>
    </table>
</div>

<form>
    <table class="formtable">

        <tbody>
        <tr>
            <td colspan="3" style="padding:10px;line-height:15px;height: 530px;">
                <div id="editor-state" class="formeditor">

                </div>
            </td>
        </tr>
        </tbody>

    </table>
</form>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script type="text/javascript" src="../../../../static/js/jquery.select.js"></script>
<script type="text/javascript" charset="utf-8" src="../../../../static/js/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="../../../../static/js/umeditor/umeditor.min.js"></script>
<script type="text/javascript" src="../../../../static/js/umeditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script type="text/javascript">

    // 富文本
    var state = UM.getEditor('editor-state');
    state.setWidth("100%");
    $(".edui-body-container").css("background", "#FFF");
    $(".edui-body-container").css("height", "420px");

</script>
</html>

