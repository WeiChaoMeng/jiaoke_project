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
    <title>新增档案</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
</head>
<body>
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
<form style="
    padding: 30px 50px 0 50px;
">
    <table class="personnel-archives">
        <tbody>
        <!--基本情况-->
        <tr>
            <td colspan="8" class="basic-situation">基本情况</td>
        </tr>
        <tr>
            <td class="form-field">所在部门：</td>
            <td class="form-content">
                <select class="select" data-value="0">
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
            <td class="form-field">职位名称：</td>
            <td class="form-content">
                <input type="text">
            </td>
            <td class="form-field">入职日期：</td>
            <td class="form-content">
                <input type="text">
            </td>
            <td class="form-field" style="background-color: #ffffff;" colspan="2" rowspan="6">
                <div style="border: 1px #000 solid;width: 107px;height: 120px;margin: 0 auto;background: #fbfbfb;">
                    <div id="image-holder" class="head-portrait"></div>
                </div>
                <div style="text-align:center;margin-top: 10px;">
                    <a href="javascript:;" class="file">选择文件
                        <input id="fileUpload" type="file" accept="image/jpeg,image/x-png"/>
                    </a>
                </div>
            </td>

        </tr>
        <tr>
            <td class="form-field">姓名：</td>
            <td class="form-content">
                <input type="text">
            </td>
            <td class="form-field">性别：</td>
            <td class="form-content">
                <input type="text">
            </td>
            <td class="form-field">名族：</td>
            <td class="form-content">
                <input type="text">
            </td>

        </tr>

        <tr>
            <td class="form-field">籍贯：</td>
            <td class="form-content">
                <input type="text">
            </td>
            <td class="form-field">学历：</td>
            <td class="form-content">
                <input type="text">
            </td>
            <td class="form-field">户口性质：</td>
            <td class="form-content">
                <input type="text">
            </td>
        </tr>
        <tr>
            <td class="form-field">政治面貌：</td>
            <td class="form-content">
                <input type="text">
            </td>
            <td class="form-field">婚姻状况：</td>
            <td class="form-content">
                <input type="text">
            </td>
            <td class="form-field">出生年月：</td>
            <td class="form-content">
                <input type="text">
            </td>
        </tr>
        <tr>
            <td class="form-field">身高：</td>
            <td class="form-content">
                <input type="text">
            </td>
            <td class="form-field">体重：</td>
            <td class="form-content">
                <input type="text">
            </td>
            <td class="form-field">血型：</td>
            <td class="form-content">
                <input type="text">
            </td>
        </tr>
        <tr>
            <td class="form-field">身份证号：</td>
            <td class="form-content">
                <input type="text">
            </td>
            <td class="form-field">邮箱：</td>
            <td class="form-content">
                <input type="text">
            </td>
            <td class="form-field">手机号：</td>
            <td class="form-content">
                <input type="text">
            </td>
        </tr>
        <tr>
            <td class="form-field">现居住地：</td>
            <td class="form-content" colspan="4">
                <input type="text">
            </td>
            <td class="form-field">邮政编码：</td>
            <td class="form-content">
                <input type="text">
            </td>
        </tr>
        <tr>
            <td class="form-field">籍贯地址：</td>
            <td class="form-content" colspan="4">
                <input type="text">
            </td>
            <td class="form-field">邮政编码：</td>
            <td class="form-content">
                <input type="text">
            </td>
        </tr>

        <!--教育情况-->
        <tr>
            <td colspan="8" class="basic-situation">教育经历（高中起）</td>
        </tr>
        <tr class="education-situation">
            <td class="form-field" colspan="2">起止日期</td>
            <td class="form-field" colspan="2">毕业学校</td>
            <td class="form-field" colspan="2">所学专业</td>
            <td class="form-field">证明人</td>
        </tr>
        <tr>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td class="form-content">
                <input type="text">
            </td>
        </tr>
        <tr>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td class="form-content">
                <input type="text">
            </td>
        </tr>
        <tr>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td class="form-content">
                <input type="text">
            </td>
        </tr>
        <tr>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td class="form-content">
                <input type="text">
            </td>
        </tr>

        <!--工作情况-->
        <tr>
            <td colspan="8" class="basic-situation">工作经历（最近三次工作）</td>
        </tr>
        <tr class="education-situation">
            <td class="form-field" colspan="2">起止日期</td>
            <td class="form-field" colspan="2">公司名称</td>
            <td class="form-field" colspan="2">职位</td>
            <td class="form-field">离职原因</td>
        </tr>
        <tr>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td class="form-content">
                <input type="text">
            </td>
        </tr>
        <tr>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td class="form-content">
                <input type="text">
            </td>
        </tr>
        <tr>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td class="form-content">
                <input type="text">
            </td>
        </tr>
        <!--社会关系-->
        <tr>
            <td colspan="8" class="basic-situation">社会关系（直系亲属）</td>
        </tr>
        <tr class="education-situation">
            <td class="form-field" colspan="2">姓名</td>
            <td class="form-field" colspan="1">关系</td>
            <td class="form-field" colspan="1">年龄</td>
            <td class="form-field" colspan="2">工作单位</td>
            <td class="form-field">联系方式</td>
        </tr>
        <tr>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td colspan="1" class="form-content">
                <input type="text">
            </td>
            <td colspan="1" class="form-content">
                <input type="text">
            </td>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td class="form-content">
                <input type="text">
            </td>
        </tr>
        <tr>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td colspan="1" class="form-content">
                <input type="text">
            </td>
            <td colspan="1" class="form-content">
                <input type="text">
            </td>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td class="form-content">
                <input type="text">
            </td>
        </tr>
        <tr>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td colspan="1" class="form-content">
                <input type="text">
            </td>
            <td colspan="1" class="form-content">
                <input type="text">
            </td>
            <td colspan="2" class="form-content">
                <input type="text">
            </td>
            <td class="form-content">
                <input type="text">
            </td>
        </tr>
        </tbody>
    </table>
</form>
<div class="confirm-button">
    <a>确认提交</a>
</div>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script>
    $("#fileUpload").on('change', function () {

        if (typeof (FileReader) != "undefined") {

            var image_holder = $("#image-holder");
            image_holder.empty();

            var reader = new FileReader();
            reader.onload = function (e) {
                $("<img />", {
                    "src": e.target.result,
                    "class": "thumb-image"
                }).appendTo(image_holder);

            }
            image_holder.show();
            reader.readAsDataURL($(this)[0].files[0]);
        } else {
            alert("你的浏览器不支持FileReader.");
        }
    });
</script>
</html>

