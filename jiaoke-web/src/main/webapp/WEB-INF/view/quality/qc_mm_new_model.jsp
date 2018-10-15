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
    <title>新建模板</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <link href="/static/js/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
</head>

<body style="padding:15px 8px 0px 8px;">
    <form>
        <table class="formtable">

            <tbody>

                <tr>
                    <td class="tlabel">配比名称：</td>
                    <td colspan="3"><input type="text" class="forminput inputstyle" style="width: 72%;" value="孙中山"></td>
                </tr>

                <tr>
                    <td class="tlabel">1#仓：</td>
                    <td><input type="text" class="forminput inputstyle" value="孙中山"></td>
                    <td class="tlabel">2#仓：</td>
                    <td><input type="text" class="forminput inputstyle" value="孙中山"></td>
                </tr>

                <tr>
                    <td class="tlabel">3#仓：</td>
                    <td>
                        <input type="text" class="forminput inputstyle" value="孙中山">
                    </td>
                    <td class="tlabel">4#仓：</td>
                    <td>
                        <input type="text" class="forminput inputstyle" value="sunzhongshan">
                    </td>
                </tr>

                <tr>
                    <td class="tlabel">5#仓：</td>
                    <td>
                        <input type="text" class="forminput inputstyle" value="孙中山">
                    </td>
                    <td class="tlabel">6#仓：</td>
                    <td>
                        <input type="text" class="forminput inputstyle" value="sunzhongshan">
                    </td>
                </tr>

                <tr>
                    <td class="tlabel">矿粉：</td>
                    <td>
                        <input type="text" class="forminput inputstyle" value="孙中山">
                    </td>
                    <td class="tlabel">油石比：</td>
                    <td>
                        <input type="text" class="forminput inputstyle" value="sunzhongshan">
                    </td>
                </tr>


                <tr>
                    <td class="tlabel">沥青加热温度：</td>
                    <td>
                        <input type="text" class="forminput inputstyle" value="18652072457">
                    </td>
                    <td class="tlabel">骨料加热温度：</td>
                    <td>
                        <input type="text" class="forminput inputstyle" value="025-85423587">
                    </td>
                </tr>

                <tr>
                    <td class="tlabel">混合料出厂温度：</td>
                    <td>
                        <input type="text" class="forminput inputstyle" value="18652072457">
                    </td>
                    <td class="tlabel">铣刨料加热温度：</td>
                    <td>
                        <input type="text" class="forminput inputstyle" value="025-85423587">
                    </td>
                </tr>

                <tr>
                    <td class="tlabel">再生料：</td>
                    <td>
                        <select class="select swidth" name="state" data-value="0">
                            <option value="0">请选择</option>
                            <option value="1">1号再生料</option>
                            <option value="2">2号再生料</option>
                            <option value="3">3号再生料</option>
                        </select>
                    </td>
                    <td class="tlabel">再生料比：</td>
                    <td>
                        <input type="text" class="forminput inputstyle" value="2%">
                    </td>
                </tr>


                <tr>
                    <td class="tlabel">添加剂：</td>
                    <td>
                        <select class="select swidth" name="state" data-value="0">
                            <option value="0">请选择</option>
                            <option value="1">1号添加剂</option>
                            <option value="2">2号添加剂</option>
                            <option value="3">3号添加剂</option>
                        </select>
                    </td>
                    <td class="tlabel">添加剂比：</td>
                    <td>
                        <input type="text" class="forminput inputstyle" value="2%">
                    </td>
                </tr>

            </tbody>

        </table>

        <div class="formbtn">
            <input type="button" value="保存" class="btnsave">
            <input type="button" value="重置" class="btncancel">
        </div>

    </form>
</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>
<script type="text/javascript" src="/static/js/jquery.select.js"></script>
<script type="text/javascript" charset="utf-8" src="/static/js/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/static/js/umeditor/umeditor.min.js"></script>
<script type="text/javascript" src="/static/js/umeditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    var state = UM.getEditor('editor-state');
    state.setWidth("99.91%");
    $(".edui-body-container").css("width", "99.91%");
    $('select.select').select();
</script>

</html>