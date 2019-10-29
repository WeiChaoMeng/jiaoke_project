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

<div class="nav nav-mini">
    <div class="nav-top">
        <div id="mini" style="border-bottom: 2px #fff solid;">
            <img style="padding: 3.5px 13px" src="../../../static/images/icon/mini.png">
        </div>
    </div>
    <ul>
        <li class="nav-item">
            <shiro:hasPermission name="personalAffairs">
                <a>
                    <i class="iconfont icon-gerenshiwu"></i>
                    <span class="parent-menu-span">个人事务</span>
                    <i class="my-icon nav-more"></i>
                </a>
            </shiro:hasPermission>
            <ul>
                <li><a id="personal_attendance"><span>个人考勤</span></a></li>
                <li><a id="personal_salary"><span>个人工资</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a>
                <i class="iconfont icon-m3-newCoordination-copy"></i>
                <span class="parent-menu-span">协同工作</span>
                <i class="my-icon nav-more"></i>
            </a>
            <ul>
                <%--<li><a id="new_matter"><span>新建事项</span></a></li>--%>
                <li><a id="waiting_matter"><span>待发事项</span></a></li>
                <li><a id="already_issued_matter"><span>已发事项</span></a></li>
                <li><a id="to_do_matter"><span>待办事项</span></a></li>
                <li><a id="managed_matter"><span>已办事项</span></a></li>
                <%--<li><a id="supervision_matters"><span>督办事项</span></a></li>--%>
            </ul>
        </li>
        <%--<li class="nav-item">
            <shiro:hasPermission name="documentManagement">
                <a><i class="iconfont icon-gongwen"></i>
                    <span class="parent-menu-span">公文管理</span>
                    <i class="my-icon nav-more"></i>
                </a>
            </shiro:hasPermission>
            <ul>
                <shiro:hasPermission name="createDocument">
                    <li><a id="release_document"><span>新建公文</span></a></li>
                    <li><a id="primed_document"><span>待发公文</span></a></li>
                    <li><a id="issued_document"><span>已发公文</span></a></li>
                </shiro:hasPermission>
                <li><a id="pending_document"><span>待办公文</span></a></li>
                <li><a id="done_document"><span>已办公文</span></a></li>

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
                           onclick="IFrame(this,$('#office').text(),'releaseDocument/toReleaseDocument')">
                            <span>公司发文</span>
                        </a>
                    </li>
                    <li>
                        <a id="office_receive_document"
                           onclick="IFrame(this,$('#office').text(),'receiveDocument/toReceiveDocument')">
                            <span>公司收文</span>
                        </a>
                    </li>
                        <%--<li>
                            <a id="office_meeting_summary"
                               onclick="IFrame(this,$('#office').text(),'comprehensiveOffice/officeMeetingSummary')">
                                <span>会议纪要</span>
                            </a>
                        </li>--%>
                    <li>
                        <a id="office_management_system"
                           onclick="IFrame(this,$('#office').text(),'managementSystem/toManagementSystem')">
                            <span>管理体系相关</span>
                        </a>
                    </li>
                    <li>
                        <a id="office_contract_agreement"
                           onclick="IFrame(this,$('#office').text(),'contractAgreement/toContractAgreement')">
                            <span>合同、协议</span>
                        </a>
                    </li>
                    <li>
                        <a id="office_eia_monitoring"
                           onclick="IFrame(this,$('#office').text(),'eiaMonitor/toEiaMonitor')">
                            <span>环评监测报告</span>
                        </a>
                    </li>
                    <li>
                        <a id="office_other_documents"
                           onclick="IFrame(this,$('#office').text(),'officeOther/toOfficeOther')">
                            <span>其他文件</span>
                        </a>
                    </li>
                </ul>
            </li>
        </shiro:hasPermission>


        <shiro:hasPermission name="businessDevelopment">
            <li class="nav-item">
                <a><i class="iconfont icon-danganguanli"></i>
                    <span class="parent-menu-span" id="operateDevelop">经营开发部档案</span>
                    <i class="my-icon nav-more"></i>
                </a>
                <ul>
                    <li>
                        <a onclick="IFrame(this,$('#operateDevelop').text(),'operate/toOperateContract?page=1')">
                            <span>合同</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="IFrame(this,$('#operateDevelop').text(),'operateSign/toIndex?page=1')">
                            <span>签认</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="IFrame(this,$('#operateDevelop').text(),'operateBid/toIndex?page=1')">
                            <span>投标管理</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="IFrame(this,$('#operateDevelop').text(),'operateCustomer/toIndex?page=1')">
                            <span>客户满意度</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="IFrame(this,$('#operateDevelop').text(),'operateOffer/toIndex?page=1')">
                            <span>报价</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="IFrame(this,$('#operateDevelop').text(),'operateLawsuit/toIndex?page=1')">
                            <span>诉讼</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="IFrame(this,$('#operateDevelop').text(),'operateMeeting/toIndex?page=1')">
                            <span>会议纪要</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="IFrame(this,$('#operateDevelop').text(),'operateOther/toIndex?page=1')">
                            <span>其他文件</span>
                        </a>
                    </li>
                </ul>
            </li>
        </shiro:hasPermission>

        <shiro:hasPermission name="productionManagement">
            <li class="nav-item">
                <a><i class="iconfont icon-danganguanli"></i>
                    <span class="parent-menu-span" id="productionManagement">生产管理部</span>
                    <i class="my-icon nav-more"></i>
                </a>
                <ul>
                    <li>
                        <a onclick="IFrame(this,$('#productionManagement').text(),'productionEnvironment/toIndex?page=1')">
                            <span>环保改造台账</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="IFrame(this,$('#productionManagement').text(),'productionContract/toIndex?page=1')">
                            <span>合同</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="IFrame(this,$('#productionManagement').text(),'productionEnergy/toIndex?page=1')">
                            <span>能源、碳排放统计</span>
                        </a>
                    </li>
                        <%--<li>
                            <a onclick="IFrame(this,$('#productionManagement').text(),'managementSystem/toManagementSystem')">
                                <span>固定资产</span>
                            </a>
                        </li>--%>
                    <li>
                        <a onclick="IFrame(this,$('#productionManagement').text(),'productionEquipment/toIndex?page=1')">
                            <span>设备档案技术资料</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="IFrame(this,$('#productionManagement').text(),'productionEngineering/toIndex?page=1')">
                            <span>工程基建类资料</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="IFrame(this,$('#operateDevelop').text(),'productionOther/toIndex?page=1')">
                            <span>其他文件</span>
                        </a>
                    </li>
                </ul>
            </li>
        </shiro:hasPermission>

        <shiro:hasPermission name="financialManagement">
            <li class="nav-item">
                <a><i class="iconfont icon-danganguanli"></i>
                    <span class="parent-menu-span" id="financialManagement">财务管理部</span>
                    <i class="my-icon nav-more"></i>
                </a>
                <ul>
                    <li>
                        <a onclick="IFrame(this,$('#financialManagement').text(),'financeVoucher/toIndex?page=1')">
                            <span>凭证</span>
                        </a>
                    </li>
                        <%--<li>
                            <a onclick="IFrame(this,$('#financialManagement').text(),'receiveDocument/toReceiveDocument')">
                                <span>合同</span>
                            </a>
                        </li>--%>
                    <li>
                        <a onclick="IFrame(this,$('#financialManagement').text(),'financeBil/toIndex?page=1')">
                            <span>票据</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="IFrame(this,$('#financialManagement').text(),'financeConfirm/toIndex?page=1')">
                            <span>确认</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="IFrame(this,$('#financialManagement').text(),'financeMaterial/toIndex?page=1')">
                            <span>报表及材料</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="IFrame(this,$('#financialManagement').text(),'financeOther/toIndex?page=1')">
                            <span>其它文件</span>
                        </a>
                    </li>
                </ul>
            </li>
        </shiro:hasPermission>

        <shiro:hasPermission name="suppliesManagement">
            <li class="nav-item">
                <a><i class="iconfont icon-danganguanli"></i>
                    <span class="parent-menu-span" id="materialManagement">物资管理部</span>
                    <i class="my-icon nav-more"></i>
                </a>
                <ul>
                    <li>
                        <a onclick="IFrame(this,$('#materialManagement').text(),'materialBidding/toIndex?page=1')">
                            <span>砂石料招投标资料</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="IFrame(this,$('#materialManagement').text(),'materialPurchase/toIndex?page=1')">
                            <span>原材料采购合同</span>
                        </a>
                    </li>
                        <%--<li>
                            <a onclick="IFrame(this,$('#materialManagement').text(),'comprehensiveOffice/officeMeetingSummary')">
                                <span>原材料过磅</span>
                            </a>
                        </li>--%>
                        <%--<li>
                            <a onclick="IFrame(this,$('#materialManagement').text(),'managementSystem/toManagementSystem')">
                                <span>成本摊销资料</span>
                            </a>
                        </li>--%>
                    <li>
                        <a onclick="IFrame(this,$('#materialManagement').text(),'materialOther/toIndex?page=1')">
                            <span>其他文件</span>
                        </a>
                    </li>
                </ul>
            </li>
        </shiro:hasPermission>

        <shiro:hasPermission name="qualityTechnology">
            <li class="nav-item">
                <a><i class="iconfont icon-danganguanli"></i>
                    <span class="parent-menu-span" id="qualityTechnology">质量技术部</span>
                    <i class="my-icon nav-more"></i>
                </a>
                <ul>
                    <li>
                        <a onclick="IFrame(this,$('#qualityTechnology').text(),'qualityDevise/toIndex?page=1')">
                            <span>设计文件</span>
                        </a>
                    </li>
                    <li>
                        <a onclick="IFrame(this,$('#qualityTechnology').text(),'qualityPersonnel/toIndex?page=1')">
                            <span>人员情况</span>
                        </a>
                    </li>
                        <%--<li>
                            <a onclick="IFrame(this,$('#qualityTechnology').text(),'comprehensiveOffice/officeMeetingSummary')">
                                <span>仪器设备台账、档案</span>
                            </a>
                        </li>--%>
                        <%--<li>
                            <a onclick="IFrame(this,$('#qualityTechnology').text(),'managementSystem/toManagementSystem')">
                                <span>配合比管理</span>
                            </a>
                        </li>--%>
                </ul>
            </li>
        </shiro:hasPermission>

        <li class="nav-item">
            <shiro:hasPermission name="meetingManagement">
                <a><i class="iconfont icon-huiyiguanli"></i>
                    <span class="parent-menu-span">会议管理</span>
                    <i class="my-icon nav-more"></i>
                </a>
            </shiro:hasPermission>
            <ul>
                <shiro:hasPermission name="newMeeting">
                    <li><a id="new_meeting"><span>新建会议</span></a></li>
                </shiro:hasPermission>
                <%--<li><a id="conference_calendar"><span>会议日历</span></a></li>--%>
                <li><a id="not_open_meeting"><span>待开会议</span></a></li>
                <li><a id="history_meeting"><span>已开会议</span></a></li>
                <%--<li><a id="conference_resources"><span>会议资源</span></a></li>--%>
            </ul>
        </li>


        <li class="nav-item">
            <shiro:hasPermission name="resourceManagement">
                <a><i class="iconfont icon-ziyuanguanli"></i>
                    <span class="parent-menu-span">资源管理</span>
                    <i class="my-icon nav-more"></i>
                </a>
            </shiro:hasPermission>
            <ul>
                <shiro:hasPermission name="resourceLibrary">
                    <li><a id="resource_storage"><span>资源入库</span></a></li>
                </shiro:hasPermission>
                <li><a id="resources_archives"><span>资源档案</span></a></li>
                <li><a id="receive_record"><span>领用记录</span></a></li>
            </ul>
        </li>

        <li class="nav-item">
            <shiro:hasPermission name="culturalDevelopment">
                <a>
                    <i class="iconfont icon-wenhua"></i>
                    <span class="parent-menu-span">企业文化建设</span>
                    <i class="my-icon nav-more"></i>
                </a>
            </shiro:hasPermission>

            <ul>
                <li><a id="announcements"><span>公告</span></a></li>
                <li><a id="news"><span>新闻</span></a></li>
            </ul>
        </li>

        <shiro:hasPermission name="backgroundManagement">
            <li class="nav-item">
                <a>
                    <img src="../../../static/images/backstage-manage.png" style="width: 25px;margin-top: 8px">
                    <span class="parent-menu-span" style="position: absolute;">后台管理</span>
                    <i class="my-icon nav-more"></i>
                </a>
                <ul>
                    <li><a id="userManager"><span>用户管理</span></a></li>
                    <li><a id="roleManager"><span>角色管理</span></a></li>
                    <li><a id="permissionsManager"><span>权限管理</span></a></li>
                    <li><a id="departmentManager"><span>部门管理</span></a></li>
                </ul>
                </a>
            </li>
        </shiro:hasPermission>
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

        <iframe src="oaHomePage/toOaHomePage" id="oa-iframe" name="ifr" width="100%" height="92%" frameborder="0"
                scrolling="auto"></iframe>
    </div>
</div>
</body>
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
</script>
</html>