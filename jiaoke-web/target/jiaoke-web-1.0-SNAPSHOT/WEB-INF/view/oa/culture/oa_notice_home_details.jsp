<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>公告详情</title>
    <!-- 引用控制层插件样式 -->
    <link href="../../../../static/css/oa/oa_news_center.css" rel="stylesheet" type="text/css">

</head>
<body>
<div style="width: 70%;margin: 0 auto;height: 40px;text-align: left;text-indent:10px; line-height: 40px;border: 1px solid #d8d4d4;border-bottom: none;border-radius:10px 10px 0 0;">
    <span style="font-size: 13px;">公告详情</span>
</div>

<div id="editor"
     style="width: 68%;margin: 0 auto;padding: 1%;border: 1px #c3c2c2 solid;overflow: auto;min-height: 450px">
    <div style="height: 50px;border-bottom: 1px #cacaca solid;margin-bottom: 20px;">
            <span style="font-size:20px;text-align: center;">
                ${oaNotice.title}
            </span>
        <span style="color: #0095ff;float: right;">
                作者：${oaNotice.publisher}
            </span>
    </div>
    ${oaNotice.richText}
</div>

<div class="form_but" style="margin-top: 15px">
    <input type="button" class="return-but-inp" value="返回" onclick="previousPage()" style="margin-left: 10px">
</div>

</tbody>

</body>

<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript">

    //返回上一页
    function previousPage() {
        window.history.back();
    }

</script>
</html>