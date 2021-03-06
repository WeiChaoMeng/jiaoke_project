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
    <title>新建环评监测报告</title>
    <link type="text/css" rel="stylesheet" href="../../../../../../static/css/oa/office-archives-style.css">
    <link type="text/css" rel="stylesheet" href="../../../../../../static/js/jeDate/skin/jedate.css">
</head>
<body>
<form id="oaEiaMonitor">
    <!-- 表单内容 -->
    <div class="contract-new-page">
        <div class="contract-block-title">
            <span>表单内容</span>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>报告编号</span>
            </label>
            <div class="contract-form-input">
                <input type="text" name="reportNumber" autocomplete="off">
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>样品名称</span>
                <i>*</i>
            </label>
            <div class="contract-form-input">
                <input type="text" name="sampleName" id="sampleName" autocomplete="off">
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>检测单位</span>
            </label>
            <div class="contract-form-input">
                <input type="text" name="testingCompany" autocomplete="off">
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>检测日期</span>
            </label>
            <div class="contract-form-input">
                <input type="text" name="testingDateStr" class="je-date" readonly>
            </div>
        </div>

        <div id="editor">
            <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
        </div>
        <div style="text-align: center;padding-top: 20px;">
            <input type="hidden" name="richText" value="" id="editorHTNL">
            <input type="button" value="提交" onclick="commitForm()" class="confirm-btn-style">
            <input type="button" value="返回" onclick="returnPrev()" class="cancel-btn-style left-spacing">
        </div>

    </div>
</form>
</body>

<script type="text/javascript" src="../../../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../../../static/js/jeDate/src/jedate.js"></script>
<script src="../../../../../../static/js/oa/layer/layer.js"></script>
<!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
<script type="text/javascript" src="../../../../../../static/editor/release/wangEditor.min.js"></script>
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
        'emoticon',  // 表情
        'image',  // 插入图片
        'table',  // 表格
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
                    window.top.tips("出错！", 6, 2, 1000);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                window.top.tips("上传失败，请检查网络后重试！", 6, 2, 1000);
            }
        });
    };

    $("#submit").on('click', function () {
        $("#editorHTNL").val(editor.txt.html());
    });

    editor.create();

    //申请时间选择器
    jeDate(".je-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,                    //是否显示节日
        isinitVal: true,                    //是否初始化
        isTime: false,                        //是否开启时间选择
        isClear: false,                      //是否显示清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    //记录上页
    var prevNum = JSON.parse('${prev}');

    function commitForm() {
        if ($.trim($("#sampleName").val()) === '') {
            top.window.tips("样品名称为必填项", 6, 5, 1500);
        } else {
            $.ajax({
                type: "POST",
                url: '${path}/eiaMonitor/add',
                data: $('#oaEiaMonitor').serialize(),
                error: function (request) {
                    window.top.tips("出错！", 6, 2, 1000);
                },
                success: function (data) {
                    var result = JSON.parse(data);
                    if (result === "success") {
                        window.top.tips("提交成功！", 0, 1, 1000);
                        window.location.href = '${path}/eiaMonitor/toEiaMonitor?page=' + prevNum;
                    } else {
                        window.top.tips("提交失败！", 0, 2, 1000);
                    }
                }
            })
        }
    }

    function returnPrev() {
        window.location.href = '${path}/eiaMonitor/toEiaMonitor?page=' + prevNum;
    }
</script>
</html>