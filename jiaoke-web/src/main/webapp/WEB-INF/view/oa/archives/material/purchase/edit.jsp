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
    <title>编辑原材料采购合同</title>
    <link href="../../../../../../static/css/oa/oa_archives_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
</head>
<body>
<div class="table-container">
    <form id="oaMaterialPurchase">
        <div class="table-title">
            <span>编辑原材料采购合同</span>
        </div>

        <table class="form-table">
            <tbody>
            <tr>
                <td class="table-td">合同编号：</td>
                <td class="table-content">
                    <input type="hidden" name="id" value="${oaMaterialPurchase.id}">
                    <input type="text" class="form-input" name="numbering" value="${oaMaterialPurchase.numbering}"
                           autocomplete="off">
                </td>

                <td class="table-td">合同名称：</td>
                <td class="table-content">
                    <input type="text" class="form-input" name="name" value="${oaMaterialPurchase.name}"
                           autocomplete="off">
                </td>
            </tr>

            <tr>
                <td class="table-td">供货商名称：</td>
                <td class="table-content">
                    <input type="text" class="form-input" name="supplier" value="${oaMaterialPurchase.supplier}"
                           autocomplete="off">
                </td>

                <td class="table-td">材料名称：</td>
                <td class="table-content">
                    <input type="text" class="form-input" name="material" value="${oaMaterialPurchase.material}"
                           autocomplete="off">
                </td>
            </tr>

            <tr>
                <td class="table-td">合同数量：</td>
                <td class="table-content">
                    <input type="text" class="form-input" name="number" value="${oaMaterialPurchase.number}"
                           autocomplete="off">
                </td>

                <td class="table-td">合同单价：</td>
                <td class="table-content">
                    <input type="text" class="form-input" name="unitPrice" value="${oaMaterialPurchase.unitPrice}"
                           autocomplete="off">
                </td>
            </tr>

            <tr>
                <td class="table-td">备注：</td>
                <td class="table-content">
                    <input type="text" class="form-input" name="remarks" value="${oaMaterialPurchase.remarks}"
                           autocomplete="off">
                </td>

                <td class="table-td">签订日期：</td>
                <td class="table-content">
                    <input type="text" class="form-input date_picker" name="signingDateStr"
                           value="${oaMaterialPurchase.signingDateStr}" onfocus="this.blur()">
                    <input type="hidden" name="richText" id="editorHTNL">
                </td>
            </tr>
        </table>

        <div id="editor" class="editor-container">
            ${oaMaterialPurchase.richText}
        </div>

        <div class="form-but">
            <button type="button" class="confirm-btn-style" onclick="commit()">提交</button>
            <button type="button" class="cancel-btn-style left-spacing" onclick="previousPage()">返回</button>
        </div>
    </form>
</div>
</body>

<script type="text/javascript" src="../../../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../../../static/editor/release/wangEditor.min.js"></script>
<script type="text/javascript" src="../../../../../../static/js/date_pickers/jquery.date_input.pack.js"></script>
<script src="../../../../../../static/js/oa/layer/layer.js"></script>
<script type="text/javascript">
    var E = window.wangEditor;
    var editor = new E('#editor');

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

    editor.create();

    //设置当前页
    var currentPageNum = JSON.parse('${currentPage}');

    //返回上一页
    function previousPage() {
        window.location.href = "${path}/materialPurchase/toIndex?page=" + currentPageNum;
    }

    //提交
    function commit() {
        $("#editorHTNL").val(editor.txt.html());

        $.ajax({
            type: "POST",
            url: '${path}/materialPurchase/edit',
            data: $('#oaMaterialPurchase').serialize(),
            error: function (request) {
                layer.msg("出错！");
            },
            success: function (result) {
                if (result === "success") {
                    layer.msg("成功");
                    window.location.href = "${path}/materialPurchase/toIndex?page=" + currentPageNum;
                } else {
                    layer.msg('失败');
                    $("#editorHTNL").val('');
                }
            }
        })
    }

    //日期选择器
    $(function () {
        $('.date_picker').date_input();
    });
</script>
</html>