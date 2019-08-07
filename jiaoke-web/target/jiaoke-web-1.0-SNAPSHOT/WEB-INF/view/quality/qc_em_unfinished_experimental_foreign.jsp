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
    <title>取样管理</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/qc/sample_management.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet" href="/static/css/qc/zxf_page.css">
</head>

<body style="padding:10px; ">

<div class="yyui_tab">
    <ul>
        <li class="yyui_tab_title_this">未完实验<span class="yyui_badge" id="experimentalCount">99+</span></li>
    </ul>

    <div class="yyui_tab_content_this">
        <div class="boxdown">
            <table class="simpletable"  style="border-top:none; text-align: center;table-layout: fixed;word-break: break-all;" id="proExcel">

                <thead>
                    <tr>
                        <th style="text-align:center;">实验编号</th>
                        <th style="text-align:center;">委托单编号</th>
                        <th style="text-align:center;">材料名称</th>
                        <th style="text-align:center;">所属厂家</th>
                        <th style="text-align:center;">取样时间</th>
                        <th style="text-align:center;">实验时间</th>
                        <th style="text-align:center;">实验状态</th>
                        <th style="text-align:center;">操作</th>
                    </tr>
                </thead>

                <tbody id="experimentalItemData">
                    <tr>
                        <td>01</td>
                        <td>01</td>
                        <td>沥青</td>
                        <td>北京市政路桥建材集团有限公司路驰分公司</td>
                        <td>2019/6/26</td>
                        <td>2019/6/26</td>
                        <td>未完成</td>
                        <td>
                            <a href="javascript:;" style="color: rgb(114, 112, 209);">查看</a>
                            <a href="javascript:;" style="color: rgb(114, 112, 209);">删除</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="zxf_pagediv"></div>
    </div>

    <%--委托单信息弹出--%>
    <div class="yyui_tab_content" id="layer_out">
        <form  class="bootstrap-frm" style="    border: none;">
            <h1>委托单
                <span>order ticket detailed information.</span>
            </h1>
            <label>
                <span>委托编号 :</span>
                <input type="text" id="order_ticket_num" placeholder="填写吨数" readonly="readonly"  />
            </label>
            <label>
                <span>材料 :</span>
                <input type="text" id="material"  placeholder="填写吨数" readonly="readonly"  />
            </label>
            </label>
            <label>
                <span>厂家 :</span>
                <input type="text" id="manufacturers"  placeholder="填写吨数" readonly="readonly"  />
            </label>
            </label>
            <label>
                <label>
                    <span>规格 :</span>
                    <input type="text" id="specification" name="tunnage" placeholder="填写吨数" readonly="readonly"  />
                </label>
            </label>
            <label>
                <span>代表吨数 :</span>
                <input type="number" id="tunnage"  placeholder="填写吨数" readonly="readonly"  />
            </label>
            <label>
                <span>委托时间 :</span>
                <input type="text" id="creat_time"  readonly="readonly" placeholder="取样时间" />
            </label>
            <label id="experimentalItem">
                <span  >试验项目 :</span>
                <div style="width: 100%;padding: 10px 25%;"><input type="checkbox"  value="筛分试验 T0327-2005" style="-webkit-appearance:checkbox;"  disabled="true" /> 筛分试验 T0327-2005</div>
                    <div style="width: 100%;padding: 10px 25%;"><input type="checkbox"  value="表观密度 T0328-2005"  style="-webkit-appearance:checkbox;"  disabled="true" /> 表观密度 T0328-2005</div>
                        <div style="width: 100%;padding: 10px 25%;"> <input type="checkbox"  value="砂当量 T0334-2005"  style="-webkit-appearance:checkbox;"  disabled="true" /> 砂当量 T0334-2005</div>
            </label>
        </form>
    </div>

</div>
<input  id="path" value="${path}" type="hidden" >
</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/qc/zxf_page.js"></script>
<script type="text/javascript" src="/static/js/layer/layer.js"></script>
<script type="text/javascript" src="/static/js/qc/unfinished_experimental_foreign.js"></script>

</html>