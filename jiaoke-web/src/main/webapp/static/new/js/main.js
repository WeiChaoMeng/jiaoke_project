//关闭弹窗（公共）
function cancel() {
    layer.close(window.lar);
    $('#modalWindow').html("");
}

//批量删除数据（公共）
function batchDeleteData(url, ids, itselfFrameId) {
    if (ids.toString() !== "") {
        layer.confirm('确定要删除吗？', {
                btn: ['确认', '取消']
            }, function () {
                $.ajax({
                    type: "post",
                    url: url,
                    data: {'ids': ids},
                    async: false,
                    success: function (data) {
                        if (data === 'success') {
                            layer.msg('删除成功！');
                            $("#" + itselfFrameId)[0].contentWindow.batchDeletePageReload(1);
                        } else {
                            layer.msg('删除失败！')
                        }
                    },
                    error: function (result) {
                        layer.msg("出错！");
                    }
                })
            }
        );
    } else {
        layer.msg('请选择数据', {time: 2000});
    }
}

//提示
function tips(tipsContent, anim, icon, time) {
    layer.msg(tipsContent, {
        //0平滑放大。默认 1从上掉落、2从最底部往上滑入、3从左滑入、4从左翻滚、5渐显、6抖动
        anim: anim,
        //0感叹号、1正确、2错误、3文号、4锁、5哭脸、6笑脸
        icon: icon,
        //单位毫秒
        time: time
    });
}

//app二维码
function selectedCode() {
    $('#modalWindow').html('<div id="layerDemo" style="width: 200px;height: 200px;display: none;">\n' +
        '    <img style="width:100%;height:100%;background-color: #fff" src="/static/images/logo/download.png" alt="移动端二维码">\n' +
        '</div>');

    layer.open({
        type: 1,
        title: false,
        closeBtn: 0,
        skin: 'layui-layer-nobg', //没有背景色
        shade: [0.95, '#A8A0A1'],
        shadeClose: true, //点击遮罩关闭
        content: $('#layerDemo'),
        end:function () {
            $('#modalWindow').html("");
        }
    });
}

//跳转驾驶舱
function cockpit() {
    window.location.href = "/cockpitPage.do";
}

//修改密码
function editPsw() {
    $('#modalWindow').html('<div id="editPassword" style="height:100%;display: none;">\n' +
        '    <div class="psw-new-style">\n' +
        '        <label class="psw-new-name">新密码</label>\n' +
        '        <div style="float: left;width: 190px;">\n' +
        '            <input class="psw-new-input" type="password" onfocus="this.removeAttribute(\'readonly\')" id="newPsw"\n' +
        '                   autocomplete="off" onblur="checkNewPsw()" onclick="newPswTips()" readonly>\n' +
        '            <span id="newPswTips" class="psw-new-tips"></span>\n' +
        '        </div>\n' +
        '    </div>\n' +
        '    <div class="paw-confirm-style">\n' +
        '        <label class="paw-confirm-name">确认密码</label>\n' +
        '        <div style="float: left;width: 190px;">\n' +
        '            <input class="paw-confirm-input" type="password" onfocus="this.removeAttribute(\'readonly\')" id="confirmPsw"\n' +
        '                   autocomplete="off" onblur="checkConfirmPsw()" readonly>\n' +
        '            <span id="confirmPswTips" class="paw-confirm-tips"></span>\n' +
        '        </div>\n' +
        '    </div>\n' +
        '    <div class="confirm-modify-psw-style">\n' +
        '        <button onclick="confirmModifyPsw()" class="layui-btn">确认修改</button>\n' +
        '    </div>\n' +
        '</div>');

    window.lar = layer.open({
        title: '修改密码',
        type: 1,
        area: ['384px', '266px'],
        shadeClose: true, //点击遮罩关闭
        content: $("#editPassword"),
        offset: "auto",
        end:function () {
            $('#modalWindow').html("");
        }
    });

    //重置新密码输入框
    $('#newPsw').val('');
    $('#confirmPsw').val('');
    //重置边框颜色
    $('#newPsw').css("border-color", "#cecccc")
    $('#confirmPsw').css("border-color", "#cecccc")
    //重置input为readonly
    $('#newPsw').attr('readonly', 'true');
    $('#confirmPsw').attr('readonly', 'true');
    //重置提示
    $('#newPswTips').text("");
    $('#confirmPswTips').text("");
}

//新密码格式规则提示
function newPswTips() {
    $('#newPswTips').text("长度为4-20个字符,包含大小写字母及数字");
    $('#newPswTips').css("color", "#797979");
}

//校验新密码
function checkNewPsw() {
    var newPas = $('#confirmPsw').val();
    var pas = $('#newPsw').val();
    if (pas === "") {
        $('#newPswTips').text("请输入新的登录密码");
        $('#newPswTips').css("color", "#ff0000");
        $('#newPsw').css("border-color", "#ff0000");
    } else if (pas.length < 4) {
        $('#newPswTips').text("长度为4-20个字符");
        $('#newPswTips').css("color", "#ff0000");
        $('#newPsw').css("border-color", "#ff0000");
    } else if (newPas === pas) {
        $('#confirmPsw').css("border-color", "#cecccc");
        $('#confirmPswTips').text("");
        $('#newPsw').css("border-color", "#cecccc");
        $('#newPswTips').text("");
    } else {
        $('#newPsw').css("border-color", "#cecccc");
        $('#newPswTips').text("");
    }
}

//校验确认密码
function checkConfirmPsw() {
    var newPas = $('#newPsw').val();
    var pas = $('#confirmPsw').val();
    if (pas === "") {
        $('#confirmPswTips').text("请输入新的登录密码");
        $('#confirmPswTips').css("color", "#ff0000");
        $('#confirmPsw').css("border-color", "#ff0000");
    } else if (newPas !== pas) {
        $('#confirmPswTips').text("两次输入的密码不一致");
        $('#confirmPswTips').css("color", "#ff0000");
        $('#confirmPsw').css("border-color", "#ff0000");
    } else {
        $('#confirmPsw').css("border-color", "#cecccc");
        $('#confirmPswTips').text("");
    }
}

//确认修改密码
function confirmModifyPsw() {
    var n = $('#newPsw').val();
    var c = $('#confirmPsw').val();

    if (n === '') {
        $('#newPswTips').text("请输入新的登录密码");
        $('#newPswTips').css("color", "#ff0000");
        $('#newPsw').css("border-color", "#ff0000");
    } else if (n === '') {
        $('#confirmPswTips').text("请输入新的登录密码");
        $('#confirmPswTips').css("color", "#ff0000");
        $('#confirmPsw').css("border-color", "#ff0000");
    } else if (n !== c) {
        $('#confirmPswTips').text("两次输入的密码不一致");
        $('#confirmPswTips').css("color", "#ff0000");
        $('#confirmPsw').css("border-color", "#ff0000");
    } else {
        $.ajax({
            type: "post",
            url: '/backstageManagement/modifyPassword',
            data: {'password': c},
            async: false,
            success: function (data) {
                if (data === 'success') {
                    cancel();
                    layer.msg('密码修改成功，3秒后自动跳转登录页面', {
                        anim: 0,
                        icon: 1,
                        time: 3000,
                        shade: [0.5, '#393D49']
                    });
                    //修改成功后，3秒后跳转登录页
                    setTimeout(function () {
                        location.href = "logout";
                    }, 3000)
                } else {
                    tips('修改失败', 1, 2, 2000);
                }
            },
            error: function (result) {
                tips('出错', 1, 2, 2000);
            }
        });
    }
}

/**-----------------------用户管理---------------------------*/
//添加用户
function addUser(department, currentPage, itselfFrameId) {
    $('#modalWindow').html('<div id="addUser" class="window-body-add">\n' +
        '    <form id="userInfo">\n' +
        '        <table class="window-table">\n' +
        '            <tbody>\n' +
        '            <tr>\n' +
        '                <td class="form_title_check"><i class="required_mark">*</i>用户名:</td>\n' +
        '                <td class="form_content_check">\n' +
        '                    <input type="hidden" id="currentPage" value="' + currentPage + '">\n' +
        '                    <input class="font_input" name="username" id="username" value="" type="text"\n' +
        '                           placeholder="请输入用户名" maxlength="16" onblur="checkUsername(this)"\n' +
        '                           onclick="clickPrompt(this)"\n' +
        '                           autocomplete="off">\n' +
        '                    <span class="prompt-span"></span>\n' +
        '                </td>\n' +
        '            </tr>\n' +
        '            <tr>\n' +
        '                <td class="form_title_check"><i class="required_mark">*</i>密&nbsp;&nbsp;&nbsp;码:</td>\n' +
        '                <td class="form_content_check">\n' +
        '                    <input class="font_input" name="password" id="password" value=""\n' +
        '                           placeholder="请输入密码" maxlength="16" onblur="checkPassword(this)"\n' +
        '                           onclick="clickPrompt(this)"\n' +
        '                           autocomplete="off">\n' +
        '                    <span class="prompt-span"></span>\n' +
        '                </td>\n' +
        '            </tr>\n' +
        '            <tr>\n' +
        '                <td class="form_title_check"><i class="required_mark">*</i>昵&nbsp;&nbsp;&nbsp;称:</td>\n' +
        '                <td class="form_content_check">\n' +
        '                    <input class="font_input" id="nickname" value="" name="nickname" type="text"\n' +
        '                           placeholder="请输入昵称" maxlength="16" onblur="checkNickname(this)"\n' +
        '                           onclick="nicknameClickPrompt(this)" autocomplete="off">\n' +
        '                    <span class="prompt-span"></span>\n' +
        '                </td>\n' +
        '            </tr>\n' +
        '            <tr>\n' +
        '                <td class="form_title_check">部&nbsp;&nbsp;&nbsp;门:</td>\n' +
        '                <td class="form_content_check">\n' +
        '                    <select name="department" class="font_input" id="department">\n' +
        '                    </select>\n' +
        '                </td>\n' +
        '            </tr>\n' +
        '            <tr>\n' +
        '                <td class="form_title_check"><i class="required_mark">*</i>岗&nbsp;&nbsp;&nbsp;位:</td>\n' +
        '                <td class="form_content_check">\n' +
        '                    <input class="font_input" id="position" value="" name="position" type="text"\n' +
        '                           placeholder="请输入岗位" maxlength="16" onkeyup="this.value=this.value.replace(/^\\s+|\\s+$/g,\'\')" autocomplete="off" onblur="checkPosition(this)">\n' +
        '                    <span class="prompt-span"></span>\n' +
        '                </td>\n' +
        '            </tr>\n' +
        '            </tbody>\n' +
        '        </table>\n' +
        '    </form>\n' +
        '\n' +
        '    <div>\n' +
        '        <input type="button" value="确认" onclick="confirm()" class="layui-btn">\n' +
        '        <input type="button" value="取消" onclick="cancel()" class="layui-btn layui-btn-primary">\n' +
        '    </div>\n' +
        '</div>');

    window.lar = layer.open({
        title: '添加用户',
        type: 1,
        area: ['384px', '418px'],
        shadeClose: true, //点击遮罩关闭
        content: $("#addUser"),
        offset: "auto",
        end: function () {
            $('#modalWindow').html("");
        }
    });

    $('#subFrameId').val(itselfFrameId);

    //解析部门list
    var dep = '';
    for (var i = 0; i < department.length; i++) {
        dep += '<option value="' + department[i].departmentKey + '">' + department[i].departmentName + '</option>';
    }
    $('#department').html(dep);
}

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
                            if ($('#position').val() === '') {
                                $('#position').next().html("请输入岗位");
                                $('#position').next().css("color", "#ff0202");
                            } else {
                                var subFrameId = $('#subFrameId').val();

                                $.ajax({
                                    type: "post",
                                    url: '/backstageManagement/add',
                                    data: $('#userInfo').serialize(),
                                    success: function (data) {
                                        if (data === 'success') {
                                            $("#" + subFrameId)[0].contentWindow.reloadPage($('#currentPage').val());
                                            //清除from
                                            document.getElementById("userInfo").reset();
                                            layer.close(window.lar);
                                            $('#modalWindow').html("");
                                            layer.msg("添加用户成功!");
                                        } else {
                                            layer.msg("添加用户失败!");
                                        }
                                    },
                                    error: function (result) {
                                        layer.msg("出错！");
                                    }
                                })
                            }
                        }
                    }
                }
            }
        }
    }
}

//编辑用户
function editUser(userInfo, department, currentPage, itselfFrameId) {
    $('#modalWindow').html('<div id="modifyUser" class="window-body-add">\n' +
        '<input type="hidden" id="currentPage" value="' + currentPage + '">\n' +
        '    <form id="userInformation"></form>\n' +
        '\n' +
        '    <div>\n' +
        '        <input type="button" value="确认" onclick="submissionEdit()" class="layui-btn">\n' +
        '        <input type="button" value="取消" onclick="cancel()" class="layui-btn layui-btn-primary">\n' +
        '    </div>\n' +
        '</div>');

    window.lar = layer.open({
        title: '编辑用户',
        type: 1,
        area: ['384px', '418px'],
        shadeClose: true, //点击遮罩关闭
        content: $("#modifyUser"),
        offset: "auto",
        end: function () {
            $('#modalWindow').html("");
        }
    });

    $('#subFrameId').val(itselfFrameId);

    var resultsInfo = '';

    resultsInfo += '<table class="window-table">';
    resultsInfo += '<tbody>';
    resultsInfo += '<tr>';
    resultsInfo += '<td class="form_title">用户名:</td>';
    resultsInfo += '<td class="form_content">';
    resultsInfo += '<input name="id" value="' + userInfo.id + '" type="hidden">';
    resultsInfo += '<input class="font_input" name="username" id="usernameEdit" value="' + userInfo.username + '" type="text" style="background: #e8e8e8" readonly>';
    resultsInfo += '</td>';
    resultsInfo += '</tr>';
    resultsInfo += '<tr>';
    resultsInfo += '<td class="form_title_check" style="padding-top: 8px">密码:</td>';
    resultsInfo += '<td class="form_content_check">';
    resultsInfo += '<input class="font_input" name="password" id="passwordEdit" value="' + userInfo.password + '" type="text" autocomplete="off" onblur="checkPassword(this)">';
    resultsInfo += '<span class="prompt-span"></span>';
    resultsInfo += '</td>';
    resultsInfo += '</tr>';
    resultsInfo += '<tr>';
    resultsInfo += '<td class="form_title_check">昵称:</td>';
    resultsInfo += '<td class="form_content_check">';
    resultsInfo += '<input class="font_input" name="nickname" id="nicknameEdit" value="' + userInfo.nickname + '" type="text" autocomplete="off" onblur="checkNickname(this)">';
    resultsInfo += '<span class="prompt-span"></span>';
    resultsInfo += '</td>';
    resultsInfo += '</tr>';
    resultsInfo += '<tr>';
    resultsInfo += '<td class="form_title" style="padding-top: 0">部门:</td>';
    resultsInfo += '<td class="form_content" style="padding-top: 0">';
    resultsInfo += '<select name="department" class="font_input">';
    for (var i = 0; i < department.length; i++) {
        if (userInfo.department === department[i].departmentKey) {
            resultsInfo += '<option value="' + department[i].departmentKey + '" selected>' + department[i].departmentName + '</option>';
        } else {
            resultsInfo += '<option value="' + department[i].departmentKey + '">' + department[i].departmentName + '</option>';
        }
    }
    resultsInfo += '</select>';
    resultsInfo += '</td>';
    resultsInfo += '</tr>';
    resultsInfo += '<tr>';
    resultsInfo += '<td class="form_title_check">岗位:</td>';
    resultsInfo += '<td class="form_content_check">';
    resultsInfo += '<input class="font_input" name="position" id="positionEdit" value="' + userInfo.position + '" type="text" onkeyup="this.value=this.value.replace(/^\\s+|\\s+$/g,\'\')" autocomplete="off" onblur="checkPosition(this)">';
    resultsInfo += '<span class="prompt-span"></span>';
    resultsInfo += '</td>';
    resultsInfo += '</tr>';
    resultsInfo += '</tbody>';
    resultsInfo += '</table>';

    $('#userInformation').html(resultsInfo);
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
                    if ($('#positionEdit').val() === '') {
                        $('#positionEdit').next().html("请输入岗位");
                        $('#positionEdit').next().css("color", "#ff0202");
                    } else {
                        var subFrameId = $('#subFrameId').val();

                        $.ajax({
                            type: "post",
                            url: '/backstageManagement/edit',
                            data: $('#userInformation').serialize(),
                            success: function (data) {
                                if (data === 'success') {
                                    $("#" + subFrameId)[0].contentWindow.reloadPage($('#currentPage').val());
                                    layer.close(window.lar);
                                    $('#modalWindow').html("");
                                    layer.msg('修改用户成功！');
                                } else {
                                    layer.msg('修改用户失败！');
                                }
                            },
                            error: function (result) {
                                layer.msg("出错！");
                            }
                        })
                    }
                }
            }
        }
    }
}

//绑定角色
function bindingRole(roleInfo, id, currentPage, itselfFrameId) {
    $('#modalWindow').html('<div id="bindingRole" class="tab-right-div"></div>');
    window.lar = layer.open({
        title: '绑定角色',
        type: 1,
        area: ['384px', '418px'],
        shadeClose: true, //点击遮罩关闭
        content: $("#bindingRole"),
        offset: "auto",
        end: function () {
            $('#modalWindow').html("");
        }
    });

    $('#subFrameId').val(itselfFrameId);

    //角色信息
    var roleList = roleInfo.roleInfoList;
    //已绑定角色信息
    var possessRoleList = roleInfo.existingRoleInfo;

    var roleInfoList = '';
    roleInfoList += '<div id="RoleInformationTab" style="height: 80%;overflow: auto">';
    roleInfoList += '<table id="permissionList" class="table-list">';
    roleInfoList += '<tbody id="perListTbody">';
    roleInfoList += '<input id="bindingUserId" type="hidden" value="' + id + '">';
    roleInfoList += '<input id="currentPage" type="hidden" value="' + currentPage + '">';
    for (var i = 0; i < roleList.length; i++) {
        roleInfoList += '<tr onclick="checkboxEvent(this)" style="height: 18px">';
        roleInfoList += '<td class="table-list-td-checkbox">';
        roleInfoList += '<input type="checkbox" style="zoom: 120%" value="' + roleList[i].id + '" onclick="window.event.cancelBubble=true;">';
        roleInfoList += '</td>';
        roleInfoList += '<td class="per-list-td">' + roleList[i].name + '</td>';
        roleInfoList += '</tr>';
    }
    roleInfoList += '</tbody>';
    roleInfoList += '</table>';
    roleInfoList += '</div>';
    roleInfoList += '<div style="padding-top: 20px;text-align: center">';
    roleInfoList += '<input type="button" value="确认" onclick="submissionBinding()" class="layui-btn">';
    roleInfoList += '<input type="button" value="取消" onclick="cancel()" class="layui-btn layui-btn-primary">';
    roleInfoList += '</div>';

    $('#bindingRole').html(roleInfoList);

    //勾选已有角色
    for (var j = 0; j < possessRoleList.length; j++) {
        $('#perListTbody').children('tr').find('input').each(function () {
            if ($(this).val() == possessRoleList[j].id) {
                this.checked = true;
            }
        });
    }
}

//提交绑定
function submissionBinding() {
    var subFrameId = $('#subFrameId').val();
    //用户id
    var userId = $('#bindingUserId').val();
    //选中的角色列表
    var array = [];
    var list = $("#perListTbody input:checked");
    for (var i = 0; i < list.length; i++) {
        array.push(list[i].value);
    }
    $.ajax({
        type: "post",
        url: '/backstageManagement/binding',
        data: 'userId=' + userId + '&array=' + array,
        success: function (data) {
            if (data === 'success') {
                $("#" + subFrameId)[0].contentWindow.reloadPage($('#currentPage').val());
                layer.close(window.lar);
                $('#modalWindow').html("");
                layer.msg('绑定角色成功！');
            } else {
                layer.msg('绑定角色失败！');
            }
        },
        error: function (result) {
            layer.msg("出错！");
        }
    })
}

//删除用户
function deleteUser(id, itselfFrameId) {
    //提示窗
    layer.confirm('确定要删除吗？', {
            btn: ['确认', '取消']
        }, function () {
            $.ajax({
                type: "post",
                url: '/backstageManagement/delete',
                data: {'id': id},
                async: false,
                success: function (data) {
                    if (data === 'success') {
                        layer.msg('删除成功！')
                        $("#" + itselfFrameId)[0].contentWindow.reloadPage(1);
                    } else {
                        layer.msg('删除失败！')
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            });
        }
    );
}

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

//校验岗位
function checkPosition(own) {
    var position = $(own).val();
    if (position === "") {
        $(own).next().html("请输入岗位");
        $(own).next().css("color", "#ff0202");
        return false;
    } else {
        $(own).next().html("");
        return true;
    }
}

/**-------------------------部门--------------------------*/
//添加部门
function addDepartment(currentPage, itselfFrameId) {
    $('#modalWindow').html('<div id="addDepartment" class="window-body-add">\n' +
        '        <table class="window-table">\n' +
        '            <tbody>\n' +
        '            <tr>\n' +
        '                <td class="form_title_check"><i class="required_mark">*</i>部门名称:</td>\n' +
        '                <td class="form_content_check">\n' +
        '                    <input type="hidden" id="departmentPage" value="' + currentPage + '">\n' +
        '                    <input class="font_input" id="departmentName" type="text" placeholder="请输入部门名称" maxlength="16" onkeyup="this.value=this.value.replace(/^\\s+|\\s+$/g,\'\')" autocomplete="off">\n' +
        '                    <span class="prompt-span"></span>\n' +
        '                </td>\n' +
        '            </tr>\n' +
        '            </tbody>\n' +
        '        </table>\n' +
        '        <div style="padding-top: 20px">\n' +
        '            <input type="button" value="确认" onclick="commitDepartment()" class="layui-btn">\n' +
        '            <input type="button" value="取消" onclick="cancel()" class="layui-btn layui-btn-primary">\n' +
        '        </div>\n' +
        '    </div>');

    window.lar = layer.open({
        title: '添加部门',
        type: 1,
        area: ['380px', '230px'],
        shadeClose: true, //点击遮罩关闭
        content: $("#addDepartment"),
        offset: "auto",
        end: function () {
            $('#modalWindow').html("");
        }
    });

    $('#subFrameId').val(itselfFrameId);
}

//提交新增部门
function commitDepartment() {
    var departmentName = $('#departmentName').val();
    var subFrameId = $('#subFrameId').val();
    if (departmentName !== "") {
        if (departmentWhetherRegister(departmentName)) {
            layer.msg('该部门已被注册');
        } else {
            $.ajax({
                type: "post",
                url: '/backstageManagement/addDepartment',
                data: {'departmentName': departmentName},
                success: function (data) {
                    if (data === 'success') {
                        $("#" + subFrameId)[0].contentWindow.departmentInfoPageReload($('#departmentPage').val());
                        layer.close(window.lar);
                        $('#modalWindow').html("");
                        layer.msg("添加部门成功!");
                    } else {
                        layer.msg("添加部门失败!");
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            })
        }
    } else {
        layer.msg("部门名称不可以为空！");
    }
}

//删除部门
function deleteDepartment(id, itselfFrameId) {
    //提示窗
    layer.confirm('确定要删除吗？', {
            btn: ['确认', '取消']
        }, function () {
            $.ajax({
                type: "post",
                url: '/backstageManagement/deleteDepartment',
                data: {'id': id},
                async: false,
                success: function (data) {
                    if (data === 'success') {
                        layer.msg('删除成功！');
                        $("#" + itselfFrameId)[0].contentWindow.departmentInfoPageReload(1);
                    } else {
                        layer.msg('删除失败！')
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            })
        }
    );
}

//编辑部门
function editDepartment(department, currentPage, itselfFrameId) {
    $('#modalWindow').html('<div id="editDepartment" class="window-body-add">\n' +
        '    <table class="window-table">\n' +
        '        <tbody>\n' +
        '        <tr>\n' +
        '            <td class="form_title_check"><i class="required_mark">*</i>部门名称:</td>\n' +
        '            <td class="form_content_check">\n' +
        '                <input type="hidden" id="editDepartmentId" value="' + department.id + '">\n' +
        '                <input type="hidden" id="departmentPage" value="' + currentPage + '">\n' +
        '                <input class="font_input" id="editDepartmentName" value="' + department.departmentName + '" type="text"\n' +
        '                       placeholder="请输入部门名称" maxlength="16" onkeyup="this.value=this.value.replace(/^\\s+|\\s+$/g,\'\')"\n' +
        '                       autocomplete="off">\n' +
        '                <span class="prompt-span"></span>\n' +
        '            </td>\n' +
        '        </tr>\n' +
        '        </tbody>\n' +
        '    </table>\n' +
        '\n' +
        '    <div style="padding-top: 20px">\n' +
        '        <input type="button" value="确认" onclick="commitEditDepartment()" class="layui-btn">\n' +
        '        <input type="button" value="取消" onclick="cancel()" class="layui-btn layui-btn-primary">\n' +
        '    </div>\n' +
        '</div>');

    window.lar = layer.open({
        title: '编辑部门',
        type: 1,
        area: ['380px', '230px'],
        shadeClose: true, //点击遮罩关闭
        content: $("#editDepartment"),
        offset: "auto",
        end: function () {
            $('#modalWindow').html("");
        }
    });

    $('#subFrameId').val(itselfFrameId);
}

//提交编辑后的部门
function commitEditDepartment() {
    var id = $('#editDepartmentId').val();
    var departmentName = $('#editDepartmentName').val();
    var subFrameId = $('#subFrameId').val();
    if (departmentName !== "") {
        if (departmentWhetherRegister(departmentName)) {
            layer.msg('该部门已被注册');
        } else {
            $.ajax({
                type: "post",
                url: '/backstageManagement/departmentEdit',
                data: {'id': id, 'departmentName': departmentName},
                success: function (data) {
                    if (data === 'success') {
                        $("#" + subFrameId)[0].contentWindow.departmentInfoPageReload($('#departmentPage').val());
                        layer.close(window.lar);
                        $('#modalWindow').html("");
                        layer.msg("编辑部门成功!");
                    } else {
                        layer.msg("编辑部门失败!");
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            })
        }
    } else {
        layer.msg("部门名称不可以为空！");
    }
}


//检查部门名称是否被注册
function departmentWhetherRegister(departmentName) {
    var res = false;
    $.ajax({
        type: "post",
        url: '/backstageManagement/checkDepartmentName',
        data: {'departmentName': departmentName},
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

//部门绑定主管
function bindingDepartmentHead(userInfoList, departmentList, id, page, target, itselfFrameId) {
    $('#modalWindow').html('<div id="bindingDepartment" style="display: none;width: 96%;height: 96%;padding: 2%">\n' +
        '    <div class="option-window-body-head cursor_hand">\n' +
        '        <input type="hidden" id="departmentId" value="' + id + '">\n' +
        '        <input type="hidden" id="bindingTarget" value="' + target + '">\n' +
        '        <input type="hidden" id="departmentPage" value="' + page + '">\n' +
        '        <div id="selectDepartment" class="selection-content-inside">\n' +
        '            <ul id="departmentAndUser"></ul>\n' +
        '        </div>\n' +
        '    </div>\n' +
        '    <div class="option-window-body-bottom">\n' +
        '        <input type="button" value="确认" onclick="confirmDepartmentHead()" class="layui-btn">\n' +
        '        <input type="button" value="取消" onclick="cancel()" class="layui-btn layui-btn-primary">\n' +
        '    </div>\n' +
        '</div>');

    window.lar = layer.open({
        title: '绑定负责人',
        type: 1,
        area: ['310px', '380px'],
        shadeClose: true, //点击遮罩关闭
        content: $("#bindingDepartment"),
        offset: "auto",
        end: function () {
            $('#modalWindow').html("");
        }
    });

    $('#subFrameId').val(itselfFrameId);

    //加载部门和员工
    var department = "";
    for (let i = 0; i < departmentList.length; i++) {
        department += '<li class="selection-box-li">';
        department += '<img src="../../../static/images/icon/department.png">';
        department += '<span onclick="departmentSelect(this)" id="' + departmentList[i].departmentKey + '">' + departmentList[i].departmentName + '</span>';
        department += '<div></div>';
        for (let j = 0; j < userInfoList.length; j++) {
            if (userInfoList[j].department === departmentList[i].departmentKey) {
                department += '<ul class="submenu-ul">';
                department += '<li onclick="addSelectionUser(this)">';
                department += '<img src="../../../static/images/icon/personnel.png">';
                department += '<span id="' + userInfoList[j].id + '">' + userInfoList[j].nickname + '</span>';
                department += '<div></div>';
                department += '</li>';
                department += '</ul>';
            }
        }
        department += '</li>';
    }
    $("#departmentAndUser").html(department);
}

//选择框中的展开与收缩
function departmentSelect(own) {
    if ($(own).siblings('ul').css('display') == "none") {
        //展开未展开
        $(own).siblings('ul').slideUp(300);
        $(own).siblings('ul').slideDown(300);
    } else {
        //收缩已展开
        $(own).siblings('ul').slideUp(300);
    }
    preventBubble();
}

//用户选择器
function addSelectionUser(own) {
    if ($(own).children('div').hasClass("selection")) {
        $(own).children('div').removeClass("selection");
    } else {
        $('#selectDepartment').find('div').removeClass("selection");
        $(own).find("div").addClass("selection");
    }
}

//提交绑定
function confirmDepartmentHead() {
    var subFrameId = $('#subFrameId').val();
    var lis = $("#selectDepartment").find("div");
    //是否包含selectedDrafter
    if (lis.hasClass("selection")) {
        //选择的用户id
        var principal = $(".selection").prev().attr('id');
        //部门id
        var id = $('#departmentId').val();
        //绑定的目标：1、部门负责人，2、部门主管领导
        var target = $('#bindingTarget').val();
        if (target == 1) {
            $.ajax({
                type: "post",
                url: '/backstageManagement/bindingDepartmentPrincipal',
                data: {'id': id, 'principal': principal},
                success: function (data) {
                    if (data === 'success') {
                        $("#" + subFrameId)[0].contentWindow.departmentInfoPageReload($('#departmentPage').val());
                        layer.close(window.lar);
                        $('#modalWindow').html("");
                        layer.msg("绑定部门负责人成功!");
                    } else {
                        layer.msg("绑定部门负责人失败!");
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            })
        } else {
            $.ajax({
                type: "post",
                url: '/backstageManagement/bindingDepartmentSupervisor',
                data: {'id': id, 'supervisor': principal},
                success: function (data) {
                    if (data === 'success') {
                        $("#" + subFrameId)[0].contentWindow.departmentInfoPageReload($('#departmentPage').val());
                        layer.close(window.lar);
                        $('#modalWindow').html("");
                        layer.msg("绑定部门主管成功!");
                    } else {
                        layer.msg("绑定部门主管失败!");
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            })
        }
    } else {
        layer.msg('请先选择')
    }
}

/**-------------------------角色管理-------------------------*/
//新增角色
function addRole(currentPage, itselfFrameId) {
    $('#modalWindow').html('<div id="addRole" class="window-body-add">\n' +
        '    <form id="roleInfo">\n' +
        '        <table class="window-table">\n' +
        '            <tbody>\n' +
        '            <tr>\n' +
        '                <td class="form_title_check"><i class="required_mark">*</i>角色名称:</td>\n' +
        '                <td class="form_content_check">\n' +
        '                    <input type="hidden" id="rolePage" value="' + currentPage + '">\n' +
        '<input class="font_input" name="name" id="name" value="" type="text" onclick="clickPromptRole(this)" autocomplete="off"\n' +
        '                           placeholder="请输入角色名称" maxlength="16" onkeyup="this.value=this.value.replace(/^\\s+|\\s+$/g,\'\')"  onblur="checkRoleName(this)">\n' +
        '                    <span class="prompt-span"></span>\n' +
        '                </td>\n' +
        '            </tr>\n' +
        '            <tr>\n' +
        '                <td class="form_title_check">角色说明:</td>\n' +
        '                <td class="form_content_check">\n' +
        '<textarea class="description-text" placeholder="请输入角色说明" name="description" id="description" onkeyup="this.value=this.value.replace(/^\\s+|\\s+$/g,\'\')" ></textarea>\n' +
        '                    <span class="prompt-span"></span>\n' +
        '                </td>\n' +
        '            </tr>\n' +
        '            </tbody>\n' +
        '        </table>\n' +
        '    </form>\n' +
        '    <div style="padding-top: 20px">\n' +
        '        <input type="button" value="确认" onclick="commitRole()" class="layui-btn">\n' +
        '        <input type="button" value="取消" onclick="cancel()" class="layui-btn layui-btn-primary">\n' +
        '    </div>\n' +
        '</div>');

    window.lar = layer.open({
        title: '添加角色',
        type: 1,
        area: ['384px', '312px'],
        shadeClose: true, //点击遮罩关闭
        content: $("#addRole"),
        offset: "auto",
        end: function () {
            $('#modalWindow').html("");
        }
    });

    $('#subFrameId').val(itselfFrameId);
}

//提交新增角色
function commitRole() {
    if ($('#name').val() === '') {
        $('#name').next().html("请输入角色名称");
        $('#name').next().css("color", "#ff0202");
    } else {
        var name = checkRoleName($('#name'));
        var subFrameId = $('#subFrameId').val();
        if (!name) {
            return;
        } else {
            $.ajax({
                type: "post",
                url: '/backstageManagement/addRoleInfo',
                data: $('#roleInfo').serialize(),
                success: function (data) {
                    if (data === 'success') {
                        $("#" + subFrameId)[0].contentWindow.roleInfoPageReload($('#rolePage').val());
                        document.getElementById("roleInfo").reset();
                        layer.close(window.lar);
                        $('#modalWindow').html("");
                        layer.msg("添加角色成功!");
                    } else {
                        layer.msg("添加角色失败!");
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            })
        }
    }
}

//校验角色名输入内容
function checkRoleName(own) {
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
    } else if (roleWhetherRegister(name)) {
        $(own).next().html("角色被占用");
        $(own).next().css("color", "#ff0202");
        return false;
    } else {
        $(own).next().html("");
        return true;
    }
}

//检查角色名是否被注册
function roleWhetherRegister(name) {
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

//角色输入提示
function clickPromptRole(owm) {
    var name = $(owm).val();
    if (name === "") {
        $(owm).next().html("支持英文、数字的组合，2-16个字符");
        $(owm).next().css("color", "#737373");
    }
}

//编辑角色
function editRole(roleInfo, currentPage, itselfFrameId) {
    $('#modalWindow').html('<div id="modifyRole" class="window-body-add">\n' +
        '     <input type="hidden" id="rolePage" value="' + currentPage + '">\n' +
        '    <form id="roleInformation"></form>\n' +
        '    <div style="padding-top: 20px">\n' +
        '        <input type="button" value="确认" onclick="commitRoleEdit()" class="layui-btn">\n' +
        '        <input type="button" value="取消" onclick="cancel()" class="layui-btn layui-btn-primary">\n' +
        '    </div>\n' +
        '</div>');

    window.lar = layer.open({
        title: '编辑角色',
        type: 1,
        area: ['384px', '312px'],
        shadeClose: true, //点击遮罩关闭
        content: $("#modifyRole"),
        offset: "auto",
        end: function () {
            $('#modalWindow').html("");
        }
    });

    $('#subFrameId').val(itselfFrameId);

    var resultRoleInfo = '';
    resultRoleInfo += '<table class="window-table">';
    resultRoleInfo += '<tbody>';
    resultRoleInfo += '<tr>';
    resultRoleInfo += '<td class="form_title">角色名称:</td>';
    resultRoleInfo += '<td class="form_content">';
    resultRoleInfo += '<input id="roleIdEdit" value="' + roleInfo.id + '" type="hidden">';
    resultRoleInfo += '<input class="font_input" name="name" id="nameEdit" value="' + roleInfo.name + '" type="text" style="background: #e8e8e8" readonly>';
    resultRoleInfo += '</td>';
    resultRoleInfo += '</tr>';
    resultRoleInfo += '<tr>';
    resultRoleInfo += '<td class="form_title">角色说明:</td>';
    resultRoleInfo += '<td class="form_content">';
    resultRoleInfo += '<textarea class="description-text" name="description" id="descriptionEdit" placeholder="请输入角色说明" onkeyup="this.value=this.value.replace(/^\\s+|\\s+$/g,\'\')" >';
    resultRoleInfo += roleInfo.description;
    resultRoleInfo += '</textarea>';
    resultRoleInfo += '</td>';
    resultRoleInfo += '</tr>';
    resultRoleInfo += '</tbody>';
    resultRoleInfo += '</table>';

    $('#roleInformation').html(resultRoleInfo);
}

//提交编辑后的角色
function commitRoleEdit() {
    var subFrameId = $('#subFrameId').val();
    //角色id
    var description = $('#descriptionEdit').val();
    var roleId = $("#roleIdEdit").val();

    $.ajax({
        type: "post",
        url: '/backstageManagement/roleEdit',
        data: {roleId: roleId, description: description},
        async: false,
        cache: false,
        traditional: true,
        success: function (data) {
            if (data === 'success') {
                $("#" + subFrameId)[0].contentWindow.roleInfoPageReload($('#rolePage').val());
                layer.close(window.lar);
                $('#modalWindow').html("");
                layer.msg('修改角色成功！');
            } else {
                layer.msg('修改角色失败！');
            }
        },
        error: function (result) {
            layer.msg("出错！");
        }
    });
}

//删除角色
function deleteRole(id, itselfFrameId) {
    //提示窗
    layer.confirm('确定要删除吗？', {
            btn: ['确认', '取消']
        }, function () {
            $.ajax({
                type: "post",
                url: '/backstageManagement/deleteRole',
                data: {'id': id},
                async: false,
                success: function (data) {
                    if (data === 'success') {
                        layer.msg('删除成功！');
                        $("#" + itselfFrameId)[0].contentWindow.roleInfoPageReload(1);
                    } else {
                        layer.msg('删除失败！')
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            })
        }
    );
}

/**---------------协同工作----------------*/
//协同-删除已发事项
function deleteAlreadySend(url, id, processInstanceId, currentPage, itselfFrameId) {
    //提示窗
    layer.confirm('该操作不能恢复,是否进行删除操作？', {
            btn: ['确认', '取消']
        }, function () {
            $.ajax({
                type: "post",
                url: url,
                data: {'id': id, 'processInstanceId': processInstanceId},
                async: false,
                success: function (data) {
                    if (data === 'success') {
                        layer.msg('删除成功！');
                        $("#" + itselfFrameId)[0].contentWindow.reloadAlreadySendDocument(currentPage);
                    } else {
                        layer.msg('删除失败！')
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            });
        }
    );
}

//协同-撤销已发事项
function rescindAlreadySend(url, id, processInstanceId, currentPage, itselfFrameId) {
    //提示窗
    layer.confirm('确定要撤销流程吗？', {
            btn: ['确认', '取消']
        }, function () {
            $.ajax({
                type: "post",
                url: url,
                data: {'id': id, 'processInstanceId': processInstanceId},
                success: function (data) {
                    if (data === 'success') {
                        layer.msg('撤销流程成功,并将数据转存到待发事项中！');
                        $("#" + itselfFrameId)[0].contentWindow.reloadAlreadySendDocument(currentPage);
                    } else if (data === 'end') {
                        layer.msg('该流程已结束,不能撤销！')
                    } else {
                        layer.msg('撤销流程失败！')
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            });
        }
    );
}

//协同-删除待发事项
function deleteWaitSend(correlationId, table, currentPage, itselfFrameId) {
    //提示窗
    layer.confirm('该操作不能恢复,是否进行删除操作？', {
            btn: ['确认', '取消']
        }, function () {
            $.ajax({
                type: "post",
                url: "/collaboration/deleteWaitSend",
                data: {'correlationId': correlationId, 'table': table},
                async: false,
                success: function (data) {
                    if (data === 'success') {
                        layer.msg('删除成功！');
                        $("#" + itselfFrameId)[0].contentWindow.reloadWaitSendDocument(currentPage);
                    } else {
                        layer.msg('删除失败！')
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            });
        }
    );
}

//表单发送前选择部门负责人
function selectPrincipal(principalList, itselfFrameId) {
    $('#modalWindow').html('<div id="selectPrincipal" class="window-body-add">\n' +
        '    <div id="principalContent"></div>\n' +
        '    <div style="padding-top: 20px">\n' +
        '        <input type="button" value="确认" onclick="commitPrincipal()" class="layui-btn">\n' +
        '        <input type="button" value="取消" onclick="cancel()" class="layui-btn layui-btn-primary">\n' +
        '    </div>\n' +
        '</div>');

    window.lar = layer.open({
        title: '所在部门负责人',
        type: 1,
        area: ['310px', '230px'],
        shadeClose: true, //点击遮罩关闭
        content: $("#selectPrincipal"),
        offset: "auto",
        end:function () {
            $('#modalWindow').html("");
        }
    });

    $('#subFrameId').val(itselfFrameId);

    var principal = "";
    principal += '<div id="radioChecked" style="text-align: left;">';
    principal += '<div style="margin: 10px;"><input type="radio" name="abc" value="'+principalList[1]+','+principalList[3]+'" checked style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>全部</span></div>';
    principal += '<div style="margin: 10px;"><input type="radio" name="abc" value="'+principalList[1]+'" style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>'+principalList[0]+'</span></div>';
    principal += '<div style="margin: 10px;"><input type="radio" name="abc" value="'+principalList[3]+'" style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>'+principalList[2]+'</span></div>';
    principal += '</div>';
    $('#principalContent').html(principal);
}

//提交-表单发送前选择部门负责人
function commitPrincipal() {
    var subFrameId = $('#subFrameId').val();
    let val = $('#radioChecked input[type="radio"]:checked').val();
    $("#"+subFrameId)[0].contentWindow.selectionPrincipal(val);
    layer.close(window.lar);
    $('#modalWindow').html("");
}

/**---------------企业文化建设----------------*/
//删除企业文化建设数据
function cultureCorporateDelete(tab, id, currentPage, itselfFrameId) {
    layer.confirm('确定要删除吗？', {
            btn: ['确认', '取消']
        }, function () {
            $.ajax({
                type: "post",
                url: tab + '/delete',
                data: {'id': id},
                async: false,
                success: function (data) {
                    if (data === 'success') {
                        layer.msg('删除成功！');
                        $("#" + itselfFrameId)[0].contentWindow.reloadCultureCorporateData(1);
                    } else {
                        layer.msg('删除失败！')
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            });
        }
    );
}

/**---------------资源管理----------------*/
//删除
function deleteAssetsArchivs(assetsArchivsId, currentPage, itselfFrameId) {
    layer.prompt({
        formType: 2,
        value: '',
        title: '删除原因',
        area: ['300px', '150px'] //自定义文本域宽高
    }, function (value, index, elem) {
        layer.confirm('该操作不能恢复,是否进行删除操作？', {
            btn: ['确认', '取消']
        }, function () {
            $.ajax({
                type: "post",
                url: "/assetsManagement/delete",
                data: {'id': assetsArchivsId, 'deleteReason': value},
                async: false,
                success: function (data) {
                    if (data === 'success') {
                        layer.msg('删除成功！');
                        $("#" + itselfFrameId)[0].contentWindow.reloadAssetsArchivs(currentPage);
                    } else {
                        layer.msg('删除失败！')
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            });
        });
        layer.close(index);
    });
}

//编辑
function editAssetsArchivs(assetsData, itselfFrameId) {
    $('#modalWindow').html('<div id="modifyAssetsInfo" class="window-body-add" style="display: none">\n' +
        '    <form id="oaAssetManagement"></form>\n' +
        '\n' +
        '    <div>\n' +
        '        <input type="button" value="确认" onclick="submissionAssetEdit()" class="layui-btn">\n' +
        '        <input type="button" value="取消" onclick="cancel()" class="layui-btn layui-btn-primary">\n' +
        '    </div>\n' +
        '</div>');

    window.lar = layer.open({
        title: '编辑资产信息',
        type: 1,
        area: ['384px', '342px'],
        shadeClose: true, //点击遮罩关闭
        content: $("#modifyAssetsInfo"),
        offset: "auto",
        end: function () {
            $('#modalWindow').html("");
        }
    });

    $('#subFrameId').val(itselfFrameId);

    var assetsInfo = '';

    assetsInfo += '<table class="window-table">';
    assetsInfo += '<tbody>';
    assetsInfo += '<tr>';
    assetsInfo += '<td class="form_title">资产名称:</td>';
    assetsInfo += '<td class="form_content">';
    assetsInfo += '<input name="id" value="' + assetsData.id + '" type="hidden">';
    assetsInfo += '<input class="font_input" name="assetsName" id="assetsNameEdit" value="' + assetsData.assetsName + '" type="text" autocomplete="off">';
    assetsInfo += '</td>';
    assetsInfo += '</tr>';
    assetsInfo += '<tr>';
    assetsInfo += '<td class="form_title_check" style="padding-top: 8px">库存数量:</td>';
    assetsInfo += '<td class="form_content_check">';
    assetsInfo += '<input class="font_input" name="productQuantity" id="productQuantityEdit" value="' + assetsData.productQuantity + '" type="text" onkeyup="value=value.replace(/^(-+)|[^\\d]+/g,\'\')" autocomplete="off">';
    assetsInfo += '</td>';
    assetsInfo += '</tr>';
    assetsInfo += '<tr>';
    assetsInfo += '<td class="form_title">编辑说明:</td>';
    assetsInfo += '<td class="form_content">';
    assetsInfo += '<textarea class="description-text" name="editExplain" id="editExplainEdit" onkeyup="this.value=this.value.replace(/^\\s+|\\s+$/g,\'\')" ></textarea>';
    assetsInfo += '</td>';
    assetsInfo += '</tr>';
    assetsInfo += '</tbody>';
    assetsInfo += '</table>';

    $('#oaAssetManagement').html(assetsInfo);
}

//提交编辑
function submissionAssetEdit() {
    if ($.trim($("#assetsNameEdit").val()) === '') {
        tips("资产名称不能为空！", 6, 5, 1000);
    } else {
        if ($.trim($("#productQuantityEdit").val()) === '') {
            tips("库存数量不能为空！", 6, 5, 1000);
        } else {
            if ($.trim($("#editExplainEdit").val()) === '') {
                tips("编辑说明不能为空！", 6, 5, 1000);
            } else {
                var subFrameId = $('#subFrameId').val();

                $.ajax({
                    type: "post",
                    url: '/assetsManagement/edit',
                    data: $('#oaAssetManagement').serialize(),
                    success: function (data) {
                        if (data === 'success') {
                            layer.close(window.lar);
                            $("#" + subFrameId)[0].contentWindow.reloadAssetsArchivs(1);
                            $('#modalWindow').html("");
                            layer.msg('修改成功！');
                        } else {
                            layer.msg('修改失败！');
                        }
                    },
                    error: function (result) {
                        layer.msg("出错！");
                    }
                })
            }
        }
    }
}

//修改资产档案状态(未使用)
function modifyAssetsState(tipInfo, id, state, currentPage, itselfFrameId) {
    layer.confirm(tipInfo, {
        btn: ['确认', '取消']
    }, function () {
        $.ajax({
            type: "post",
            url: '/assetsManagement/updateState',
            data: {'id': id, 'state': state},
            success: function (data) {
                if (data === 'success') {
                    tips("处理成功！", 0, 1, 1000);
                    $("#" + itselfFrameId)[0].contentWindow.reloadAssetsArchivs(currentPage);
                } else {
                    tips("处理失败！", 0, 1, 1000);
                }
            },
            error: function (result) {
                tips("出错！", 6, 2, 1000);
            }
        });
    });
}

/**--------------------文件上传------------------------*/
//文件选择
function fileSelect(own) {
    $('#fileName').val(own.files[0].name);
}

let count = 0;

//上传文件弹窗
function uploadFile(itselfFrameId) {
    $('#subFrameId').val(itselfFrameId);
    $('#modalWindow').html('<div id="uploadFile" style="height: 100%">\n' +
        '    <div style="padding: 30px">\n' +
        '        <div id="addFile" style="display:inline-table;"></div>\n' +
        '        <ul class="file-ul" id="fileNames"></ul>\n' +
        '    </div>\n' +
        '    <div class="option-window-body-bottom" style="padding: 0;">\n' +
        '        <input type="button" value="确认" onclick="fileConfirm()" class="layui-btn">\n' +
        '        <input type="button" value="取消" onclick="fileCancel()" class="layui-btn layui-btn-primary">\n' +
        '    </div>\n' +
        '</div>');

    window.lar = layer.open({
        title: '上传本地文件',
        type: 1,
        area: ['400px', '250px'],
        shadeClose: false, //点击遮罩关闭
        content: $("#uploadFile"),
        offset: "auto",
        cancel: function () {
            //初始化上传弹窗
            fileCancel();
            $('#modalWindow').html("");
        }
    });

    addBut();
}

//添加按钮
function addBut() {
    var addFile = '';
    addFile += '<div id="fileContent1" style="display:inline-table;">';
    addFile += '<button type="button" class="add-but">添加</button>';
    addFile += '<input type="file" id="file1" name="file1" class="file-input" onchange="addFile(this)">';
    addFile += '</div>';
    $('#addFile').append(addFile);
}

//添加
function addFile(owm) {
    count++;

    var nameHTML = '';
    nameHTML += '<li class="file-li" id="fileName' + count + '">';
    nameHTML += '<span class="file-name" title="' + $(owm)[0].files[0].name + '">' + $(owm)[0].files[0].name + '</span>';
    nameHTML += '<em class="layui-icon" title="删除" onclick="deleteFile(' + count + ')">&#x1006;</em>';
    nameHTML += '</li>';
    $('#fileNames').append(nameHTML);

    $('#fileContent' + count + '').css('display', 'none');

    var addFile = '';
    addFile += '<div id="fileContent' + (count + 1) + '" style="display:inline-table;">';
    addFile += '<button type="button" class="add-but">添加</button>';
    addFile += '<input type="file" id="file' + (count + 1) + '" name="file' + (count + 1) + '" class="file-input" onchange="addFile(this)">';
    addFile += '</div>';
    $('#addFile').append(addFile);
}

//删除
function deleteFile(id) {
    $('#fileName' + id).remove();
    $('#fileContent' + id).remove();
    layer.msg("删除");
}

//关闭弹窗并初始化
function fileCancel() {
    $('#addFile').html("");
    $('#fileNames').html("");
    addBut();
    count = 0;
    cancel();
}

//确认文件上传
function fileConfirm() {
    var subFrameId = $('#subFrameId').val();
    var formData = new FormData();
    $('#addFile').find('input').each(function () {
        formData.append("files", $(this)[0].files[0]);
    });
    $.ajax({
        type: "POST",
        url: '/fileUploadHandle/uploadFile',
        data: formData,
        async: true,
        cache: false,
        contentType: false,    //不可缺
        processData: false,    //不可缺
        success: function (ret) {
            if (ret[0].message === "success") {
                layer.msg("上传成功");
                $("#"+subFrameId)[0].contentWindow.writeFile(ret);
                $('#modalWindow').html("");
            } else {
                layer.msg("上传失败");
            }
        },
        error: function (res) {
            layer.msg("上传失败，请检查网络后重试!");
        }
    });

    //初始化上传弹窗
    fileCancel();
}

//删除已上传文件
function deleteUploaded(fileName, itselfFrameId) {
    var fileId = fileName.substring(fileName.indexOf("_") + 1);
    //提示窗
    layer.confirm('确定要删除"' + fileId + '"吗？', {
            btn: ['确认', '取消']
        }, function () {
        $("#"+itselfFrameId)[0].contentWindow.delFile(fileName);
        }
    );
}

/**---------------档案管理----------------*/
//删除档案数据
function deleteArchivesData(tab, id, itselfFrameId) {
    //提示窗
    layer.confirm('确定要删除吗？', {
            btn: ['确认', '取消']
        }, function () {
            $.ajax({
                type: "post",
                url: tab + '/delete',
                data: {'id': id},
                async: false,
                success: function (data) {
                    if (data === 'success') {
                        layer.msg('删除成功！');
                        $("#"+itselfFrameId)[0].contentWindow.reloadArchivesData(1);
                    } else {
                        layer.msg('删除失败！');
                    }
                },
                error: function (result) {
                    layer.msg("出错！");
                }
            });
        }
    );
}

/**-----------------------关联表单----------------------*/
//关联表单-选择
function selectRelevanceForms(list,itselfFrameId) {
    $('#modalWindow').html('<div id="relevanceForms" style="display: none;">\n' +
        '    <div style="padding: 10px 15px">\n' +
        '        <div style="height: 79%;overflow: auto;margin-bottom: 20px;">\n' +
        '            <table class="relevance-table">\n' +
        '                <thead>\n' +
        '                <tr>\n' +
        '                    <th colspan="2" style="width: 50%">表单名称</th>\n' +
        '                    <th style="width: 15%">部门</th>\n' +
        '                    <th style="width: 15%">填表日期</th>\n' +
        '                    <th style="width: 10%">总金额(元)</th>\n' +
        '                    <th style="width: 10%">填表人</th>\n' +
        '                </tr>\n' +
        '                </thead>\n' +
        '                <tbody id="relevanceFormsTbo">\n' +
        '                </tbody>\n' +
        '            </table>\n' +
        '        </div>\n' +
        '        <div class="confirm-modify-psw-style">\n' +
        '            <button onclick="confirmRelevanceForms()" class="layui-btn">确认</button>\n' +
        '        </div>\n' +
        '    </div>\n' +
        '</div>');

    window.lar = layer.open({
        title: '选择关联的表单',
        type: 1,
        area: ['60%', '60%'],
        shadeClose: false, //点击遮罩关闭
        content: $("#relevanceForms"),
        offset: "auto",
        end:function () {
            $('#modalWindow').html("");
        }
    });

    $('#subFrameId').val(itselfFrameId);

    var relevanceFormsContent = '';
    for (let i = 0; i < list.length; i++) {
        relevanceFormsContent += '<tr>';
        relevanceFormsContent += '<td style="width:30px;"><input type="checkbox" value="' + list[i].id + ',' + list[i].title + '" onclick="relevanceFormsCheckbox()" style="zoom: 130%;"></td>';
        relevanceFormsContent += '<td style="text-align: left;text-indent: 8px;">'+ list[i].title +'</td>';
        relevanceFormsContent += '<td>'+ list[i].department +'</td>';
        relevanceFormsContent += '<td>'+ list[i].fillingDate +'</td>';
        relevanceFormsContent += '<td>'+ list[i].total +'</td>';
        relevanceFormsContent += '<td>'+ list[i].preparer +'</td>';
        relevanceFormsContent += '</tr>';
    }
    $('#relevanceFormsTbo').html(relevanceFormsContent)
}

//关联表单-复选框
function relevanceFormsCheckbox(){
    $('#relevanceFormsTbo').find('input[type=checkbox]').bind('click', function(){
        $("#relevanceFormsTbo").find('input[type=checkbox]').not(this).attr("checked", false);
    });
}

//关联表单-提交
function confirmRelevanceForms() {
    var subFrameId = $('#subFrameId').val();
    let length = $("#relevanceFormsTbo input:checked").length;
    if (length !== 1) {
        tips("请选择一条数据！！", 6, 0, 1000);
        return false;
    } else {
        var val = $("#relevanceFormsTbo input:checked").val();
        var id = val.substring(0,val.indexOf(','));
        var name = val.substring(val.indexOf(',') + 1);
        $("#"+subFrameId)[0].contentWindow.relevanceFormsBinding(id,name);
    }

    //关闭弹窗
    cancel()
}

//关联表单-预览
function relevanceFormsDetailsPreview(id) {
    $('#modalWindow').html('<div id="relevanceFormsPreview" style="display: none;">\n' +
        '    <div id="relevanceFormsPreviewContent" style="padding:10px 15px"></div>\n' +
        '</div>');

    window.lar = layer.open({
        title: '预览',
        type: 1,
        area: ['60%', '60%'],
        shadeClose: false, //点击遮罩关闭
        content: $("#relevanceFormsPreview"),
        offset: "auto",
        end:function () {
            $('#modalWindow').html("");
        }
    });

    $.ajax({
        type: "POST",
        url: '/officeSupplies/details',
        data: {'id': id},
        cache: false,
        dataType: 'html',
        error: function (request) {
            alert("出错了");
        },
        success: function (data) {
            //截取需要展示的部分
            var newHtml = data.substring(data.indexOf('<flag>'),data.indexOf('</flag>'));
            $("#relevanceFormsPreviewContent").html(newHtml);
        }
    });
}

//关联表单-删除
function relevanceFormsDelete(fileName,id,itselfFrameId) {
    //提示窗
    layer.confirm('确定要删除"' + fileName + '"吗？', {
            btn: ['确认', '取消']
        }, function (index) {
            $("#"+itselfFrameId)[0].contentWindow.executeRelevanceFormsDelete(id);
            layer.close(index);
        }
    );
}

//公文-选择拟稿人
function selectReviewers(userInfoList, draftedPerson, flag, itselfFrameId ) {
    $('#modalWindow').html('<div id="singleSelection" class="single-option-window" style="display: none">\n' +
        '    <input type="hidden" id="pendingDocumentPage">\n' +
        '    <input type="hidden" id="singleFlag" value="'+flag+'">\n' +
        '    <div class="option-window-body-head">\n' +
        '        <ul id="singleSelectionContent"></ul>\n' +
        '    </div>\n' +
        '    <div class="option-window-body-bottom" style="left: 35%;">\n' +
        '        <input type="button" value="确认" onclick="confirmReviewers()" class="layui-btn">\n' +
        '        <input type="button" value="取消" onclick="cancel()" class="layui-btn layui-btn-primary">\n' +
        '    </div>\n' +
        '</div>');

    window.lar = layer.open({
        title: '请选择',
        type: 1,
        area: ['25%', '55%'],
        shadeClose: true, //点击遮罩关闭
        content: $("#singleSelection"),
        offset: "auto",
        end:function () {
            $('#modalWindow').html("");
        }
    });

    $('#subFrameId').val(itselfFrameId);

    var content = '';
    if (userInfoList.length <= 0) {
        //当前部门没有人员
        content += '<img style="padding: 28% 32%;" src="../../../static/images/icon/empty.png">';
    } else {
        for (let i = 0; i < userInfoList.length; i++) {
            if (draftedPerson === userInfoList[i].nickname) {
                content +=
                    '<li class="single-election-box-li">' +
                    '<img src="../../static/images/icon/personnel.png">' +
                    '<span id="' + userInfoList[i].id + '">' + userInfoList[i].nickname + '</span>' +
                    '<div class="selectedDrafter"></div>' +
                    '</li>';
            } else {
                content +=
                    '<li class="single-election-box-li">' +
                    '<img src="../../static/images/icon/personnel.png">' +
                    '<span id="' + userInfoList[i].id + '">' + userInfoList[i].nickname + '</span>' +
                    '<div></div>' +
                    '</li>';
            }

        }
    }
    //添加到选择列表
    $("#singleSelectionContent").html(content);

    //单选弹窗 - li选择器
    $("#singleSelectionContent").on('click', 'li', function () {
        if ($(this).find("div").hasClass("selectedDrafter")) {
            $(this).find("div").removeClass("selectedDrafter");
        } else {
            var trs = $(this).parent().find("li").find("div");
            trs.removeClass("selectedDrafter");
            $(this).find("div").addClass("selectedDrafter");
        }
    });
}


//单选弹窗 - 确认
function confirmReviewers() {
    var subFrameId = $('#subFrameId').val();
    var flag = $('#singleFlag').val();
    var lis = $("#singleSelectionContent").find("li").find("div");
    //是否包含selectedDrafter
    if (lis.hasClass("selectedDrafter")) {
        if (flag === "meetingCompere") {
            $("#"+subFrameId)[0].contentWindow.insertMeetingCompere($(".selectedDrafter").prev().text());
        } else if (flag === "meetingRecorder") {
            $("#"+subFrameId)[0].contentWindow.insertMeetingRecorder($(".selectedDrafter").prev().text());
        } else if (flag === "draftAuthor") {
            $("#"+subFrameId)[0].contentWindow.insertReviewer($(".selectedDrafter").prev().text());
        } else if (flag === "editReviewer") {
            $("#"+subFrameId)[0].contentWindow.insertReviewerEdit($(".selectedDrafter").prev().text());
        }
        cancel();
    } else {
        layer.msg('请选择拟稿人！')
    }
}

//公文-选择抄送人员
function selectNotifyPerson(userInfoList, departmentList, flag, itselfFrameId) {
    $('#modalWindow').html('<div id="selectWindow" class="option-window" style="display: none">\n' +
        '\n' +
        '    <div class="option-window-body-head cursor_hand">\n' +
        '        <input type="hidden" id="multiFlag" value="'+flag+'">\n' +
        '        <div class="selection-box">\n' +
        '            <div class="selection-box-title">\n' +
        '                <span>选择</span>\n' +
        '            </div>\n' +
        '            <div class="selection-content-outer">\n' +
        '                <div id="selectDiv" class="selection-content-inside">\n' +
        '                    <ul id="selectContent"></ul>\n' +
        '                </div>\n' +
        '            </div>\n' +
        '        </div>\n' +
        '        <div class="selected-box">\n' +
        '            <div class="selection-box-title">\n' +
        '                <span>已选</span>\n' +
        '            </div>\n' +
        '            <div class="selection-content-outer">\n' +
        '                <div id="" class="selection-content-inside">\n' +
        '                    <ul id="selectedNotifyPerson">\n' +
        '                    </ul>\n' +
        '                </div>\n' +
        '            </div>\n' +
        '        </div>\n' +
        '    </div>\n' +
        '    <input id="path" type="hidden" value="${path}"/>\n' +
        '    <div class="option-window-body-bottom">\n' +
        '        <input type="button" value="确认" onclick="consentNotifyPerson()" class="layui-btn">\n' +
        '        <input type="button" value="取消" onclick="cancel()" class="layui-btn layui-btn-primary">\n' +
        '    </div>\n' +
        '</div>');

    window.lar = layer.open({
        title: '请选择',
        type: 1,
        area: ['50%', '66%'],
        shadeClose: true, //点击遮罩关闭
        content: $("#selectWindow"),
        offset: "auto",
        end:function () {
            $('#modalWindow').html("");
        }
    });

    $('#subFrameId').val(itselfFrameId);

    //清空已选列表
    $('#selectedNotifyPerson li').remove();

    //加载部门和员工
    var department = "";
    for (let i = 0; i < departmentList.length; i++) {
        department += '<li class="selection-box-li">';
        department += '<img src="../../../static/images/icon/department.png">';
        department += '<span onclick="departmentSelect(this)" id="' + departmentList[i].departmentKey + '">' + departmentList[i].departmentName + '</span>';
        department += '<div></div>';

        for (let j = 0; j < userInfoList.length; j++) {
            if (userInfoList[j].department === departmentList[i].departmentKey) {
                department += '<ul class="submenu-ul">';
                department += '<li onclick="addNotifyPerson(this)">';
                department += '<img src="../../../static/images/icon/personnel.png">';
                department += '<span id="' + userInfoList[j].id + '">' + userInfoList[j].nickname + '</span>';
                department += '<div></div>';
                department += '</li>';
                department += '</ul>';
            }
        }
        department += '</li>';
    }
    //添加到选择列表
    $("#selectContent").html(department);
}

//确认
function consentNotifyPerson() {
    var subFrameId = $('#subFrameId').val();
    var flag = $('#multiFlag').val();
    //存储名字
    var array = new Array();
    //存储id
    var arrayId = new Array();
    $("#selectedNotifyPerson").each(function () {
        $(this).find('li').find("span").each(function () {
            array.push($(this).text());
            arrayId.push($(this).attr('id'));
        });

        if (flag === 'meetingParticipants') {
            $("#"+subFrameId)[0].contentWindow.insertParticipants(array, arrayId);
        } else {
            $("#"+subFrameId)[0].contentWindow.insertCopyGive(array, arrayId);
        }
        cancel();
    });
}

//选择框中的展开与收缩
function departmentSelect(own) {
    if ($(own).siblings('ul').css('display') == "none") {
        //展开未展开
        $(own).siblings('ul').slideUp(300);
        $(own).siblings('ul').slideDown(300);
    } else {
        //收缩已展开
        $(own).siblings('ul').slideUp(300);
    }
    preventBubble();
}

//选择列表的选择与取消
function addNotifyPerson(own) {
    var id = $(own).children('span').attr('id');
    var text = $(own).children('span').text();
    if ($(own).children('div').hasClass("selection")) {
        $(own).children('div').removeClass("selection");
        //遍历已选列表
        $("#selectedNotifyPerson").each(function () {
            $(this).find('li').each(function () {
                if ($(this).children('span').attr('id') === id) {
                    $(this).remove();
                }
            });
        });
    } else {
        $(own).children('div').addClass("selection");
        $('#selectedNotifyPerson').append(' <li style="padding:5px 20px">' +
            '<img src="../../static/images/icon/personnel.png" style="vertical-align:middle;">' +
            '<span style="margin-left:8px" id="' + id + '">' + text + '</span>' +
            '<img src="../../static/images/icon/delete.png" style="float:right">' +
            '</li>')
    }
    preventBubble();
}

//删除已选列表选中的标签并且删除选择列表中选中的样式
$('#selectedNotifyPerson').on("click", "li", function () {
    //获取选中li的id
    var selectedId = $(this).children('span').attr('id');
    //删除选中的li
    $(this).remove();
    //遍历选择列表
    $('#selectDiv').each(function () {
        $(this).find('ul').each(function () {
            $(this).find('li').each(function () {
                // alert($(this).children('span').attr('id'));
                var selectId = $(this).children('span').attr('id');
                if (selectedId === selectId) {
                    //删除选择列表对应已选列表li-div-class
                    $(this).children('span').next('div').removeClass();
                }
            })
        })
    });
});

//组织冒泡
function preventBubble(event) {
    var e = arguments.callee.caller.arguments[0] || event; //若省略此句，下面的e改为event，IE运行可以，但是其他浏览器就不兼容
    if (e && e.stopPropagation) {
        e.stopPropagation();
    } else if (window.event) {
        window.event.cancelBubble = true;
    }
}

//公文-选择主送人员
function selectMainGive(itselfFrameId) {
    $('#modalWindow').html('<div id="selectMainGive" class="window-body-add" style="display: none">\n' +
        '    <div id="mainGiveContent"></div>\n' +
        '    <div style="padding-top: 20px">\n' +
        '        <input type="button" value="确认" onclick="commitMainGive()" class="layui-btn">\n' +
        '        <input type="button" value="取消" onclick="cancel()" class="layui-btn layui-btn-primary">\n' +
        '    </div>\n' +
        '</div>');

    window.lar = layer.open({
        title: '所在部门负责人',
        type: 1,
        area: ['20%', '30%'],
        shadeClose: true, //点击遮罩关闭
        content: $("#selectMainGive"),
        offset: "auto",
        end:function () {
            $('#modalWindow').html("");
        }
    });

    $('#subFrameId').val(itselfFrameId);

    var principal = "";
    // principal += '<div id="radioChecked" style="text-align: left;">';
    // principal += '<div style="margin: 10px;"><input type="radio" name="abc" value="'+principalList[1]+','+principalList[3]+'" checked style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>全部</span></div>';
    // principal += '<div style="margin: 10px;"><input type="radio" name="abc" value="'+principalList[1]+'" style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>'+principalList[0]+'</span></div>';
    // principal += '<div style="margin: 10px;"><input type="radio" name="abc" value="'+principalList[3]+'" style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>'+principalList[2]+'</span></div>';
    // principal += '</div>';
    principal += '<div id="radioChecked" style="text-align: left;">';
    principal += '<div style="margin: 10px;"><input type="radio" name="name" value="1" checked style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>领导班子</span></div>';
    principal += '<div style="margin: 10px;"><input type="radio" name="name" value="2" style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>各部室负责人</span></div>';
    principal += '<div style="margin: 10px;"><input type="radio" name="name" value="0" style="zoom: 120%;vertical-align: middle;margin-right: 10px;"><span>无</span></div>';
    principal += '</div>';
    $('#mainGiveContent').html(principal);
}

//提交-表单发送前选择部门负责人
function commitMainGive() {
    var subFrameId = $('#subFrameId').val();
    let val = $('#radioChecked input[type="radio"]:checked').val();
    var text = $('#radioChecked input[type="radio"]:checked').next('span').html();
    $("#"+subFrameId)[0].contentWindow.insetMainGive(val,text);
    layer.close(window.lar);
}

/**---------------OA审批表单-----------------*/
//OA审批单，部门选择
function selectionDepartment(departmentList, flag, itselfFrameId) {
    $('#modalWindow').html('<div id="departmentSelector" style="display: none;width: 96%;height: 96%;padding: 2%">\n' +
        '    <div class="option-window-body-head cursor_hand">\n' +
        '        <input type="hidden" id="departmentFlag">\n' +
        '        <div id="selectionDep" class="selection-content-inside">\n' +
        '            <ul id="departmentList"></ul>\n' +
        '        </div>\n' +
        '    </div>\n' +
        '    <div class="option-window-body-bottom" style="left: 30%">\n' +
        '        <input type="button" value="确认" onclick="confirmDepartmentSelection()" class="layui-btn">\n' +
        '        <input type="button" value="取消" onclick="cancel()" class="layui-btn layui-btn-primary">\n' +
        '    </div>\n' +
        '</div>');

    window.lar = layer.open({
        title: '选择部门',
        type: 1,
        area: ['20%', '50%'],
        shadeClose: true, //点击遮罩关闭
        content: $("#departmentSelector"),
        offset: "auto",
        end:function () {
            $('#modalWindow').html("");
        }
    });

    $('#subFrameId').val(itselfFrameId);
    $('#departmentFlag').val(flag);

    //加载部门
    var department = "";
    for (let i = 0; i < departmentList.length; i++) {
        department += '<li class="selection-box-li">';
        department += '<img src="../../../static/images/icon/department.png">';
        department += '<span onclick="selectedDepartment(this)" id="' + departmentList[i].departmentKey + '">' + departmentList[i].departmentName + '</span>';
        department += '<div></div>';
        department += '</li>';
    }
    $("#departmentList").html(department);
}

//部门选择器
function selectedDepartment(own) {
    if ($(own).nextAll('div').hasClass("selection")) {
        $(own).nextAll('div').removeClass("selection");
    } else {
        $('#selectionDep').find('div').removeClass("selection");
        $(own).nextAll("div").addClass("selection");
    }
}

//提交
function confirmDepartmentSelection() {
    var subFrameId = $('#subFrameId').val();
    var lis = $("#selectionDep").find("div");
    //是否包含selectedDrafter
    if (lis.hasClass("selection")) {
        var id = $(".selection").prev().attr('id')
        var name = $(".selection").prev().text()
        var flag = $('#departmentFlag').val();
        $("#"+subFrameId)[0].contentWindow.selectDepartmentComplete(id, name, flag);
        layer.close(window.lar);
    } else {
        layer.msg('请选择部门！')
    }
}

//OA审批表中使用
function selectRecipient(userInfoList, departmentList,itselfFrameId) {
    $('#modalWindow').html('<div id="selectRecipientModel" style="display: none;width: 96%;height: 96%;padding: 2%">\n' +
        '    <div class="option-window-body-head cursor_hand">\n' +
        '        <div id="selectDepartmentRecipient" class="selection-content-inside">\n' +
        '            <ul id="departmentAndUserRecipient"></ul>\n' +
        '        </div>\n' +
        '    </div>\n' +
        '    <div class="option-window-body-bottom" style="left: 30%;">\n' +
        '        <input type="button" value="确认" onclick="confirmDepartmentRecipient()" class="layui-btn">\n' +
        '        <input type="button" value="取消" onclick="cancel()" class="layui-btn layui-btn-primary">\n' +
        '    </div>\n' +
        '</div>');

    window.lar = layer.open({
        title: '请选择',
        type: 1,
        area: ['20%', '50%'],
        shadeClose: true, //点击遮罩关闭
        content: $("#selectRecipientModel"),
        offset: "auto",
        end:function () {
            $('#modalWindow').html("");
        }
    });

    $('#subFrameId').val(itselfFrameId);

    //加载部门和员工
    var department = "";
    for (let i = 0; i < departmentList.length; i++) {
        department += '<li class="selection-box-li">';
        department += '<img src="../../../static/images/icon/department.png">';
        department += '<span onclick="departmentSelect(this)" id="' + departmentList[i].departmentKey + '">' + departmentList[i].departmentName + '</span>';
        department += '<div></div>';
        for (let j = 0; j < userInfoList.length; j++) {
            if (userInfoList[j].department === departmentList[i].departmentKey) {
                department += '<ul class="submenu-ul">';
                department += '<li onclick="addSelectionUserRecipient(this)">';
                department += '<img src="../../../static/images/icon/personnel.png">';
                department += '<span id="' + userInfoList[j].id + '">' + userInfoList[j].nickname + '</span>';
                department += '<div></div>';
                department += '</li>';
                department += '</ul>';
            }
        }
        department += '</li>';
    }
    $("#departmentAndUserRecipient").html(department);
}

//用户选择器
function addSelectionUserRecipient(own) {
    if ($(own).children('div').hasClass("selection")) {
        $(own).children('div').removeClass("selection");
    } else {
        $('#selectDepartmentRecipient').find('div').removeClass("selection");
        $(own).find("div").addClass("selection");
    }
}

//提交
function confirmDepartmentRecipient() {
    var subFrameId = $('#subFrameId').val();
    var lis = $("#selectDepartmentRecipient").find("div");
    //是否包含selectedDrafter
    if (lis.hasClass("selection")) {
        //选择的用户id
        var principal = $(".selection").prev().attr('id');
        var principalStr = $(".selection").prev().text();
        $("#"+subFrameId)[0].contentWindow.confirmSelectRecipient(principal, principalStr);
        layer.close(window.lar);
    } else {
        layer.msg('请选择被通知人！')
    }
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