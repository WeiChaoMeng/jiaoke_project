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
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <meta charset="utf-8">
    <title>公司发文</title>
    <link href="../../../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link href="../../../../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body style="padding:15px 8px 0px 8px;">

<div class="cursor_hand">
    <div class="page_head">
        <table style="width:100%;height:100%">
            <tbody>
            <tr>
                <td>
                    <div class="head_left_button" id="newCompanyWriting" onmousemove="select_color(this)"
                         onmouseout="unselected_color(this)">
                        &#xeb86; 新建
                    </div>

                    <div class="separation_line">

                    </div>

                    <div class="head_left_button" id="edit" onmousemove="select_color(this)"
                         onmouseout="unselected_color(this)">
                        &#xe7e9; 编辑
                    </div>

                    <div class="separation_line">

                    </div>

                    <div class="head_left_button" id="remove" onmousemove="select_color(this)"
                         onmouseout="unselected_color(this)">
                        &#xeaa5; 删除
                    </div>
                </td>
                <td>
                    <div class="conditional_query">
                        <!--搜索按钮-->
                        <i class="iconfont search" id="conditional_search" onmousemove="select_color(this)"
                           onmouseout="unselected_color(this)" onclick="searchButton(1,0)">&#xe7e7;</i>
                        <!--标题-->
                        <div id="div2" class="head_right_side_input matter_title">
                            <input type="text" id="titleName" value="">
                        </div>

                        <!--日期选择-->
                        <div id="div3" class="head_right_side_input matter_importance" style="height: 30px;">
                            <input type="text" id="datePicker" name="datePicker" value=""
                                   onfocus="this.blur()" style="width: 200px">
                        </div>

                        <!--条件查询-->
                        <div id="div1" class="head_right_side">
                            <select id="condition">
                                <option value="0">- -查询条件- -</option>
                                <option value="1">文件名称</option>
                                <option value="2">访问日期</option>
                            </select>
                        </div>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <table class="simpletable">

        <thead>
        <th style="width: 3%;"><input type="checkbox"></th>
        <th style="width: 3%;">序号</th>
        <th style="width: 13%;">发文编号</th>
        <th style="width: 10%;">
            <select id="documentType" onchange="typeFilter(1)"
                    style="background: #92ebff;width:100%;height: 100%;outline: none;text-align: center;text-align-last: center">
                <option style="background: #fff;" value="888">文件类别</option>
                <option style="background: #fff;" value="0">行政文件</option>
                <option style="background: #fff;" value="1">党支部文件</option>
                <option style="background: #fff;" value="2">普通文件</option>
                <option style="background: #fff;" value="3">上报请示</option>
                <option style="background: #fff;" value="4">函文</option>
            </select>
        </th>
        <th style="width: 22%;">文件名称</th>
        <th style="width: 12%;">访问日期</th>
        <th style="width: 15%;">主送部门</th>
        <th style="width: 20%;">备注</th>
        </thead>

        <tbody id="tbody">

        <%--<c:forEach var="oaReleaseDocument" items="${oaReleaseDocumentList}" varStatus="status">
            <tr onclick="particulars(${oaReleaseDocument.id})">
                <td><input type="checkbox" value="${oaReleaseDocument.id}" onclick="window.event.cancelBubble=true;">
                </td>
                <td>${oaReleaseDocument.documentNumber}</td>
                <c:choose>
                    <c:when test="${oaReleaseDocument.documentType == 0}">
                        <td>行政文件</td>
                    </c:when>
                    <c:when test="${oaReleaseDocument.documentType == 1}">
                        <td>党支部文件</td>
                    </c:when>
                    <c:when test="${oaReleaseDocument.documentType == 2}">
                        <td>普通文件</td>
                    </c:when>
                    <c:when test="${oaReleaseDocument.documentType == 3}">
                        <td>上报请示</td>
                    </c:when>
                    <c:when test="${oaReleaseDocument.documentType == 4}">
                        <td>函文</td>
                    </c:when>
                </c:choose>
                <td>${oaReleaseDocument.documentName}</td>
                <td>${oaReleaseDocument.visitDateStr}</td>
                <td>${oaReleaseDocument.mainDeliveryDepartment}</td>
                <td>${oaReleaseDocument.remarks}</td>
            </tr>
        </c:forEach>--%>

        </tbody>

    </table>

</div>

<div id="fenye" style="right: 10px;height: 35px;position: absolute;bottom: 10px;">
    <div class="">
        <div class="" style="float: right;">
            <ul class="pagination" id="pagination" style="margin: 0"></ul>
            <input type="hidden" id="PageCount" runat="server"/>
            <input type="hidden" id="PageSize" runat="server"/>
            <input type="hidden" id="countindex" runat="server"/>
            <!--设置最多显示的页码数 可以手动设置 默认为7-->
            <input type="hidden" id="visiblePages" runat="server" value="10"/>
            <input type="hidden" id="page"/>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../../../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../../../static/js/oa/oa_common.js"></script>
<script type="text/javascript" src="../../../../../../static/js/date_pickers/jquery.date_input.pack.js"></script>
<script type="text/javascript" src="../../../../../../static/js/paging/jqPaginator.js"></script>
<script>

    //设置当前页
    var currentPageNum = JSON.parse('${currentPage}');

    function exeData(page, type, parameter) {
        //全部
        if (parameter === 1) {
            loadData(page);
            loadPage(parameter);

            //类型
        } else if (parameter === 2) {
            typeFilter(page);
            loadPage(parameter);

            //搜索
        } else if (parameter === 3 || parameter === 4) {
            searchButton(page);
            loadPage(parameter);
        }

    }

    function loadPage(parameter) {
        var myPageCount = parseInt($("#PageCount").val());
        var myPageSize = parseInt($("#PageSize").val());
        var countindex = Math.ceil(myPageCount / myPageSize);
        $("#countindex").val(countindex);

        $.jqPaginator('#pagination', {
            totalPages: parseInt($("#countindex").val()),
            visiblePages: parseInt($("#visiblePages").val()),
            currentPage: 1,
            first: '<li class="first"><a href="javascript:;">首页</a></li>',
            prev: '<li class="prev"><a href="javascript:;"><i class="arrow arrow2"></i>上一页</a></li>',
            next: '<li class="next"><a href="javascript:;">下一页<i class="arrow arrow3"></i></a></li>',
            last: '<li class="last"><a href="javascript:;">末页</a></li>',
            page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
            onPageChange: function (page, type) {
                if (type == "change") {
                    exeData(page, type, parameter);
                }
            }
        });
    }

    $(function () {
        $('#page').val(currentPageNum);
        loadData(currentPageNum);
        loadPage(1);
    });

    function loadData(page) {
        $.ajax({
            type: "post",
            url: '/releaseDocument/index',
            data: {'page': page},
            async: false,
            success: function (data) {
                var oaReleaseDocuments = JSON.parse(data);
                // console.log(oaReleaseDocument);
                //总数
                $("#PageCount").val(oaReleaseDocuments.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseList(oaReleaseDocuments);
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }

    //新建公司发文
    $("#newCompanyWriting").on("click", function () {
        window.location.href = '${path}/releaseDocument/toNewReleaseDocument';
    });

    //公司发文详情
    function particulars(id) {
        window.location.href = "${path}/releaseDocument/toReleaseDocumentDetails?id=" + id;
    }

    //文件类型筛选
    function typeFilter(page) {
        var documentType = $('#documentType').val();
        $.ajax({
            url: '/releaseDocument/docTypeFilter',
            data: {'documentType': documentType, 'page': page},
            type: 'POST',
            success: function (result) {
                var oaReleaseDocuments = JSON.parse(result);
                // console.log(oaReleaseDocument);
                //总数
                $("#PageCount").val(oaReleaseDocuments.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseList(oaReleaseDocuments);
                loadPage(2);
            },
            error: function () {
                alert("Connection error");
            }
        })
    }

    //搜索按钮
    function searchButton(page, parameter) {
        // $(".matter_title ,.matter_importance").css("display", "none");
        //发文名称搜索
        var documentName = $('#titleName').val();
        if (documentName != '' || parameter === 3) {
            $.ajax({
                url: '/releaseDocument/documentNameFilter',
                data: {'documentName': documentName, 'page': page},
                type: 'POST',
                success: function (result) {
                    $('#tbody').empty();
                    // var oaReleaseDocumentList = JSON.parse(result);
                    // parseList(oaReleaseDocumentList);
                    var oaReleaseDocuments = JSON.parse(result);
                    // console.log(oaReleaseDocument);
                    //总数
                    $("#PageCount").val(oaReleaseDocuments.total);
                    //每页显示条数
                    $("#PageSize").val("15");
                    parseList(oaReleaseDocuments);
                    loadPage(3);
                },
                error: function () {
                    alert("Connection error");
                }
            })
        }

        //访问时间搜索
        var visitDate = $('#datePicker').val();
        if (visitDate != '' || parameter === 4) {
            $.ajax({
                url: '/releaseDocument/visitDateFilter',
                data: {'visitDate': visitDate, 'page': page},
                type: 'POST',
                success: function (result) {
                    $('#tbody').empty();
                    // var oaReleaseDocumentList = JSON.parse(result);
                    // parseList(oaReleaseDocumentList);
                    var oaReleaseDocuments = JSON.parse(result);
                    // console.log(oaReleaseDocument);
                    //总数
                    $("#PageCount").val(oaReleaseDocuments.total);
                    //每页显示条数
                    $("#PageSize").val("15");
                    parseList(oaReleaseDocuments);
                    loadPage(4);
                },
                error: function () {
                    alert("Connection error");
                }
            })
        }
    }

    //解析筛选后的list
    function parseList(oaReleaseDocuments) {
        //结果集
        var oaReleaseDocumentList = oaReleaseDocuments.list;
        //当前页
        var pageNum = oaReleaseDocuments.pageNum;

        var oaReleaseDocument = '';
        if (oaReleaseDocumentList.length === 0) {
            oaReleaseDocument += '<tr>';
            oaReleaseDocument += '<td colspan="8">' + '暂无数据' + '</td>';
            oaReleaseDocument += '</tr>';
        } else {
            for (let i = 0; i < oaReleaseDocumentList.length; i++) {
                oaReleaseDocument += '<tr onclick="particulars(' + oaReleaseDocumentList[i].id + ')">';
                oaReleaseDocument += '<td><input type="checkbox" value="' + oaReleaseDocumentList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
                oaReleaseDocument += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
                oaReleaseDocument += '<td>' + oaReleaseDocumentList[i].documentNumber + '</td>';
                if (oaReleaseDocumentList[i].documentType == 0) {
                    oaReleaseDocument += '<td>' + '行政文件' + '</td>';
                } else if (oaReleaseDocumentList[i].documentType == 1) {
                    oaReleaseDocument += '<td>' + '党支部文件' + '</td>';
                } else if (oaReleaseDocumentList[i].documentType == 2) {
                    oaReleaseDocument += '<td>' + '普通文件' + '</td>';
                } else if (oaReleaseDocumentList[i].documentType == 3) {
                    oaReleaseDocument += '<td>' + '上报请示' + '</td>';
                } else if (oaReleaseDocumentList[i].documentType == 4) {
                    oaReleaseDocument += '<td>' + '函文' + '</td>';
                }
                oaReleaseDocument += '<td>' + oaReleaseDocumentList[i].documentName + '</td>';
                oaReleaseDocument += '<td>' + oaReleaseDocumentList[i].visitDateStr + '</td>';
                oaReleaseDocument += '<td>' + oaReleaseDocumentList[i].mainDeliveryDepartment + '</td>';
                oaReleaseDocument += '<td>' + oaReleaseDocumentList[i].remarks + '</td>';
                oaReleaseDocument += '</tr>';
            }
        }
        $('#tbody').html(oaReleaseDocument);
    }

    //日期选择器
    $('#datePicker').on('click', function () {
        $('#datePicker').date_input();
    });

    //内容列表选中颜色
    $("#tbody").on('click', 'tr', function () {
        if ($(this).hasClass("clickColor")) {
            $(this).removeClass("clickColor");
        } else {
            var trs = $(this).parent().find("tr");
            trs.removeClass("clickColor");
            $(this).addClass("clickColor");
        }
    });

    //修改
    $('#edit').on('click', function () {
        let length = $("tbody input:checked").length;
        if (length != 1) {
            alert("一次只能选择一条数据");
            return false;
        } else {
            var id = $("tbody input:checked").val();
            window.location.href = "${path}/releaseDocument/toEdit?id=" + id;
        }
    });

    //删除
    $('#remove').on('click', function () {
        let length = $("tbody input:checked").length;
        if (length !== 1) {
            layer.msg('请选择一条数据！');
            return false;
        } else {
            var id = $("tbody input:checked").val();
            //主页fun
            window.top.deleteArchivesData('/releaseDocument', id, $('#page').val());
        }
    });

    //重载页面
    function reloadArchivesData(page) {
        window.location.href = "${path}/releaseDocument/toReleaseDocument?page=" + page;
    }

</script>
</html>
