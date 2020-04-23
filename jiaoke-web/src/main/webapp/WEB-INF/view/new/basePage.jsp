<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>我的桌面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="icon" href="../../../static/images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../../../static/new/css/font.css">
    <link rel="stylesheet" href="../../../static/new/css/xadmin.css">
    <script src="../../../static/new/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../../static/new/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">

        <div class="layui-col-md7">
            <div class="layui-card">
                <div class="layui-card-header">数据统计</div>
                <div class="layui-card-body ">
                    <ul class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">
                        <li class="layui-col-md4 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>文章数</h3>
                                <p>
                                    <cite>66</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md4 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>会员数</h3>
                                <p>
                                    <cite>12</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md4 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>回复数</h3>
                                <p>
                                    <cite>99</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md4 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>商品数</h3>
                                <p>
                                    <cite>67</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md4 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>文章数</h3>
                                <p>
                                    <cite>67</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md4 layui-col-xs6 ">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>文章数</h3>
                                <p>
                                    <cite>6766</cite></p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="layui-col-md5">
            <div class="layui-card">
                <div class="layui-card-body">
                    <div class="layui-carousel" id="test1">
                        <div carousel-item>
                            <div><img src="../../../static/images/test/2.jpg" style="width: 100%;height: 100%;"></div>
                            <div><img src="../../../static/images/test/3.jpg" style="width: 100%;height: 100%;"></div>
                            <div><img src="../../../static/images/test/4.jpg" style="width: 100%;height: 100%;"></div>
                            <div><img src="../../../static/images/test/5.jpg" style="width: 100%;height: 100%;"></div>
                            <div><img src="../../../static/images/test/6.jpg" style="width: 100%;height: 100%;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">常用模板</div>
                <div class="layui-card-body" style=" min-height: 190px;">
                    <table style="font-size: 13px;width: 100%;">
                        <tbody>
                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('car')" title="用车申请单">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>用车申请单
                                </a>
                            </td>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('sealsBorrow')" title="印章借用审批单">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>印章借用审批单
                                </a>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('sealsUse')" title="印章使用审批单">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>印章使用审批单
                                </a>
                            </td>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('licenceBorrow')" title="证照借用审批单（原件）">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>证照借用审批单（原件）
                                </a>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('licenceUse')" title="证照使用审批单（复印件）">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>证照使用审批单（复印件）
                                </a>
                            </td>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('officeSupplies')" title="办公用品需求计划">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>办公用品需求计划
                                </a>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('officeSuppliesUse')" title="办公用品需求计划">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>办公用品领用
                                </a>
                            </td>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('annualLeave')" title="年休假审批表">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>年休假审批表
                                </a>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('adjustWages')" title="调资审批表">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>调资审批表
                                </a>
                            </td>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('productionLeave')" title="生产假审批表">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>生产假审批表
                                </a>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('annualLeave')" title="年休假审批表">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>年休假审批表
                                </a>
                            </td>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('leave')" title="请假审批表">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>请假审批表
                                </a>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('regularization')" title="转正申请表">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>转正申请表
                                </a>
                            </td>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('transfer')" title="转岗审批表">
                                    <em class="iconfont" style="font-size: 13px;margin-right: 10px;">&#xe6a2;</em>转岗审批表
                                </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">待办工作</div>
                <div class="layui-card-body" style="min-height: 190px;">
                    <table style="font-size: 13px;width: 100%;">
                        <tbody>
                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="list_content" style="width: 75%;">
                                <span class="list_content_name">
                                    <a class="check_color" onclick="taskApprovalHandle('annualLeave','2020040214123242776391','534053')" title="年休假审批表(2020-04-02 14:11:43)">年休假审批表(2020-04-05 11:22:20)</a>
                                </span>
                            </td>
                            <td class="list-content-time" style="width: 15%;">
                                <span class="list_content_date">
                                    <a title="申请时间">2020-04-05</a>
                                </span>
                            </td>
                            <td class="list-content-proposer" style="width: 10%;">
                                <span class="list_content_sponsor">
                                    <a title="申请人">测试</a>
                                </span>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="list_content" style="width: 75%;">
                                <span class="list_content_name">
                                    <a class="check_color" onclick="taskApprovalHandle('annualLeave','2020040214123242776391','534053')" title="证照借用(2020-04-02 14:11:43)">证照借用(2020-04-02 14:11:43)</a>
                                </span>
                            </td>
                            <td class="list-content-time" style="width: 15%;">
                                <span class="list_content_date">
                                    <a title="申请时间">2020-04-02</a>
                                </span>
                            </td>
                            <td class="list-content-proposer" style="width: 10%;">
                                <span class="list_content_sponsor">
                                    <a title="申请人">测试</a>
                                </span>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="list_content" style="width: 75%;">
                                <span class="list_content_name">
                                    <a class="check_color" onclick="taskApprovalHandle('annualLeave','2020040214123242776391','534053')" title="用车审批单(2020-04-02 14:11:43)">用车审批单(2020-04-01 09:10:00)</a>
                                </span>
                            </td>
                            <td class="list-content-time" style="width: 15%;">
                                <span class="list_content_date">
                                    <a title="申请时间">2020-04-01</a>
                                </span>
                            </td>
                            <td class="list-content-proposer" style="width: 10%;">
                                <span class="list_content_sponsor">
                                    <a title="申请人">测试</a>
                                </span>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="list_content" style="width: 75%;">
                                <span class="list_content_name">
                                    <a class="check_color" onclick="taskApprovalHandle('annualLeave','2020040214123242776391','534053')" title="办公用品领用(2020-04-02 14:11:43)">办公用品领用(2020-04-01 09:10:00)</a>
                                </span>
                            </td>
                            <td class="list-content-time" style="width: 15%;">
                                <span class="list_content_date">
                                    <a title="申请时间">2020-04-01</a>
                                </span>
                            </td>
                            <td class="list-content-proposer" style="width: 10%;">
                                <span class="list_content_sponsor">
                                    <a title="申请人">测试</a>
                                </span>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="list_content" style="width: 75%;">
                                <span class="list_content_name">
                                    <a class="check_color" onclick="taskApprovalHandle('annualLeave','2020040214123242776391','534053')" title="奖罚意见表(2020-04-02 14:11:43)">奖罚意见表(2020-04-01 09:10:00)</a>
                                </span>
                            </td>
                            <td class="list-content-time" style="width: 15%;">
                                <span class="list_content_date">
                                    <a title="申请时间">2020-04-01</a>
                                </span>
                            </td>
                            <td class="list-content-proposer" style="width: 10%;">
                                <span class="list_content_sponsor">
                                    <a title="申请人">测试</a>
                                </span>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="list_content" style="width: 75%;">
                                <span class="list_content_name">
                                    <a class="check_color" onclick="taskApprovalHandle('annualLeave','2020040214123242776391','534053')" title="转岗审批表(2020-04-02 14:11:43)">转岗审批表(2020-04-01 09:10:00)</a>
                                </span>
                            </td>
                            <td class="list-content-time" style="width: 15%;">
                                <span class="list_content_date">
                                    <a title="申请时间">2020-04-01</a>
                                </span>
                            </td>
                            <td class="list-content-proposer" style="width: 10%;">
                                <span class="list_content_sponsor">
                                    <a title="申请人">测试</a>
                                </span>
                            </td>
                        </tr>

                        <tr style="line-height: 25px;cursor: pointer;">
                            <td class="list_content" style="width: 75%;">
                                <span class="list_content_name">
                                    <a class="check_color" onclick="taskApprovalHandle('annualLeave','2020040214123242776391','534053')" title="收文阅办单(2020-04-02 14:11:43)">收文阅办单(2020-04-01 09:10:00)</a>
                                </span>
                            </td>
                            <td class="list-content-time" style="width: 15%;">
                                <span class="list_content_date">
                                    <a title="申请时间">2020-04-01</a>
                                </span>
                            </td>
                            <td class="list-content-proposer" style="width: 10%;">
                                <span class="list_content_sponsor">
                                    <a title="申请人">测试</a>
                                </span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

            <div class="layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header">公告</div>
                    <div class="layui-card-body">
                        <ul>
                            <li>
                                <a href="notice/homePageDetails?id=11">中秋节廉洁提醒</a>
                                <i class="layuiadmin-badge-time">2019-09-12</i>
                            </li>
                            <li>
                                <span></span>
                                <a href="notice/homePageDetails?id=10">端午小长假廉洁提醒</a>
                                <i class="layuiadmin-badge-time">2019-06-06</i>
                            </li>
                            <li>
                                <span></span>
                                <a href="notice/homePageDetails?id=9">路驰党支部严明纪律规定，廉洁过好“五一”</a>
                                <i class="layuiadmin-badge-time">2019-04-30</i>
                            </li>
                            <li>
                                <span></span>
                                <a href="notice/homePageDetails?id=8">【廉政】清明节廉政提醒</a>
                                <i class="layuiadmin-badge-time">2019-04-04</i>
                            </li>
                            <li>
                                <span></span>
                                <a href="notice/homePageDetails?id=7">中共北京市政路桥集团有限公司纪委文件</a>
                                <i class="layuiadmin-badge-time">2019-03-28</i>
                            </li>
                            <li>
                                <span></span>
                                <a href="notice/homePageDetails?id=6">中国共产党纪律处分条例</a>
                                <i class="layuiadmin-badge-time">2019-03-12</i>
                            </li>
                            <li>
                                <span></span>
                                <a href="notice/homePageDetails?id=5">2018年职工大会</a>
                                <i class="layuiadmin-badge-time">2018-11-22</i>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">新闻</div>
                <div class="layui-card-body">
                    <ul>
                        <li>
                            <a href="notice/homePageDetails?id=11">天气转凉 棉衣暖心</a>
                            <i class="layuiadmin-badge-time">2019-10-31</i>
                        </li>
                        <li>
                            <span></span>
                            <a href="notice/homePageDetails?id=10">路驰分公司团支部组织开展“不忘初心、牢记使命” 主题团日活动</a>
                            <i class="layuiadmin-badge-time">2019-10-29</i>
                        </li>
                        <li>
                            <span></span>
                            <a href="notice/homePageDetails?id=9">金秋送温暖——路驰分公司工会开展节日慰问活动</a>
                            <i class="layuiadmin-badge-time">2019-10-26</i>
                        </li>
                        <li>
                            <span></span>
                            <a href="notice/homePageDetails?id=8">路驰分公司开展职工幸福指数调研座谈会</a>
                            <i class="layuiadmin-badge-time">2019-04-04</i>
                        </li>
                        <li>
                            <span></span>
                            <a href="notice/homePageDetails?id=7">中共北京市政路桥集团有限公司纪委文件</a>
                            <i class="layuiadmin-badge-time">2019-10-25</i>
                        </li>
                        <li>
                            <span></span>
                            <a href="notice/homePageDetails?id=6">路驰分公司党支部开展 “不忘初心 牢记使命”主题教育动员会</a>
                            <i class="layuiadmin-badge-time">2019-10-20</i>
                        </li>
                        <li>
                            <span></span>
                            <a href="notice/homePageDetails?id=5">路驰分公司上半年产量、产值再创新高</a>
                            <i class="layuiadmin-badge-time">2019-10-18</i>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>
</body>

<script>
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,height: '209px' //设置容器宽度
        });
    });
</script>
</html>