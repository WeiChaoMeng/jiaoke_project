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
<html>
<head>
    <meta charset="utf-8">
    <title>新闻中心</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
</head>

<body style="padding:15px 8px 0px 8px;">

<table style="width: 100%;height: 100%;">
    <tbody>
    <tr class="news_headlines_color">
        <td width="50%">
            <table width="100%" height="100%">
                <tbody>
                <tr>
                    <td class="news_headlines_left">
                        <span class="news_headlines_left_content">新闻中心</span>
                    </td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <div style="width: 100%">
                <div>
                    <div class="unit_news_title" style="font-size: 13px">单位新闻</div>
                </div>
                <div style="min-height: 180px">
                    <table class="simpletable">

                        <thead>
                        <th style="width: 5%">序号</th>
                        <th style="width: 30%">标题</th>
                        <th style="width: 15%">发布部门</th>
                        <th style="width: 10%">发布人</th>
                        <th style="width: 15%">发布时间</th>
                        <th style="width: 25%">摘要</th>
                        </thead>

                        <tbody>
                        <c:choose>
                            <c:when test="${oaNewsCenterList.size() <= 0}">
                                <td colspan="7">没有查询到匹配记录</td>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="newsCenter" items="${oaNewsCenterList}" varStatus="status">
                                    <tr onclick="particulars(${newsCenter.id})">
                                        <td>${status.count}</td>
                                        <td style="text-align: left;text-indent: 10px;">${newsCenter.newsHeadlines}</td>
                                        <td>${newsCenter.releaseDepartment}</td>
                                        <td>${newsCenter.publisher}</td>
                                        <td>${newsCenter.releaseDateStr}</td>
                                        <td style="text-align: left;text-indent: 10px;">${newsCenter.summary}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                        </tbody>

                    </table>
                </div>

                <div class="unit_news_foot_left">
                    <div class="unit_news_margin">
                        <span class="unit_news_margin_content">管理员:系统管理员</span>

                    </div>
                    <div class="unit_news_foot_right">

                        <shiro:hasPermission name="news:add">
                            <button class="publish-new-content" type="button" onclick="newsRelease()">新闻发布</button>
                        </shiro:hasPermission>

                        <a onclick="moreNewsData()" style="color: #00b8ff;cursor: pointer">更多</a>
                    </div>
                </div>

                <div style="clear: both"></div>

                <div>
                    <div class="unit_news_title" style="font-size: 13px">企业荣誉</div>
                </div>
                <div style="min-height: 180px">
                    <table class="simpletable">

                        <thead>
                        <th style="width: 5%">序号</th>
                        <th style="width: 30%">标题</th>
                        <th style="width: 15%">发布部门</th>
                        <th style="width: 10%">发布人</th>
                        <th style="width: 15%">发布时间</th>
                        <th style="width: 25%">摘要</th>
                        </thead>

                        <tbody>

                        <c:choose>
                            <c:when test="${oaCorporateHonorList.size() <= 0}">
                                <td colspan="7">没有查询到匹配记录</td>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="corporateHonor" items="${oaCorporateHonorList}" varStatus="status">
                                    <tr onclick="corporateHonorParticulars(${corporateHonor.id})">
                                        <td>${status.count}</td>
                                        <td style="text-align: left;text-indent: 10px;">${corporateHonor.title}</td>
                                        <td>${corporateHonor.releaseDepartment}</td>
                                        <td>${corporateHonor.publisher}</td>
                                        <td>${corporateHonor.releaseDateStr}</td>
                                        <td style="text-align: left;text-indent: 10px;">${corporateHonor.summary}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                        </tbody>

                    </table>
                </div>

                <div class="unit_news_foot_left">
                    <div class="unit_news_margin">
                        <span class="unit_news_margin_content">管理员:系统管理员</span>

                    </div>

                    <div class="unit_news_foot_right">

                        <shiro:hasPermission name="honour:add">
                            <button class="publish-new-content" type="button" onclick="corporateHonorRelease()">新闻发布</button>
                        </shiro:hasPermission>

                        <a onclick="moreCorporateHonorData()" style="color: #00b8ff;cursor: pointer">更多</a>
                    </div>
                </div>

            </div>
        </td>
    </tr>
    </tbody>
</table>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script>
    //新闻发布
    function newsRelease(){
        window.location.href = '/newsCenter/toNewsRelease';
    }

    //更多新闻
    function moreNewsData() {
        window.location.href = '/newsCenter/toNewsList';
    }

    //新闻详情
    function particulars(id) {
        window.location.href = '${path}/newsCenter/newsDetails?id=' + id;
    }

    /*-------企业荣誉----------*/

    //企业荣誉发布
    function corporateHonorRelease() {
        window.location.href = '/newsCenter/toCorporateHonor';
    }

    //更多企业荣誉
    function moreCorporateHonorData() {
        window.location.href = '/newsCenter/toCorporateHonorList';
    }

    //企业荣誉详情
    function corporateHonorParticulars(id) {
        window.location.href = '${path}/newsCenter/corporateHonorDetails?id=' + id;
    }

</script>
</html>
