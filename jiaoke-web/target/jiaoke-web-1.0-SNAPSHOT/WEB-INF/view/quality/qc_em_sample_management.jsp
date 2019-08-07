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
        <li id="sampleList"  class="yyui_tab_title_this">取样单<span class="yyui_badge" id="sampleCount">99+</span></li>
        <li class="yyui_tab_title" onclick="getFromData()">新建取样</li>
    </ul>

    <div class="yyui_tab_content_this">
        <div class="boxdown">
            <table class="simpletable"  style="border-top:none; text-align: center;table-layout: fixed;word-break: break-all;" id="proExcel">

                <thead>
                <tr>
                    <th style="text-align:center;">编号</th>
                    <th style="text-align:center;">材料名称</th>
                    <th style="text-align:center;">取样时间</th>
                    <th style="text-align:center;">所属厂家</th>
                    <th style="text-align:center;">规格</th>
                    <th style="text-align:center;">代表吨数</th>
                    <th style="text-align:center;">备注</th>
                    <th style="text-align:center;">状态</th>
                    <th style="text-align:center;">操作</th>
                </tr></thead>

                <tbody id="samplingData">
                    <tr>
                        <td>01</td>
                        <td>粗集料</td>
                        <td>2019/6/26</td>
                        <td>北京市政路桥建材集团有限公司路驰分公司</td>
                        <td>公路沥青路面施工技术规范</td>
                        <td>100t</td>
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
    <div class="yyui_tab_content">
        <form  class="bootstrap-frm">
            <h1>新建取样单
                <span>Please fill all the texts in the fields.</span>
            </h1>
            <label>
                <span>材料 :</span>
                <select  id="materials" name="materials">
                    <option value="Job Inquiry">Job Inquiry</option>
                    <option value="General Question">General Question</option>
                </select>
            </label>
            </label>
            <label>
                <span>厂家 :</span>
                <select id="manufacturers" name="manufacturers">
                    <option value="Job Inquiry">Job Inquiry</option>
                    <option value="General Question">General Question</option>
                </select>
            </label>
            </label>
            <label>
                <label>
                    <span>规格 :</span>
                    <select id="specification" name="specification">
                        <option value="Job Inquiry">Job Inquiry</option>
                    </select>
                </label>
            </label>
            <label>
                <span>代表吨数 :</span>
                <input type="number" id="tunnage" name="tunnage" placeholder="填写吨数" required />
            </label>
            <label>
                <span>取样时间 :</span>
                <input type="text" id="creat_time" name="creat_time" readonly="readonly" placeholder="取样时间" />
            </label>
            <label>
                <span>备注 :</span>
                <textarea  name="remark" id="remark" placeholder="取样相关备注信息"></textarea>
            </label>
            <label>
                <span>&nbsp;</span>
                <input type="button" onclick="addSample()" class="button" value="Send" />
            </label>
        </form>
    </div>

</div>
<input  id="path" value="${path}" type="hidden" >
</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/qc/zxf_page.js"></script>
<script type="text/javascript" src="/static/js/layer/layer.js"></script>
<script type="text/javascript" src="/static/js/qc/sample_management.js"></script>

</html>