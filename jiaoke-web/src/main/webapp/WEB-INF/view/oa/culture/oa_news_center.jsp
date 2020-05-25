<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>新闻中心</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <style>
        .news-headlines-color{
            background-image: linear-gradient(to right, #FF5722 , #FFB800);
        }

        .news-headlines-left-content {
            font-size: 18px;
            color: #ffffff;
        }

        .unit_news_title {
            padding: 5px;
            font-size: 15px;
            font-weight: 600;
        }

        .simple-table-style{
            width: 100%;
        }

        .simple-table-style thead tr th {
            height: 35px;
            position: relative;
            padding: 8px 15px;
            min-height: 20px;
            font-size: 14px;
            text-align: left;
            font-weight: 400;
            word-break: break-all;
            border: none;
            background: #f2f2f2;
        }

        .simple-table-style tbody tr td{
            text-align: left;
            padding: 0 15px;
            line-height: 30px;
            border: none;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .simple-table-style tbody tr:hover {
            background: #bdbdbd80;
            cursor: pointer;
        }

        .publish-new-content-but {
            padding: 5px 15px;
            border: 0;
            cursor: pointer;
            background: #009688;
            outline: none;
            border-radius: 5px;
            color: #FFFFFF;
            font-size: 13px;
            margin-right: 8px;
        }

        .publish-new-content-but:hover {
            opacity: .8;
        }

        .more-data-style{
            color: #00b8ff;
            cursor: pointer;
            font-size: 13px;
        }
    </style>
</head>

<body style="padding:15px 8px 0px 8px;">

<table style="width: 100%;height: 100%;">
    <tbody>
    <tr class="news-headlines-color">
        <td>
            <table width="100%" height="100%">
                <tbody>
                <tr>
                    <td class="news_headlines_left">
                        <span class="news-headlines-left-content">新闻中心</span>
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
                    <div class="unit_news_title">单位新闻</div>
                </div>
                <div style="min-height: 180px">
                    <table class="simple-table-style" style="border: none">

                        <thead>
                        <tr>
                            <th style="width: 5%">序号</th>
                            <th style="width: 30%">标题</th>
                            <th style="width: 15%">发布部门</th>
                            <th style="width: 10%">发布人</th>
                            <th style="width: 15%">发布时间</th>
                            <th style="width: 25%">摘要</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:choose>
                            <c:when test="${oaNewsCenterList.size() <= 0}">
                                <td colspan="7">没有查询到匹配记录</td>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="newsCenter" items="${oaNewsCenterList}" varStatus="status">
                                    <tr onclick="particulars(${newsCenter.id})">
                                        <td style="text-align: center;">${status.count}</td>
                                        <td>${newsCenter.newsHeadlines}</td>
                                        <td>${newsCenter.releaseDepartment}</td>
                                        <td>${newsCenter.publisher}</td>
                                        <td>${newsCenter.releaseDateStr}</td>
                                        <td>${newsCenter.summary}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                        </tbody>

                    </table>
                </div>

                <div class="unit_news_foot_left">
                    <div class="unit_news_margin">
                        <span class="unit_news_margin_content">管理员:
                            <span style="display: inline-block;color: #2196F3;">
                                <c:forEach items="${newsManagerList}" var="newsManager">
                                    ${newsManager.nickname}
                                </c:forEach>
                            </span>
                        </span>
                    </div>
                    <div class="unit_news_foot_right">

                        <shiro:hasPermission name="news:add">
                            <button class="publish-new-content-but" type="button" onclick="newsRelease()">新闻发布</button>
                        </shiro:hasPermission>

                        <a onclick="moreNewsData()" class="more-data-style">更多</a>
                    </div>
                </div>

                <div style="clear: both"></div>

                <div>
                    <div class="unit_news_title">企业荣誉</div>
                </div>
                <div style="min-height: 180px">
                    <table class="simple-table-style">

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
                        <span class="unit_news_margin_content">管理员:
                            <span style="display: inline-block;color: #2196F3;">
                                <c:forEach items="${honourManagerList}" var="honourManager">
                                    ${honourManager.nickname}
                                </c:forEach>
                            </span>
                        </span>
                    </div>

                    <div class="unit_news_foot_right">

                        <shiro:hasPermission name="honour:add">
                            <button class="publish-new-content-but" type="button" onclick="corporateHonorRelease()">荣誉发布
                            </button>
                        </shiro:hasPermission>

                        <a onclick="moreCorporateHonorData()" class="more-data-style">更多</a>
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
    function newsRelease() {
        window.location.href = '/newsCenter/toNewsRelease?jumpFlag=1';
    }

    //更多新闻
    function moreNewsData() {
        window.location.href = '/newsCenter/toNewsList?page=1';
    }

    //新闻详情
    function particulars(id) {
        window.location.href = '${path}/newsCenter/newsDetails?id=' + id;
    }

    /*-------企业荣誉----------*/

    //企业荣誉发布
    function corporateHonorRelease() {
        window.location.href = '/corporateHonor/toCorporateHonor?jumpFlag=1';
    }

    //更多企业荣誉
    function moreCorporateHonorData() {
        window.location.href = '/corporateHonor/toCorporateHonorList?page=1';
    }

    //企业荣誉详情
    function corporateHonorParticulars(id) {
        window.location.href = '${path}/corporateHonor/corporateHonorDetails?id=' + id;
    }

</script>
</html>
