//用户名密码输入提示
function clickPrompt(owm) {
    var username = $(owm).val();
    if (username === "") {
        $(owm).next().html("支持英文、数字的组合，4-16个字符");
        $(owm).next().css("color", "#737373");
    }
}

//校验密码输入内容
function checkPassword(own) {
    var pwd = $(own).val();
    var len = /^.{4,16}$/;
    var reg = /^[a-zA-Z0-9]{4,16}$/;
    var han = "^[\u4e00-\u9fa5]{0,}$";
    if (pwd === "") {
        $(own).next().html("");
        return false;
    } else if (pwd.match(han)) {
        $(own).next().html("只支持英文、数字的组合");
        $(own).next().css("color", "#ff0202");
        return false;
    } else if (!pwd.match(len)) {
        $(own).next().html("长度只能在4-16个字符之间");
        $(own).next().css("color", "#ff0202");
        return false;
    } else if (!pwd.match(reg)) {
        $(own).next().html("只支持英文、数字的组合");
        $(own).next().css("color", "#ff0202");
        return false;
    } else {
        $(own).next().html("");
        return true;
    }
}

//校验用户名输入内容
function checkUsername(own) {
    var username = $(own).val();
    var len = /^.{4,16}$/;
    var reg = /^[a-zA-Z0-9]{4,16}$/;
    var han = "^[\u4e00-\u9fa5]{0,}$";
    if (username === "") {
        $(own).next().html("");
        return false;
    } else if (username.match(han)) {
        $(own).next().html("只支持英文、数字的组合");
        $(own).next().css("color", "#ff0202");
        return false;
    } else if (!username.match(len)) {
        $(own).next().html("长度只能在4-16个字符之间");
        $(own).next().css("color", "#ff0202");
        return false;
    } else if (!username.match(reg)) {
        $(own).next().html("只支持英文、数字的组合");
        $(own).next().css("color", "#ff0202");
        return false;
    } else if (whetherRegister(username)) {
        $(own).next().html("用户已存在");
        $(own).next().css("color", "#ff0202");
        return false;
    } else {
        $(own).next().html("");
        return true;
    }
}

//检查用户名是否被注册
function whetherRegister(username) {
    var res = false;
    $.ajax({
        type: "post",
        url: '/backstageManagement/checkUsername',
        data: {'username': username},
        async: false,
        success: function (data) {
            if (data === "true") {
                res = true;
            } else {
                res = false;
            }
        },
        error: function (result) {
            alert("出错！");
        }
    });
    return res;
}

//显示昵称输入提示
function nicknameClickPrompt(owm) {
    var username = $(owm).val();
    if (username === "") {
        $(owm).next().html("支持中文、英文、数字的组合，2-16个字符");
        $(owm).next().css("color", "#737373");
    }
}

//校验昵称输入内容
function checkNickname(own) {
    var nick = $(own).val();
    var len = /^.{2,16}$/;
    var reg = /^[\u4e00-\u9fa5a-zA-Z0-9]+$/;
    if (nick === "") {
        $(own).next().html("");
        return false;
    } else if (!nick.match(len)) {
        $(own).next().html("长度只能在2-16个字符之间");
        $(own).next().css("color", "#ff0202");
        return false;
    } else if (!nick.match(reg)) {
        $(own).next().html("只支持中文、英文、数字的组合");
        $(own).next().css("color", "#ff0202");
        return false;
    } else {
        $(own).next().html("");
        return true;
    }
}

//新增用户
$('#addUser').on('click', function () {
    $('#windowBackgroundColor').css("display", "block");
    $('#newUser').css("display", "block");
});

//提交新增用户
function confirm() {
    if ($('#username').val() === '') {
        $('#username').next().html("请输入用户名");
        $('#username').next().css("color", "#ff0202");
    } else {
        var name = checkUsername($('#username'));
        if (!name) {
            return;
        } else {
            if ($('#password').val() === '') {
                $('#password').next().html("请输入密码");
                $('#password').next().css("color", "#ff0202");
            } else {
                var pwd = checkPassword($('#password'));
                if (!pwd) {
                    return;
                } else {
                    if ($('#nickname').val() === '') {
                        $('#nickname').next().html("请输入昵称");
                        $('#nickname').next().css("color", "#ff0202");
                    } else {
                        var nick = checkNickname($('#nickname'));
                        if (!nick) {
                            return;
                        } else {
                            $.ajax({
                                type: "post",
                                url: '/backstageManagement/add',
                                data: $('#userInfo').serialize(),
                                success: function (data) {
                                    if (data == 'success') {
                                        alert('添加用户成功！');
                                        cancel();
                                        window.location.reload();
                                    } else {
                                        alert('添加用户失败！');
                                    }
                                },
                                error: function (result) {
                                    alert("出错！");
                                }
                            })
                        }
                    }
                }
            }
        }
    }
}

//提交编辑后的用户
function submissionEdit() {

    if ($('#passwordEdit').val() === '') {
        $('#passwordEdit').next().html("请输入密码");
        $('#passwordEdit').next().css("color", "#ff0202");
    } else {
        var pwd = checkPassword($('#passwordEdit'));
        if (!pwd) {
            return;
        } else {
            if ($('#nicknameEdit').val() === '') {
                $('#nicknameEdit').next().html("请输入昵称");
                $('#nicknameEdit').next().css("color", "#ff0202");
            } else {
                var nick = checkNickname($('#nicknameEdit'));
                if (!nick) {
                    return;
                } else {
                    var userInfo = $('#userInformation').serialize();
                    //当前用户所有角色
                    var array = [];
                    var list = $("#perListTbody input:checked");
                    for (var i = 0; i < list.length; i++) {
                        array.push(list[i].value);
                    }
                    $.ajax({
                        type: "post",
                        url: '/backstageManagement/edit',
                        data: userInfo + '&array=' + array,
                        success: function (data) {
                            if (data == 'success') {
                                alert('修改用户成功！');
                                cancel();
                                window.location.reload();
                            } else {
                                alert('修改用户失败！');
                            }
                        },
                        error: function (result) {
                            alert("出错！");
                        }
                    })
                }
            }
        }
    }
}

//删除用户
$('#deleteUser').on('click', function () {
    let length = $("tbody input:checked").length;
    if (length != 1) {
        alert("请选择一条数据！");
        return false;
    } else {
        var id = $("tbody input:checked").val();
        $.ajax({
            type: "post",
            url: '/backstageManagement/delete',
            data: {'id': id},
            success: function (data) {
                if (data == 'success') {
                    alert('删除用户成功！');
                    window.location.reload();
                } else {
                    alert('删除用户失败！');
                }
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }

});

//关闭弹窗
$("#windowBackgroundColor").on("click", function () {
    $("#windowBackgroundColor").css("display", "none");
    $("#newUser").css("display", "none");
    $("#modifyUser").css("display", "none");
    removeFrom();
    removeSpanContent();
});

//取消
function cancel() {
    $("#windowBackgroundColor").css("display", "none");
    $("#newUser").css("display", "none");
    $("#modifyUser").css("display", "none");
    removeFrom();
    removeSpanContent();
}

//初始化必填项提示文字
function removeSpanContent() {
    $('.form_content_check').children('span').html('');
}

//关闭弹窗清除from
function removeFrom() {
    document.getElementById("userInfo").reset();
}

//名字搜索
function searchButton(page, parameter) {
    var username = $('#logonName').val();
    $.ajax({
        type: "post",
        url: '/backstageManagement/usernameFilter',
        data: {'page': page, 'username': username},
        success: function (data) {
            var userInfos = JSON.parse(data);
            //总数
            $("#PageCount").val(userInfos.total);
            //每页显示条数
            $("#PageSize").val("15");
            parseResult(userInfos);
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

//加载数据
function loadData(page) {
    $.ajax({
        type: "post",
        url: '/backstageManagement/userManager',
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
            alert("出错！");
        }
    })
}

//解析list
function parseResult(userInfos) {
    //结果集
    var userInfoList = userInfos.list;
    //当前页
    var pageNum = userInfos.pageNum;
    //插入tbody
    var userInfo = '';
    if (userInfoList.length === 0) {
        userInfo += '<tr>';
        userInfo += '<td colspan="10">' + '暂无数据' + '</td>';
        userInfo += '</tr>';
    } else {
        for (let i = 0; i < userInfoList.length; i++) {
            userInfo += '<tr onclick="checkboxEvent(this)">';
            userInfo += '<td><input type="checkbox" value="' + userInfoList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
            userInfo += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
            userInfo += '<td>' + userInfoList[i].username + '</td>';
            userInfo += '<td>' + userInfoList[i].nickname + '</td>';
            userInfo += '<td>' + userInfoList[i].department + '</td>';
            if (userInfoList[i].phone == null) {
                userInfo += '<td></td>';
            } else {
                userInfo += '<td>' + userInfoList[i].phone + '</td>';
            }

            if (userInfoList[i].email == null) {
                userInfo += '<td></td>';
            } else {
                userInfo += '<td>' + userInfoList[i].email + '</td>';
            }
            userInfo += '</tr>';
        }
    }

    $('#tbody').html(userInfo);
}

//功能选中颜色
function select_color(itself) {
    itself.style.background = "#fff";
}

//功能未选中颜色
function unselected_color(itself) {
    itself.style.background = "#f1f1f1";
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

/*tab切换*/
//基本信息
function basicInformation() {
    $('#basicInformationTab').css("display", "block");
    $('#RoleInformationTab').css("display", "none");
    $('#div1').css("background", "#fff");
    $('#div2').css("background", "#92ebff");
}

//权限信息
function roleInformation() {
    $('#RoleInformationTab').css("display", "block");
    $('#basicInformationTab').css("display", "none");
    $('#div2').css("background", "#fff");
    $('#div1').css("background", "#92ebff");
}
