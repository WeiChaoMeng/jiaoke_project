<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改公司收文</title>
    <link href="../../../../../../static/js/datepicker/css/bootstrap-datepicker.css" rel="stylesheet">
    <link href="../../../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
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

        .contract-form-input input, select {
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
<form action="${path}/receiveDocument/edit" name="oaReceiveDocument" method="post">
    <!-- 表单内容 -->
    <div class="contract-new-page">
        <div class="contract-block-title">
            <span>表单内容:</span>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>:</span>
                <span>收文时间</span>
                <i>*</i>
            </label>
            <div class="contract-form-input">
                <input type="text" name="receiveDateStr" value="${oaReceiveDocument.receiveDateStr}" class="forminput"
                       id="datePicker" readonly="readonly"
                       required>
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>:</span>
                <span>收文编号</span>
                <i>*</i>
            </label>
            <div class="contract-form-input">
                <input type="hidden" name="id" value="${oaReceiveDocument.id}">
                <input type="text" name="documentNumber" value="${oaReceiveDocument.documentNumber}" required>
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>:</span>
                <span>来文字号</span>
                <i>*</i>
            </label>
            <div class="contract-form-input">
                <input type="text" name="documentReceivedNumber" value="${oaReceiveDocument.documentReceivedNumber}"
                       required>
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>:</span>
                <span>标题</span>
                <i>*</i>
            </label>
            <div class="contract-form-input">
                <input type="text" name="documentName" value="${oaReceiveDocument.documentName}" required>
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>:</span>
                <span>备注</span>
                <i>*</i>
            </label>
            <div class="contract-form-input">
                <input type="text" name="remarks" value="${oaReceiveDocument.remarks}" required>
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>:</span>
                <span>文件类别</span>
                <i>*</i>
            </label>
            <div class="contract-form-input">
                <select name="publishingDepartment">
                    <c:choose>
                        <c:when test="${oaReceiveDocument.publishingDepartment == 0}">
                            <option value="0" selected="selected">安全管理部</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0">安全管理部</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaReceiveDocument.publishingDepartment == 1}">
                            <option value="1" selected="selected">办公室</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1">办公室</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaReceiveDocument.publishingDepartment == 2}">
                            <option value="2" selected="selected">财务管理部</option>
                        </c:when>
                        <c:otherwise>
                            <option value="2">财务管理部</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaReceiveDocument.publishingDepartment == 3}">
                            <option value="3" selected="selected">纪检监察部</option>
                        </c:when>
                        <c:otherwise>
                            <option value="3">纪检监察部</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaReceiveDocument.publishingDepartment == 4}">
                            <option value="4" selected="selected">企业管理部</option>
                        </c:when>
                        <c:otherwise>
                            <option value="4">企业管理部</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaReceiveDocument.publishingDepartment == 5}">
                            <option value="5" selected="selected">生产经营部</option>
                        </c:when>
                        <c:otherwise>
                            <option value="5">生产经营部</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaReceiveDocument.publishingDepartment == 6}">
                            <option value="6" selected="selected">组织人事部</option>
                        </c:when>
                        <c:otherwise>
                            <option value="6">组织人事部</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaReceiveDocument.publishingDepartment == 7}">
                            <option value="7" selected="selected">建材集团党发</option>
                        </c:when>
                        <c:otherwise>
                            <option value="7">建材集团党发</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaReceiveDocument.publishingDepartment == 8}">
                            <option value="8" selected="selected">建材集团工会发</option>
                        </c:when>
                        <c:otherwise>
                            <option value="8">建材集团工会发</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaReceiveDocument.publishingDepartment == 9}">
                            <option value="9" selected="selected">共青团发</option>
                        </c:when>
                        <c:otherwise>
                            <option value="9">共青团发</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaReceiveDocument.publishingDepartment == 10}">
                            <option value="10" selected="selected">市政路桥集团发</option>
                        </c:when>
                        <c:otherwise>
                            <option value="10">市政路桥集团发</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${oaReceiveDocument.publishingDepartment == 11}">
                            <option value="11" selected="selected">其他收文</option>
                        </c:when>
                        <c:otherwise>
                            <option value="11">其他收文</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </div>
        </div>

        <div id="editor">
            ${oaReceiveDocument.richText}
        </div>
        <div style="text-align: center;padding-top: 20px;">
            <input type="hidden" name="richText" value="" id="editorHTNL">
            <input type="submit" id="submit" value="提交"
                   style="padding: 7px 20px; background: #92ebff;border: 1px #a5a5a5 solid;">
            <input type="button" value="返回"
                   style="margin-left:20px;padding: 7px 20px; background: #92ebff;border: 1px #a5a5a5 solid;"
                   onclick="javascript:history.back()">
        </div>

    </div>
</form>
</body>

<script type="text/javascript" src="../../../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../../../static/js/date_pickers/jquery.date_input.pack.js"></script>
<!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
<script type="text/javascript" src="../../../../../../static/editor/release/wangEditor.min.js"></script>
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
            url: '${path}/uploadPic/uploadImg',
            data: formData,
            async: true,
            cache: false,
            contentType: false,    //不可缺
            processData: false,    //不可缺
            success: function (ret) {
                if (ret.message == "success") {
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

    $("#submit").on('click', function () {
        $("#editorHTNL").val(editor.txt.html());
    });

    editor.create();

    //日期选择器
    $(function () {
        $('#datePicker').date_input();
    });
</script>
</html>