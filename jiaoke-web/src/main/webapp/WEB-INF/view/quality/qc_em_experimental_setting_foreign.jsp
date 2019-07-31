<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>实验模板</title>
    <link href="/static/css/qc/sample_management.css" rel="stylesheet" type="text/css">
</head>
<body style="padding:30px; ">

<div class="yyui_tab">

    <div class="yyui_tab_content_this">
        <div class="experiment_infoboxleft" id="specification">
            <div class="experiment_boxtitle">
                <span>材料规格</span>
                <a href="javacript:void(0);" onclick="getSpecificationPage()">新建
                </a>
            </div>
            <ul class="experiment_textlist" id="specificationUl">


            </ul>
        </div>

        <div class="experiment_infoboxleft" id="manufacturers">
            <div class="experiment_boxtitle">
                <span>生产厂家</span>
                <a href="javacript:void(0);" onclick="getManufacturersPage()">新建
                </a>
            </div>
            <ul class="experiment_textlist" id="manufacturersUl">

            </ul>
        </div>
    </div>
</div>
<%--规格--%>
<div class="experiment_from_div" id="specificationFrom" style="display:none;">
    <div class="title">
        <span>新建规格</span>
    </div>

    <div class="title-msg">
        <span>请输入新建规格名称</span>
    </div>

    <form class="login-form" method="post" novalidate >
        <!--输入框-->
        <div class="input-content">
            <!--autoFocus-->
            <div>
                <input type="text" autocomplete="off" id="specificationInput"
                       placeholder="规格"  required/>
            </div>
        </div>
        <!--登入按钮-->
        <div style="text-align: center">
            <button type="button" class="enter-btn"  onclick="sendSpecificationFrom()">确定</button>
        </div>
    </form>

</div>
</div>
<%--厂家--%>
<div class="experiment_from_div" id="manufacturersFrom" style="display:none;">
    <div class="title">
        <span>新建厂家</span>
    </div>

    <div class="title-msg">
        <span>请输入新建材料厂家名称</span>
    </div>

    <form class="login-form" >
        <!--输入框-->
        <div class="input-content">
            <!--autoFocus-->
            <div>
                <input type="text" autocomplete="off" id="manufacturersInput"
                       placeholder="规格"  required/>
            </div>
        </div>
        <!--登入按钮-->
        <div style="text-align: center">
            <button type="button" class="enter-btn"  onclick="sendManufacturersFrom()">确定</button>
        </div>
    </form>

</div>
<%--修改方法--%>
<div class="experiment_from_div" id="updateFrom" style="display:none;">
    <div class="title">
        <span>修改内容</span>
    </div>

    <div class="title-msg">
        <span>请输入最新修改的内容</span>
    </div>

    <form class="login-form" method="post" novalidate >
        <!--输入框-->
        <div class="input-content">
            <!--autoFocus-->
            <div>
                <input type="hidden" autocomplete="off" id="id"
                      required/>
                <input type="hidden" autocomplete="off" id="tableName"
                        required/>
                <input type="text" autocomplete="off" id="newName"
                       placeholder="规格"  required/>
            </div>
        </div>
        <!--登入按钮-->
        <div style="text-align: center">
            <button type="button" class="enter-btn"  onclick="updateSpecificationOrManufacturers()">确定</button>
        </div>
    </form>

</div>
</div>
</div>
<input  id="path" value="${path}" type="hidden" >
</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/layer/layer.js"></script>
<script type="text/javascript" src="/static/js/qc/experimental_setting_foreign.js"></script>

</html>