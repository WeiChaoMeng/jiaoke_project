$(function () {
    //关于
    //$("#index").attr("class","selected");
    $('.manu').first().attr("class", "selected");
    $('#about').on('click', function () {
        layer.alert('你确定要修改吗？', {icon: 0});
    });
    $('#logo').on('click', function () {
        layer.tips('官方网站：uimaker.com', '#logo', {tips: 3});
    });

    $('.manu').click(function () {
        $('.selected').attr('class', 'manu');
        $(this).attr('class', 'selected');
        switch ($(this).attr('id')) {

            case 'index':
                $("#iframe").attr("src", "deault.html");
                break;

            case 'OA':

                $("#iframe").attr("src", "index.html");
                break;

            case 'ZL':


                break;

            case 'HR':


                break;

            case 'DQ':


                break;

            case 'JY':


                break;

            case 'HB':


                break;

            case 'AQ':


                break;

        }
    })
});

//选中主页状态下点击效果
$('#index').click(function () {
    $('.selected').attr('class', 'manu');
    $(this).attr('class', 'selected');
    $('#iframe').attr('src', 'default.html');
});

//选中二级菜单时左侧菜单加载

//个人中心
$('#personal_office').click(function () {
    var left_menu_str =
        "<li>"
        + "<a id='persional_attendance' onclick='right_change(this.id)' href='javascript:left_change();' target='right' class='left_menus'>"
        + "<i class='iconfont'>&#xe739;</i>个人考勤</a>"
        + "</li>"
        + "<li>"
        + "<a id='persional_salary' onclick='right_change(this.id)' >"
        + "<i class='iconfont'>&#xe820;</i>个人工资</a>"
        + "</li>"
        + "<li>"
        + "<a id='schedule_planning' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe6a7;</i>日程计划</a>"
        + "</li>"
        + "<li>"
        + "<a id='do_not' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe6bf;</i>待办记事</a >"
        + "</li >";
    left_menu_change(left_menu_str);
});

//协同工作
$('#team_work').click(function () {
    var left_menu_str =
        "<li>"
        + "<a id='new_matter' onclick='right_change(this.id)' >"
        + "<i class='iconfont'>&#xe691;</i>新建事项</a>"
        + "</li>"
        + "<li>"
        + "<a id='waiting_matter' onclick='right_change(this.id)' >"
        + "<i class='iconfont'>&#xe69e;</i>待发事项</a>"
        + "</li>"
        + "<li>"
        + "<a id='already_issued_matter' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe8bf;</i>已发事项</a>"
        + "</li>"
        + "<li>"
        + "<a id='to_do_matter' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe7eb;</i>待办事项</a >"
        + "</li >"
        + "<li>"
        + "<a id='managed_matter' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xeb9e;</i>已办事项</a >"
        + "</li >"
        + "<li>"
        + "<a id='supervision_matters' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe970;</i>督办事项</a >"
        + "</li >";
    left_menu_change(left_menu_str);
});

//公文管理
$('#office_docu').click(function () {
    var left_menu_str =
        "<li>"
        + "<a id='document_processing' onclick='right_change(this.id)'  >"
        + "<i class='iconfont'>&#xe691;</i>公文发布</a>"
        + "</li>"
        + "<li>"
        + "<a id='waiting_document' onclick='right_change(this.id)'>"
        + "<i class='iconfont' style='font_1-size: 19px;margin-left: -2px'>&#xe6f3;</i>待发公文</a>"
        + "</li>"
        + "<li>"
        + "<a id='document_signing' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe695;</i>公文签收</a>"
        + "</li>"
        + "<li>"
        + "<a id='historical_documents' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe69c;</i>历史公文</a>"
        + "</li>";
    left_menu_change(left_menu_str);
});

//档案管理
$('#docu_center').click(function () {
    var left_menu_str =
        "<li>"
        + "<a id='employee_files' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe652;</i>自有员工档案</a>"
        + "</li>"
        + "<li>"
        + "<a id='dispatch_file' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe63e;</i>劳务派遣档案</a>"
        + "</li>";
    left_menu_change(left_menu_str);
});

//会议管理
$('#meeting_management').click(function () {
    var left_menu_str =
        "<li>"
        + "<a id='meeting_schedule' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe6c3;</i>会议安排</a>"
        + "</li>"
        + "<li>"
        + "<a id='conference_calendar' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe8ce;</i>会议日历</a>"
        + "</li>"
        + "<li>"
        + "<a id='not_open_meeting' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe8ce;</i>待开会议</a>"
        + "</li>"
        + "<li>"
        + "<a id='historical_conference' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe8db;</i>已开会议</a>"
        + "</li>"
        + "<li>"
        + "<a id='conference_resources' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe672;</i>会议资源</a >"
        + "</li >";
    left_menu_change(left_menu_str);
});

//资源管理 resource_management
$('#resource_management').click(function () {
    var left_menu_str =
        "<li>"
        + "<a id='resource_storage' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe642;</i>资源入库</a>"
        + "</li>"
        + "</li>"
        + "<li>"
        + "<a id='resources_archives' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe64b;</i>资源档案</a>"
        + "</li>"
        + "<li>"
        + "<a id='apply_resource' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe646;</i>申领资源</a>"
        + "</li>"
        + "<li>"
        + "<a id='receive_record' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe64b;</i>领用记录</a>"
        + "</li>";
    left_menu_change(left_menu_str);
});

//文化建设
$('#cultural_construction').click(function () {
    var left_menu_str =
        "<li>"
        + "<a id='news' onclick='right_change(this.id)'>"
        + "<i class='iconfont'>&#xe67b;</i>新闻</a>"
        + "</li>"
        + "<li>"
        + "<a id='announcements' onclick='right_change(this.id)' >"
        + "<i class='iconfont'>&#xe668;</i>公告</a>"
        + "</li>";
    left_menu_change(left_menu_str);
});

//二级菜单选中时添加背景色
$('.menu_selected').click(function () {
    if ($(this).attr("style") === "background:#c4c4c4;") {
        return false;
    }
    $('.menu_selected').removeAttr("style");
    $(this).attr("style", "background:#c4c4c4;");
});

//修改左侧菜单
function left_menu_change(left_menu_str) {
    $("#left-menu").html(left_menu_str);
}


//三级菜单跳转时相应逻辑
function right_change(id) {

    //点击时取消其他选择样式
    $('.selected').attr("class", "left_menus");
    //功能名称字符串制作
    var title = $('#' + id).text().trim().slice(1, 5);
    //动态添加标签所需的字符串
    var right_top_str =

        '<ul class="menutab" id="' + id + '_menu' + '" >'
        + '<li class="tabselected"><a href="#">'
        + title
        + '<i class="tabclose iconfont" id="' + id + '_close' + '" onclick = "close_change(this.id)" >&#xe6f2;</i></a></li>'
        + '</ul>';

    switch (id) {

        /*--- 个人事务 ---*/
        //个人考勤
        case 'persional_attendance':
            $('#oa-iframe').attr("src", "oa_personal_attendance.jsp");
            $('#persional_attendance').attr("class", "selected");
            if ($("#persional_attendance_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //日程计划
        case 'schedule_planning':
            $('#oa-iframe').attr("src", "schedule/oa_schedule_planning.jsp");
            $('#schedule_planning').attr("class", "selected");
            if ($("#schedule_planning_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //个人工资
        case 'persional_salary':
            $('#oa-iframe').attr("src", "oa_personal_salary.jsp");
            $('#persional_salary').attr("class", "selected");
            if ($("#persional_salary_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;


        //待办记事
        case 'do_not':
            $('#oa-iframe').attr("src", "oa_notepad.jsp");
            $('#do_not').attr("class", "selected");
            if ($("#do_not_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;


        /*--- 协同工作 ---*/
        //新建事项
        case 'new_matter':
            window.open('oa_new_matter.jsp', '_blank', 'height=700, width=1400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
            $('#new_matter').attr("class", "selected");
            if ($("#new_matter_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //待发事项
        case 'waiting_matter':
            $("#oa-iframe").attr("src", "oa_waiting_matter.jsp")
            $('#waiting_matter').attr("class", "selected");
            if ($("#waiting_matter_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //已发事项
        case 'already_issued_matter':
            $("#oa-iframe").attr("src", "oa_already_issued_matter.jsp")
            $('#already_issued_matter').attr("class", "selected");
            if ($("#already_issued_matter_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //待办事项
        case 'to_do_matter':
            $("#oa-iframe").attr("src", "oa_upcoming_matter.jsp")
            $('#to_do_matter').attr("class", "selected");
            if ($("#to_do_matter_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //已办事项
        case 'managed_matter':
            $("#oa-iframe").attr("src", "oa_managed_matter.jsp")
            $('#managed_matter').attr("class", "selected");
            if ($("#managed_matter_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //督办事项
        case 'supervision_matters':
            $("#oa-iframe").attr("src", "oa_supervision_matters.jsp")
            $('#supervision_matters').attr("class", "selected");
            if ($("#supervision_matters_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        /*--- 公文管理 ---*/
        //公文发布
        case 'document_processing':
            //更改引用
            window.open('oa_release_document.jsp', '_blank', 'height=700, width=1400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
            //添加选择后样式
            $('#document_processing').attr("class", "selected");
            //添加右侧控制台最上标签
            if ($("#document_processing_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //待发公文
        case 'waiting_document':
            //更改引用
            $("#oa-iframe").attr("src", "oa_primed_document.jsp")
            //添加选择后样式
            $('#waiting_document').attr("class", "selected");
            //添加右侧控制台最上标签
            if ($("#waiting_document_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //公文签收
        case 'document_signing':
            //更改引用
            $("#oa-iframe").attr("src", "oa_pending_document.jsp")
            //添加选择后样式
            $('#document_signing').attr("class", "selected");
            //添加右侧控制台最上标签
            if ($("#document_signing_menu").attr("id") == null) {

                $('.menutab').last().after(right_top_str);
            }
            break;

        //历史公文
        case 'historical_documents':
            //更改引用
            $("#oa-iframe").attr("src", "oa_issued_document.jsp")
            //添加选择后样式
            $('#historical_documents').attr("class", "selected");
            //添加右侧控制台最上标签
            if ($("#historical_documents_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        /*--- 档案管理 ---*/
        //自有员工档案
        case 'employee_files':
            $('#oa-iframe').attr("src", "oa_employee_files.jsp");
            $('#employee_files').attr("class", "selected");
            if ($("#employee_files_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //劳务派遣档案
        case 'dispatch_file':
            $('#oa-iframe').attr("src", "oa_dispatch_file.jsp");
            $('#dispatch_file').attr("class", "selected");
            if ($("#dispatch_file_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        /*--- 会议管理 ---*/
        //会议资源
        case 'conference_resources':
            $("#oa-iframe").attr("src", "oa_conference_resources.jsp")
            $('#conference_resources').attr("class", "selected");
            if ($("#conference_resources_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //待开会议
        case 'not_open_meeting':
            $("#oa-iframe").attr("src", "oa_pending_meeting.jsp")
            $('#not_open_meeting').attr("class", "selected");
            if ($("#not_open_meeting_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //已开会议
        case 'historical_conference':
            $("#oa-iframe").attr("src", "oa_historical_conference.jsp")
            $('#historical_conference').attr("class", "selected");
            if ($("#historical_conference_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //会议日历
        case 'conference_calendar':
            $("#oa-iframe").attr("src", "oa_conference_calendar.jsp")
            $('#conference_calendar').attr("class", "selected");
            if ($("#conference_calendar_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //会议安排
        case 'meeting_schedule':
            $("#oa-iframe").attr("src", "oa_meeting_schedule.jsp");
            $('#meeting_schedule').attr("class", "selected");
            if ($("#meeting_schedule_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        /*--- 资源管理 ---*/
        //资源入库
        case 'resource_storage':
            $('#oa-iframe').attr("src", "oa_asset_management.jsp");
            $('#resource_storage').attr("class", "selected");
            if ($("#resource_storage_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //资源档案
        case 'resources_archives':
            $('#oa-iframe').attr("src", "oa_assets_archives.jsp");
            $('#resources_archives').attr("class", "selected");
            if ($("#resources_archives_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //申领资源
        case 'apply_resource':
            $('#oa-iframe').attr("src", "oa_resource_apply.jsp");
            $('#apply_resource').attr("class", "selected");
            if ($("#apply_resource_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //申领记录
        case 'receive_record':
            $('#oa-iframe').attr("src", "oa_receive_record.jsp");
            $('#receive_record').attr("class", "selected");
            if ($("#receive_record_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        /*--- 文化建设 ---*/
        //公告管理
        case 'announcements':
            $('#oa-iframe').attr("src", "oa_announcements.jsp");
            $('#announcements').attr("class", "selected");
            if ($("#announcements_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

        //新闻管理
        case 'news':
            $('#oa-iframe').attr("src", "oa_news_center.jsp");
            $('#news').attr("class", "selected");
            if ($("#news_menu").attr("id") == null) {
                $('.menutab').last().after(right_top_str);
            }
            break;

    }
}


