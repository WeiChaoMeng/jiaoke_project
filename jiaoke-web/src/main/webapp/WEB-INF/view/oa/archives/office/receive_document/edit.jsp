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
    <link type="text/css" rel="stylesheet" href="../../../../../../static/css/oa/office-archives-style.css">
    <link type="text/css" rel="stylesheet" href="../../../../../../static/js/jeDate/skin/jedate.css">
</head>
<body>
<form id="oaReceiveDocument">
    <!-- 表单内容 -->
    <div class="contract-new-page">
        <div class="contract-block-title">
            <span>表单内容</span>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>收文时间</span>
            </label>
            <div class="contract-form-input">
                <input type="text" name="receiveDateStr" value="${oaReceiveDocument.receiveDateStr}" class="forminput je-date" readonly>
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>收文编号</span>
                <i>*</i>
            </label>
            <div class="contract-form-input">
                <input type="hidden" name="id" value="${oaReceiveDocument.id}">
                <input type="text" name="documentNumber" id="documentNumber" value="${oaReceiveDocument.documentNumber}" autocomplete="off">
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>来文字号</span>
            </label>
            <div class="contract-form-input">
                <input type="text" name="documentReceivedNumber" value="${oaReceiveDocument.documentReceivedNumber}"
                       autocomplete="off">
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>标题</span>
                <i>*</i>
            </label>
            <div class="contract-form-input">
                <input type="text" name="documentName" id="documentName" value="${oaReceiveDocument.documentName}" autocomplete="off">
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>备注</span>
            </label>
            <div class="contract-form-input">
                <input type="text" name="remarks" value="${oaReceiveDocument.remarks}" autocomplete="off">
            </div>
        </div>

        <div class="contract-form">
            <label class="contract-form-title">
                <span>文件类别</span>
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
            <input type="hidden" name="richText" id="editorHTNL">
            <input type="button" value="提交" onclick="commitForm()" class="confirm-btn-style">
            <input type="button" value="返回" onclick="returnPrev()" class="cancel-btn-style left-spacing">
        </div>

    </div>
</form>
</body>

<script type="text/javascript" src="../../../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../../../static/js/jeDate/src/jedate.js"></script>
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
        if ($.trim($("#documentNumber").val()) === '') {
            top.window.tips("收文编号为必填项", 6, 5, 1500);
        } else {
            if ($.trim($("#documentName").val()) === '') {
                top.window.tips("标题为必填项", 6, 5, 1500);
            } else {
                $.ajax({
                    type: "POST",
                    url: '${path}/receiveDocument/edit',
                    data: $('#oaReceiveDocument').serialize(),
                    error: function (request) {
                        window.top.tips("出错！", 6, 2, 1000);
                    },
                    success: function (data) {
                        var result = JSON.parse(data);
                        if (result === "success") {
                            window.top.tips("提交成功！", 0, 1, 1000);
                            window.location.href = '${path}/receiveDocument/toReceiveDocument?page=' + prevNum;
                        } else {
                            window.top.tips("提交失败！", 0, 2, 1000);
                        }
                    }
                })
            }
        }
    }

    function returnPrev() {
        window.location.href = '${path}/receiveDocument/toReceiveDocument?page=' + prevNum;
    }
</script>
</html>