$(function () {
    // nav收缩展开
    $('.nav-item>a').on('click', function () {
        if (!$('.nav').hasClass('nav-mini')) {
            if ($(this).next().css('display') == "none") {
                //展开未展开
                $('.nav-item').children('ul').slideUp(300);
                $(this).next('ul').slideDown(300);
                $(this).parent('li').addClass('nav-show').siblings('li').removeClass('nav-show');
            } else {
                //收缩已展开
                $(this).next('ul').slideUp(300);
                $('.nav-item.nav-show').removeClass('nav-show');
            }
        }
    });
    //nav-mini切换
    $('#mini').on('click', function () {
        if (!$('.nav').hasClass('nav-mini')) {
            $('.nav-item.nav-show').removeClass('nav-show');
            $('.nav-item').children('ul').removeAttr('style');
            $('.nav').addClass('nav-mini');
            $(".right_page").css("width", "96%");
        } else {
            $('.nav').removeClass('nav-mini');
            $(".right_page").css("width", "88%");
        }
    });

    /*--- 个人事务 ---*/
    //个人考勤
    $("#personal_attendance").on("click", function () {
        removeOwnName();
        personal(this);
        $('#oa-iframe').attr("src", "personalAttendance/toPersonalAttendance");
    });

    //个人工资
    $("#personal_salary").on("click", function () {
        removeOwnName();
        personal(this);
        $('#oa-iframe').attr("src", "wageStatistics/toPersonalSalary");
    });

    /*--- 协同工作 ---*/
    //新建事项
    $("#new_matter").on("click", function () {
        window.open('collaboration/newBuild', '_blank', 'height=700, width=1400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
    });

    //待发事项
    $("#waiting_matter").on("click", function () {
        removeOwnName();
        synergetic_work(this);
        $("#oa-iframe").attr("src", "collaboration/waitSend?page=1")
    });

    //已发事项
    $("#already_issued_matter").on("click", function () {
        removeOwnName();
        synergetic_work(this);
        $("#oa-iframe").attr("src", "collaboration/alreadySend?page=1")
    });

    //待办事项
    $("#to_do_matter").on("click", function () {
        removeOwnName();
        synergetic_work(this);
        $("#oa-iframe").attr("src", "collaboration/pending?page=1")
    });

    //已办事项
    $("#managed_matter").on("click", function () {
        removeOwnName();
        synergetic_work(this);
        $("#oa-iframe").attr("src", "collaboration/done?page=1")
    });

    /*--- 会议管理 ---*/
    //新建会议
    $("#new_meeting").on("click", function () {
        removeOwnName();
        meeting(this);
        $("#oa-iframe").attr("src", "meeting/toAdd");
    });

    //会议日历
    $("#conference_calendar").on("click", function () {
        removeOwnName();
        meeting(this);
        $("#oa-iframe").attr("src", "OAConferenceCalendar.do")
    });

    //待开会议
    $("#not_open_meeting").on("click", function () {
        removeOwnName();
        meeting(this);
        $("#oa-iframe").attr("src", "meeting/toPendingMeeting?page=1")
    });

    //已开会议
    $("#history_meeting").on("click", function () {
        removeOwnName();
        meeting(this);
        $("#oa-iframe").attr("src", "meeting/toHistoryMeeting?page=1")
    });

    //会议资源
    $("#conference_resources").on("click", function () {
        removeOwnName();
        meeting(this);
        $("#oa-iframe").attr("src", "OAConferenceResources.do")
    });

    /*--- 资源管理 ---*/
    //资产入库
    $("#resource_storage").on("click", function () {
        removeOwnName();
        resources(this);
        $('#oa-iframe').attr("src", "assetsManagement/toAssetsManagement");
    });

    //资产档案
    $("#resources_archives").on("click", function () {
        removeOwnName();
        resources(this);
        $('#oa-iframe').attr("src", "assetsManagement/toAssetsArchives");
    });

    //申领记录
    $("#receive_record").on("click", function () {
        removeOwnName();
        resources(this);
        $('#oa-iframe').attr("src", "assetsManagement/OAReceiveRecord.do");
    });

    /*--- 文化建设 ---*/
    //公告管理
    $("#announcements").on("click", function () {
        removeOwnName();
        cultural_construction(this);
        $('#oa-iframe').attr("src", "notice/toIndex?page=1");
    });

    //新闻管理
    $("#news").on("click", function () {
        removeOwnName();
        cultural_construction(this);
        $('#oa-iframe').attr("src", "newsCenter/toNewsCenter");
    });

    /*--- 后台管理 ---*/
    //用户管理
    $("#userManager").on("click", function () {
        removeOwnName();
        cultural_construction(this);
        $('#oa-iframe').attr("src", "backstageManagement/toUserManager?page=1");
    });

    //角色管理
    $("#roleManager").on("click", function () {
        removeOwnName();
        cultural_construction(this);
        $('#oa-iframe').attr("src", "backstageManagement/toRoleManager?page=1");
    });

    //权限管理
    $("#permissionsManager").on("click", function () {
        removeOwnName();
        cultural_construction(this);
        $('#oa-iframe').attr("src", "backstageManagement/toPermissionManager");
    });

    //部门管理
    $("#departmentManager").on("click", function () {
        removeOwnName();
        cultural_construction(this);
        $('#oa-iframe').attr("src", "backstageManagement/toDepartmentManager?page=1");
    });

    /*当前位置*/

    //动态添加到 页头导航位置
    function personal(parameter) {
        $('#content').append("<a style='margin-right:8px'>" + "个人管理" + "</a>" + ">" + "<a style='margin-left: 8px'>" + parameter.innerText + "</a>");
    }

    function synergetic_work(parameter) {
        $('#content').append("<a style='margin-right:8px'>" + "协同工作" + "</a>" + ">" + "<a style='margin-left: 8px'>" + parameter.innerText + "</a>");
    }

    function archives(parameter) {
        $('#content').append("<a style='margin-right:8px'>" + "档案管理" + "</a>" + ">" + "<a style='margin-left: 8px'>" + parameter.innerText + "</a>");
    }

    function meeting(parameter) {
        $('#content').append("<a style='margin-right:8px'>" + "会议管理" + "</a>" + ">" + "<a style='margin-left: 8px'>" + parameter.innerText + "</a>");
    }

    function resources(parameter) {
        $('#content').append("<a style='margin-right:8px'>" + "资源管理" + "</a>" + ">" + "<a style='margin-left: 8px'>" + parameter.innerText + "</a>");
    }

    function cultural_construction(parameter) {
        $('#content').append("<a style='margin-right:8px'>" + "文化建设" + "</a>" + ">" + "<a style='margin-left: 8px'>" + parameter.innerText + "</a>");
    }

    //删除子元素
    function removeOwnName() {
        $('#content').empty();
    }
});