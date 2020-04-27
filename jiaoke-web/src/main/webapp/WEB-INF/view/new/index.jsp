<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+ "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path",basePath);
%>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>路驰公司企业综合管理平台</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="icon" href="../../../static/images/favicon.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="../../../static/new/css/font.css">
        <link rel="stylesheet" href="../../../static/new/css/xadmin.css">
        <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
        <script src="../../../static/new/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../../../static/new/js/xadmin.js"></script>
        <script type="text/javascript" src="../../../static/new/js/main.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script>
            // 是否开启刷新记忆tab功能
            var is_remember = false;
        </script>
    </head>
    <body class="index">
    <%--模态窗-添加用户--%>
    <div id="addUser" class="window-body-add" style="display: none">
        <form id="userInfo">
            <table class="window-table">
                <tbody>
                <tr>
                    <td class="form_title_check"><i class="required_mark">*</i>用户名:</td>
                    <td class="form_content_check">
                        <input type="hidden" id="currentPage">
                        <input class="font_input" name="username" id="username" value="" type="text"
                               placeholder="请输入用户名" maxlength="16" onblur="checkUsername(this)"
                               onclick="clickPrompt(this)"
                               autocomplete="off">
                        <span class="prompt-span"></span>
                    </td>
                </tr>

                <tr>
                    <td class="form_title_check"><i class="required_mark">*</i>密&nbsp;&nbsp;&nbsp;码:</td>
                    <td class="form_content_check">
                        <input class="font_input" name="password" id="password" value=""
                               placeholder="请输入密码" maxlength="16" onblur="checkPassword(this)"
                               onclick="clickPrompt(this)"
                               autocomplete="off">
                        <span class="prompt-span"></span>
                    </td>
                </tr>

                <tr>
                    <td class="form_title_check"><i class="required_mark">*</i>昵&nbsp;&nbsp;&nbsp;称:</td>
                    <td class="form_content_check">
                        <input class="font_input" id="nickname" value="" name="nickname" type="text"
                               placeholder="请输入昵称" maxlength="16" onblur="checkNickname(this)"
                               onclick="nicknameClickPrompt(this)" autocomplete="off">
                        <span class="prompt-span"></span>
                    </td>
                </tr>

                <tr>
                    <td class="form_title_check">部&nbsp;&nbsp;&nbsp;门:</td>
                    <td class="form_content_check">
                        <select name="department" class="font_input" id="department">
                        </select>
                    </td>
                </tr>

                <tr>
                    <td class="form_title_check"><i class="required_mark">*</i>岗&nbsp;&nbsp;&nbsp;位:</td>
                    <td class="form_content_check">
                        <input class="font_input" id="position" value="" name="position" type="text"
                               placeholder="请输入岗位" maxlength="16" onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')" autocomplete="off" onblur="checkPosition(this)">
                        <span class="prompt-span"></span>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>

        <div>
            <input type="button" value="确认" onclick="confirm()" class="confirm-btn-style">
            <input type="button" value="取消" onclick="cancel()" class="cancel-btn-style left-spacing">
        </div>
    </div>

        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a href="/homePage.do">路驰综合管理平台</a>
            </div>

            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>

            <%--弹窗实例--%>
            <%--<ul class="layui-nav left fast-add" lay-filter="">--%>
                <%--<li class="layui-nav-item">--%>
                    <%--<a href="javascript:;">+新增</a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<!-- 二级菜单 -->--%>
                        <%--<dd>--%>
                            <%--<a onclick="xadmin.open('最大化','http://www.baidu.com','','',true)">--%>
                                <%--<i class="iconfont">&#xe6a2;</i>弹出最大化</a></dd>--%>
                        <%--<dd>--%>
                            <%--<a onclick="xadmin.open('弹出自动宽高','http://www.baidu.com')">--%>
                                <%--<i class="iconfont">&#xe6a8;</i>弹出自动宽高</a></dd>--%>
                        <%--<dd>--%>
                            <%--<a onclick="xadmin.open('弹出指定宽高','http://www.baidu.com',500,300)">--%>
                                <%--<i class="iconfont">&#xe6a8;</i>弹出指定宽高</a></dd>--%>
                        <%--<dd>--%>
                            <%--<a onclick="xadmin.add_tab('在tab打开','member-list.html')">--%>
                                <%--<i class="iconfont">&#xe6b8;</i>在tab打开</a></dd>--%>
                        <%--<dd>--%>
                            <%--<a onclick="xadmin.add_tab('在tab打开刷新','member-del.html',true)">--%>
                                <%--<i class="iconfont">&#xe6b8;</i>在tab打开刷新</a></dd>--%>
                    <%--</dl>--%>
                <%--</li>--%>
            <%--</ul>--%>

            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">${userInfo.nickname}</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a onclick="xadmin.open('个人信息','http://www.baidu.com')">个人信息</a></dd>
                        <dd>
                            <a onclick="xadmin.open('切换帐号','http://www.baidu.com')">切换帐号</a></dd>
                        <dd>
                            <a href="/logout">退出</a></dd>
                    </dl>
                </li>

                <%--<li class="layui-nav-item to-index">--%>
                    <%--<a href="/">前台首页</a>--%>
                <%--</li>--%>
            </ul>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="OA系统">&#xe6b8;</i>
                            <cite>OA系统</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>

                        <ul class="sub-menu">

                            <li>
                                <a href="javascript:;">
                                    <i class="iconfont">&#xe726;</i>
                                    <cite>个人事务</cite>
                                    <i class="iconfont nav_right">&#xe697;</i></a>
                                <ul class="sub-menu">
                                    <li>
                                        <a onclick="xadmin.add_tab('个人考勤','personalAttendance/toPersonalAttendance',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>个人考勤</cite></a>
                                    </li>
                                    <li>
                                        <a onclick="xadmin.add_tab('个人工资','wageStatistics/toPersonalSalary',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>个人工资</cite></a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript:;">
                                    <i class="iconfont">&#xe82a;</i>
                                    <cite>协同工作</cite>
                                    <i class="iconfont nav_right">&#xe697;</i></a>
                                <ul class="sub-menu">
                                    <li>
                                        <a onclick="xadmin.add_tab('待发事项','collaboration/waitSend?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>待发事项</cite></a>
                                    </li>
                                    <li>
                                        <a onclick="xadmin.add_tab('已发事项','collaboration/alreadySend?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>已发事项</cite></a>
                                    </li>
                                    <li>
                                        <a onclick="xadmin.add_tab('待办事项','collaboration/pending?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>待办事项</cite></a>
                                    </li>
                                    <li>
                                        <a onclick="xadmin.add_tab('已办事项','collaboration/done?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>已办事项</cite></a>
                                    </li>
                                    <li>
                                        <a onclick="xadmin.add_tab('合同管理','review/toContractManagement?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>合同管理</cite></a>
                                    </li>

                                </ul>
                            </li>

                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('综合办公室','member-list1.html',true)">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>综合办公室</cite></a>--%>
                            <%--</li>--%>

                            <li>
                                <a href="javascript:;">
                                    <i class="iconfont">&#xe6a2;</i>
                                    <cite>资源管理</cite>
                                    <i class="iconfont nav_right">&#xe697;</i></a>
                                <ul class="sub-menu">
                                    <li>
                                        <a onclick="xadmin.add_tab('资源档案','assetsManagement/toAssetsArchives?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>资源档案</cite></a>
                                    </li>
                                    <li>
                                        <a onclick="xadmin.add_tab('领用记录','assetsManagement/toAssetUse?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>领用记录</cite></a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript:;">
                                    <i class="iconfont">&#xe6a0;</i>
                                    <cite>企业文化建设</cite>
                                    <i class="iconfont nav_right">&#xe697;</i></a>
                                <ul class="sub-menu">
                                    <li>
                                        <a onclick="xadmin.add_tab('公告','notice/toIndex?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>公告</cite></a>
                                    </li>
                                    <li>
                                        <a onclick="xadmin.add_tab('新闻','newsCenter/toNewsCenter',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>新闻</cite></a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript:;">
                                    <i class="iconfont">&#xe6ae;</i>
                                    <cite>后台管理</cite>
                                    <i class="iconfont nav_right">&#xe697;</i></a>
                                <ul class="sub-menu">
                                    <li>
                                        <a onclick="xadmin.add_tab('用户管理','backstageManagement/toUserManager?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>用户管理</cite></a>
                                    </li>
                                    <li>
                                        <a onclick="xadmin.add_tab('角色管理','backstageManagement/toRoleManager?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>角色管理</cite></a>
                                    </li>
                                    <li>
                                        <a onclick="xadmin.add_tab('权限管理','backstageManagement/toPermissionManager',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>权限管理</cite></a>
                                    </li>
                                    <li>
                                        <a onclick="xadmin.add_tab('部门管理','backstageManagement/toDepartmentManager?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>部门管理</cite></a>
                                    </li>

                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="质量管控">&#xe6b3;</i>
                            <cite>质量管控</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('质量首页','qc_index.do',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>质量首页</cite></a>
                            </li>

                            <li>
                                <a onclick="xadmin.add_tab('实时监测','qc_real_time_surveillance.do',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>实时监测</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('历史数据','qc_historical_data.do',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>历史数据</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('工程管理','qc_project_manager.do',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>工程管理</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('配比管理','qc_matching_model.do',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>配比管理</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('级配管理','qc_grading_manager.do',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>级配管理</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('动态管理','qc_dynamic_management.do',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>动态管理</cite></a>
                            </li>

                            <li>
                                <a onclick="xadmin.add_tab('实时监控','qc_real_time_monitoring.do',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>实时监控</cite></a>
                            </li>

                            <li>
                                <a onclick="xadmin.add_tab('质量预警','qc_quality_warning.do',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>质量预警</cite></a>
                            </li>

                            <li>
                                <a onclick="xadmin.add_tab('数据管理','qc_data_manager.do',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>数据管理</cite></a>
                            </li>

                            <li>
                                <a onclick="xadmin.add_tab('辅助分析','qc_auxiliary_analysis.do',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>辅助分析</cite></a>
                            </li>

                            <li>
                                <a onclick="xadmin.add_tab('数据汇总','qc_data_summary.do',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>数据汇总</cite></a>
                            </li>

                            <li>
                                <a onclick="xadmin.add_tab('警报管理','qc_critical_warning.do',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>警报管理</cite></a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a onclick="xadmin.add_tab('实验管理','experimental_management.do',true)">
                            <i class="iconfont left-nav-li" lay-tips="实验管理">&#xe6ce;</i>
                            <cite>实验管理</cite>
                            <%--<i class="iconfont nav_right">&#xe697;</i>--%>
                        </a>
                        <%--<ul class="sub-menu">--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('实时监测','qc_real_time_surveillance.do')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>实时监测</cite></a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    </li>

                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="人事管理">&#xe83c;</i>
                            <cite>人事管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('人事首页','personnel/toHomePage',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>人事首页</cite></a>
                            </li>

                            <li>
                                <a onclick="xadmin.add_tab('基本信息','personnel/toBasic?page=1',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>基本信息</cite></a>
                            </li>

                            <li>
                                <a href="javascript:;">
                                    <i class="iconfont">&#xe70b;</i>
                                    <cite>人员管理</cite>
                                    <i class="iconfont nav_right">&#xe697;</i></a>
                                <ul class="sub-menu">
                                    <li>
                                        <a onclick="xadmin.add_tab('入职','personnel/toEntry?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>入职</cite></a>
                                    </li>

                                    <li>
                                        <a onclick="xadmin.add_tab('等待离职','personnel/toWaitLeave?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>等待离职</cite></a>
                                    </li>

                                    <li>
                                        <a onclick="xadmin.add_tab('已经离职','personnel/toAlreadyLeave?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>已经离职</cite></a>
                                    </li>

                                    <li>
                                        <a onclick="xadmin.add_tab('退休','personnel/toRetireManage?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>退休</cite></a>
                                    </li>

                                    <li>
                                        <a onclick="xadmin.add_tab('职位变动','personnel/toJobChange?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>职位变动</cite></a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a onclick="xadmin.add_tab('合同管理','personnel/toContract?page=1',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>合同管理</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('考勤管理','personalAttendance/toAttendanceStatistics',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>考勤管理</cite></a>
                            </li>

                            <li>
                                <a href="javascript:;">
                                    <i class="iconfont">&#xe6e5;</i>
                                    <cite>工资管理</cite>
                                    <i class="iconfont nav_right">&#xe697;</i></a>
                                <ul class="sub-menu">
                                    <li>
                                        <a onclick="xadmin.add_tab('正式职工','wageStatistics/toRegularEmployee',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>正式职工</cite></a>
                                    </li>
                                    <li>
                                        <a onclick="xadmin.add_tab('外包职工','wageStatistics/toOutsourcedStaff',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>外包职工</cite></a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="党建工作">&#xe6cb;</i>
                            <cite>党建工作</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('学习强国','https://www.xuexi.cn/')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>学习强国</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('共产党员网','http://www.12371.cn/')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>共产党员网</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('组织架构','member-list1.html',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>组织架构</cite></a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a onclick="xadmin.add_tab('经营管理','/operatingManager.do',true)">
                            <i class="iconfont left-nav-li" lay-tips="经营管理">&#xe6bf;</i>
                            <cite>经营管理</cite>
                            <%--<i class="iconfont nav_right">&#xe697;</i>--%>
                        </a>
                        <%--<ul class="sub-menu">--%>
                        <%--<li>--%>
                        <%--<a onclick="xadmin.add_tab('实时监测','qc_real_time_surveillance.do')">--%>
                        <%--<i class="iconfont">&#xe6a7;</i>--%>
                        <%--<cite>实时监测</cite></a>--%>
                        <%--</li>--%>
                        <%--</ul>--%>
                    </li>

                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="环保监控">&#xe707;</i>
                            <cite>环保监控</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('公开环保数据','weatherIndex.do',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>公开环保数据</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('实时环保数据','realTimeData.do',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>实时环保数据</cite></a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a onclick="xadmin.add_tab('厂区安全','/security.do',true)">
                            <i class="iconfont left-nav-li" lay-tips="厂区安全">&#xe722;</i>
                            <cite>厂区安全</cite>
                            <%--<i class="iconfont nav_right">&#xe697;</i>--%>
                        </a>
                        <%--<ul class="sub-menu">--%>
                        <%--<li>--%>
                        <%--<a onclick="xadmin.add_tab('实时监测','qc_real_time_surveillance.do')">--%>
                        <%--<i class="iconfont">&#xe6a7;</i>--%>
                        <%--<cite>实时监测</cite></a>--%>
                        <%--</li>--%>
                        <%--</ul>--%>
                    </li>

                    <%--<li>--%>
                        <%--<a href="javascript:;">--%>
                            <%--<i class="iconfont left-nav-li" lay-tips="会员管理">&#xe6b8;</i>--%>
                            <%--<cite>会员管理</cite>--%>
                            <%--<i class="iconfont nav_right">&#xe697;</i></a>--%>
                        <%--<ul class="sub-menu">--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('统计页面','welcome1.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>统计页面</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('会员列表(静态表格)','member-list.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>会员列表(静态表格)</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('会员列表(动态表格)','member-list1.html',true)">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>会员列表(动态表格)</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('会员删除','member-del.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>会员删除</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="javascript:;">--%>
                                    <%--<i class="iconfont">&#xe70b;</i>--%>
                                    <%--<cite>会员管理</cite>--%>
                                    <%--<i class="iconfont nav_right">&#xe697;</i></a>--%>
                                <%--<ul class="sub-menu">--%>
                                    <%--<li>--%>
                                        <%--<a onclick="xadmin.add_tab('会员删除','member-del.html')">--%>
                                            <%--<i class="iconfont">&#xe6a7;</i>--%>
                                            <%--<cite>会员删除</cite></a>--%>
                                    <%--</li>--%>
                                    <%--<li>--%>
                                        <%--<a onclick="xadmin.add_tab('等级管理','member-list1.html')">--%>
                                            <%--<i class="iconfont">&#xe6a7;</i>--%>
                                            <%--<cite>等级管理</cite></a>--%>
                                    <%--</li>--%>
                                <%--</ul>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:;">--%>
                            <%--<i class="iconfont left-nav-li" lay-tips="订单管理">&#xe723;</i>--%>
                            <%--<cite>订单管理</cite>--%>
                            <%--<i class="iconfont nav_right">&#xe697;</i></a>--%>
                        <%--<ul class="sub-menu">--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('订单列表','order-list.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>订单列表</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('订单列表1','order-list1.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>订单列表1</cite></a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:;">--%>
                            <%--<i class="iconfont left-nav-li" lay-tips="分类管理">&#xe723;</i>--%>
                            <%--<cite>分类管理</cite>--%>
                            <%--<i class="iconfont nav_right">&#xe697;</i></a>--%>
                        <%--<ul class="sub-menu">--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('多级分类','cate.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>多级分类</cite></a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:;">--%>
                            <%--<i class="iconfont left-nav-li" lay-tips="城市联动">&#xe723;</i>--%>
                            <%--<cite>城市联动</cite>--%>
                            <%--<i class="iconfont nav_right">&#xe697;</i></a>--%>
                        <%--<ul class="sub-menu">--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('三级地区联动','city.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>三级地区联动</cite></a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:;">--%>
                            <%--<i class="iconfont left-nav-li" lay-tips="管理员管理">&#xe726;</i>--%>
                            <%--<cite>管理员管理</cite>--%>
                            <%--<i class="iconfont nav_right">&#xe697;</i></a>--%>
                        <%--<ul class="sub-menu">--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('管理员列表','admin-list.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>管理员列表</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('角色管理','admin-role.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>角色管理</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('权限分类','admin-cate.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>权限分类</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('权限管理','admin-rule.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>权限管理</cite></a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:;">--%>
                            <%--<i class="iconfont left-nav-li" lay-tips="系统统计">&#xe6ce;</i>--%>
                            <%--<cite>系统统计</cite>--%>
                            <%--<i class="iconfont nav_right">&#xe697;</i></a>--%>
                        <%--<ul class="sub-menu">--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('拆线图','echarts1.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>拆线图</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('拆线图','echarts2.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>拆线图</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('地图','echarts3.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>地图</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('饼图','echarts4.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>饼图</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('雷达图','echarts5.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>雷达图</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('k线图','echarts6.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>k线图</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('热力图','echarts7.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>热力图</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('仪表图','echarts8.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>仪表图</cite></a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:;">--%>
                            <%--<i class="iconfont left-nav-li" lay-tips="图标字体">&#xe6b4;</i>--%>
                            <%--<cite>图标字体</cite>--%>
                            <%--<i class="iconfont nav_right">&#xe697;</i></a>--%>
                        <%--<ul class="sub-menu">--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('图标对应字体','unicode.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>图标对应字体</cite></a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:;">--%>
                            <%--<i class="iconfont left-nav-li" lay-tips="其它页面">&#xe6b4;</i>--%>
                            <%--<cite>其它页面</cite>--%>
                            <%--<i class="iconfont nav_right">&#xe697;</i></a>--%>
                        <%--<ul class="sub-menu">--%>
                            <%--<li>--%>
                                <%--<a href="login.html" target="_blank">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>登录页面</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('错误页面','error.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>错误页面</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('示例页面','demo.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>示例页面</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('更新日志','log.html')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>更新日志</cite></a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:;">--%>
                            <%--<i class="iconfont left-nav-li" lay-tips="第三方组件">&#xe6b4;</i>--%>
                            <%--<cite>layui第三方组件</cite>--%>
                            <%--<i class="iconfont nav_right">&#xe697;</i></a>--%>
                        <%--<ul class="sub-menu">--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('滑块验证','https://fly.layui.com/extend/sliderVerify/')" target="">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>滑块验证</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('富文本编辑器','https://fly.layui.com/extend/layedit/')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>富文本编辑器</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('eleTree 树组件','https://fly.layui.com/extend/eleTree/')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>eleTree 树组件</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('图片截取','https://fly.layui.com/extend/croppers/')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>图片截取</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('formSelects 4.x 多选框','https://fly.layui.com/extend/formSelects/')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>formSelects 4.x 多选框</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('Magnifier 放大镜','https://fly.layui.com/extend/Magnifier/')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>Magnifier 放大镜</cite></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('notice 通知控件','https://fly.layui.com/extend/notice/')">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>notice 通知控件</cite></a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                </ul>
            </div>
        </div>
        <!-- <div class="x-slide_left"></div> -->
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
            <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
                <ul class="layui-tab-title">
                    <li class="home layui-this">
                        <i class="layui-icon">&#xe68e;</i>我的桌面</li></ul>
                <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
                    <dl>
                        <dd data-type="this">关闭当前</dd>
                        <dd data-type="other">关闭其它</dd>
                        <dd data-type="all">关闭全部</dd></dl>
                </div>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <%--<shiro:hasPermission name="managementLayer">--%>
                            <%--<iframe src='/managePage.do' frameborder="0" scrolling="yes" class="x-iframe"></iframe>--%>
                        <%--</shiro:hasPermission>--%>

                        <%--<shiro:lacksPermission name="managementLayer">--%>
                            <%--<iframe src='/basePage.do' frameborder="0" scrolling="yes" class="x-iframe"></iframe>--%>
                        <%--</shiro:lacksPermission>--%>

                        <iframe src='/basePage.do' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                    </div>
                </div>
                <div id="tab_show"></div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <style id="theme_style"></style>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
        <script>//百度统计可去掉
            var _hmt = _hmt || []; (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();</script>
    </body>

</html>