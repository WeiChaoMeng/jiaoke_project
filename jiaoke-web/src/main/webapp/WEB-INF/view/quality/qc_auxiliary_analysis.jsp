<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
    <link href="/static/css/qc/jqTable.css" rel="stylesheet" type="text/css">
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

    <div data-level="true">


        <div class="c-table--main c-table J-table c-table--noWrap g-toggleTable--main c-table__cell--block el-table--enable-row-transition" style="width: 100%;padding-left: 10%;"><div class="c-table__header-wrapper"> <table cellspacing="0" cellpadding="0" border="0" class="c-table__header" role="c-table4" style="width: 1470px;">
            <colgroup>
                <col name="" width="15%">
                <col name="" width="15%">
                <col name="" width="15%">
                <col name="" width="15%">
                <col name="" width="15%">
                <col name="" width="15%">
                <col name="" width="15%">
            </colgroup>
            <thead>
            <tr class="g-toggleTable--title">
                <th class="">
                    <div class="cell"><i class="iconfont icon-right text-muted mr10 g-toggleTable--buttonAll" aria-hidden="true"></i>产品编号</div>
                </th>
                <th class="">
                    <div class="cell">生产日期</div>
                </th>
                <th>
                    <div clas="">生产时间</div>
                </th>
                <th>
                    <div clas="">配比号</div>
                </th>
                <th>
                    <div clas="">产品盘号</div>
                </th>
                <th>
                    <div clas="">机组</div>
                </th>
            </tr>
            </thead>

        </table></div><div class="c-table__body-wrapper"> <table cellspacing="0" cellpadding="0" border="0" class="c-table__body" role="c-table4" style="width: 1470px;">
            <colgroup>
                <col name="" width="15%">
                <col name="" width="15%">
                <col name="" width="15%">
                <col name="" width="15%">
                <col name="" width="15%">
                <col name="" width="15%">
                <col name="" width="15%">
            </colgroup>

            <tbody>

            <c:forEach items="${pageBean.pageData}" var="item" varStatus="statusd">

                <tr class="c-table__row c-table__row-${statusd.index} g-toggleTable--title">

                    <td class="">
                        <div class="cell"><i class="iconfont icon-right text-muted mr10 g-toggleTable--button" aria-hidden="true"></i> ${item.id}</div>
                    </td>
                    <td class="">
                        <div class="cell">${item.produce_date}</div>
                    </td>
                    <td>
                        <div class="cell">${item.produce_time}</div>
                    </td>
                    <td>
                        <div class="cell">${item.produce_ratio_id}</div>
                    </td>
                    <td>
                        <div class="cell">${item.produce_disc_num}</div>
                    </td>
                    <td>
                        <div class="cell">${item.produce_crewNum == 1 ?  "机组1":"机组2"}</div>
                    </td>
                </tr>

                <tr class="c-table__row c-table__row-${statusd.index} c-table__child c-table__child-default hide">

                    <td class="" >
                        <div class="cell">&nbsp;</div>
                    </td>
                    <td class="">
                        <div class="cell">材料</div>
                    </td>
                    <td class="">
                        <div class="cell">模板值</div>
                    </td>
                    <td>
                        <div class="cell">实际值</div>
                    </td>
                    <td>
                        <div class="cell">偏差值</div>
                    </td>
                    <td>
                        <div class="cell">报警级别</div>
                    </td>

                </tr>

                <c:forEach items="${waringList}" var="waringData" varStatus="status">

                    <c:if test="${item.id == waringData.crew_id}" >
                        <c:choose>
                            <c:when test="${waringData.material_name == '沥青温度' || waringData.material_name == '混合料温度' || waringData.material_name == '骨料温度' }">
                                <tr class="c-table__row c-table__row-${statusd.index} c-table__child c-table__child-default hide">

                                    <td class="" >
                                        <div class="cell">&nbsp;</div>
                                    </td>
                                    <td class="">
                                        <div class="cell">${waringData.material_name}</div>
                                    </td>
                                    <td class="">
                                        <div class="cell">${waringData.moudle_ratio}℃</div>
                                    </td>
                                    <td>
                                        <div class="cell">${waringData.actual_ratio}℃</div>
                                    </td>
                                    <td>
                                        <div class="cell">${waringData.deviation_ratio}℃</div>
                                    </td>
                                    <td>
                                        <div class="cell">${waringData.warning_level}级预警</div>
                                    </td>
                                </tr>

                            </c:when>
                            <c:otherwise>
                                <tr class="c-table__row c-table__row-${status.index} c-table__child c-table__child-default hide">

                                    <td class="" >
                                        <div class="cell">&nbsp;</div>
                                    </td>
                                    <td class="">
                                        <div class="cell">${waringData.material_name}</div>
                                    </td>
                                    <td class="">
                                        <div class="cell">${waringData.moudle_ratio}%</div>
                                    </td>
                                    <td>
                                        <div class="cell">${waringData.actual_ratio}%</div>
                                    </td>
                                    <td>
                                        <div class="cell">${waringData.deviation_ratio}%</div>
                                    </td>
                                    <td>
                                        <div class="cell">${waringData.warning_level}级预警</div>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                 </c:forEach>
            </c:forEach>
            </tbody>
        </table></div> </div>
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
<script src="/static/js/qc/zipJs/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="/static/js/qc/zipJs/jqTable.all.min.js"></script>
<script type="text/javascript" src="/static/js/qc/zipJs/artTemplate.js"></script>
<script type="text/javascript" src="/static/js/qc/zipJs/message.js"></script>
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
