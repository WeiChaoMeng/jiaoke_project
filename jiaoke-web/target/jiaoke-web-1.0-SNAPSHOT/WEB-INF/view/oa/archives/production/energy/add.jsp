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
    <title>新增能源、碳排放统计</title>
    <link href="../../../../../../static/css/oa/oa_archives_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
</head>
<body>
<div class="table-container">
    <form id="oaProductionEnergy">
        <div class="table-title">
            <span>新建能源、碳排放统计</span>
        </div>

        <table class="form-table">
            <tbody>
            <tr>
                <td class="table-td-special">年份：</td>
                <td class="table-content">
                    <input type="text" class="form-input date_picker" name="yearStr" onfocus="this.blur()">
                </td>

                <td class="table-td-special">产量(吨)：</td>
                <td class="table-content">
                    <input type="text" class="form-input" name="yield" autocomplete="off">
                </td>
            </tr>

            <tr>
                <td class="table-td-special">产值(万元)：</td>
                <td class="table-content">
                    <input type="text" class="form-input" name="outputValue" autocomplete="off">
                </td>

                <td class="table-td-special">万元产值能耗(吨标准煤/万元)：</td>
                <td class="table-content">
                    <input type="text" class="form-input" name="productionConsume" autocomplete="off">
                </td>
            </tr>

            <tr>
                <td class="table-td-special">单位产品能耗(千克标准煤/吨)：</td>
                <td class="table-content">
                    <input type="text" class="form-input" name="productConsume" autocomplete="off">
                </td>

                <td class="table-td-special">天然气消耗量(万立方米)：</td>
                <td class="table-content">
                    <input type="text" class="form-input" name="gasConsume" autocomplete="off">
                </td>
            </tr>

            <tr>
                <td class="table-td-special">耗电量(万千瓦时)：</td>
                <td class="table-content">
                    <input type="text" class="form-input" name="powerConsumption" autocomplete="off">
                </td>

                <td class="table-td-special">单位产品碳排放量(千克二氧化碳/吨)：</td>
                <td class="table-content">
                    <input type="text" class="form-input" name="carbonEmission" autocomplete="off">
                    <input type="hidden" name="richText" id="editorHTNL">
                </td>
            </tr>
        </table>

        <div id="editor" class="editor-container">
            <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
        </div>

        <div class="form-but">
            <button type="button" class="return-but" onclick="previousPage()">返回</button>
            <button type="button" class="commit-but" onclick="commit()">提交</button>
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
        window.location.href = "${path}/productionEnergy/toIndex?page=" + currentPageNum;
    }

    //提交from
    function commit() {
        $("#editorHTNL").val(editor.txt.html());

        $.ajax({
            type: "POST",
            url: '${path}/productionEnergy/add',
            data: $('#oaProductionEnergy').serialize(),
            error: function (request) {
                layer.msg("出错！");
            },
            success: function (result) {
                if (result === "success") {
                    layer.msg("成功");
                    window.location.href = "${path}/productionEnergy/toIndex?page=1";
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