/*tab切换*/
//基本信息
function basicInformation() {
    $('#basicInformationTab').css("display", "block");
    $('#permissionInformationTab').css("display", "none");
    $('#div1').css("background", "#fff");
    $('#div2').css("background", "#92ebff");
}

//权限信息
function permissionInformation() {
    $('#permissionInformationTab').css("display", "block");
    $('#basicInformationTab').css("display", "none");
    $('#div2').css("background", "#fff");
    $('#div1').css("background", "#92ebff");
}

//角色输入提示
function clickPrompt(owm) {
    var name = $(owm).val();
    if (name === "") {
        $(owm).next().html("支持英文、数字的组合，2-16个字符");
        $(owm).next().css("color", "#737373");
    }
}

//校验角色名输入内容
function checkName(own) {
    var name = $(own).val();
    var len = /^.{2,16}$/;
    var check = /^[\u4e00-\u9fa5a-zA-Z0-9]+$/;
    if (name === "") {
        $(own).next().html("");
        return false;
    } else if (!name.match(len)) {
        $(own).next().html("长度只能在2-16个字符之间");
        $(own).next().css("color", "#ff0202");
        return false;
    } else if (!name.match(check)) {
        $(own).next().html("只支持汉字、英文、数字的组合");
        $(own).next().css("color", "#ff0202");
        return false;
    } else if (whetherRegister(name)) {
        $(own).next().html("角色被占用");
        $(own).next().css("color", "#ff0202");
        return false;
    } else {
        $(own).next().html("");
        return true;
    }
}

//检查角色名是否被注册
function whetherRegister(name) {
    var res = false;
    $.ajax({
        type: "post",
        url: '/backstageManagement/checkRoleName',
        data: {'name': name},
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

//新增角色
$('#addRole').on('click', function () {
    $('#windowBackgroundColor').css("display", "block");
    $('#newRole').css("display", "block");
});

//提交新增角色
function confirm() {
    if ($('#name').val() === '') {
        $('#name').next().html("请输入角色名称");
        $('#name').next().css("color", "#ff0202");
    } else {
        var name = checkName($('#name'));
        if (!name) {
            return;
        } else {
            $.ajax({
                type: "post",
                url: '/backstageManagement/addRoleInfo',
                data: $('#roleInfo').serialize(),
                success: function (data) {
                    if (data == 'success') {
                        alert('添加角色成功！');
                        cancel();
                        window.location.reload();
                    } else {
                        alert('添加角色失败！');
                    }
                },
                error: function (result) {
                    alert("出错！");
                }
            })
        }
    }
}

//编辑
$('#editRole').on('click', function () {
    let length = $("#tbody input:checked").length;
    if (length != 1) {
        alert("请选择一条数据！");
        return false;
    } else {
        var id = $("#tbody input:checked").val();
        $.ajax({
            type: "post",
            url: '/backstageManagement/toRoleEdit',
            data: {'id': id},
            success: function (data) {
                var roleInfo = JSON.parse(data);
                for (var key in roleInfo) {
                    if (key === 'roleInfo') {
                        var resultRoleInfo = '';

                        resultRoleInfo += '<table class="window-table">';
                        resultRoleInfo += '<tbody>';
                        resultRoleInfo += '<tr>';
                        resultRoleInfo += '<td class="form_title">角色名称:</td>';
                        resultRoleInfo += '<td class="form_content">';
                        resultRoleInfo += '<input class="font_input" name="name" id="nameEdit" value="' + roleInfo[key].name + '" type="text" style="background: #e8e8e8" readonly>';
                        resultRoleInfo += '</td>';
                        resultRoleInfo += '</tr>';
                        resultRoleInfo += '<tr>';
                        resultRoleInfo += '<td class="form_title">角色说明:</td>';
                        resultRoleInfo += '<td class="form_content">';
                        resultRoleInfo += '<textarea class="description-text" name="description" id="descriptionEdit" placeholder="请输入角色说明">';
                        resultRoleInfo += roleInfo[key].description;
                        resultRoleInfo += '</textarea>';
                        resultRoleInfo += '</td>';
                        resultRoleInfo += '</tr>';
                        resultRoleInfo += '</tbody>';
                        resultRoleInfo += '</table>';

                        $('#roleMessage').html(resultRoleInfo);

                        $('#windowBackgroundColor').css("display", "block");
                        $("#modifyRole").css("display", "block");
                    } else {
                        //勾选已有权限
                        for (var i = 0; i < roleInfo[key].length; i++) {
                            $('#perListTbody').children('tr').find('input').each(function () {
                                if ($(this).val() == roleInfo[key][i].id) {
                                    this.checked = true;
                                }
                            });
                        }
                    }
                }
            },
            error: function (result) {
                alert("出错！");
            }
        })
    }
});

//提交编辑后的用户
function submissionEdit() {
    //角色id
    var description = $('#descriptionEdit').val();
    var roleId = $("#tbody input:checked").val();

    //当前角色拥有的权限
    var array = [];
    var list = $("#perListTbody input:checked");
    for (var i = 0; i < list.length; i++) {
        array.push(list[i].value);
    }
    $.ajax({
        type: "post",
        url: '/backstageManagement/roleEdit',
        data: {array: array, roleId: roleId, description: description},
        async: false,
        cache: false,
        traditional: true,
        success: function (data) {
            if (data == 'success') {
                alert('修改角色成功！');
                cancel();
                window.location.reload();
            } else {
                alert('修改角色失败！');
            }
        },
        error: function (result) {
            alert("出错！");
        }
    })
}

//删除用户
$('#deleteRole').on('click', function () {
    let length = $("#tbody input:checked").length;
    if (length != 1) {
        alert("请选择一条数据！");
        return false;
    } else {
        var id = $("#tbody input:checked").val();
        $.ajax({
            type: "post",
            url: '/backstageManagement/deleteRole',
            data: {'id': id},
            success: function (data) {
                if (data == 'success') {
                    alert('删除角色成功！');
                    window.location.reload();
                } else {
                    alert('删除角色失败！');
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
    $("#newRole").css("display", "none");
    $("#modifyRole").css("display", "none");
    removeFrom();
    removeSpanContent();
});

//取消
function cancel() {
    $("#windowBackgroundColor").css("display", "none");
    $("#newRole").css("display", "none");
    $("#modifyRole").css("display", "none");
    removeFrom();
    removeSpanContent();
}

//初始化必填项提示文字
function removeSpanContent() {
    $('.form_content_check').children('span').html('');
}

//关闭弹窗清除from
function removeFrom() {
    document.getElementById("roleInfo").reset();
}

//名字搜索
function searchButton(page, parameter) {
    var name = $('#roleName').val();
    $.ajax({
        type: "post",
        url: '/backstageManagement/roleNameFilter',
        data: {'page': page, 'name': name},
        success: function (data) {
            var roleInfos = JSON.parse(data);
            //总数
            $("#PageCount").val(roleInfos.total);
            //每页显示条数
            $("#PageSize").val("15");
            parseResult(roleInfos);
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
        url: '/backstageManagement/roleManager',
        data: {'page': page},
        async: false,
        success: function (data) {
            var roleInfos = JSON.parse(data);
            //总数
            $("#PageCount").val(roleInfos.total);
            //每页显示条数
            $("#PageSize").val("15");
            parseResult(roleInfos);
        },
        error: function (result) {
            alert("出错！");
        }
    })
}

//解析list
function parseResult(roleInfos) {
    //结果集
    var roleInfoList = roleInfos.list;
    //当前页
    var pageNum = roleInfos.pageNum;
    //插入tbody
    var roleInfo = '';
    if (roleInfoList.length === 0) {
        roleInfo += '<tr>';
        roleInfo += '<td colspan="10">' + '暂无数据' + '</td>';
        roleInfo += '</tr>';
    } else {
        for (let i = 0; i < roleInfoList.length; i++) {
            roleInfo += '<tr onclick="checkboxEvent(this)">';
            roleInfo += '<td><input type="checkbox" value="' + roleInfoList[i].id + '" onclick="window.event.cancelBubble=true;"></td>';
            roleInfo += '<td>' + (pageNum === 1 ? pageNum + i : (pageNum - 1) * 15 + i + 1) + '</td>';
            roleInfo += '<td>' + roleInfoList[i].name + '</td>';
            roleInfo += '<td>' + roleInfoList[i].description + '</td>';
            roleInfo += '<td>' + roleInfoList[i].createTimeStr + '</td>';
            roleInfo += '</tr>';
        }
    }

    $('#tbody').html(roleInfo);
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
