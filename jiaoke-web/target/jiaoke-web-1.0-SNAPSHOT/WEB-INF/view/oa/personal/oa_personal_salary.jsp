<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>个人工资</title>
    <link href="../../../../static/css/calendar.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <script src="../../../../static/js/echarts/echarts.js"></script>
    <script src="../../../../static/js/echarts/uimaker.js"></script>
</head>

<body style="overflow-x:auto; overflow-y:auto;">

<!--本单位职工-->
<div class="">
    <div class="boxdown">

        <table class="simpletable" style="border: none;margin-top: 10px;width: 2320px;color: #000">

            <thead>
            <th style="width: 80px;">结算日期</th>
            <th style="width: 100px;">姓名</th>
            <th style="width: 100px;">部门</th>
            <th style="width: 150px;">岗位</th>
            <th style="width: 80px;">岗位工资</th>
            <th style="width: 100px;">技术职称津贴</th>
            <th style="width: 100px;">特殊工种津贴</th>
            <th style="width: 80px;">补发工资</th>
            <th style="width: 80px;">奖金</th>
            <th style="width: 80px;">月奖</th>
            <th style="width: 80px;">补助</th>
            <th style="width: 80px;">高温津贴</th>
            <th style="width: 80px;">加班费</th>
            <th style="width: 80px;">扣发工资</th>
            <th style="width: 80px;">应发工资</th>
            <th style="width: 80px;">养老险</th>
            <th style="width: 80px;">失业险</th>
            <th style="width: 80px;">医保</th>
            <th style="width: 80px;">大额</th>
            <th style="width: 80px;">公积金</th>
            <th style="width: 150px;">本月应扣三险一金合计</th>
            <th style="width: 150px;">扣三险及公积金后工资</th>
            <th style="width: 100px;">个人所得税</th>
            <th style="width: 80px;">会费</th>
            <th style="width: 80px;">实发金额</th>
            <th style="width: 10px"></th>
            </thead>

            <tbody>
            <c:choose>
                <c:when test="${personalWages == null}">
                    <tr>
                        <td colspan="26">
                            暂无数据
                        </td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td>${personalWages.settlementDate}</td>
                        <td>${personalWages.name}</td>
                        <td>${personalWages.department}</td>
                        <td>${personalWages.position}</td>
                        <td>${personalWages.positionSalary}</td>
                        <td>${personalWages.technicalTitleAllowance}</td>
                        <td>${personalWages.specialWorkAllowance}</td>
                        <td>${personalWages.reissueWages}</td>
                        <td>${personalWages.bonus}</td>
                        <td>${personalWages.monthlyAward}</td>
                        <td>${personalWages.subsidy}</td>
                        <td>${personalWages.megathermalAllowance}</td>
                        <td>${personalWages.overtimePay}</td>
                        <td>${personalWages.withholdingWages}</td>
                        <td>${personalWages.wagesPayable}</td>
                        <td>${personalWages.endowmentInsurance}</td>
                        <td>${personalWages.unemploymentInsurance}</td>
                        <td>${personalWages.medicalInsurance}</td>
                        <td>${personalWages.largeMedicalInsurance}</td>
                        <td>${personalWages.accumulationFund}</td>
                        <td>${personalWages.deductibleExpenses}</td>
                        <td>${personalWages.feeAfterDeduction}</td>
                        <td>${personalWages.individualIncomeTax}</td>
                        <td>${personalWages.membershipFee}</td>
                        <td>${personalWages.actualAmount}</td>
                    </tr>
                </c:otherwise>
            </c:choose>

            </tbody>
        </table>
    </div>
</div>

<div class="chartbox3" id="chart_box">

    <li>

        <div id="chart2" class="charts3"></div>
        <script type="text/javascript">
            var myChart1 = echarts.init(document.getElementById('chart2'));
            // 指定图表的配置项和数据


            var option = {
                title: {
                    text: '工资构成情况',
                    subtext: '纯属虚构',
                    x: 'center'
                },
                //tooltip: {
                //    trigger: 'item',
                //    formatter: "{a} <br/>{b}: {c} ({d}%)"
                //},
                legend: {
                    orient: 'vertical',
                    x: 'left',
                    data: ['基本工资', '出勤', '餐补', '加班费用', '交通补助', '其他']
                },
                series: [
                    {
                        name: '工资占比',
                        type: 'pie',
                        radius: ['40%', '55%'],
                        label: {
                            normal: {
                                formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
                                backgroundColor: '#eee',
                                borderColor: '#aaa',
                                borderWidth: 1,
                                borderRadius: 5,

                                rich: {
                                    a: {
                                        color: '#999',
                                        lineHeight: 22,
                                        align: 'center'
                                    },
                                    // abg: {
                                    //     backgroundColor: '#333',
                                    //     width: '100%',
                                    //     align: 'right',
                                    //     height: 22,
                                    //     borderRadius: [4, 4, 0, 0]
                                    // },
                                    hr: {
                                        borderColor: '#aaa',
                                        width: '100%',
                                        borderWidth: 0.5,
                                        height: 0
                                    },
                                    b: {
                                        fontSize: 16,
                                        lineHeight: 33
                                    },
                                    per: {
                                        color: '#eee',
                                        backgroundColor: '#334455',
                                        padding: [2, 4],
                                        borderRadius: 2
                                    }
                                }
                            },

                            emphasis: {
                                show: true,
                                textStyle: {
                                    fontSize: '30',
                                    fontWeight: 'bold'
                                }
                            }
                        },

                        <c:choose>
                            <c:when test="${personalWages == null}">
                                data: [
                                    {value: 348, name: '基本工资'},
                                    {value: 251, name: '出勤'},
                                    {value: 147, name: '餐补'},
                                    {value: 102, name: '加班费用'},
                                    {value: 102, name: '交通补助'},
                                    {value: 200, name: '其他'}
                                ]
                            </c:when>
                            <c:otherwise>
                                data: [
                                    {value: ${personalWages.positionSalary}, name: '岗位工资'},
                                    {value: ${personalWages.overtimePay}, name: '加班'},
                                    {value: ${personalWages.technicalTitleAllowance + personalWages.specialWorkAllowance + personalWages.megathermalAllowance}, name: '各类津贴'},
                                    {value: ${personalWages.bonus + personalWages.monthlyAward}, name: '各类奖金'},
                                    {value: ${personalWages.subsidy}, name: '补助'},
                                    {value: ${personalWages.reissueWages}, name: '补发工资'}
                                ]
                            </c:otherwise>
                        </c:choose>

                    }
                ]
            };
            myChart1.setOption(option, true);
            window.addEventListener("resize", function () {
                myChart1.resize();
            });
        </script>

    </li>

</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/jquery.min.js"></script>
<script type="text/javascript" src="../../../../static/js/common.js"></script>
<script type="text/javascript" src="../../../../static/js/skin.js"></script>
<script type="text/javascript" src="../../../../static/js/calendar.js"></script>
<script>
    $(function () {
        document.getElementById('chart_box').setAttribute('class', 'fixed');
    });
</script>
</html>
