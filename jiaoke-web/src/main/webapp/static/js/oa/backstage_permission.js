//名字搜索
function searchButton(page, parameter) {
    var permissionName = $('#permissionName').val();
    $.ajax({
        type: "post",
        url: '/backstageManagement/permissionFilter',
        data: {'page': page, 'permissionName': permissionName},
        success: function (data) {
            var permissions = JSON.parse(data);
            //总数
            $("#PageCount").val(permissions.total);
            //每页显示条数
            $("#PageSize").val("15");
            parseResult(permissions);
            loadPage(parameter);
        },
        error: function (result) {
            alert("出错！");
        }
    })
}

//分页
$(function () {
    loadData(1);
    loadPage(1);
});

//分页
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

//加载数据
function loadData(page) {
    $.ajax({
        type: "post",
        url: '/backstageManagement/permissionManager',
        data: {'page': page},
        async: false,
        success: function (data) {
            var permissions = JSON.parse(data);
            //总数
            $("#PageCount").val(permissions.total);
            //每页显示条数
            $("#PageSize").val("15");
            parseResult(permissions);
        },
        error: function (result) {
            alert("出错！");
        }
    })
}

//解析list
function parseResult(permissions) {
    //结果集
    var permissionList = permissions.list;
    //当前页
    var pageNum = permissions.pageNum;
    //插入tbody
    var permission = '';
    if (permissionList.length === 0) {
        permission += '<tr>';
        permission += '<td colspan="5">' + '暂无数据' + '</td>';
        permission += '</tr>';
    } else {
        for (let i = 0; i < permissionList.length; i++) {
            permission += '<tr onclick="checkboxEvent(this)">';
            permission += '<td><input type="checkbox" value="' + permissionList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
            permission += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
            permission += '<td>' + permissionList[i].description + '</td>';
            permission += '<td>' + permissionList[i].url + '</td>';
            permission += '<td>' + permissionList[i].createTimeStr + '</td>';
            permission += '</tr>';
        }
    }

    $('#tbody').html(permission);
}

//checkbox选中事件
function checkboxEvent(own) {
    var checkbox = $(own).children('td').children('input').prop('checked');
    if (checkbox) {
        $(own).children('td').children('input').attr("checked", false);
    } else {
        $(own).children('td').children('input').attr("checked", true);
    }
}

//重置页面
function resetButton() {
    window.location.reload();
}
