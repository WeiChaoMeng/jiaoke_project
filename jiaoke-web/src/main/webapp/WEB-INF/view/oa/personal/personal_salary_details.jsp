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
    <title>个人工资详情</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="../../../../static/new/css/font.css">
    <script src="../../../../static/new/lib/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../../../../static/new/css/xadmin.css">
</head>

<body>
<div class="x-nav">
    <span class="layui-breadcrumb">
        <a><cite>主页</cite></a>
        <a><cite>OA系统</cite></a>
        <a><cite>个人事务</cite></a>
        <a><cite>个人工资</cite></a>
        <a><cite>工资详情</cite></a>
    </span>

    <a class="layui-btn layui-btn-normal" style="margin-top: 5px;float: right;height: 30px;padding: 0 15px;line-height: 30px;" onclick="window.history.back()" title="返回">
        <i class="layui-icon layui-icon-return" style="font-size: 14px;"></i>
    </a>
</div>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <table class="layui-table layui-form" lay-filter="demo">
                        <tbody id="tbody">
                        <tr>
                            <td style="width: 12%;background: #f2f2f2;padding: 10px 15px;">部门</td>
                            <td style="width: 13%;">${oaPersonalWages.department}</td>

                            <td style="width: 12%;background: #f2f2f2;">姓名</td>
                            <td style="width: 13%;">${oaPersonalWages.name}</td>

                            <td style="width: 12%;background: #f2f2f2;">岗位</td>
                            <td style="width: 13%;">${oaPersonalWages.position}</td>

                            <td style="width: 12%;background: #f2f2f2;">岗位工资</td>
                            <td style="width: 13%;">${oaPersonalWages.positionSalary}</td>
                        </tr>

                        <tr>
                            <td style="width: 12%;background: #f2f2f2;padding: 10px 15px;">技术职称津贴</td>
                            <td style="width: 13%;">${oaPersonalWages.technicalTitleAllowance}</td>

                            <td style="width: 12%;background: #f2f2f2;">特殊工种津贴</td>
                            <td style="width: 13%;">${oaPersonalWages.specialWorkAllowance}</td>

                            <td style="width: 12%;background: #f2f2f2;">补发工资</td>
                            <td style="width: 13%;">${oaPersonalWages.reissueWages}</td>

                            <td style="width: 12%;background: #f2f2f2;">奖金</td>
                            <td style="width: 13%;">${oaPersonalWages.bonus}</td>
                        </tr>

                        <tr>
                            <td style="width: 12%;background: #f2f2f2;padding: 10px 15px;">月奖</td>
                            <td style="width: 13%;">${oaPersonalWages.monthlyAward}</td>

                            <td style="width: 12%;background: #f2f2f2;">补助</td>
                            <td style="width: 13%;">${oaPersonalWages.subsidy}</td>

                            <td style="width: 12%;background: #f2f2f2;">高温津贴</td>
                            <td style="width: 13%;">${oaPersonalWages.megathermalAllowance}</td>

                            <td style="width: 12%;background: #f2f2f2;">加班费</td>
                            <td style="width: 13%;">${oaPersonalWages.overtimePay}</td>


                        </tr>

                        <tr>
                            <td style="width: 12%;background: #f2f2f2;padding: 10px 15px;">扣发工资</td>
                            <td style="width: 13%;">${oaPersonalWages.withholdingWages}</td>

                            <td style="width: 12%;background: #f2f2f2;">应发工资</td>
                            <td style="width: 13%;">${oaPersonalWages.wagesPayable}</td>

                            <td style="width: 12%;background: #f2f2f2;">养老险</td>
                            <td style="width: 13%;">${oaPersonalWages.endowmentInsurance}</td>

                            <td style="width: 12%;background: #f2f2f2;">失业险</td>
                            <td style="width: 13%;">${oaPersonalWages.unemploymentInsurance}</td>
                        </tr>

                        <tr>
                            <td style="width: 12%;background: #f2f2f2;padding: 10px 15px;">医保</td>
                            <td style="width: 13%;">${oaPersonalWages.medicalInsurance}</td>

                            <td style="width: 12%;background: #f2f2f2;">大额</td>
                            <td style="width: 13%;">${oaPersonalWages.largeMedicalInsurance}</td>

                            <td style="width: 12%;background: #f2f2f2;">公积金</td>
                            <td style="width: 13%;">${oaPersonalWages.accumulationFund}</td>

                            <td style="width: 12%;background: #f2f2f2;">应扣三险一金合计</td>
                            <td style="width: 13%;">${oaPersonalWages.deductibleExpenses}</td>
                        </tr>

                        <tr>
                            <td style="width: 12%;background: #f2f2f2;padding: 10px 15px;">扣三险及公积金后工资</td>
                            <td style="width: 13%;">${oaPersonalWages.feeAfterDeduction}</td>

                            <td style="width: 12%;background: #f2f2f2;">会费</td>
                            <td style="width: 13%;">${oaPersonalWages.individualIncomeTax}</td>

                            <td style="width: 12%;background: #f2f2f2;">实发金额</td>
                            <td style="width: 13%;">${oaPersonalWages.actualAmount}</td>

                            <td style="width: 12%;background: #f2f2f2;">结算日期</td>
                            <td style="width: 13%;">${oaPersonalWages.settlementDate}</td>
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
<script type="text/javascript" src="../../../../static/js/oa/layer/layer.js"></script>
</html>