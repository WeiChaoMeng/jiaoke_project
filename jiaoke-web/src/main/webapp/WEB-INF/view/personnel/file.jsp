<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2019-8-8
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工档案</title>
    <link rel="stylesheet" type="text/css" href="../../../static/css/personnel/personnelCommon.css">
    <link href="../../../static/css/paging/htmleaf-demo.css" rel="stylesheet" type="text/css">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div style="width:95%;margin:0 auto;padding-top:20px;">
    <div style="display: table;">
        <span style="font-size: 13px;">档案信息</span>
    </div>

    <div style="background-color: #f5f9ff;border-radius: 5px;min-height: 500px;padding: 20px;">
        <table class="simple-table simple-table-file">
            <thead>
            <tr>
                <th>姓名</th>
                <th>人事材料存档率</th>
                <th>身份证原件</th>
                <th>学历证明</th>
                <th>合同</th>
                <th>入职简历</th>
                <th>入职登记表</th>
                <th>入职体检表</th>
                <th>上家公司离职证明</th>
                <th>最后更新时间</th>
            </tr>
            </thead>

            <tbody id="tbody">
            <tr>
                <td><span>西西</span></td>
                <td>0%</td>
                <td><img src="../../../static/images/personnel/incomplete.png"></td>
                <td><img src="../../../static/images/personnel/incomplete.png"></td>
                <td><img src="../../../static/images/personnel/incomplete.png"></td>
                <td><img src="../../../static/images/personnel/incomplete.png"></td>
                <td><img src="../../../static/images/personnel/incomplete.png"></td>
                <td><img src="../../../static/images/personnel/incomplete.png"></td>
                <td><img src="../../../static/images/personnel/incomplete.png"></td>
                <td>2019-09-01 12:12:12</td>
            </tr>

            <tr>
                <td>楠楠</td>
                <td>42.86%</td>
                <td><img src="../../../static/images/personnel/complete.png"></td>
                <td><img src="../../../static/images/personnel/incomplete.png"></td>
                <td><img src="../../../static/images/personnel/incomplete.png"></td>
                <td><img src="../../../static/images/personnel/incomplete.png"></td>
                <td><img src="../../../static/images/personnel/complete.png"></td>
                <td><img src="../../../static/images/personnel/incomplete.png"></td>
                <td><img src="../../../static/images/personnel/complete.png"></td>
                <td>2019-09-01 12:12:12</td>
            </tr>
            </tbody>
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

    function enclosureDetails(){
        layer.msg("上传");
    }

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
            url: '/personnel/userFiles',
            data: {'page': page},
            async: false,
            success: function (data) {
                var userInfos = JSON.parse(data);
                //总数
                $("#PageCount").val(userInfos.total);
                //每页显示条数
                $("#PageSize").val("15");
                parseResult(userInfos);
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    function exeData(page, type) {
        loadData(page);
        loadPage();
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

                userInfo += '<tr style="cursor: pointer;" onclick="enclosureDetails()">';
                userInfo += '<td>' + userInfoList[i].name + '</td>';
                userInfo += '<td>0%</td>';

                if (userInfoList[i].idCard !== undefined) {
                    userInfo += '<td><img src="../../../static/images/personnel/complete.png"></td>';
                } else {
                    userInfo += '<td><img src="../../../static/images/personnel/incomplete.png"></td>';
                }

                if (userInfoList[i].educatio !== undefined) {
                    userInfo += '<td><img src="../../../static/images/personnel/complete.png"></td>';
                } else {
                    userInfo += '<td><img src="../../../static/images/personnel/incomplete.png"></td>';
                }

                if (userInfoList[i].contract !== undefined) {
                    userInfo += '<td><img src="../../../static/images/personnel/complete.png"></td>';
                } else {
                    userInfo += '<td><img src="../../../static/images/personnel/incomplete.png"></td>';
                }

                if (userInfoList[i].resume !== undefined) {
                    userInfo += '<td><img src="../../../static/images/personnel/complete.png"></td>';
                } else {
                    userInfo += '<td><img src="../../../static/images/personnel/incomplete.png"></td>';
                }

                if (userInfoList[i].entry !== undefined) {
                    userInfo += '<td><img src="../../../static/images/personnel/complete.png"></td>';
                } else {
                    userInfo += '<td><img src="../../../static/images/personnel/incomplete.png"></td>';
                }

                if (userInfoList[i].medical !== undefined) {
                    userInfo += '<td><img src="../../../static/images/personnel/complete.png"></td>';
                } else {
                    userInfo += '<td><img src="../../../static/images/personnel/incomplete.png"></td>';
                }

                if (userInfoList[i].leave !== undefined) {
                    userInfo += '<td><img src="../../../static/images/personnel/complete.png"></td>';
                } else {
                    userInfo += '<td><img src="../../../static/images/personnel/incomplete.png"></td>';
                }

                userInfo += '<td>' + userInfoList[i].updateDateStr + '</td>';
                userInfo += '</tr>';
            }
        }
        $('#tbody').html(userInfo);
    }
</script>
</html>
