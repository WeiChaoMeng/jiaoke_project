<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath); %>
<html>
<head>
    <title>登录成功跳转</title>
</head>
<body>

</body>
<script type="text/javascript" src="../../static/js/jquery.js"></script>
<script>
    $(function () {
        <shiro:hasPermission name="cockpitLayer">
        console.log("驾驶舱");
        window.location.href = '${path}/cockpitPage.do';
        </shiro:hasPermission>

        <shiro:lacksPermission name="cockpitLayer">
        console.log("原页面");
        window.location.href = '${path}/homePage.do';
        </shiro:lacksPermission>
    });
</script>
</html>
