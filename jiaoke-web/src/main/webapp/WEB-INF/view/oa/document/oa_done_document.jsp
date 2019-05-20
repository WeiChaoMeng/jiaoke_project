<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>已办公文</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<style>
    .text_style {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .tbodys tr:hover {
        background-color: #d8d8d8;
    }
</style>

<body style="padding:15px 8px 0px 8px;">

<div class="">

    <div class="page_head">
        <table width="100%" height="100%">
            <tbody>
            <tr>
                <td>
                    <div>
                        <div class="conditional-query cursor_hand">
                            <input type="text" id="textTitle" class="search-bar" placeholder="标题" autocomplete="off">
                            <i onclick="loadData(1)" class="iconfont search-icon-size"
                               id="conditional_search">&#xe7e7;</i>
                        </div>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <table class="simpletable simpletable_color" style="table-layout: fixed">

        <thead>
        <th style="width: 3%;"><input type="checkbox"></th>
        <th style="width: 8%;">密级</th>
        <th style="width: 36%;">标题</th>
        <th style="width: 15%;">公文文号</th>
        <th style="width: 8%;">发起人</th>
        <th style="width: 15%">发起时间</th>
        <th style="width: 15%;">接收时间</th>
        </thead>

        <tbody class="tbodys">

        <c:choose>
            <c:when test="${oaDocumentList.size() == 0}">
                <tr></tr>
                <tr>
                    <td colspan="9">没有查询到匹配记录</td>
                </tr>
            </c:when>
            <c:otherwise>
                <tr></tr>

                <c:forEach var="oaDocument" items="${oaDocumentList}" varStatus="status">
                    <tr onclick="particulars(${oaDocument.id})">
                        <td class="tdnum">
                            <input type="checkbox" onclick="window.event.cancelBubble=true;">
                        </td>
                        <td>
                            <c:if test="${oaDocument.rank == 0}">普通公文</c:if>
                            <c:if test="${oaDocument.rank == 1}">秘密公文</c:if>
                            <c:if test="${oaDocument.rank == 2}">机密公文</c:if>
                            <c:if test="${oaDocument.rank == 3}">绝密公文</c:if>
                        </td>
                        <td class="text_style"
                            title="${oaDocument.textTitle}">${oaDocument.textTitle}
                        </td>
                        <td>${oaDocument.textNumber}</td>
                        <td>${oaDocument.userInfoId}</td>
                        <td>${oaDocument.createTimeStr}</td>
                        <td>${oaDocument.createTimeStr}</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>

        </tbody>

    </table>

</div>

<div id="paging" class="paging-div">
    <div>
        <div class="" style="float: right;">
            <ul class="pagination" id="pagination" style="margin: 0"></ul>
            <input type="hidden" id="PageCount" runat="server"/>
            <input type="hidden" id="PageSize" runat="server"/>
            <input type="hidden" id="countindex" runat="server"/>
            <!--设置最多显示的页码数 可以手动设置 默认为10-->
            <input type="hidden" id="visiblePages" runat="server" value="10"/>
            <input type="hidden" id="page" value="1"/>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/paging/jqPaginator.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>

    //设置当前页
    var currentPage = '${page}';
    var currentPageNum = JSON.parse(currentPage);

    //初始化分页
    $(function () {
        //设置当前页
        $('#page').val(currentPageNum);
        loadData(currentPageNum);
    });

    //加载数据
    function loadData(page) {
        var textTitle = $('#textTitle').val();
        $.ajax({
            type: "post",
            url: '/document/doneDocument',
            data: {'page': page, 'textTitle': textTitle},
            async: false,
            success: function (data) {
                var lists = JSON.parse(data);
                parseResult(lists);
                loadPage();
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    function loadPage() {
        var myPageCount = parseInt($("#PageCount").val());
        var myPageSize = parseInt($("#PageSize").val());
        var countindex = myPageCount === 0 ? 1 : Math.ceil(myPageCount / myPageSize);
        $("#countindex").val(countindex);

        $.jqPaginator('#pagination', {
            totalPages: parseInt($("#countindex").val()),
            visiblePages: parseInt($("#visiblePages").val()),
            currentPage: currentPageNum,
            first: '<li class="first"><a href="javascript:;">首页</a></li>',
            prev: '<li class="prev"><a href="javascript:;"><i class="arrow arrow2"></i>上一页</a></li>',
            next: '<li class="next"><a href="javascript:;">下一页<i class="arrow arrow3"></i></a></li>',
            last: '<li class="last"><a href="javascript:;">末页</a></li>',
            page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
            onPageChange: function (page, type) {
                if (type == "change") {
                    $('#page').val(page);
                    exeData(page, type);
                }
            }
        });
    }

    function exeData(page, type) {
        loadData(page);
    }

    //解析list
    function parseResult(lists) {
        var resultList = '';
        if (lists === 'noData') {
            resultList += '<tr>';
            resultList += '<td colspan="7">' + '没有查询到匹配记录' + '</td>';
            resultList += '</tr>';
            $("#PageCount").val(0);
            //每页显示条数
            $("#PageSize").val("15");
        } else {
            //总数
            $("#PageCount").val(lists.total);
            //每页显示条数
            $("#PageSize").val("15");
            //结果集
            var objList = lists.list;
            //插入tbody
            for (let i = 0; i < objList.length; i++) {
                resultList += '<tr onclick="particulars(' + objList[i].id + ')">';
                resultList += '<input type="hidden" id="taskId" value="' + objList[i].taskId + '">';
                resultList += '<td><input type="checkbox" value="' + objList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                resultList += '<td>';
                if (objList[i].rank === 1) {
                    resultList += '普通公文';
                } else if (objList[i].rank === 2) {
                    resultList += '秘密公文';
                } else if (objList[i].rank === 3) {
                    resultList += '机密公文';
                } else if (objList[i].rank === 4) {
                    resultList += '绝密公文';
                }
                resultList += '</td>';
                resultList += '<td style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;text-align: left;text-indent:10px;" title="' + objList[i].textTitle + '"> ' + objList[i].textTitle + ' </td>';
                resultList += '<td>' + objList[i].textNumber + '</td>';
                resultList += '<td>';
                if (objList[i].userInfoId != null && objList[i].userInfoId != "") {
                    resultList += objList[i].userInfoId;
                } else {
                    resultList += '无';
                }
                resultList += '</td>';
                resultList += '<td>' + objList[i].createTimeStr + '</td>';
                resultList += '<td>' + objList[i].receiveTime + '</td>';
                resultList += '</tr>';
            }
        }
        $('#tbodys').html(resultList);
    }

    //查看详情
    function particulars(id) {
        var taskId = $("#taskId").val();
        window.location.href = "${path}/document/documentDetails?id=" + id + "&taskId=" + taskId;
    }
</script>
</html>
