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
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />

        <link rel="icon" href="../../../static/images/favicon.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="../../../static/new/css/font.css">
        <link rel="stylesheet" href="../../../static/new/css/xadmin.css">
        <link href="../../../static/css/oa/backstage_style.css" rel="stylesheet" type="text/css">
        <link href="../../../static/css/oa/document.css" rel="stylesheet" type="text/css">
        <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
        <script src="../../../static/new/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../../../static/new/js/xadmin.js"></script>
        <script type="text/javascript" src="../../../static/js/jquery.js"></script>
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

        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a href="/homePage.do">路驰综合管理平台</a>
            </div>

            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>

            <ul class="layui-nav right" style="padding: 0 40px" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">${userInfo.nickname}</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <%--<dd>--%>
                            <%--<a onclick="">个人信息</a>--%>
                        <%--</dd>--%>

                        <shiro:hasPermission name="cockpitLayer">
                            <dd>
                                <a onclick="cockpit()">驾驶舱</a>
                            </dd>
                        </shiro:hasPermission>

                        <dd>
                            <a onclick="editPsw()">修改密码</a>
                        </dd>

                        <dd>
                            <a onclick="selectedCode()">APP码</a>
                        </dd>

                        <dd>
                            <a href="/logout">退出</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <shiro:hasPermission name="oa:oa">
                        <li>
                            <a href="javascript:;">
                                <i class="iconfont left-nav-li" lay-tips="OA系统">&#xe6b8;</i>
                                <cite>OA系统</cite>
                                <i class="iconfont nav_right">&#xe697;</i>
                            </a>

                            <ul class="sub-menu">
                                <shiro:hasPermission name="oa:personal">
                                <li>
                                    <a href="javascript:;">
                                        <i class="iconfont">&#xe726;</i>
                                        <cite>个人事务</cite>
                                        <i class="iconfont nav_right">&#xe697;</i>
                                    </a>
                                    <ul class="sub-menu">
                                    <shiro:hasPermission name="personal:attendance">
                                        <li>
                                            <a onclick="xadmin.add_tab('个人考勤','personalAttendance/toPersonalAttendance',true)">
                                                <i class="iconfont">&#xe6a7;</i>
                                                <cite>个人考勤</cite>
                                            </a>
                                        </li>
                                    </shiro:hasPermission>

                                    <shiro:hasPermission name="personal:wage">
                                        <li>
                                            <a onclick="xadmin.add_tab('个人工资','wageStatistics/toPersonalSalary',true)">
                                                <i class="iconfont">&#xe6a7;</i>
                                                <cite>个人工资</cite>
                                            </a>
                                        </li>
                                    </shiro:hasPermission>
                                    </ul>
                                </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="oa:teamwork">
                                <li>
                                    <a href="javascript:;">
                                        <i class="iconfont">&#xe82a;</i>
                                        <cite>协同工作</cite>
                                        <i class="iconfont nav_right">&#xe697;</i>
                                    </a>
                                    <ul class="sub-menu">
                                        <shiro:hasPermission name="teamwork:wait">
                                        <li>
                                            <a onclick="xadmin.add_tab('待发事项','collaboration/waitSend?page=1',true)">
                                                <i class="iconfont">&#xe6a7;</i>
                                                <cite>待发事项</cite>
                                            </a>
                                        </li>
                                        </shiro:hasPermission>

                                        <shiro:hasPermission name="teamwork:send">
                                        <li>
                                            <a onclick="xadmin.add_tab('已发事项','collaboration/alreadySend?page=1',true)">
                                                <i class="iconfont">&#xe6a7;</i>
                                                <cite>已发事项</cite>
                                            </a>
                                        </li>
                                        </shiro:hasPermission>

                                        <shiro:hasPermission name="teamwork:upcoming">
                                        <li>
                                            <a onclick="xadmin.add_tab('待办事项','collaboration/pending?page=1',true)">
                                                <i class="iconfont">&#xe6a7;</i>
                                                <cite>待办事项</cite>
                                            </a>
                                        </li>
                                        </shiro:hasPermission>

                                        <shiro:hasPermission name="teamwork:already">
                                        <li>
                                            <a onclick="xadmin.add_tab('已办事项','collaboration/done?page=1',true)">
                                                <i class="iconfont">&#xe6a7;</i>
                                                <cite>已办事项</cite>
                                            </a>
                                        </li>
                                        </shiro:hasPermission>

                                        <shiro:hasPermission name="teamwork:contract">
                                        <li>
                                            <a onclick="xadmin.add_tab('合同管理','review/toContractManagement?page=1',true)">
                                                <i class="iconfont">&#xe6a7;</i>
                                                <cite>合同管理</cite>
                                            </a>
                                        </li>
                                        </shiro:hasPermission>

                                        <li>
                                            <a onclick="xadmin.add_tab('流程模板','collaboration/toFlowTemplate',true)">
                                                <i class="iconfont">&#xe6a7;</i>
                                                <cite>流程模板</cite>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="file:office">
                                    <li>
                                        <a href="javascript:;">
                                            <i class="iconfont">&#xe83c;</i>
                                            <cite>综合办公室</cite>
                                            <i class="iconfont nav_right">&#xe697;</i>
                                        </a>
                                        <ul class="sub-menu">
                                            <li>
                                                <a onclick="xadmin.add_tab('公司发文','releaseDocument/toReleaseDocument?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>公司发文</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('公司收文','receiveDocument/toReceiveDocument?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>公司收文</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('管理体系相关','managementSystem/toManagementSystem?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>管理体系相关</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('合同、协议','contractAgreement/toContractAgreement?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>合同、协议</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('环评监测报告','eiaMonitor/toEiaMonitor?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>环评监测报告</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('其它文件','officeOther/toOfficeOther?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>其它文件</cite>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="file:operate">
                                    <li>
                                        <a href="javascript:;">
                                            <i class="iconfont">&#xe83c;</i>
                                            <cite>经营开发部</cite>
                                            <i class="iconfont nav_right">&#xe697;</i>
                                        </a>
                                        <ul class="sub-menu">
                                            <li>
                                                <a onclick="xadmin.add_tab('合同','operate/toOperateContract?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>合同</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('签认','operateSign/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>签认</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('投标管理','operateBid/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>投标管理</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('客户满意度','operateCustomer/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>客户满意度</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('报价','operateOffer/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>报价</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('诉讼','operateLawsuit/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>诉讼</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('会议纪要','operateMeeting/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>会议纪要</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('其它文件','operateOther/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>其它文件</cite>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="file:production">
                                    <li>
                                        <a href="javascript:;">
                                            <i class="iconfont">&#xe83c;</i>
                                            <cite>生产管理部</cite>
                                            <i class="iconfont nav_right">&#xe697;</i>
                                        </a>
                                        <ul class="sub-menu">
                                            <li>
                                                <a onclick="xadmin.add_tab('环保改造台账','productionEnvironment/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>环保改造台账</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('合同','productionContract/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>合同</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('能源、碳排放统计','productionEnergy/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>能源、碳排放统计</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('设备档案技术资料','productionEquipment/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>设备档案技术资料</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('工程基建类资料','productionEngineering/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>工程基建类资料</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('其它文件','productionOther/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>其它文件</cite>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="file:financial">
                                    <li>
                                        <a href="javascript:;">
                                            <i class="iconfont">&#xe83c;</i>
                                            <cite>财务管理部</cite>
                                            <i class="iconfont nav_right">&#xe697;</i>
                                        </a>
                                        <ul class="sub-menu">
                                            <li>
                                                <a onclick="xadmin.add_tab('凭证','financeVoucher/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>凭证</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('票据','financeBil/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>票据</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('确认','financeConfirm/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>确认</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('报表及材料','financeMaterial/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>报表及材料</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('其它文件','financeOther/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>其它文件</cite>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="file:supplies">
                                    <li>
                                        <a href="javascript:;">
                                            <i class="iconfont">&#xe83c;</i>
                                            <cite>物资管理部</cite>
                                            <i class="iconfont nav_right">&#xe697;</i>
                                        </a>
                                        <ul class="sub-menu">
                                            <li>
                                                <a onclick="xadmin.add_tab('砂石料招投标资料','materialBidding/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>砂石料招投标资料</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('原材料采购合同','materialPurchase/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>原材料采购合同</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('其它文件','materialOther/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>其它文件</cite>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="file:quality">
                                    <li>
                                        <a href="javascript:;">
                                            <i class="iconfont">&#xe83c;</i>
                                            <cite>质量技术部</cite>
                                            <i class="iconfont nav_right">&#xe697;</i>
                                        </a>
                                        <ul class="sub-menu">
                                            <li>
                                                <a onclick="xadmin.add_tab('设计文件','qualityDevise/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>设计文件</cite>
                                                </a>
                                            </li>
                                            <li>
                                                <a onclick="xadmin.add_tab('人员情况','qualityPersonnel/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>人员情况</cite>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="oa:resource">
                                    <li>
                                        <a href="javascript:;">
                                            <i class="iconfont">&#xe6a2;</i>
                                            <cite>资源管理</cite>
                                            <i class="iconfont nav_right">&#xe697;</i>
                                        </a>
                                        <ul class="sub-menu">
                                            <shiro:hasPermission name="resource:file">
                                                <li>
                                                    <a onclick="xadmin.add_tab('资源档案','assetsManagement/toAssetsArchives?page=1',true)">
                                                        <i class="iconfont">&#xe6a7;</i>
                                                        <cite>资源档案</cite>
                                                    </a>
                                                </li>
                                            </shiro:hasPermission>

                                            <shiro:hasPermission name="resource:annal">
                                                <li>
                                                    <a onclick="xadmin.add_tab('领用记录','assetsManagement/toAssetUse?page=1',true)">
                                                        <i class="iconfont">&#xe6a7;</i>
                                                        <cite>领用记录</cite>
                                                    </a>
                                                </li>
                                            </shiro:hasPermission>
                                        </ul>
                                    </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="oa:culture">
                                    <li>
                                        <a href="javascript:;">
                                            <i class="iconfont">&#xe6a0;</i>
                                            <cite>企业文化建设</cite>
                                            <i class="iconfont nav_right">&#xe697;</i>
                                        </a>
                                        <ul class="sub-menu">
                                            <shiro:hasPermission name="culture:notice">
                                                <li>
                                                    <a onclick="xadmin.add_tab('公告','notice/toIndex?page=1',true)">
                                                        <i class="iconfont">&#xe6a7;</i>
                                                        <cite>公告</cite>
                                                    </a>
                                                </li>
                                            </shiro:hasPermission>

                                            <shiro:hasPermission name="culture:news">
                                                <li>
                                                    <a onclick="xadmin.add_tab('新闻','newsCenter/toNewsCenter',true)">
                                                        <i class="iconfont">&#xe6a7;</i>
                                                        <cite>新闻</cite>
                                                    </a>
                                                </li>
                                            </shiro:hasPermission>
                                        </ul>
                                    </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="oa:backstage">
                                    <li>
                                        <a href="javascript:;">
                                            <i class="iconfont">&#xe6ae;</i>
                                            <cite>后台管理</cite>
                                            <i class="iconfont nav_right">&#xe697;</i>
                                        </a>
                                        <ul class="sub-menu">
                                            <shiro:hasPermission name="backstage:user">
                                            <li>
                                                <a onclick="xadmin.add_tab('用户管理','backstageManagement/toUserManager?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>用户管理</cite>
                                                </a>
                                            </li>
                                            </shiro:hasPermission>

                                            <shiro:hasPermission name="backstage:role">
                                            <li>
                                                <a onclick="xadmin.add_tab('角色管理','backstageManagement/toRoleManager?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>角色管理</cite>
                                                </a>
                                            </li>
                                            </shiro:hasPermission>

                                            <shiro:hasPermission name="backstage:power">
                                            <li>
                                                <a onclick="xadmin.add_tab('权限管理','backstageManagement/toPermissionManager',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>权限管理</cite>
                                                </a>
                                            </li>
                                            </shiro:hasPermission>

                                            <shiro:hasPermission name="backstage:department">
                                            <li>
                                                <a onclick="xadmin.add_tab('部门管理','backstageManagement/toDepartmentManager?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>部门管理</cite>
                                                </a>
                                            </li>
                                            </shiro:hasPermission>

                                            <li>
                                                <a onclick="xadmin.add_tab('主送参数','mainDelivery/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>主送参数</cite>
                                                </a>
                                            </li>

                                            <li>
                                                <a onclick="xadmin.add_tab('抄送参数','copyDelivery/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>抄送参数</cite>
                                                </a>
                                            </li>

                                            <li>
                                                <a onclick="xadmin.add_tab('收文参数','receiptReading/toIndex?page=1',true)">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite>收文参数</cite>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </shiro:hasPermission>
                            </ul>
                        </li>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="quality:quality">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="质量管控">&#xe726;</i>
                            <cite>质量管控</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('质量首页','qc_index.do',true)">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>质量首页</cite></a>--%>
                            <%--</li>--%>
                            <shiro:hasPermission name="quality:monitorOuter">
                            <li>
                                <a onclick="xadmin.add_tab('实时监测','qc_real_time_surveillance.do',true)">
                                    <i class="iconfont">&#xe6bb;</i>
                                    <cite>实时监测</cite></a>
                            </li>
                            </shiro:hasPermission>

                                <shiro:hasPermission name="quality:historyOuter">
                            <li>
                                <a onclick="xadmin.add_tab('历史数据','qc_historical_data.do',true)">
                                    <i class="iconfont">&#xe70c;</i>
                                    <cite>历史数据</cite></a>
                            </li>
                                </shiro:hasPermission>

                            <%--<li>--%>
                                <%--<a onclick="xadmin.add_tab('工程管理','qc_project_manager.do',true)">--%>
                                    <%--<i class="iconfont">&#xe6a7;</i>--%>
                                    <%--<cite>工程管理</cite></a>--%>
                            <%--</li>--%>

                                <shiro:hasPermission name="quality:proportioning">
                            <li>
                                <a onclick="xadmin.add_tab('配比管理','qc_matching_model.do',true)">
                                    <i class="iconfont">&#xe6fa;</i>
                                    <cite>配比管理</cite></a>
                            </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="quality:grading">
                            <li>
                                <a onclick="xadmin.add_tab('级配管理','qc_grading_manager.do',true)">
                                    <i class="iconfont">&#xe6b5;</i>
                                    <cite>级配管理</cite></a>
                            </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="quality:dynamic">
                            <li>
                                <a onclick="xadmin.add_tab('动态管理','qc_dynamic_management.do',true)">
                                    <i class="iconfont">&#xe6b3;</i>
                                    <cite>动态管理</cite></a>
                            </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="quality:monitor">
                            <li>
                                <a onclick="xadmin.add_tab('实时监控','qc_real_time_monitoring.do',true)">
                                    <i class="iconfont">&#xe829;</i>
                                    <cite>实时监控</cite></a>
                            </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="quality:warning">
                            <li>
                                <a onclick="xadmin.add_tab('质量预警','qc_quality_warning.do',true)">
                                    <i class="iconfont">&#xe713;</i>
                                    <cite>质量预警</cite></a>
                            </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="quality:data">
                            <li>
                                <a onclick="xadmin.add_tab('数据管理','qc_data_manager.do',true)">
                                    <i class="iconfont">&#xe70c;</i>
                                    <cite>数据管理</cite></a>
                            </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="quality:assist">
                            <li>
                                <a onclick="xadmin.add_tab('辅助分析','qc_auxiliary_analysis.do',true)">
                                    <i class="iconfont">&#xe704;</i>
                                    <cite>辅助分析</cite></a>
                            </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="quality:summary">
                            <li>
                                <a onclick="xadmin.add_tab('数据汇总','qc_data_summary.do',true)">
                                    <i class="iconfont">&#xe724;</i>
                                    <cite>数据汇总</cite></a>
                            </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="quality:alarm">
                            <li>
                                <a onclick="xadmin.add_tab('警报管理','qc_critical_warning.do',true)">
                                    <i class="iconfont">&#xe70e;</i>
                                    <cite>警报管理</cite></a>
                            </li>
                                </shiro:hasPermission>
                        </ul>
                    </li>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="experiment:experiment">
                    <li>
                        <a onclick="xadmin.add_tab('实验管理','experimental_management.do',true)">
                            <i class="iconfont left-nav-li" lay-tips="实验管理">&#xe74c;</i>
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
                    </shiro:hasPermission>

                    <shiro:hasPermission name="personnel:personnel">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="人事管理">&#xe83c;</i>
                            <cite>人事管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('人事首页','personnel/toHomePage',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>人事首页</cite>
                                </a>
                            </li>

                            <shiro:hasPermission name="personnel:basic">
                            <li>
                                <a onclick="xadmin.add_tab('基本信息','personnel/toBasic?page=1',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>基本信息</cite>
                                </a>
                            </li>
                            </shiro:hasPermission>

                            <shiro:hasPermission name="personnel:people">
                            <li>
                                <a href="javascript:;">
                                    <i class="iconfont">&#xe70b;</i>
                                    <cite>人员管理</cite>
                                    <i class="iconfont nav_right">&#xe697;</i>
                                </a>
                                <ul class="sub-menu">
                                    <li>
                                        <a onclick="xadmin.add_tab('入职','personnel/toEntry?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>入职</cite>
                                        </a>
                                    </li>

                                    <li>
                                        <a onclick="xadmin.add_tab('等待离职','personnel/toWaitLeave?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>等待离职</cite>
                                        </a>
                                    </li>

                                    <li>
                                        <a onclick="xadmin.add_tab('已经离职','personnel/toAlreadyLeave?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>已经离职</cite>
                                        </a>
                                    </li>

                                    <li>
                                        <a onclick="xadmin.add_tab('退休','personnel/toRetireManage?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>退休</cite>
                                        </a>
                                    </li>

                                    <li>
                                        <a onclick="xadmin.add_tab('职位变动','personnel/toJobChange?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>职位变动</cite>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            </shiro:hasPermission>

                            <shiro:hasPermission name="personnel:contract">
                            <li>
                                <a onclick="xadmin.add_tab('合同管理','personnel/toContract?page=1',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>合同管理</cite>
                                </a>
                            </li>
                            </shiro:hasPermission>

                            <shiro:hasPermission name="personnel:attendance">
                            <li>
                                <a onclick="xadmin.add_tab('考勤管理','personalAttendance/toAttendanceStatistics',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>考勤管理</cite>
                                </a>
                            </li>
                            </shiro:hasPermission>

                            <shiro:hasPermission name="personnel:wage">
                            <li>
                                <a href="javascript:;">
                                    <i class="iconfont">&#xe6e5;</i>
                                    <cite>工资管理</cite>
                                    <i class="iconfont nav_right">&#xe697;</i>
                                </a>
                                <ul class="sub-menu">
                                    <li>
                                        <a onclick="xadmin.add_tab('正式职工','wageStatistics/toRegularStaff?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>正式职工</cite>
                                        </a>
                                    </li>
                                    <li>
                                        <a onclick="xadmin.add_tab('外包职工','wageStatistics/toOutsourcingStaff?page=1',true)">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>外包职工</cite>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="party:party">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="党建工作">&#xe6cb;</i>
                            <cite>党建工作</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('学习强国','https://www.xuexi.cn/')">
                                    <i class="iconfont">&#xe6c0;</i>
                                    <cite>学习强国</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('共产党员网','http://www.12371.cn/')">
                                    <i class="iconfont">&#xe6f7;</i>
                                    <cite>共产党员网</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('组织架构','/partyBuilding.do',true)">
                                    <i class="iconfont">&#xe705;</i>
                                    <cite>组织架构</cite></a>
                            </li>
                        </ul>
                    </li>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="operate:operate">
                    <li>
                        <a onclick="xadmin.add_tab('经营管理','/operatingManager.do',true)">
                            <i class="iconfont left-nav-li" lay-tips="经营管理">&#xe6bf;</i>
                            <cite>经营管理</cite>
                        </a>
                    </li>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="milieu:milieu">
                        <li>
                            <a href="javascript:;">
                                <i class="iconfont left-nav-li" lay-tips="环保监控">&#xe707;</i>
                                <cite>环保监控</cite>
                                <i class="iconfont nav_right">&#xe697;</i></a>
                            <ul class="sub-menu">
                                <shiro:hasPermission name="milieu:public">
                                <li>
                                    <a onclick="xadmin.add_tab('公开环保数据','weatherIndex.do',true)">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>公开环保数据</cite>
                                    </a>
                                </li>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="milieu:synchro">
                                <li>
                                    <a onclick="xadmin.add_tab('实时环保数据','realTimeData.do',true)">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>实时环保数据</cite>
                                    </a>
                                </li>
                                </shiro:hasPermission>
                            </ul>
                        </li>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="security:security">
                        <li>
                            <a onclick="xadmin.add_tab('厂区安全','/security.do',true)">
                                <i class="iconfont left-nav-li" lay-tips="厂区安全">&#xe722;</i>
                                <cite>厂区安全</cite>
                            </a>
                        </li>
                    </shiro:hasPermission>
                </ul>
            </div>
        </div>
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
                        <iframe src='/basePage.do' id="iframes" frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                    </div>
                </div>
                <div id="tab_show"></div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <style id="theme_style"></style>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
    <input type="hidden" id="subFrameId">
    <div id="modalWindow"></div>
    </body>

</html>