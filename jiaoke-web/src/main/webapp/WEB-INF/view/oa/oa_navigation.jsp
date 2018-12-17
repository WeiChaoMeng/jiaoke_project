<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/10/8
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OA系统</title>
    <link rel="stylesheet" type="text/css" href="/static/css/nav.css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <link rel="stylesheet" type="text/css" href="/static/fonts/font_2/iconfont.css">
    <link rel="stylesheet" type="text/css" href="/static/fonts/font_3/iconfont.css">
</head>
<body>
<!--弹窗背景-->
<div id='windowBackgroundColor'></div>

<!--多选-->
<div id="selectWindow" class="option-window">

    <div class="option-window-head">选择拟稿人</div>

    <div class="option-window-body">
        <div class="option-window-body-head">
            <div class="selection-box">
                <div class="selection-box-title">
                    <span>选择</span>
                    <span>：</span>
                </div>
                <div class="selection-content-outer">
                    <div id="selectDiv" class="selection-content-inside">

                        <ul id="selectContent">
                            <li onclick="add(this)" class="selection-box-li">
                                <img class="department" src="../../../static/images/icon/department.png">
                                <span id="123">综合办公室</span>
                                <div></div>

                                <ul class="submenu-ul">
                                    <li onclick="add(this)">
                                        <img src="../../../static/images/icon/personnel.png">
                                        <span id="1234">张三</span>
                                        <div></div>
                                    </li>
                                </ul>
                                <ul class="submenu-ul">
                                    <li onclick="add(this)">
                                        <img src="../../../static/images/icon/personnel.png">
                                        <span id="1235">李四</span>
                                        <div></div>
                                    </li>
                                </ul>

                            </li>

                            <li onclick="add(this)" class="selection-box-li">
                                <img class="department" src="../../../static/images/icon/department.png">
                                <span id="124">经营开发部</span>
                                <div></div>

                                <ul class="submenu-ul">
                                    <li onclick="add(this)">
                                        <img src="../../../static/images/icon/personnel.png">
                                        <span id="1244">王五</span>
                                        <div></div>
                                    </li>
                                </ul>
                                <ul class="submenu-ul">
                                    <li onclick="add(this)">
                                        <img src="../../../static/images/icon/personnel.png">
                                        <span id="1245">赵六</span>
                                        <div></div>
                                    </li>
                                </ul>

                            </li>

                            <li onclick="add(this)" class="selection-box-li">
                                <img class="department" src="../../../static/images/icon/department.png">
                                <span id="125">生产管理部</span>
                                <div></div>

                                <ul class="submenu-ul">
                                    <li onclick="add(this)">
                                        <img src="../../../static/images/icon/personnel.png">
                                        <span id="1254">黄七</span>
                                        <div></div>
                                    </li>
                                </ul>
                                <ul class="submenu-ul">
                                    <li onclick="add(this)">
                                        <img src="../../../static/images/icon/personnel.png">
                                        <span id="1255">马八</span>
                                        <div></div>
                                    </li>
                                </ul>

                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="selected-box">
                <div class="selected-box-title ">
                    <span>已选</span>
                    <span>：</span>
                </div>
                <div class="selected-box-content">
                    <ul id="selectedReviewer">

                    </ul>
                </div>
            </div>
        </div>

        <div class="option-window-body-bottom">
            <input type="button" value="确认" onclick="consent()" class="body-bottom-button">
            <input type="button" value="取消" onclick="cancel()" class="body-bottom-button left-spacing">
        </div>
    </div>
</div>

<%-- 单选 --%>
<div id="singleSelection" class="single-option-window">

    <div class="option-window-head">选择拟稿人</div>

    <div class="option-window-body">
        <div class="option-window-body-head">
            <div>
                <div class="selection-box-title">
                    <span>综合管理部</span>
                    <span>：</span>
                </div>
                <div class="selection-content-outer" style="width: auto">
                    <div id="singleSelectionDiv" class="selection-content-inside">

                        <ul id="singleSelectionContent">

                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="option-window-body-bottom">
            <input type="button" value="确认" onclick="confirm()" class="body-bottom-button">
            <input type="button" value="取消" onclick="cancel()" class="body-bottom-button left-spacing">
        </div>
    </div>
</div>

<div class="nav nav-mini">
    <div class="nav-top">
        <div id="mini" style="border-bottom: 2px #fff solid;">
            <img style="padding: 3.5px 13px" src="../../../static/images/icon/mini.png">
        </div>
    </div>
    <ul>
        <li class="nav-item">
            <a>
                <i class="iconfont icon-gerenshiwu"></i>
                <span class="parent-menu-span">个人事务</span>
                <i class="my-icon nav-more"></i>
            </a>
            <ul>
                <li><a id="persional_attendance"><span>个人考勤</span></a></li>
                <li><a id="persional_salary"><span>个人工资</span></a></li>
                <li><a id="wage_statistics"><span>工资统计</span></a></li>
                <li><a id="schedule_planning"><span>日程计划</span></a></li>
                <li><a id="notepad"><span>待办记事</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a><i class="iconfont icon-m3-newCoordination-copy"></i>
                <span class="parent-menu-span">协同工作</span>
                <i class="my-icon nav-more"></i>
            </a>
            <ul>
                <li><a id="new_matter"><span>新建事项</span></a></li>
                <li><a id="waiting_matter"><span>待发事项</span></a></li>
                <li><a id="already_issued_matter"><span>已发事项</span></a></li>
                <li><a id="to_do_matter"><span>待办事项</span></a></li>
                <li><a id="managed_matter"><span>已办事项</span></a></li>
                <li><a id="supervision_matters"><span>督办事项</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a><i class="iconfont icon-gongwen"></i>
                <span class="parent-menu-span">公文管理</span>
                <i class="my-icon nav-more"></i></a>
            <ul>
                <shiro:hasPermission name="createDocument">
                    <li><a id="release_document"><span>新建公文</span></a></li>
                    <li><a id="primed_document"><span>待发公文</span></a></li>
                    <li><a id="issued_document"><span>已发公文</span></a></li>
                </shiro:hasPermission>
                <li><a id="pending_document"><span>待办公文</span></a></li>
                <li><a id="done_document"><span>已办公文</span></a></li>

            </ul>
        </li>

        <%--<li class="nav-item">
            <a><i class="iconfont icon-danganguanli"></i>
                <span class="parent-menu-span">档案管理</span>
                <i class="my-icon nav-more"></i>
            </a>
            <ul>
                <li><a id="contract_archives"><span>合同档案</span></a></li>
                <li><a id="general_office"><span>综合办公室</span></a></li>
                <li><a id="business_development"><span>经营开发部</span></a></li>
                <li><a id="quality_technology"><span>质量技术部</span></a></li>
                <li><a id="material_administration"><span>物资管理部</span></a></li>
                <li><a id="finance_administration"><span>财务管理部</span></a></li>
                <li><a id="production_administration"><span>生产管理部</span></a></li>
            </ul>
        </li>--%>

        <shiro:hasPermission name="comprehensiveOffice">
            <li class="nav-item">
                <a><i class="iconfont icon-danganguanli"></i>
                    <span class="parent-menu-span" id="office">综合办公室档案</span>
                    <i class="my-icon nav-more"></i>
                </a>
                <ul>
                    <li>
                        <a id="office_release_document"
                           onclick="IFrame(this,$('#office').text(),'comprehensiveOffice/officeReleaseDocument')">
                            <span>公司发文</span>
                        </a>
                    </li>
                    <li>
                        <a id="office_receive_document"
                           onclick="IFrame(this,$('#office').text(),'comprehensiveOffice/officeReceiveDocument')">
                            <span>公司收文</span>
                        </a>
                    </li>
                    <li>
                        <a id="office_meeting_summary"
                           onclick="IFrame(this,$('#office').text(),'comprehensiveOffice/officeMeetingSummary')">
                            <span>会议纪要</span>
                        </a>
                    </li>
                    <li>
                        <a id="office_management_system"
                           onclick="IFrame(this,$('#office').text(),'comprehensiveOffice/officeManagementSystem')">
                            <span>管理体系相关</span>
                        </a>
                    </li>
                    <li>
                        <a id="office_contract_agreement"
                           onclick="IFrame(this,$('#office').text(),'comprehensiveOffice/officeContractAgreement')">
                            <span>合同、协议</span>
                        </a>
                    </li>
                    <li>
                        <a id="office_eia_monitoring"
                           onclick="IFrame(this,$('#office').text(),'comprehensiveOffice/officeEiaMonitor')">
                            <span>环评监测报告</span>
                        </a>
                    </li>
                    <li>
                        <a id="office_other_documents"
                           onclick="IFrame(this,$('#office').text(),'comprehensiveOffice/officeOtherDocuments')">
                            <span>其他文件</span>
                        </a>
                    </li>
                </ul>
            </li>
        </shiro:hasPermission>

        <shiro:hasPermission name="financialManagement">
            <li class="nav-item">
                <a><i class="iconfont icon-danganguanli"></i>
                    <span class="parent-menu-span">财务管理部档案</span>
                    <i class="my-icon nav-more"></i>
                </a>
                <ul>
                    <li><a id="voucher"><span>凭证</span></a></li>
                    <li><a id="finance_contract"><span>合同</span></a></li>
                    <li><a id="finance_bill"><span>票据</span></a></li>
                    <li><a id="confirm"><span>确认</span></a></li>
                    <li><a id="report_material"><span>报表及资料</span></a></li>
                    <li><a id="finance_other_documents"><span>其他文件</span></a></li>
                </ul>
            </li>
        </shiro:hasPermission>

        <li class="nav-item">
            <a><i class="iconfont icon-huiyiguanli"></i>
                <span class="parent-menu-span">会议管理</span>
                <i class="my-icon nav-more"></i></a>
            <ul>
                <li><a id="meeting_schedule"><span>会议安排</span></a></li>
                <li><a id="conference_calendar"><span>会议日历</span></a></li>
                <li><a id="not_open_meeting"><span>待开会议</span></a></li>
                <li><a id="historical_conference"><span>已开会议</span></a></li>
                <li><a id="conference_resources"><span>会议资源</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a><i class="iconfont icon-ziyuanguanli"></i>
                <span class="parent-menu-span">资源管理</span>
                <i class="my-icon nav-more"></i></a>
            <ul>
                <li><a id="resource_storage"><span>资源入库</span></a></li>
                <li><a id="resources_archives"><span>资源档案</span></a></li>
                <li><a id="apply_resource"><span>申领资源</span></a></li>
                <li><a id="receive_record"><span>领用记录</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a><i class="iconfont icon-wenhua"></i>
                <span class="parent-menu-span">企业文化建设</span>
                <i class="my-icon nav-more"></i></a>
            <ul>
                <li><a id="announcements"><span>公告</span></a></li>
                <li><a id="news"><span>新闻</span></a></li>
            </ul>
        </li>
    </ul>
</div>

<!--现在位置-->
<div class="right" style="width: 100%; height: 100%;">
    <div class="right_page">

        <div class="now_location">
            <span class="now_location_icon">
                <img src="../../../static/images/icon/homepage.png">
            </span>

            <span class="now_location_content" id="content">
               <a>个人空间</a>

            </span>
        </div>

        <iframe src="oaIndex.do" id="oa-iframe" name="ifr" width="99%" height="92%" frameborder="0"
                scrolling="auto" style="padding-left:10px;"></iframe>
    </div>
</div>
</body>
<!--<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>-->
<!--<script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>-->
<script src="../../../static/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../../../static/js/oa/nav.js"></script>
<script>

    //当前所在页面导航
    function IFrame(own, fatherMenuTitle, url) {
        var content = $('#content');
        content.empty();
        content.append("<a style='margin-right:8px'>" + fatherMenuTitle + "</a>" + ">" + "<a style='margin-left: 8px'>" + $(own).children().text() + "</a>");
        $('#oa-iframe').attr("src", url);
    }

    //拟稿人选择框
    $('.department').on('click', function () {
        if ($(this).siblings('ul').css('display') == "none") {
            //展开未展开
            $(this).siblings('ul').slideUp(300);
            $(this).siblings('ul').slideDown(300);
        } else {
            //收缩已展开
            $(this).siblings('ul').slideUp(300);
        }
        preventBubble();
    });

    //多选弹窗
    function openMultiSelectWindows(userInfoList) {
        $("#windowBackgroundColor").css("display", "block");
        $("#selectWindow").css("display", "block");
        //清空已选列表
        // $('#selectedReviewer li').remove();
        var content = '';
        if (userInfoList.length <= 0) {
            //当前部门没有人员
            content += '<img style="padding: 37% 27%;" src="../../../static/images/icon/empty.png">';
        } else {
            for (let i = 0; i < userInfoList.length; i++) {
                content +=
                    '<li onclick="add(this)" class="selection-box-li">' +
                    '<img onclick="department()" src="../../../static/images/icon/department.png">' +
                    '<span id="' + userInfoList[i].id + '">' + userInfoList[i].nickName + '</span>' +
                    '<div></div>' +
                    '</li>';
            }
        }
        //添加到选择列表
        $("#selectContent").html(content);
    }

    //选择列表的选择与取消
    function add(own) {
        var id = $(own).children('span').attr('id');
        var text = $(own).children('span').text();
        if ($(own).children('div').hasClass("selection")) {
            $(own).children('div').removeClass("selection");
            //遍历已选列表
            $("#selectedReviewer").each(function () {
                $(this).find('li').each(function () {
                    // alert($(this).attr('id'));
                    if ($(this).children('span').attr('id') === id) {
                        $(this).remove();
                    }
                });
            });
        } else {
            $(own).children('div').addClass("selection");
            $('#selectedReviewer').append(' <li style="padding:5px 20px">' +
                '<img src="../../../static/images/icon/personnel.png" style="vertical-align:middle;">' +
                '<span style="margin-left:8px" id="' + id + '">' + text + '</span>' +
                '<img src="../../../static/images/icon/delete.png" style="float:right">' +
                '</li>')
        }
        preventBubble();
    }

    //删除已选列表选中的标签并且删除选择列表中选中的样式
    $('#selectedReviewer').on("click", "li", function () {
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

    //确认
    function consent() {

        $("#selectedReviewer").each(function () {
            var size = $(this).find('li').size();
            if (size < 1) {
                alert("请最少选择一个！");
            } else {
                var array = new Array();
                $(this).find('li').each(function () {
                    //调用子页面方式
                    array.push($(this).text());
                });
                console.log(array);
                ifr.window.insertCopyGive(array);
                cancel();
            }

        });
    }

    //单选窗口 - 选择核稿人
    function openBack(userInfoList) {
        $("#windowBackgroundColor").css("display", "block");
        $("#singleSelection").css("display", "block");

        var content = '';
        if (userInfoList.length <= 0) {
            //当前部门没有人员
            content += '<img style="padding: 28% 32%;" src="../../../static/images/icon/empty.png">';
        } else {
            for (let i = 0; i < userInfoList.length; i++) {
                content +=
                    '<li class="single-election-box-li">' +
                    '<img src="../../../static/images/icon/personnel.png">' +
                    '<span id="' + userInfoList[i].id + '">' + userInfoList[i].nickName + '</span>' +
                    '<div></div>' +
                    '</li>';
            }
        }
        //添加到选择列表
        $("#singleSelectionContent").html(content);
    }

    //单选弹窗 - 确认
    function confirm() {
        var lis = $("#singleSelectionContent").find("li").find("div");
        //是否包含selection
        if (lis.hasClass("selection")) {
            ifr.window.insertReviewer($(".selection").prev().text());
            cancel();
        } else {
            alert('请选择核稿人！')
        }
    }

    //单选弹窗 - li选择器
    $("#singleSelectionContent").on('click', 'li', function () {
        if ($(this).find("div").hasClass("selection")) {
            $(this).find("div").removeClass("selection");
        } else {
            var trs = $(this).parent().find("li").find("div");
            trs.removeClass("selection");
            $(this).find("div").addClass("selection");
        }
    });

    //取消
    function cancel() {
        $("#windowBackgroundColor").css("display", "none");
        $("#singleSelection,#selectWindow").css("display", "none");
    }

    //点击任意位置关闭弹窗
    $("#windowBackgroundColor").on("click", function () {
        $("#windowBackgroundColor").css("display", "none");
        $("#selectWindow").css("display", "none");
        $("#singleSelection").css("display", "none");
    });

    //组织冒泡
    function preventBubble(event) {
        var e = arguments.callee.caller.arguments[0] || event; //若省略此句，下面的e改为event，IE运行可以，但是其他浏览器就不兼容  
        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else if (window.event) {
            window.event.cancelBubble = true;
        }
    }
</script>
</html>