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
    <meta charset="UTF-8">
    <title>图片上传</title>
    <!-- 引用控制层插件样式 -->
    <link rel="stylesheet" href="../upload/control/css/zyUpload.css" type="text/css">
    <link href="../../../../static/../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <script src="../../../../static/../static/js/jquery.min.js"></script>
    <!-- 引用核心层插件 -->
    <script src="../upload/core/zyFile.js"></script>
    <!-- 引用控制层插件 -->
    <script src="../upload/control/js/zyUpload.js"></script>
    <!-- 引用初始化JS -->
    <script src="../upload/core/lanrenzhijia.js"></script>

</head>
<body>
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
            <input type="text">
        </div>
    </div>

    <div class="contract-form">
        <label class="contract-form-title">
            <span>:</span>
            <span>标题</span>
            <i>*</i>
        </label>
        <div class="contract-form-input">
            <input type="text">
        </div>
    </div>

    <div class="contract-form">
        <label class="contract-form-title">
            <span>:</span>
            <span>摘要</span>
            <i>*</i>
        </label>
        <div class="contract-form-input">
            <input type="text">
        </div>
    </div>

    <div class="contract-form">
        <label class="contract-form-title">
            <span>:</span>
            <span>经手人</span>
            <i>*</i>
        </label>
        <div class="contract-form-input">
            <input type="text">
        </div>
    </div>

    <div class="contract-form">
        <label class="contract-form-title">
            <span>:</span>
            <span>签署单位</span>
            <i>*</i>
        </label>
        <div class="contract-form-input">
            <input type="text">
        </div>
    </div>

    <div class="contract-form">
        <label class="contract-form-title">
            <span>:</span>
            <span>签署时间</span>
            <i>*</i>
        </label>
        <div class="contract-form-input">
            <input type="text">
        </div>
    </div>

    <!-- 上传图片-->
    <div class="contract-block-title">
        <span>上传图片:</span>
    </div>
    <div id="demo" class="demo"></div>
</div>

</body>
</html>