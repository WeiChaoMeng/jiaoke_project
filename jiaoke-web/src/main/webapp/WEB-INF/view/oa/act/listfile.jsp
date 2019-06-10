<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<!-- 遍历Map集合 -->
<c:forEach var="me" items="${fileNameMap}">
    <c:url value="/servlet/DownLoadServlet" var="downurl">
        <c:param name="filename" value="${me.key}"></c:param>
    </c:url>
    ${me.value}<a href="${downurl}">下载</a>
    <br/>
</c:forEach>--%>

<div>
    <a href="/fileDownloadHandle/download?fileName=12c882bd-d5a0-4621-8edf-c75db03316c7_端午廉洁4.jpg">端午廉洁4.jpg</a>
    <%--<button type="button" value="12c882bd-d5a0-4621-8edf-c75db03316c7_端午廉洁4.jpg" onclick="dow()">端午廉洁4.jpg</button>--%>
    <span type=""></span>
</div>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script>
    function dow() {
        var val = $(this).val();
        $.ajax({
            type: "POST",
            url: '${path}/fileDownloadHandle/download',
            data: {'fileName':val},
            async: true,
            cache: false,
            success: function (ret) {
                console.log(ret);
                    alert("成功：：" + ret.message);
            },
            error: function () {
                alert("错误！");
            }
        });
    }
</script>
</html>
