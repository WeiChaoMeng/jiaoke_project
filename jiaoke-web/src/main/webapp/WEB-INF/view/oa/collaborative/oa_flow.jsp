<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>流程模板</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="../../../../static/new/css/font.css">
    <script src="../../../../static/new/lib/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../../../../static/new/css/xadmin.css">
    <style>
        .layui-table tbody tr:hover {
            background: none;
        }

        .layui-table td {
            border: none;
            padding: 5px 10px !important;
        }

        .flow-style {
            font-size: 20px !important;
            vertical-align: bottom;
            color: #1E9FFF;
            margin-right: 5px;
        }
    </style>
</head>

<body>
<div class="x-nav">
    <span class="layui-breadcrumb">
        <a><cite>主页</cite></a>
        <a><cite>OA系统</cite></a>
        <a><cite>协同工作</cite></a>
        <a><cite>流程模板</cite></a>
    </span>

    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
</div>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">

                <div class="layui-card-body ">
                    <table class="layui-table layui-form" lay-filter="demo">
                        <tbody>
                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('car')" title="用车申请单">
                                    <i class="layui-icon flow-style">&#xe63c;</i>用车申请单
                                </a>
                            </td>

                            <%--<td class="template" valign="middle">--%>
                            <%--<a class="check_color" onclick="commonJump('meals')" title="客饭审批单">--%>
                            <%--<i class="layui-icon flow-style">&#xe60a;</i>客饭审批单--%>
                            <%--</a>--%>
                            <%--</td>--%>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('relieveLaborContract')" title="解除劳动合同审批表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>解除劳动合同审批表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('card')" title="饭卡申请单">
                                    <i class="layui-icon flow-style">&#xe63c;</i>饭卡申请单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('sealsBorrow')" title="印章借用审批单">
                                    <i class="layui-icon flow-style">&#xe63c;</i>印章借用审批单
                                </a>
                            </td>
                        </tr>

                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('sealsUse')" title="印章使用审批单">
                                    <i class="layui-icon flow-style">&#xe63c;</i>印章使用审批单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('licenceBorrow')" title="证照借用审批单（原件）">
                                    <i class="layui-icon flow-style">&#xe63c;</i>证照借用审批单（原件）
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('licenceUse')" title="证照使用审批单（复印件）">
                                    <i class="layui-icon flow-style">&#xe63c;</i>证照使用审批单（复印件）
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('review')" title="合同审查表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>合同审查表
                                </a>
                            </td>
                        </tr>

                        <%--new--%>
                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('read')" title="收文阅办审批单">
                                    <i class="layui-icon flow-style">&#xe63c;</i>收文阅办审批单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('maintain')" title="设备维修申请单">
                                    <i class="layui-icon flow-style">&#xe63c;</i>设备维修申请单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('acceptance')" title="验收单">
                                    <i class="layui-icon flow-style">&#xe63c;</i>设备维修验收单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('engineering')" title="工程名称变更记录表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>工程名称变更记录表
                                </a>
                            </td>
                        </tr>

                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('document')" title="发送公文">
                                    <i class="layui-icon flow-style">&#xe63c;</i>发送公文
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('officeSupplies')" title="办公用品需求计划">
                                    <i class="layui-icon flow-style">&#xe63c;</i>办公用品需求计划
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('acceptanceWarehousing')" title="办公用品需求计划">
                                    <i class="layui-icon flow-style">&#xe63c;</i>验收入库单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('officeSuppliesUse')" title="办公用品需求计划">
                                    <i class="layui-icon flow-style">&#xe63c;</i>办公用品领用
                                </a>
                            </td>
                        </tr>

                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('laborContractSign')" title="劳动合同签订通知书">
                                    <i class="layui-icon flow-style">&#xe63c;</i>劳动合同签订通知书
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('laborContractRenewal')"
                                   title="劳动合同签订、续订、变更、终止审批表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>劳动合同签订、续订、变更、终止审批表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('regularization')" title="转正申请表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>转正申请表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('transfer')" title="转岗审批表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>转岗审批表
                                </a>
                            </td>
                        </tr>

                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('annualLeave')" title="年休假审批表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>年休假审批表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('rotation')" title="员工轮岗审批表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>员工轮岗审批表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('adjustWages')" title="调资审批表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>调资审批表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('productionLeave')" title="生产假审批表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>生产假审批表
                                </a>
                            </td>
                        </tr>

                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('departure')" title="离职会签表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>离职会签表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('pactStop')" title="劳务协议终止通知书">
                                    <i class="layui-icon flow-style">&#xe63c;</i>劳务协议终止通知书
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('laborContractStop')" title="劳动合同终止通知书">
                                    <i class="layui-icon flow-style">&#xe63c;</i>劳动合同终止通知书
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('pactSign')" title="劳务派遣员工协议签订、续订、变更、终止审批表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>劳务派遣员工协议签订、续订、变更、终止审批表
                                </a>
                            </td>
                        </tr>

                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('contractSign')"
                                   title="劳务派遣员工合同签订、续订、变更、终止审批表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>劳务派遣员工合同签订、续订、变更、终止审批表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('rewardsPenalties')" title="奖罚意见表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>奖罚意见表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('overtime')" title="加班审批表、统计表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>加班统计表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('leave')" title="请假审批表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>请假审批表
                                </a>
                            </td>
                        </tr>

                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('taxiUse')" title="用车申请表(出租车)">
                                    <i class="layui-icon flow-style">&#xe63c;</i>用车申请表(出租车)
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('confirm')" title="确认单审批单">
                                    <i class="layui-icon flow-style">&#xe63c;</i>确认单审批单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('unitPrice')" title="单价审批单">
                                    <i class="layui-icon flow-style">&#xe63c;</i>单价审批单
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('contractReview')" title="合同评审表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>合同评审表
                                </a>
                            </td>
                        </tr>

                        <tr>
                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('employment')" title="部室用人申请表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>部室用人申请表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('examination')" title="职称（技术等级）考试申请表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>职称（技术等级）考试申请表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('engage')" title="职称（技术等级）评聘申请表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>职称（技术等级）评聘申请表
                                </a>
                            </td>

                            <td class="template" valign="middle">
                                <a class="check_color" onclick="commonJump('trainee')" title="毕业生见习期满考核鉴定表">
                                    <i class="layui-icon flow-style">&#xe63c;</i>毕业生见习期满考核鉴定表
                                </a>
                            </td>

                            <%--<td class="template" valign="middle">--%>
                            <%--<a class="check_color" onclick="commonJump('meeting')" title="会议室申请单">--%>
                            <%--<i class="layui-icon flow-style">&#xe63c;</i>会议室申请单--%>
                            <%--</a>--%>
                            <%--</td>--%>

                            <%--<td class="template" valign="middle">--%>
                            <%--<a class="check_color" onclick="assets()" title="固定资产投资完成验收单（生产用）">--%>
                            <%--<i class="layui-icon flow-style">&#xe63c;</i>固定资产投资完成验收单（生产用）--%>
                            <%--</a>--%>
                            <%--</td>--%>

                            <%--<td class="template" valign="middle">--%>
                            <%--<a class="check_color" onclick="liaison()" title="信息联络处理单">--%>
                            <%--<i class="layui-icon flow-style">&#xe63c;</i>信息联络处理单--%>
                            <%--</a>--%>
                            <%--</td>--%>
                        </tr>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/new/js/xadmin.js"></script>
<script>
    function commonJump(classAddress) {
        window.location.href = "${path}" + classAddress + "/toIndex";
    }
</script>
</html>