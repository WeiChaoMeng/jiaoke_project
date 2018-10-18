<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();

    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>合同档案</title>
    <link href="/static/js/datepicker/css/bootstrap-datepicker.css" rel="stylesheet">

    <style>
        * {
            font-size: 12px;
            border: 0;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: '微软雅黑';
            margin: 0 auto;
            /*min-width: 980px;*/
        }

        .contract-new-page {
            width: 735px;
            margin: 0 auto;
            height: auto;
            margin-top: 20px;
        }

        .contract-block-title {
            text-align: left;
            font-size: 17px;
            font-weight: 500;
            margin-bottom: 10px;
            text-decoration: none;
        }

        .contract-form {
            width: 100%;
            padding: 0;
            border: 0;
            float: left;
            margin-bottom: 30px;
        }

        .contract-form-title {
            text-align: right;
            float: left;
            font-size: 14px;
            width: 20%;
            padding-top: 9px;
        }

        .contract-form-title i {
            color: red;
            font-style: normal;
            float: right;
            margin-right: 3px;
        }

        .contract-form-title span {
            float: right;
            margin-right: 3px;
        }

        .contract-form-input {
            padding-left: 10px;
            width: 70%;
            float: left;
        }

        .contract-form-input input {
            width: 60%;
            height: 30px;
            padding: 6px 12px;
            font-size: 12px;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            overflow: auto;
            line-height: 20px;
            outline: none;
        }
    </style>
</head>
<body>
<form action="/contractArchives/add" id="oaContractArchives" name="oaContractArchives" method="post">
    <!-- 表单内容 -->
    <div class="contract-new-page">
        <div class="contract-block-title">
            <span>表单内容:</span>
        </div>
        <div class="contract-form">
            <label class="contract-form-title">
                <span>:</span>
                <span>编号</span>
                <i>*</i>
            </label>
            <div class="contract-form-input">
                <input type="text" name="serialNumber" value="" required>
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>:</span>
                <span>标题</span>
                <i>*</i>
            </label>
            <div class="contract-form-input">
                <input type="text" name="title" value="" required>
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>:</span>
                <span>摘要</span>
                <i>*</i>
            </label>
            <div class="contract-form-input">
                <input type="text" name="archivesAbstract" value="" required>
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>:</span>
                <span>经手人</span>
                <i>*</i>
            </label>
            <div class="contract-form-input">
                <input type="text" name="operator" value="" required>
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>:</span>
                <span>签署单位</span>
                <i>*</i>
            </label>
            <div class="contract-form-input">
                <input type="text" name="signingUnit" value="" required>
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>:</span>
                <span>签署时间</span>
                <i>*</i>
            </label>
            <div class="contract-form-input">
                <input type="text" name="signingDate" value="" class="forminput" id="start" required>
            </div>
        </div>

        <div id="editor">
            <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
        </div>
        <div style="text-align: center;padding-top: 20px;">
            <input type="hidden" name="richText" value="" id="editorHTNL">
            <input type="button" value="返回"
                   style="margin-right:20px;padding: 7px 20px; background: #92ebff;border: 1px #a5a5a5 solid;"
                   onclick="javascript:history.back()">
            <input type="submit" value="提交" style="padding: 7px 20px; background: #92ebff;border: 1px #a5a5a5 solid;">
        </div>

    </div>
</form>
</body>

<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/static/js/datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
<script type="text/javascript" src="../../../../static/editor/release/wangEditor.min.js"></script>
<script type="text/javascript">
    var E = window.wangEditor;
    var editor = new E('#editor');
    // 或者 var editor = new E( document.getElementById('editor') )
    // editor.customConfig.uploadImgShowBase64 = true;   // 使用 base64 保存图片
    // editor.customConfig.uploadImgServer = '/upload'  // 上传图片到服务器

    // 自定义菜单配置
    editor.customConfig.menus = [
        'head',  // 标题
        'bold',  // 粗体
        'fontSize',  // 字号
        'fontName',  // 字体
        'italic',  // 斜体
        'underline',  // 下划线
        'strikeThrough',  // 删除线
        'foreColor',  // 文字颜色
        'backColor',  // 背景颜色
        'link',  // 插入链接
        'list',  // 列表
        'justify',  // 对齐方式
        // 'quote',  // 引用
        'emoticon',  // 表情
        'image',  // 插入图片
        'table',  // 表格
        // 'video',  // 插入视频
        // 'code',  // 插入代码
        'undo',  // 撤销
        'redo'  // 重复
    ];

    // 限制一次最多上传 1 张图片
    editor.customConfig.uploadImgMaxLength = 1;

    editor.customConfig.customUploadImg = function (files, insert) {
        // files 是 input 中选中的文件列表
        // insert 是获取图片 url 后，插入到编辑器的方法
        var formData = new FormData();
        formData.append('file', files[0]);
        $.ajax({
            type: "POST",
            url: '/uploadPic/uploadImg',
            // url: 'http://47.105.114.70/uploadPic/uploadImg',
            // data: {"file": files},
            data: formData,
            async: true,
            cache: false,
            contentType: false,    //不可缺
            processData: false,    //不可缺
            success: function (ret) {
                if (ret.message == "success") {
                    alert("成功");
                    // 上传代码返回结果之后，将图片插入到编辑器中
                    insert(ret.imageFilePaths);
                    $("#editorHTNL").val(editor.txt.html());
                } else {
                    alert("失败");
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("上传失败，请检查网络后重试");
            }
        });
    };


    editor.create();

    /* document.getElementById('btn1').addEventListener('click', function () {
         // 读取 html
         alert(editor.txt.html())
     }, false);

     document.getElementById('btn2').addEventListener('click', function () {
         // 读取 text
         alert(editor.txt.text())
     }, false);*/

    /*function addFrom(formId) {
        console.log(editor.txt.html());
        $("#editorHTNL").val(editor.txt.html());
        $.ajax({
            type: "post",
            url: '/contractArchives/add',
            // url: 'http://47.105.114.70/contractArchives/add',
            data: $("#" + formId).serialize(),
            async: false,
            error: function (request) {
                alert("Connection error");
            },
            success: function (data) {

            }
        });
    }*/

    //日期选择器
    $("#start").datepicker({
        "language": "zh-CN",
        "format": 'yyyy-mm-dd'
    });
    $("#end").datepicker({
        "language": "zh-CN",
        "format": 'yyyy-mm-dd'
    });
    $(".date .iconfont").click(function () {
        $(this).prev().trigger("focus");
    });

    $('select.select').select();
</script>
</html>