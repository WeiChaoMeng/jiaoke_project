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
    <title>发布公文</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
</head>
<style>
    .swidth {
        width: 200px;
        margin: 0;
    }

    .forminput, .search {
        text-align: left;
    }

</style>

<body style="padding: 20px">


<div class="top_toolbar">
    <div class="top_toolbar_inside">
        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <i></i>
            <span id="preservationPending">保存待发</span>
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
            <span>正文类型</span>
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
<form action="/document/add" name="oaDocumentProcessing" id="oaDocumentProcessing" method="post" onsubmit="">
    <div class="form_area">
        <table style="width: 100%">
            <tbody>
            <tr>
                <td rowspan="2" nowrap="nowrap" style="width: 1px">
                    <input type="submit" value="发送" style="padding: 15px;margin: 5px 10px;background-color: #00a6f570">
                </td>

                <th nowrap="nowrap" class="th_title">标题:</th>

                <td>
                    <div class="common_input_frame">
                        <input type="hidden" name="formState" id="formState" value="">
                        <input type="text" name="formTitle" id="formTitle" value="" placeholder="<点击此处填写标题>" required>
                    </div>
                </td>

                <td class="condition_select_frame">
                    <div class="common_select_frame">
                        <select name="importance">
                            <option value="0">普通</option>
                            <option value="1">重要</option>
                            <option value="2">非常重要</option>
                        </select>
                    </div>
                </td>

                <th class="common_th">关联项目:</th>

                <td class="common_condition_select_frame">
                    <div class="common_select_frame">
                        <select name="associatedProject" id="">
                            <option value="0">无</option>
                        </select>
                    </div>
                </td>

                <th class="common_th">预归档到:</th>

                <td class="common_condition_select_frame">
                    <div class="common_select_frame">
                        <select name="preArchiving">
                            <option value="0">无</option>
                        </select>
                    </div>
                </td>
            </tr>

            <tr>
                <th class="th_title" nowrap="nowrap">流程:</th>
                <td>
                    <div class="common_input_frame">
                        <input type="text" value="" name="flow" placeholder="<点击新建流程>">
                    </div>
                </td>
                <td class="condition_select_frame">
                    <div class="common_select_frame">
                        <input type="button" value="编辑流程">
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
                            <input type="radio" id="radioall" name="track" value="1" checked="checked">全部人员
                        </label>
                        <label for="radiopart">
                            <input type="radio" id="radiopart" name="track" value="2">指定人员
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
            <td class="tlabel">标题：</td>
            <td colspan="5">
                <input class="forminput inputstyle inputadress" type="text" name="textTitle" value="" required>
            </td>
        </tr>

        <tr>
            <td class="tlabel">文号：</td>
            <td>
                <input class="forminput inputstyle" type="text" name="textNumber" value="" required>
            </td>
            <td class="tlabel">密级：</td>
            <td>
                <select class="select swidth" name="rank" data-value="0" required>
                    <option value="0">请选择</option>
                    <option value="1">普通公文</option>
                    <option value="2">秘密公文</option>
                    <option value="3">机密公文</option>
                    <option value="4">绝密公文</option>
                </select>
            </td>
            <td class="tlabel">标识：</td>
            <td>
                <select class="select swidth" name="identification" data-value="0" required>
                    <option value="0">请选择</option>
                    <option value="1">上行文</option>
                    <option value="2">下行文</option>
                    <option value="3">平行文</option>
                    <option value="4">内部行文</option>
                    <option value="5">外部行文</option>
                    <option value="6">其它</option>
                </select>
            </td>
        </tr>

        <tr>
            <td class="tlabel">拟稿部门：</td>
            <td>
                <select class="select swidth" name="draftingDepartment" data-value="0" required>
                    <option value="0">请选择</option>
                    <option value="1">办公室</option>
                    <option value="2">组织人事部</option>
                    <option value="3">党群工作部</option>
                    <option value="4">生产经营部</option>
                    <option value="5">财务管理部</option>
                    <option value="6">企业管理部</option>
                    <option value="7">内控审计部</option>
                    <option value="8">安全管理部</option>
                    <option value="9">纪委监督部</option>
                </select>
            </td>
            <td class="tlabel">拟稿人：</td>
            <td><input type="text" class="forminput inputstyle" name="draftedPerson" value="" required></td>
            <td class="tlabel">核稿人：</td>
            <td><input type="text" class="forminput inputstyle" name="nuclearDrafts" value="" required></td>
        </tr>

        <tr>
            <td class="tlabel">签发：</td>
            <td><input type="text" class="forminput inputstyle" name="issue" value="" required></td>
            <td class="tlabel">会签：</td>
            <td colspan=""><input type="text" class="forminput inputstyle" name="countersign" value="" required></td>
            <td class="tlabel">保存期限：</td>
            <td>
                <select class="select swidth" name="storageLife" data-value="0" required>
                    <option value="0">请选择</option>
                    <option value="1">10年</option>
                    <option value="2">30年</option>
                    <option value="3">永久</option>
                </select>
            </td>
        </tr>

        <tr>
            <td class="tlabel">主题词：</td>
            <td colspan="5"><input type="text" class="forminput inputstyle inputadress" name="thematicWords" value=""
                                   required>
            </td>
        </tr>

        <tr>
            <td class="tlabel">主送：</td>
            <td colspan="5"><input type="text" class="forminput inputstyle inputadress" name="mainGive" value=""></td>
        </tr>

        <tr>
            <td class="tlabel">抄送：</td>
            <td colspan="5"><input type="text" class="forminput inputstyle inputadress" name="copyGive" value=""></td>
        </tr>

        <tr>
            <td class="tlabel">内容：</td>
            <td colspan="5"><textarea rows="10" name="content"
                                      style=" resize:none;width: 95%;margin: 10px 0; border: 1px #bdbdbd solid;padding:5px;font-size: 14px;height: 106px;"></textarea>
            </td>
        </tr>

        <tr>
            <td class="tlabel">印制：</td>
            <td><input type="text" class="forminput inputstyle" value="" name="print" id="print" required></td>
            <td class="tlabel">校对：</td>
            <td><input type="text" class="forminput inputstyle" value="" name="proofreading" id="proofreading" required>
            </td>
            <td class="tlabel">份数：</td>
            <td><input readonly="readonly" value="" name="attachmentNumber"></td>
        </tr>

        <tr>
            <td class="tlabel">附件上传：</td>
            <td colspan="5">
                <input type="file" name="attachment" value="">
            </td>
        </tr>

        </tbody>

    </table>
</form>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script>
    //保存待发
    $("#preservationPending").on("click", function () {
        var formTitle = $("#formTitle").val();
        if ($.trim(formTitle) == '') {
            alert("标题不能为空！")
        } else {
            $("#formState").val("1");
            $.ajax({
                cache: true,
                type: "POST",
                // url: '/document/preservationPending',
                url: 'http://47.105.114.70/document/preservationPending',
                data: $("#oaDocumentProcessing").serialize(),
                error: function (request) {
                    alert("Connection error");
                },
                success: function (result) {
                    if (result == "success") {
                        window.location.href = "primedDocument.do";
                    } else {
                        alert("保存失败")
                    }
                }
            })
        }

    });

    //跟踪选择切换
    var flag = false;

    function choice() {
        $("#radioall").attr("checked", flag);
        flag = !flag;
    }
</script>
</html>

