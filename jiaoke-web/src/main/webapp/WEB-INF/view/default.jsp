<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>无标题文档</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <link type="text/css" rel="stylesheet" href="/static/slider/css/carousel.css">
    <script src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/echarts/uimaker.js"></script>
</head>

<body>

<div>
    <div>

        <!--top-->
        <div class="div_top">
            <iframe src="../../static/lbt/index.html" id="iframe" name="right" width="100%" height="100%"
                    frameborder="0"
                    scrolling="auto"></iframe>
        </div>

        <div class="wrap">
            <div class="div_left2">
                <ul>
                    <li>
                        <div class="listbox">
                            <i class="iconfont">&#xe64c;</i>
                            <em>0
                                <p>待办事项</p>
                            </em>
                        </div>
                    </li>
                    <li>
                        <div class="listbox">
                            <i class="iconfont">&#xe6f3;</i>
                            <em>0
                                <p>待签公文</p>
                            </em>
                        </div>
                    </li>

                    <li>
                        <div class="listbox">
                            <i class="iconfont">&#xe672;</i>
                            <em>0
                                <p>本月会议</p>
                            </em>
                        </div>
                    </li>
                    <li>
                        <div class="listbox">
                            <i class="iconfont">&#xe70f;</i>
                            <em>0
                                <p>公告信息</p>
                            </em>
                        </div>
                    </li>

                    <li>
                        <div class="listbox">
                            <i class="iconfont">&#xe974;</i>
                            <em>0
                                <p>日程计划</p>
                            </em>
                        </div>
                    </li>
                    <li>
                        <div class="listbox" style="margin-right: 0">
                            <i class="iconfont">&#xe76c;</i>
                            <em>0
                                <p>行业动态</p>
                            </em>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="infolist1">

                <div class="infoboxleft">
                    <div class="boxtitle">
                        <span>公告</span>
                        <a href="notice/toIndex?page=1">更多
                            <i class="iconfont">&#xeba8;</i>
                        </a>
                    </div>

                    <div class="boxdown">
                        <ul class="textlist">
                            <c:forEach items="${oaNoticeList}" var="notice">
                                <li>
                                    <span></span>
                                    <a href="notice/homePageDetails?id=${notice.id}" style="width: 650px;">${notice.title}</a>
                                    <i>${notice.releaseDateStr}</i>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                </div>
            </div>

            <div class="inforight">
                <div class="infoboxright">
                    <div class="boxtitle">
                        <span>新闻</span>
                        <a href="newsCenter/toNewsList">更多
                            <i class="iconfont">&#xeba8;</i>
                        </a>
                    </div>

                    <ul class="textlist">
                        <c:forEach items="${oaNewsCenterList}" var="newsCenter">
                            <li>
                                <span></span>
                                <a href="newsCenter/newsDetails?id=${newsCenter.id}">${newsCenter.newsHeadlines}</a>
                                <i>${newsCenter.releaseDateStr}</i>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

            <div class="pubBox achievement">
                <div class="cont">
                    <ul>
                        <li class="mainPic"><span>玉树援建结古供水厂</span><a href="javascript:void(0);"><img
                                src="../../static/images/test/8.JPG" alt=""></a></li>
                        <li class="smallPic"><span>首都机场收费站</span><a href="javascript:void(0);"><img
                                src="../../static/images/test/2.jpg" alt=""></a></li>
                        <li class="smallPic"><span>张花高速高墩施工</span><a href="javascript:void(0);"><img
                                src="../../static/images/test/3.jpg" alt=""></a></li>

                        <li class="middlePic"><span>郭公庄水厂全景</span><a href="javascript:void(0);"><img
                                src="../../static/images/test/4.jpg" alt=""></a></li>
                        <li class="middlePic"><span>长安街大修</span><a href="javascript:void(0);"><img
                                src="../../static/images/test/5.jpg" alt=""></a></li>
                        <li class="smallPic"><span>地铁4号线动物园站</span><a href="javascript:void(0);"><img
                                src="../../static/images/test/6.jpg" alt=""></a></li>
                        <li class="smallPic"><span>中环广场</span><a href="javascript:void(0);"><img
                                src="../../static/images/test/7.jpg" alt=""></a></li>
                    </ul>
                </div>
            </div>

        </div>

    </div>

</div>

</body>
<!--<script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>-->
<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/slider/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/static/slider/js/jquery.carousel.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>
</html>
