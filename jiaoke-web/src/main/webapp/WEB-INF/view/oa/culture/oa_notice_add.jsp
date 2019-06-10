<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
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
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>新建公告</title>
    <!-- 引用控制层插件样式 -->
    <link href="../../../../static/css/oa/oa_news_center.css" rel="stylesheet" type="text/css">

</head>
<body>
<form id="oaNotice" style="width: 90%;margin: 0 auto;">
    <div style="width: 100%;height: 40px;text-align: center;line-height: 40px;">
        <span style="font-size: 18px;border: 1px solid #d8d4d4;border-bottom: none;border-radius:10px 10px 0 0;">新建公告</span>
    </div>
    <table class="form_table" style="width: 100%;">

        <tbody>

        <tr>
            <td class="table_td">公告标题：</td>
            <td colspan="4" class="table_content">
                <input type="text" class="form_input" name="title" id="title" autocomplete="off">
            </td>

            <td class="table_td">发布日期：</td>
            <td class="table_content">
                <input type="text" class="form_input" name="releaseDateStr"
                       value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" readonly="readonly">
            </td>
        </tr>

        <tr>
            <td class="table_td">发布部门：</td>
            <td class="table_content">
                <input type="text" class="form_input" name="releaseDepartment" value="${userInfo.department}"
                       readonly="readonly">
            </td>

            <td class="table_td">发布人：</td>
            <td class="table_content">
                <input type="text" class="form_input" name="publisher" value="${userInfo.nickname}" readonly="readonly">
            </td>

            <td class="table_td">摘要：</td>
            <td colspan="2" class="table_content">
                <input type="text" class="form_input" name="summary" id="summary" autocomplete="off">
            </td>
        </tr>

    </table>

    <div id="editor" style="width: 100%;margin: 20px 0">
        <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
    </div>

    <div class="form_but">
        <input type="hidden" name="richText" value="" id="editorHTNL">
        <input type="button" class="return-but-inp" value="返回" onclick="previousPage()">
        <input type="button" class="commit-but-inp" value="提交" onclick="commit()">
        <input type="hidden" id="page"/>
    </div>

    </tbody>
</form>

</body>

<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/editor/release/wangEditor.min.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
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
                    layer.msg("失败");
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("上传失败，请检查网络后重试");
            }
        });
    };

    editor.create();

    //设置当前页
    var currentPageNum = JSON.parse('${currentPage}');
    $('#page').val(currentPageNum);

    //返回上一页
    function previousPage() {
        window.location.href = "${path}/notice/toIndex?page=" + $('#page').val();
    }

    //提交from
    function commit() {
        if ($.trim($('#title').val()) === '') {
            layer.msg('标题不可以为空！')
        } else if ($.trim($('#summary').val()) === '') {
            layer.msg('摘要不可以为空！')
        } else {
            $("#editorHTNL").val(editor.txt.html());

            $.ajax({
                type: "POST",
                url: '${path}/notice/add',
                data: $('#oaNotice').serialize(),
                async: false,
                error: function (request) {
                    layer.msg("连接错误！");
                },
                success: function (data) {
                    var result = JSON.parse(data);
                    if (result === "success") {
                        layer.msg("添加成功！");
                        window.location.href = "${path}/notice/toIndex?page=1";
                    } else {
                        layer.msg('添加失败！');
                    }
                }
            })
        }
    }

</script>
</html>