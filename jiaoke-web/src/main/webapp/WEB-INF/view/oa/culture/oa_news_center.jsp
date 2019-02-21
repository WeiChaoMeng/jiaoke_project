<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>新闻中心</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
</head>

<body style="padding:15px 8px 0px 8px;">

<table width="100%" height="100%">
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

        <%--<td width="50%">
            <div class="news_headlines_right">

                <!--标题-->
                <div id="div2" class="head_right_side_input news_title">
                    <input type="text">
                </div>

                <!--发布人-->
                <div id="div3" class="head_right_side_input news_publisher">
                    <input type="text">
                </div>

                <!--发布部门-->
                <div id="div4" class="head_right_side_input news_department">
                    <input type="text">
                </div>

                <!--关键字-->
                <div id="div5" class="head_right_side_input news_keywords">
                    <input type="text">
                </div>

                <!--摘要-->
                <div id="div6" class="head_right_side_input news_summary">
                    <input type="text">
                </div>

                <!--条件查询-->
                <div id="div1" class="head_right_side">
                    <select id="condition4">
                        <option value="0">- -查询条件- -</option>
                        <option value="1">标题</option>
                        <option value="2">发布人</option>
                        <option value="3">发布部门</option>
                        <option value="4">关键字</option>
                        <option value="5">摘要</option>
                    </select>
                </div>
            </div>
        </td>--%>

    </tr>
    <tr>
        <td colspan="2">
            <div style="width: 100%">
                <div>
                    <div class="unit_news_title" style="font-size: 13px">单位新闻</div>
                </div>
                <div style="min-height: 180px">
                    <table class="simpletable simpletable_color">

                        <thead>
                        <th style="width: 5%">序号</th>
                        <th style="width: 30%">标题</th>
                        <th style="width: 10%">发布部门</th>
                        <th style="width: 10%">发布人</th>
                        <th style="width: 10%">发布时间</th>
                        <th style="width: 15%">关键字</th>
                        <th style="width: 20%">摘要</th>
                        </thead>

                        <tbody>
                        <c:choose>
                            <c:when test="${oaNewsCenterList.size() <= 0}">
                                <td colspan="7">' + '暂无数据' + '</td>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="newsCenter" items="${oaNewsCenterList}" varStatus="status">
                                    <tr onclick="particulars(${newsCenter.id})">
                                        <td>${status.count}</td>
                                        <td>${newsCenter.newsHeadlines}</td>
                                        <td>${newsCenter.releaseDepartment}</td>
                                        <td>${newsCenter.publisher}</td>
                                        <td>${newsCenter.releaseDateStr}</td>
                                        <td>${newsCenter.keyword}</td>
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
                        <span class="unit_news_margin_content">管理员:系统管理员</span>

                    </div>
                    <div class="unit_news_foot_right">
                        <input type="button" value="新闻发布" class="press_release_button"
                               style="padding: 3px 5px;background: #f3f3f3;border: 1px #000000 solid;margin-right: 10px;border-radius: 3px;"
                               id="newsRelease">
                        <a onclick="moreNewsData()" style="color: #00b8ff">更多</a>
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
                        <th style="width: 10%">发布部门</th>
                        <th style="width: 10%">发布人</th>
                        <th style="width: 10%">发布时间</th>
                        <th style="width: 15%">关键字</th>
                        <th style="width: 20%">摘要</th>
                        </thead>

                        <tbody>
                        <c:forEach var="corporateHonor" items="${oaCorporateHonorList}" varStatus="status">
                            <tr onclick="corporateHonorParticulars(${corporateHonor.id})">
                                <td>${status.count}</td>
                                <td>${corporateHonor.title}</td>
                                <td>${corporateHonor.releaseDepartment}</td>
                                <td>${corporateHonor.publisher}</td>
                                <td>${corporateHonor.releaseDateStr}</td>
                                <td>${corporateHonor.keyword}</td>
                                <td>${corporateHonor.summary}</td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </div>

                <div class="unit_news_foot_left">
                    <div class="unit_news_margin">
                        <span class="unit_news_margin_content">管理员:系统管理员</span>

                    </div>

                    <div class="unit_news_foot_right">
                        <input type="button" value="荣誉发布" class="press_release_button"
                               style="padding: 3px 5px;background: #f3f3f3;border: 1px #000000 solid;margin-right: 10px;border-radius: 3px;"
                               onclick="corporateHonorRelease()">
                        <a onclick="moreCorporateHonorData()" style="color: #00b8ff">更多</a>
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
    $('#newsRelease').on('click', function () {
        window.location.href = '/newsCenter/toNewsRelease';
    });

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
    function corporateHonorRelease(){
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
