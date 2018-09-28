<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        <table class="simpletable" style="border: none">

            <thead>
            <th>员工编号</th>
            <th>部门</th>
            <th>姓名</th>
            <th>岗位</th>
            <th>岗位工资</th>
            <th>技术职称津贴</th>
            <th>特殊工种津贴</th>
            <th>补发工资</th>
            <th>奖金</th>
            <th>月奖</th>
            <th>补助</th>
            <th>高温津贴</th>
            <th>加班费</th>
            <th>应发工资</th>
            <th>养老险</th>
            <th>失业险</th>
            <th>医保</th>
            <th>大额</th>
            <th>公积金</th>
            <th>个人所得税</th>
            <th>会费</th>
            <th>实发金额</th>
            <th>操作</th>
            </thead>

            <tbody>

            <tr>
                <td>B801</td>
                <td>生产经营部</td>
                <td>张三</td>
                <td>施工管理</td>
                <td>10000</td>
                <td>1000</td>
                <td>600</td>
                <td>300</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td>800</td>
                <td>0</td>
                <td>12400</td>
                <td>992</td>
                <td>24.8</td>
                <td>248</td>
                <td>1488</td>
                <td>674.44</td>
                <td>172.76</td>
                <td>172.76</td>
                <td>8972.76</td>
                <td>删除</td>
            </tr>

            </tbody>
        </table>
    </div>
</div>

<!--外包职工-->
<div class="" style="margin-top: 50px">
    <div class="boxdown">

        <table class="simpletable" style="border: none;width: 1100px;">

            <thead>
            <th>员工编号</th>
            <th>部门</th>
            <th>姓名</th>
            <th>岗位</th>
            <th>岗位工资</th>
            <th>技术职称津贴</th>
            <th>特殊工种津贴</th>
            <th>补发工资</th>
            <th>月奖</th>
            <th>高温津贴</th>
            <th>超时服务费</th>
            <th>应发工资</th>
            <th>操作</th>
            </thead>

            <tbody>

            <tr class="even">
                <td>W601</td>
                <td>技术部</td>
                <td>李四</td>
                <td>仪器仪表</td>
                <td>8000</td>
                <td>300</td>
                <td>600</td>
                <td>100</td>
                <td>400</td>
                <td>200</td>
                <td>0</td>
                <td>9600</td>
                <td>删除</td>
            </tr>

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
                    data: ['基本工资', '出勤', '餐补', '加班费用', '交通补助','其他']
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
                                // shadowBlur:3,
                                // shadowOffsetX: 2,
                                // shadowOffsetY: 2,
                                // shadowColor: '#999',
                                // padding: [0, 7],

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

                        data: [
                            {value: 348, name: '基本工资'},
                            {value: 251, name: '出勤'},
                            {value: 147, name: '餐补'},
                            {value: 102, name: '加班费用'},
                            {value: 102, name: '交通补助'},
                            {value: 200, name: '其他'}
                        ]
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
        document.getElementById('chart_box').setAttribute('class','fixed');
    });
</script>
</html>
