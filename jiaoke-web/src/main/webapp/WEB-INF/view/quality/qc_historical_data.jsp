<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/12/17
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <title>历史数据</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <script src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/echarts/uimaker.js"></script>
</head>

<body style="padding:10px 8px 100px 8px;">

    <!--form start-->

    <div class="div_data">

        <div class="">
            <div class="">
                <div class="boxtitle">
                    <span>历史产品数据</span>
                </div>

                <div class="boxdown">
                    <table class="simpletable">

                        <c:choose>
                            <c:when test="${pageBean.pageData} == null || ${pageBean.dataCountNum == 0}" >
                                <span style="text-align: center" >暂无历史生产数据</span>
                            </c:when>
                            <c:otherwise>
                                <tbody>
                                    <thead>
                                    <th>产品日期</th>
                                    <th>产量<i>T/吨</i></th>
                                    <th>开始生产时间</th>
                                    <th>结束生产时间</th>
                                    <th>所在机组</th>
                                    <th>操作</th>
                                    </thead>
                                    <c:forEach items="${pageBean.pageData}" var="item">
                                        <tr>
                                            <td>${item.produceDate}</td>
                                            <td>${item.materialTotal}</td>
                                            <td>${item.startTime}</td>
                                            <td>${item.endTime}</td>
                                            <td>${item.crewNum == 1 ? '机组1':'机组2'} </td>
                                            <td>
                                                <a class="selected" id="add" href="${path}/getFalseDataByDate.do?producedDate=${item.produceDate}&crewNum=${item.crewNum}" ><i class="toolico iconfont">&#xe970;</i>查看</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </c:otherwise>
                        </c:choose>

                    </table>
                </div>

            </div>
        </div>
        <div class="data_manager_pagination">
            <ul class="data_manager_pagelist">
                <%--首页--%>
                <c:choose>
                    <c:when test="${pageBean.currentPageNum == 1}">
                        <li><a href="javascript:;" class="first">首页</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="<c:url value="${pageBean.url}"></c:url> " >首页</a></li>
                    </c:otherwise>
                </c:choose>

                <%-- 上一页 --%>
                <c:if test="${pageBean.currentPageNum > 1}">
                    <li><a href="<c:url value="${pageBean.url}currentPageNum=${pageBean.currentPageNum - 1 }"></c:url> "><i class="iconfont">&#xe68a;</i></a></li>
                </c:if>

                <c:choose>
                    <c:when test="${pageBean.pageCount <= 10 }">
                        <c:set var="begin" value="1"></c:set>
                        <c:set var="end" value="${pageBean.pageCount}"></c:set>
                    </c:when>
                    <c:otherwise>
                        <c:set var="begin" value="${pageBean.currentPageNum - 4}"></c:set>
                        <c:set var="end" value="${pageBean.currentPageNum + 5}"></c:set>
                        <c:choose>

                            <c:when test="${begin < 1}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="10"/>
                            </c:when>

                            <c:when test="${end > pageBean.pageCount}">
                                <c:set var="begin" value="${pageBean.pageCount - 9}"></c:set>
                                <c:set var="end" value="${pageBean.pageCount}"></c:set>
                            </c:when>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
                <c:forEach begin="${begin}" end="${end}" var="i">
                    <c:choose>
                        <c:when test="${i == pageBean.currentPageNum }">
                            <li><a href="javascript:;" class="selected pageico" >${i}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="<c:url value="${pageBean.url}currentPageNum=${i}"></c:url>">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <%--下一页--%>
                <c:if test="${pageBean.currentPageNum < pageBean.pageCount}">
                    <li><a href="<c:url value="${pageBean.url}currentPageNum=${pageBean.currentPageNum + 1 }"></c:url> " class="pageico"><i class="iconfont">&#xe673;</i></a></li>
                </c:if>

                <%--尾页--%>
                <c:choose>
                    <c:when test="${pageBean.currentPageNum == pageBean.pageCount}">
                        <li><a href="javascript:;" class="first">尾页</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="<c:url value="${pageBean.url}currentPageNum=${pageBean.pageCount}"></c:url>  " >尾页</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>

            <span class="data_manager_pageinfo">共 ${pageBean.dataCountNum} 条记录，每页 ${pageBean.eachPageDataNum} 条，当前第 ${pageBean.currentPageNum} 页，共 ${pageBean.pageCount} 页</span>
        </div>
    </div>


</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>

</html>