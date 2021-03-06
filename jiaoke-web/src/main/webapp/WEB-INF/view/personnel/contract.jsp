<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <title>员工合同</title>
    <link rel="stylesheet" type="text/css" href="../../../static/css/personnel/personnelCommon.css">
    <link href="../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="personnel-manage-style">
    <div class="top-statistics">
        <div class="top-statistics-style">
            <span>已签订合同<h2>${total}</h2>人</span>
        </div>

        <div class="top-statistics-style" style="margin-left: 20px">
            <span>即将到期合同<h2 id="expire">0</h2>人</span>
        </div>
    </div>

    <div class="table-margin">
        <table class="simple-table simple-table-contract">
            <thead>
            <tr>
                <th>序号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>入职日期</th>
                <th>合同期限</th>
                <th>合同签订日期</th>
                <th>合同终止日期</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody id="tbody"></tbody>
        </table>

        <div id="paging" class="paging-div">
            <div class="">
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
    </div>
</div>


</body>
<script src="../../../static/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../../../static/js/paging/jqPaginator.js"></script>
<script src="../../../static/js/oa/layer/layer.js"></script>
<script>

    //设置当前页
    var currentPageNum = JSON.parse('${currentPage}');

    //初始化分页
    $(function () {
        //设置当前页
        $('#page').val(currentPageNum);
        loadData(currentPageNum);
        loadPage(1);
    });

    //加载数据
    function loadData(page) {
        $.ajax({
            type: "post",
            url: '/personnel/contractList',
            data: {'page': page},
            async: false,
            success: function (data) {
                var userInfos = JSON.parse(data);
                //总数
                $("#PageCount").val(userInfos.total);
                $("#totalNumberPeople").text(userInfos.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseResult(userInfos);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    //名字搜索
    function searchButton(page, parameter) {
        var username = $('#logonName').val();
        $.ajax({
            type: "post",
            url: '/personnel/usernameFilter',
            data: {'page': page, 'username': username},
            async: false,
            success: function (data) {
                $('#page').val(1);
                var userInfos = JSON.parse(data);
                //总数
                $("#PageCount").val(userInfos.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseResult(userInfos);
                loadPage(parameter);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    function exeData(page, type, parameter) {
        //全部
        if (parameter === 1) {
            loadData(page);
            loadPage(parameter);

            //名字搜索
        } else if (parameter === 2) {
            searchButton(page);
            loadPage(parameter);
        }
    }

    function loadPage(parameter) {
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
                    exeData(page, type, parameter);
                }
            }
        });
    }

    //解析list
    function parseResult(userInfos) {
        var count = 0;
        //结果集
        var userInfoList = userInfos.list;
        //当前页
        var pageNum = userInfos.pageNum;
        //插入tbody
        var userInfo = '';
        if (userInfoList.length === 0) {
            userInfo += '<tr>';
            userInfo += '<td colspan="7">' + '暂无数据' + '</td>';
            userInfo += '</tr>';
        } else {
            for (let i = 0; i < userInfoList.length; i++) {
                if (userInfoList[i].expire === 1) {
                    count++;
                    userInfo += '<tr style="background: #fbdcb5;">';
                } else {
                    userInfo += '<tr>';
                }
                userInfo += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
                userInfo += '<td>' + userInfoList[i].name + '</td>';
                userInfo += '<td>' + userInfoList[i].sex + '</td>';
                userInfo += '<td>' + userInfoList[i].joinedDate + '</td>';
                if (userInfoList[i].contractTerm === 0) {
                    userInfo += '<td>—</td>';
                } else if (userInfoList[i].contractTerm === 1) {
                    userInfo += '<td>三年</td>';
                } else if (userInfoList[i].contractTerm === 2) {
                    userInfo += '<td>五年</td>';
                } else if (userInfoList[i].contractTerm === 3) {
                    userInfo += '<td>无固定</td>';
                } else if (userInfoList[i].contractTerm === 4) {
                    userInfo += '<td>其他</td>';
                }
                if(userInfoList[i].contractSign === undefined || userInfoList[i].contractSign === ""){
                    userInfo += '<td>—</td>';
                }else {
                    userInfo += '<td>' + userInfoList[i].contractSign + '</td>';
                }
                if(userInfoList[i].contractStop === undefined || userInfoList[i].contractStop === ""){
                    userInfo += '<td>—</td>';
                }else {
                    userInfo += '<td>' + userInfoList[i].contractStop + '</td>';
                }
                userInfo += '<td>';
                userInfo += '<button type="button" class="basic-info-operation" onclick="edit(\'' + userInfoList[i].id + '\')">编辑</button>';
                userInfo += '<button type="button" class="basic-info-operation" onclick="particulars(\'' + userInfoList[i].id + '\')">详情</button>';
                userInfo += '</td>';
                userInfo += '</tr>';
            }

            $('#expire').text(count);
        }
        $('#tbody').html(userInfo);
    }

    function edit(id) {
        window.location.href = "${path}/personnel/toContractEdit?id=" + id;
    }

    function particulars(id) {
        window.top.contractDetails(id);
    }
</script>
</html>
