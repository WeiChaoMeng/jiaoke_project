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
    <link type="text/css" rel="stylesheet" href="/static/css/qc/jeDate-test.css">
    <link type="text/css" rel="stylesheet" href="/static/css/qc/jedate.css">
    <link type="text/css" rel="stylesheet" href="/static/css/qc/qc_select.css">
    <link href="/static/css/qc/jqTable.css" rel="stylesheet" type="text/css">
    <style>


    </style>
</head>

<body style="padding:15px 8px 0px 8px;">

<div class="">
    <li class="card-item active">
        <div class="card">
            <div class="card-content content-second">
                <div class="main-info">
                    <div style="width: 100%;height: 10%;" >
                            <div class="jeitem">
                                <div class="jeitem">
                                    <label class="jelabel">开始日期：</label>
                                    <div class="dy_select_div"   >
                                        <input type="text" class="dy_select_date" id="inpstart"  placeholder="选择开始日期" >
                                    </div>
                                    <label class="jelabel">结束日期：</label>
                                    <div class="dy_select_div"   >
                                        <input type="text" class="dy_select_date" id="inpend" placeholder="选择开始日期" >
                                    </div>

                                <label class="jelabel">机组选择</label>
                                <div class="dy_select_div"   >
                                    <select id="crew_num" class="dy_select" onchange="getModelByDateTimeAndCrew()" >
                                        <option value="sect">请选择</option>
                                        <option value="data1">机组一</option>
                                        <option value="data2">机组二</option>
                                    </select>
                                </div>

                                <label class="jelabel">模板选择</label>
                                <div class="dy_select_div" >
                                    <select  id="ratio_id" class="dy_select">
                                        <option value="select" >请选择</option>
                                    </select>
                                </div>

                                <label class="jelabel">预警选择</label>
                                <div class="dy_select_div" >
                                    <select  id="waring_leve" class="dy_select">
                                        <option value="0">无预警</option>
                                        <option value="1">一级预警</option>
                                        <option value="2">二级预警</option>
                                        <option value="3">三级预警</option>
                                    </select>
                                </div>
                                <button style="width: 160px;height: 36px;margin-left: 5%;" onclick="selectProductMessage()" >查询</button>
                            </div>
                    </div>
                </div>
            </div>
        </div>

    </li>

    <div class="">

                <div class="boxdown">
                    <table class="auxiliary_simpletable">

                        <c:choose>
                            <c:when test="${pageBean.pageData} == null || ${pageBean.dataCountNum == 0}" >
                                <span style="text-align: center" >暂无历史生产数据</span>
                            </c:when>
                            <c:otherwise>
                                <tbody>
                                <thead>
                                <th>生产日期</th>
                                <th>生产时间</th>
                                <th>配比号</th>
                                <th>配比名称</th>
                                <th>产品盘号</th>
                                <th >所在机组</th>
                                <th>操作</th>
                                </thead>
                                <c:forEach items="${pageBean.pageData}" var="item" varStatus="itemIndex">
                                    <tr>
                                        <td>${item.produce_date}</td>
                                        <td>${item.produce_time}</td>
                                        <td>${item.produce_ratio_id}</td>
                                        <td>${item.pro_name}</td>
                                        <td>${item.produce_disc_num}</td>
                                        <td>${item.produce_crewNum == 1 ?  "机组1":"机组2"} </td>
                                        <td>

                                            <a class="selected" href="#" id="${itemIndex.index}"  onclick="getProductById('${item.id}', '${item.produce_date}','${item.produce_disc_num}','${item.produce_crewNum}','${itemIndex.index}')"  ><i class="toolico iconfont">&#xe970;</i>查看</a>

                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </c:otherwise>
                        </c:choose>

                    </table>
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
                    <li><a href="<c:url value="${pageBean.url}&currentPageNum=${pageBean.currentPageNum - 1 }"></c:url> "><i class="iconfont">&#xe68a;</i></a></li>
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
                            <li><a href="<c:url value="${pageBean.url}&currentPageNum=${i}"></c:url>">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <%--下一页--%>
                <c:if test="${pageBean.currentPageNum < pageBean.pageCount}">
                    <li><a href="<c:url value="${pageBean.url}&currentPageNum=${pageBean.currentPageNum + 1 }"></c:url> " class="pageico"><i class="iconfont">&#xe673;</i></a></li>
                </c:if>

                <%--尾页--%>
                <c:choose>
                    <c:when test="${pageBean.currentPageNum == pageBean.pageCount}">
                        <li><a href="javascript:;" class="first">尾页</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="<c:url value="${pageBean.url}&currentPageNum=${pageBean.pageCount}"></c:url>  " >尾页</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>

            <span class="data_manager_pageinfo">共 ${pageBean.dataCountNum} 条记录，每页 ${pageBean.eachPageDataNum} 条，当前第 ${pageBean.currentPageNum} 页，共 ${pageBean.pageCount} 页</span>
        </div>
    </div>

</div>

    <div class="popup_back" style="display:none;">
    </div>
    <div class="popup_window_first" style="display:none;">
        <p class="popup_cont">是否删除？</p>
        <a href="javascript:void(0)" class="popup_btn" onclick="closeWindow();">确定</a>
        <a href="javascript:void(0)" class="popup_btn" onclick="closeWindow();">取消</a>
    </div>
<input  id="path" value="${path}" type="hidden" >
<input  id="temcrew" value="${crew}" type="hidden" >
<input  id="temRatioNum" value="${rationId}" type="hidden" >
<input  id="temWaring" value="${warningLive}" type="hidden" >
<input  id="temDate" value="${proData}" type="hidden" >
</body>

<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/qc/zipJs/jqTable.all.min.js"></script>
<script type="text/javascript" src="/static/js/qc/datetime.js"></script>
<script type="text/javascript" src="/static/js/layer/layer.js"></script>
<script type="text/javascript" src="/static/js/qc/auxiliary.js"></script>
<script type="text/javascript">
    //回显方法
    (function () {

        var crew = $("#temcrew").val();
        var ratioNum = $("#temRatioNum").val();
        var waring = $("#temWaring").val();
        var dates = $("#temDate").val();
        var numbers = $("#crew_num").find("option"); //获取select下拉框的所有值
        var warings = $("#waring_leve").find("option");
        var arry = dates.split("to");

        //添加一个选项
        if (crew != ""){

            for (var j = 1; j < numbers.length; j++) {
                if ($(numbers[j]).val() == crew) {
                    $(numbers[j]).attr("selected", "selected");
                }
            }
        }

        //回显日期
        if (arry[0]){
            $("#inpstart").val(arry[0]);
            $("#inpend").val(arry[1]);
        }

        if (ratioNum != "") {
            getModelByDateAndCrew(ratioNum);
        }

        if (waring != "") {
            for (var j = 1; j < warings.length; j++) {
                if ($(warings[j]).val() == waring) {
                    $(warings[j]).attr("selected", "selected");
                }
            }
        }

    })();
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
