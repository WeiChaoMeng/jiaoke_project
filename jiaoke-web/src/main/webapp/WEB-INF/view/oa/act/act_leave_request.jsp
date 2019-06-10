<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>请假审批表</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
</head>

<body>
<div style="width:100%;margin: 20px auto;text-align: center">
    <span style="font-size: 17px;">请假审批表</span>
</div>
<div class="top_toolbar">
    <div class="top_toolbar_inside">
        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <i></i>
            <span id="preservationPending" onclick="preservationPending()">保存待发</span>
        </a>
        <em class="top_toolbar_em"></em>

        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <i></i>
            <span>调用模板</span>
        </a>
        <em class="top_toolbar_em"></em>

        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <i></i>
            <span>插入</span>
        </a>
        <em class="top_toolbar_em"></em>

        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <i></i>
            <span>存为模板</span>
        </a>
        <em class="top_toolbar_em"></em>

        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <i></i>
            <span>打印</span>
        </a>
    </div>
</div>
<!--  -->
<form id="oaDocumentProcessing" action="http://127.0.0.1:8080/document/add" method="post">

    <div class="form_area">
        <table style="width: 100%">
            <tbody>
            <tr>
                <td rowspan="2" nowrap="nowrap" style="width: 5%">
                    <input type="submit" value="发送" id="opo"
                           style="padding: 15px;margin: 5px 10px;background-color: #00a6f570">
                </td>

                <th nowrap="nowrap" class="th_title">标题:</th>

                <td width="35%">
                    <div class="common_input_frame">
                        <input type="text" id="formTitle" placeholder="<点击此处填写标题>">
                    </div>
                </td>

                <td class="condition_select_frame">
                    <div class="common_select_frame">
                        <select name="" required>
                            <option>普通</option>
                            <option>重要</option>
                            <option>非常重要</option>
                        </select>
                    </div>
                </td>

                <th class="common_th">关联项目:</th>

                <td class="common_condition_select_frame">
                    <div class="common_select_frame">
                        <select name="" id="">
                            <option>无</option>
                        </select>
                    </div>
                </td>

                <th class="common_th">预归档到:</th>

                <td class="common_condition_select_frame">
                    <div class="common_select_frame">
                        <select name="">
                            <option>无</option>
                        </select>
                    </div>
                </td>
            </tr>

            <tr>
                <th class="th_title" nowrap="nowrap">流程:</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" placeholder="<点击新建流程>">
                    </div>
                </td>
                <td class="condition_select_frame">
                    <div class="common_select_frame">
                        <input type="button" value="查看流程">
                    </div>
                </td>

                <th class="common_th">流程期限:</th>

                <td class="common_condition_select_frame">
                    <div class="common_select_frame">
                        <select name="processDeadline" id="deadline">
                            <option value="0">无</option>
                            <option value="60">1小时</option>
                            <option value="120">2小时</option>
                            <option value="240">4小时</option>
                            <option value="1440">1天</option>
                            <option value="2880">2天</option>
                            <option value="4320">3天</option>
                            <option value="7200">5天</option>
                            <option value="10080">1周</option>
                            <option value="21600">15天</option>
                            <option value="43200">1个月</option>
                            <option value="129600">3个月</option>
                        </select>
                    </div>
                </td>

                <th class="common_th">
                    <div>
                        <label for="canTrack">
                            <input id="canTrack" type="checkbox" checked="checked" onclick="choice()">跟踪
                        </label>
                    </div>
                </th>
                <td colspan="3">
                    <div class="common_radio">
                        <label for="radioall">
                            <input type="radio" id="radioall" checked="checked" name="track">全部人员
                        </label>
                        <label for="radiopart">
                            <input type="radio" id="radiopart" name="track">指定人员
                        </label>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <table class="formtable">

        <tbody>

        <tr>
            <td class="tlabel">申请人：</td>
            <td style="width: 27%;">
                <input type="text" class="forminput" value="" readonly="readonly">
            </td>
            <td class="tlabel">申请部门：</td>
            <td style="width: 20%;">
                <input type="text" class="forminput" value="" readonly="readonly">
            </td>
            <td class="tlabel">申请时间：</td>
            <td style="width: 20%;">
                <input type="text" class="forminput" value="" id="applyTime" readonly="readonly">
            </td>
        </tr>

        <tr>
            <td class="tlabel">请假类型：</td>
            <td>
                <select class="select" name="state" data-value="0" required>
                    <option value="0">请选择</option>
                    <option value="1">年假</option>
                    <option value="2">事假</option>
                    <option value="3">病假</option>
                    <option value="4">调休</option>
                    <option value="5">产假</option>
                    <option value="6">陪产假</option>
                    <option value="7">婚假</option>
                    <option value="8">丧假</option>
                </select>
            </td>
            <td class="tlabel">开始时间：</td>
            <td>
                <div class="data">
                    <input type="text" class="forminput" id="start" value="" name="startTime" readonly="readonly"
                           required>
                </div>
            </td>
            <td class="tlabel">结束时间：</td>
            <td>
                <div class="data">
                    <input type="text" class="forminput" id="end" readonly="readonly">
                </div>
            </td>
        </tr>

        <tr>
            <td class="tlabel">请假事由：</td>
            <td colspan="5" style="height: 100px;padding: 10px;">
                <textarea class="opinion-column"></textarea>
            </td>
        </tr>

        <tr>
            <td class="tlabel">部门领导意见：</td>
            <td colspan="5" style="height: 100px;padding: 10px;">
                <textarea class="opinion-column"></textarea>
            </td>
        </tr>

        <shiro:lacksPermission name="createDocument">
            <tr>
                <td class="tlabel">人事部门意见：</td>
                <td colspan="5" style="height: 100px;padding: 10px;">
                    <textarea disabled="disabled" class="read-write-permission"></textarea>
                </td>
            </tr>
        </shiro:lacksPermission>

        <shiro:hasPermission name="createDocument">
            <tr>
                <td class="tlabel">人事部门意见：</td>
                <td colspan="5" style="height: 100px;padding: 10px;">
                    <textarea class="opinion-column"></textarea>
                </td>
            </tr>
        </shiro:hasPermission>
        </tbody>

    </table>
</form>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/date_pickers/jquery.date_input.pack.js"></script>
<script>

    var flag = false;

    function choice() {
        $("#radioall").attr("checked", flag);
        flag = !flag;
    }

    $('#start').date_input();
    $('#end').date_input();

    $(function () {
        //当前年月日
        var date = new Date();
        $('#applyTime').val(date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate());
    })
</script>
</html>

