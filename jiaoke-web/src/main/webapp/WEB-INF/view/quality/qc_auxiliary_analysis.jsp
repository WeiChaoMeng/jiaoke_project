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
    <title>辅助分析</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <style>
        .nform li span {
            width: 28%;
        }

        .simpletable thead tr th {
            background: #9affe4;
            border: solid 1px #fff;
            height: 30px;
            line-height: 30px;
            font-weight: bold;
            text-align: center;
            text-indent: 0;
            white-space: nowrap;
        }

    </style>
</head>

<body style="padding:15px 8px 0px 8px;">

<div class="">

    <div class="table_top">
        <table width="100%" height="100%">
            <tbody>
            <tr>
                <td>
                    <div class="conditional_query">

                        <!--条件查询-->
                        <div id="div1" class="head_right_side">
                            <select id="condition">
                                <option value="0">- -查询条件- -</option>
                                <option value="1">预警级别一</option>
                                <option value="2">预警级别二</option>
                                <option value="3">预警级别三</option>
                            </select>
                        </div>
                    </div>

                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="content_title">

        <table class="simpletable" style="width: 100%;">

            <thead>
            <th style="width: 40px"><input type="checkbox" id="checkAll" ></th>

            <th style="width: 150px ">生产日期</th>
            <th style="width: 150px" >生产时间</th>
            <th style="width: 150px">盘号</th>
            <th style="width: 150px ">配比号</th>
            <th style="width: 150px " >生产机组</th>
            <th style="width: 150px">材料名</th>
            <th style="width: 150px">实际配比</th>
            <th style="width: 150px">模板配比</th>
            <th style="width: 150px">偏差比</th>
            <th style="width: 150px ">预警级别</th>
            <th style="width: 10px"></th>
            </thead>
            <c:choose>
                <c:when test="${pageBean.pageData == null}" >
                    <span>暂无预警数据</span>
                </c:when>
                <c:otherwise>
                    <tbody>
                    <tr></tr>
                    <c:forEach items="${pageBean.pageData}" var="item">
                        <tr>
                            <td><input type="checkbox"></td>
                            <td STYLE="text-align: center" >${item.produce_date}</td>
                            <td STYLE="text-align: center" >${item.produce_time}</td>
                            <td STYLE="text-align: center" >${item.produce_disc_num}</td>
                            <td STYLE="text-align: center">${item.produce_ratio_id}</td>
                            <td STYLE="text-align: center">${item.produce_crewNum == '1' ? '机组1':'机组2'}</td>
                            <td STYLE="text-align: center">${item.material_name}</td>
                            <c:choose>
                                <c:when test="${item.material_name == '沥青温度' || item.material_name == '混合料温度' || item.material_name == '骨料温度' }">
                                    <td STYLE="text-align: center">${item.actual_ratio}<i>°C</i></td>
                                    <td STYLE="text-align: center">${item.moudle_ratio}<i>°C</i></td>
                                    <td STYLE="text-align: center">${item.deviation_ratio}<i>°C</i></td>
                                </c:when>
                                <c:otherwise>
                                    <td STYLE="text-align: center">${item.actual_ratio}<i>%</i></td>
                                    <td STYLE="text-align: center">${item.moudle_ratio}<i>%</i></td>
                                    <td STYLE="text-align: center">${item.deviation_ratio}<i>%</i></td>
                                </c:otherwise>
                            </c:choose>

                            <td>
                                <c:choose>
                                <c:when test="${item.warning_level == '1'}">
                                    一级预警
                                </c:when>
                                <c:when test="${item.warning_level == '2'}">
                                    二级预警
                                </c:when>
                                    <c:when test="${item.warning_level == '0'}">
                                        无预警
                                    </c:when>
                                    <c:when test="${item.warning_level == '3'}">
                                        三级预警
                                    </c:when>
                            </c:choose>
                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </c:otherwise>
            </c:choose>
        </table>
    </div>
    <div class="my_pagination">
        <ul class="my_pagelist">
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

        <span class="my_pageinfo">共 ${pageBean.dataCountNum} 条记录，每页 ${pageBean.eachPageDataNum} 条，当前第 ${pageBean.currentPageNum} 页，共 ${pageBean.pageCount} 页</span>
    </div>
</div>

    <div class="popup_back" style="display:none;">
    </div>
    <div class="popup_window_first" style="display:none;">
        <p class="popup_cont">是否删除？</p>
        <a href="javascript:void(0)" class="popup_btn" onclick="closeWindow();">确定</a>
        <a href="javascript:void(0)" class="popup_btn" onclick="closeWindow();">取消</a>
    </div>

</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>

<script type="text/javascript">
    (function(){

    })(jQuery)
    
    $("#checkAll").click(function(){
        $("input:checkbox").each(function () {
            this.checked = $("#checkAll").get(0).checked;
        })
    })

        //点击弹出删除按钮
    function closeWindow() {
        $('.popup_back,.popup_window_first').hide();
    }
    $('#delect').click(function() {
        $('.popup_window_first,.popup_back').show();
    });

</script>
</html>
