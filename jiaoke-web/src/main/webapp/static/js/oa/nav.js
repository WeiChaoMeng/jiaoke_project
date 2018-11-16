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
        $('#oa-iframe').attr("src", "OAPersonalAttendance.do");
    });

    //日程计划
    $("#schedule_planning").on("click", function () {
        removeOwnName();
        personal(this);
        $('#oa-iframe').attr("src", "OASchedulePlanning.do");
    });

    //个人工资
    $("#persional_salary").on("click", function () {
        removeOwnName();
        personal(this);
        $('#oa-iframe').attr("src", "OAPersonalSalary.do");
    });

    //工资统计
    $("#wage_statistics").on("click", function () {
        removeOwnName();
        personal(this);
        $('#oa-iframe').attr("src", "OAWageStatisticsInner.do");
    });

    //待办记事
    $("#notepad").on("click", function () {
        removeOwnName();
        personal(this);
        $('#oa-iframe').attr("src", "OANotepad.do");
    });

    /*--- 协同工作 ---*/

    //新建事项
    $("#new_matter").on("click", function () {
        window.open('OANewMatter.do', '_blank', 'height=700, width=1400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
    });

    //待发事项
    $("#waiting_matter").on("click", function () {
        removeOwnName();
        synergetic_work(this);
        $("#oa-iframe").attr("src", "OAWaitingMatter.do")
    });

    //已发事项
    $("#already_issued_matter").on("click", function () {
        removeOwnName();
        synergetic_work(this);
        $("#oa-iframe").attr("src", "OAAlreadyIssuedMatter.do")
    });

    //待办事项
    $("#to_do_matter").on("click", function () {
        removeOwnName();
        synergetic_work(this);
        $("#oa-iframe").attr("src", "OAUpcomingMatter.do")
    });

    //已办事项
    $("#managed_matter").on("click", function () {
        removeOwnName();
        synergetic_work(this);
        $("#oa-iframe").attr("src", "OAManagedMatter.do")
    });

    //督办事项
    $("#supervision_matters").on("click", function () {
        removeOwnName();
        synergetic_work(this);
        $("#oa-iframe").attr("src", "OASupervisionMatters.do")
    });

    /*--- 公文管理 ---*/
    //新建公文
    $("#release_document").on("click", function () {
        removeOwnName();
        document(this);
        $("#oa-iframe").attr("src", "document/releaseDocument.do")
    });

    //待办公文
    $("#pending_document").on("click", function () {
        removeOwnName();
        document(this);
        $("#oa-iframe").attr("src", "document/pendingDocument.do")
    });

    //已办公文
    $("#done_document").on("click", function () {
        removeOwnName();
        document(this);
        $("#oa-iframe").attr("src", "document/doneDocument.do")
    });

    //待发公文
    $("#primed_document").on("click", function () {
        removeOwnName();
        document(this);
        $("#oa-iframe").attr("src", "document/primedDocument.do")
    });

    //已发公文
    $("#issued_document").on("click", function () {
        removeOwnName();
        document(this);
        $("#oa-iframe").attr("src", "document/issuedDocument.do")
    });

    /*--- 档案管理 ---*/
    //合同档案
    $("#contract_archives").on("click", function () {
        removeOwnName();
        archives(this);
        $('#oa-iframe').attr("src", "contractArchives/OAContractArchives.do");
    });

    //综合办公室档案
    $("#general_office").on("click", function () {
        removeOwnName();
        archives(this);
        $('#oa-iframe').attr("src", "generalOffice/generalOffice.do");
    });

    //经营开发部档案
    $("#business_development").on("click", function () {
        removeOwnName();
        archives(this);
        $('#oa-iframe').attr("src", "businessDevelopment/businessDevelopment.do");
    });

    //质量技术部档案
    $("#quality_technology").on("click", function () {
        removeOwnName();
        archives(this);
        $('#oa-iframe').attr("src", "qualityTechnology/qualityTechnology.do");
    });

    //物资管理部档案
    $("#material_administration").on("click", function () {
        removeOwnName();
        archives(this);
        $('#oa-iframe').attr("src", "materialAdministration/materialAdministration.do");
    });

    //财务管理部档案
    $("#finance_administration").on("click", function () {
        removeOwnName();
        archives(this);
        $('#oa-iframe').attr("src", "financeAdministration/financeAdministration.do");
    });

    //生产管理部档案
    $("#production_administration").on("click", function () {
        removeOwnName();
        archives(this);
        $('#oa-iframe').attr("src", "productionAdministration/productionAdministration.do");
    });

    /*---综合办公室档案---*/
    //公司发文
    /*$("#office_release_document").on("click", function () {
        removeOwnName();
        archives(this);
        $('#oa-iframe').attr("src", "comprehensiveOffice/officeReleaseDocument");
    });*/

    function office(id,url){
        $(id).on("click", function () {
            removeOwnName();
            archives(this);
            $('#oa-iframe').attr("src", url);
        });
    }

    /*--- 会议管理 ---*/
    //会议安排
    $("#meeting_schedule").on("click", function () {
        removeOwnName();
        meeting(this);
        $("#oa-iframe").attr("src", "OAMeetingSchedule.do");
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
        $("#oa-iframe").attr("src", "OAPendingMeeting.do")
    });

    //已开会议
    $("#historical_conference").on("click", function () {
        removeOwnName();
        meeting(this);
        $("#oa-iframe").attr("src", "OAHistoricalConference.do")
    });

    //会议资源
    $("#conference_resources").on("click", function () {
        removeOwnName();
        meeting(this);
        $("#oa-iframe").attr("src", "OAConferenceResources.do")
    });

    /*--- 资源管理 ---*/
    //资源入库
    $("#resource_storage").on("click", function () {
        removeOwnName();
        resources(this);
        $('#oa-iframe').attr("src", "OAResourceStorage.do");
    });

    //资源档案
    $("#resources_archives").on("click", function () {
        removeOwnName();
        resources(this);
        $('#oa-iframe').attr("src", "OAResourcesArchives.do");
    });

    //申领资源
    $("#apply_resource").on("click", function () {
        removeOwnName();
        resources(this);
        $('#oa-iframe').attr("src", "OAResourceApply.do");
    });

    //申领记录
    $("#receive_record").on("click", function () {
        removeOwnName();
        resources(this);
        $('#oa-iframe').attr("src", "OAReceiveRecord.do");
    });

    /*--- 文化建设 ---*/
    //公告管理
    $("#announcements").on("click", function () {
        removeOwnName();
        cultural_construction(this);
        $('#oa-iframe').attr("src", "OAAnnouncements.do");
    });

    //新闻管理
    $("#news").on("click", function () {
        removeOwnName();
        cultural_construction(this);
        $('#oa-iframe').attr("src", "OANewsCenter.do");
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