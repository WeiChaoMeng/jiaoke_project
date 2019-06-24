<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>收文阅办审批单详情</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
</head>

<body>
<!--startprint-->
<div class="table-title">
    <span>${oaActRead.title}</span>
</div>
<div class="top_toolbar">
    <div class="top_toolbar_inside" style="height: 40px;border-bottom: none;">
        <div style="line-height: 40px;margin: 0 10px;float: left;">
            <span style="float: left;margin-left: 10px;font-size: 13px;">申请时间：${oaActRead.createTimeStr}</span>
        </div>

        <div class="head_left_button" style="float: right;line-height: 40px;" id="printBut">
            <button type="button" class="cursor_hand" onclick="print()" style="font-size: 13px;">&#xea0e; 打印</button>
        </div>
    </div>
</div>
<!-- -->
<table class="formTable" style="margin: 0">
    <tbody>
    <tr>
        <td class="tdLabel">来文机关：</td>
        <td class="table-td-content">
            ${oaActRead.organ}
        </td>

        <td class="tdLabel">来文字号：</td>
        <td class="table-td-content">
            ${oaActRead.fontSize}
        </td>

        <td class="tdLabel">编号：</td>
        <td class="table-td-content">
            ${oaActRead.number}
        </td>
    </tr>

    <tr>
        <td class="tdLabel">份数：</td>
        <td class="table-td-content">
            ${oaActRead.copies}
        </td>

        <td class="tdLabel">收文日期：</td>
        <td class="table-td-content">
            ${oaActRead.receiptTimeStr}
        </td>

        <td class="tdLabel">保存期限：</td>
        <td class="table-td-content">
            <select class="select" name="deadline">
                <option value="0">10年</option>
                <option value="1">30年</option>
                <option value="2">永久</option>
            </select>
        </td>
    </tr>

    <tr>
        <td class="tdLabel">文件标题：</td>
        <td colspan="5" class="table-td-content">
            <div>
                <span class="annex-span">${oaActRead.annexStr}</span>
                <a class="download-file" href="/fileDownloadHandle/download?fileName=${oaActRead.annex}" title="下载">&#xeac9;</a>
            </div>
        </td>
    </tr>
    </tbody>
</table>

<div class="receipt-container">
    <div class="receipt-title">
        <div class="receipt-script">回执意见（共条）</div>
    </div>

    <c:forEach items="${commentsList}" var="comments">
        <div class="comment-container">
            <div class="comment-style">
                <span class="comment-name">${comments.userName}</span>
                <span class="comment-message">${comments.message}</span>
                <span class="comment-date">${comments.timeStr}</span>
            </div>
        </div>
    </c:forEach>

    <div class="receipt-style"></div>
</div>

<div class="form-but" style="margin-top: 20px;">
    <button type="button" class="return-but" onclick="previousPage()">返回</button>
</div>
<!--endprint-->
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //返回上一页
    function previousPage() {
        window.history.back();
    }

    //打印
    function print() {
        $('#printBut').hide();
        bdhtml = window.document.body.innerHTML;
        //开始打印标识字符串有17个字符
        sprnstr = "<!--startprint-->";
        //结束打印标识字符串
        eprnstr = "<!--endprint-->";
        //从开始打印标识之后的内容
        prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 17);
        //截取开始标识和结束标识之间的内容
        prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
        //把需要打印的指定内容赋给body.innerHTML
        window.document.body.innerHTML = prnhtml;
        //调用浏览器的打印功能打印指定区域
        window.print();
        // 最后还原页面
        window.document.body.innerHTML = bdhtml;
        $('#printBut').show();
    }

</script>
</html>