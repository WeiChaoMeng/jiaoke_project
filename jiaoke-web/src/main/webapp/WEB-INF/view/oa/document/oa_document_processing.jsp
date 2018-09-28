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

<div class="top_toolbar">
    <div class="top_toolbar_inside">
        <a onmousemove="select_color(this)" onmouseout="unselected_color(this)">
            <i></i>
            <span>保存待发</span>
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
<div class="form_area">
    <table style="width: 100%">
        <tbody>
        <tr>
            <td rowspan="2" nowrap="nowrap">
                <a class="send_button">
                    <i class="iconfont" style="display: block;">&#xe764;</i>
                    <p>发送</p>
                </a>
            </td>

            <th nowrap="nowrap" class="th_title">标题:</th>

            <td>
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
            <td class="tlabel">标题：</td>
            <td colspan="5"><input type="text" class="forminput inputstyle inputadress"
                                   value="北京市政路桥建材集团有限公司关于印发《北京市政路桥建材集团有限公司xxx管理办法》的通知"></td>
        </tr>

        <tr>
            <td class="tlabel">文号：</td>
            <td><input type="text" class="forminput inputstyle" value="建材集团生发[2018]180号"></td>
            <td class="tlabel">密级：</td>
            <td>
                <select class="select swidth" name="state" data-value="0">
                    <option value="0">请选择</option>
                    <option value="1">普通公文</option>
                    <option value="2">秘密公文</option>
                    <option value="3">机密公文</option>
                    <option value="4">绝密公文</option>
                </select>
            </td>
            <td class="tlabel">标识：</td>
            <td>
                <select class="select swidth" name="state" data-value="0">
                    <option value="0">请选择</option>
                    <option value="1">上行文</option>
                    <option value="2">下行文</option>
                    <option value="3">平行文</option>
                    <option value="4">内部行文</option>
                    <option value="5">外部行文</option>
                </select>
            </td>
        </tr>

        <tr>
            <td class="tlabel">拟稿部门：</td>
            <td>
                <select class="select swidth" name="state" data-value="0">
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
            <td><input type="text" class="forminput inputstyle" value="XXX"></td>
            <td class="tlabel">核稿人：</td>
            <td><input type="text" class="forminput inputstyle" value="XXX"></td>
        </tr>

        <tr>
            <td class="tlabel">签发：</td>
            <td><input type="text" class="forminput inputstyle" value="孙中山"></td>
            <td class="tlabel">会签：</td>
            <td colspan=""><input type="text" class="forminput inputstyle" value="sunzhongshan"></td>
            <td class="tlabel">保存期限：</td>
            <td>
                <select class="select swidth" name="state" data-value="0">
                    <option value="0">请选择</option>
                    <option value="1">10年</option>
                    <option value="2">30年</option>
                    <option value="3">永久</option>
                </select>
            </td>
        </tr>

        <tr>
            <td class="tlabel">主题词：</td>
            <td colspan="5"><input type="text" class="forminput inputstyle inputadress" value="科技 示范 创建 活动 通知"></td>
        </tr>

        <tr>
            <td class="tlabel">主送：</td>
            <td colspan="5"><input type="text" class="forminput inputstyle inputadress" value="各单位"></td>
        </tr>

        <tr>
            <td class="tlabel">抄送：</td>
            <td colspan="5"><input type="text" class="forminput inputstyle inputadress" value="各领导,各部室"></td>
        </tr>

        <tr>
            <td class="tlabel">附件：</td>
            <td colspan="5"><input type="text" class="forminput inputstyle inputadress" value="北京市政路桥建材集团有限公司xxx管理办法">
            </td>
        </tr>

        <tr>
            <td class="tlabel">内容：</td>
            <td colspan="5"><input type="text" class="forminput inputstyle inputadress" value="详见附件"></td>
        </tr>

        <tr>
            <td class="tlabel">印制：</td>
            <td><input type="text" class="forminput inputstyle" value="办公室"></td>
            <td class="tlabel">校对：</td>
            <td><input type="text" class="forminput inputstyle" value="张三"></td>
            <td class="tlabel">份数：</td>
            <td>1</td>
        </tr>

        <tr>
            <td class="tlabel">附件上传：</td>
            <td colspan="5">
                <input type="file" name="啦啦啦" value="快快快">
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
</html>

