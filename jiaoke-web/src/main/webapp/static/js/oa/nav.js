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
            $(".right_page").css("width", "87%");
        }
    });


    /*--- 个人事务 ---*/
    //个人考勤
    $("#persional_attendance").on("click", function () {
        removeOwnName();
        personal(this);
        $('#oa-iframe').attr("src", "personal/oa_personal_attendance.jsp");
    });

    //日程计划
    $("#schedule_planning").on("click", function () {
        removeOwnName();
        personal(this);
        $('#oa-iframe').attr("src", "personal/oa_schedule_planning.jsp");
    });

    //个人工资
    $("#persional_salary").on("click", function () {
        removeOwnName();
        personal(this);
        $('#oa-iframe').attr("src", "personal/oa_personal_salary.jsp");
    });

    //工资统计
    $("#wage_statistics").on("click", function () {
        removeOwnName();
        personal(this);
        $('#oa-iframe').attr("src", "personal/oa_wage_statistics_inner.jsp");
    });

    //待办记事
    $("#notepad").on("click", function () {
        removeOwnName();
        personal(this);
        $('#oa-iframe').attr("src", "personal/oa_notepad.jsp");
    });

    /*--- 协同工作 ---*/

    //新建事项
    $("#new_matter").on("click", function () {
        window.open('collaboration/oa_new_matter.jsp', '_blank', 'height=700, width=1400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
    });

    //待发事项
    $("#waiting_matter").on("click", function () {
        removeOwnName();
        synergetic_work(this);
        $("#oa-iframe").attr("src", "collaboration/oa_waiting_matter.jsp")
    });

    //已发事项
    $("#already_issued_matter").on("click", function () {
        removeOwnName();
        synergetic_work(this);
        $("#oa-iframe").attr("src", "collaboration/oa_already_issued_matter.jsp")
    });

    //待办事项
    $("#to_do_matter").on("click", function () {
        removeOwnName();
        synergetic_work(this);
        $("#oa-iframe").attr("src", "collaboration/oa_upcoming_matter.jsp")
    });

    //已办事项
    $("#managed_matter").on("click", function () {
        removeOwnName();
        synergetic_work(this);
        $("#oa-iframe").attr("src", "collaboration/oa_managed_matter.jsp")
    });

    //督办事项
    $("#supervision_matters").on("click", function () {
        removeOwnName();
        synergetic_work(this);
        $("#oa-iframe").attr("src", "collaboration/oa_supervision_matters.jsp")
    });

    /*--- 公文管理 ---*/
    //公文发布
    $("#document_processing").on("click", function () {
        window.open('document/oa_document_processing.jsp', '_blank', 'height=700, width=1400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
    });

    //待发公文
    $("#waiting_document").on("click", function () {
        removeOwnName();
        document(this);
        $("#oa-iframe").attr("src", "document/oa_waiting_document.jsp")
    });

    //公文签收
    $("#document_signing").on("click", function () {
        removeOwnName();
        document(this);
        $("#oa-iframe").attr("src", "document/oa_document_signing.jsp")
    });

    //历史公文
    $("#historical_documents").on("click", function () {
        removeOwnName();
        document(this);
        $("#oa-iframe").attr("src", "document/oa_documents_historical.jsp")
    });

    /*--- 档案管理 ---*/
    //自有员工档案
    $("#employee_files").on("click", function () {
        removeOwnName();
        archives(this);
        $('#oa-iframe').attr("src", "archives/oa_employee_files.jsp");
    });

    //劳务派遣档案
    $("#dispatch_file").on("click", function () {
        removeOwnName();
        archives(this);
        $('#oa-iframe').attr("src", "archives/oa_dispatch_file.jsp");
    });

    //合同档案
    $("#contract_archives").on("click", function () {
        removeOwnName();
        archives(this);
        $('#oa-iframe').attr("src", "archives/oa_contract_archives.jsp");
    });

    /*--- 会议管理 ---*/
    //会议安排
    $("#meeting_schedule").on("click", function () {
        removeOwnName();
        meeting(this);
        $("#oa-iframe").attr("src", "meeting/oa_meeting_schedule.jsp");
    });

    //会议日历
    $("#conference_calendar").on("click", function () {
        removeOwnName();
        meeting(this);
        $("#oa-iframe").attr("src", "meeting/oa_conference_calendar.jsp")
    });

    //待开会议
    $("#not_open_meeting").on("click", function () {
        removeOwnName();
        meeting(this);
        $("#oa-iframe").attr("src", "meeting/oa_pending_meeting.jsp")
    });

    //已开会议
    $("#historical_conference").on("click", function () {
        removeOwnName();
        meeting(this);
        $("#oa-iframe").attr("src", "meeting/oa_historical_conference.jsp")
    });

    //会议资源
    $("#conference_resources").on("click", function () {
        removeOwnName();
        meeting(this);
        $("#oa-iframe").attr("src", "meeting/oa_conference_resources.jsp")
    });

    /*--- 资源管理 ---*/
    //资源入库
    $("#resource_storage").on("click", function () {
        removeOwnName();
        resources(this);
        $('#oa-iframe').attr("src", "resources/oa_resource_storage.jsp");
    });

    //资源档案
    $("#resources_archives").on("click", function () {
        removeOwnName();
        resources(this);
        $('#oa-iframe').attr("src", "resources/oa_resources_archives.jsp");
    });

    //申领资源
    $("#apply_resource").on("click", function () {
        removeOwnName();
        resources(this);
        $('#oa-iframe').attr("src", "resources/oa_resource_apply.jsp");
    });

    //申领记录
    $("#receive_record").on("click", function () {
        removeOwnName();
        resources(this);
        $('#oa-iframe').attr("src", "resources/oa_receive_record.jsp");
    });

    /*--- 文化建设 ---*/
    //公告管理
    $("#announcements").on("click", function () {
        removeOwnName();
        cultural_construction(this);
        $('#oa-iframe').attr("src", "culture/oa_announcements.jsp");
    });

    //新闻管理
    $("#news").on("click", function () {
        removeOwnName();
        cultural_construction(this);
        $('#oa-iframe').attr("src", "culture/oa_news_center.jsp");
    });

    /*当前位置*/

    //动态添加到 页头导航位置
    function personal(parameter) {
        $('#content').append("<a style='margin-right:8px'>" + "个人管理" + "</a>" + ">" + "<a style='margin-left: 8px'>" + parameter.innerText + "</a>");
    }

    function synergetic_work(parameter) {
        $('#content').append("<a style='margin-right:8px'>" + "协同工作" + "</a>" + ">" + "<a style='margin-left: 8px'>" + parameter.innerText + "</a>");
    }

    function document(parameter) {
        $('#content').append("<a style='margin-right:8px'>" + "公文管理" + "</a>" + ">" + "<a style='margin-left: 8px'>" + parameter.innerText + "</a>");
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