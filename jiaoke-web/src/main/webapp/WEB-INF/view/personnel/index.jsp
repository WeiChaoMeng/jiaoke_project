<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人事管理</title>
    <link rel="stylesheet" type="text/css" href="../../../static/css/personnel/personnelCommon.css">
    <script src="../../../static/js/echarts/echarts.js"></script>
</head>
<body>
<div class="index-margin-style">
    <div class="index-page-title-style">
        <div class="index-page-top-left">
            <div class="basic-column-all">
                <span>在职<h2>${map.totalNumber}</h2>人</span>
            </div>

            <div class="basic-column-formal">
                <span>自有职工<h2>${map.ownEmployees}</h2>人</span>
            </div>

            <div class="basic-column-outsource">
                <span>外包职工<h2>${map.outsourcingWorkers}</h2>人</span>
            </div>
        </div>

        <div class="index-page-top-right">
            <div class="basic-right-1">
                <span>即将转正<h2>2</h2>人</span>
            </div>

            <div class="basic-right-2">
                <span>待离职<h2>1</h2>人</span>
            </div>

            <div class="basic-right-3">
                <span>即将到期合同<h2>5</h2>人</span>
            </div>
        </div>
    </div>

    <div class="chart-margin-style">

        <div class="chart-top-margin">

            <div class="chart-inner-margin-4">
                <div class="chart-content">
                    <div class="chart-content-title">职务等级划分</div>

                    <div class="chart-content-entity">
                        <div class="chart-content-entity-size" id="basic"></div>
                    </div>
                </div>
            </div>

            <div class="chart-inner-margin-4">
                <div class="chart-content">
                    <div class="chart-content-title">人才信息</div>

                    <div class="chart-content-entity">
                        <div class="chart-content-entity-size" id="talent"></div>
                    </div>
                </div>
            </div>

            <div class="chart-inner-margin-4">
                <div class="chart-content">
                    <div class="chart-content-title">技术等级划分</div>

                    <div class="chart-content-entity">
                        <div class="chart-content-entity-size" id="jobTitle"></div>
                    </div>
                </div>
            </div>

            <div class="chart-inner-margin-4">
                <div class="chart-content">
                    <div class="chart-content-title">年龄划分</div>

                    <div class="chart-content-entity">
                        <div class="chart-content-entity-size" id="age"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="chart-margin-style">

        <div class="chart-top-margin">

            <div class="chart-inner-margin-3">
                <div class="chart-content">
                    <div class="chart-content-title">职称划分</div>

                    <div class="chart-content-entity">
                        <div class="chart-content-entity-size" id="credentials"></div>
                    </div>
                </div>
            </div>

            <div class="chart-inner-margin-3">
                <div class="chart-content">
                    <div class="chart-content-title">性别划分</div>

                    <div class="chart-content-entity">
                        <div class="chart-content-entity-size" id="sex"></div>
                    </div>
                </div>
            </div>

            <div class="chart-inner-margin-3">
                <div class="chart-content">
                    <div class="chart-content-title">户口性质划分</div>

                    <div class="chart-content-entity">
                        <div class="chart-content-entity-size" id="account"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="../../../static/js/jquery.min.js" type="text/javascript"></script>
<script src="../../../static/js/oa/layer/layer.js"></script>
<script>
    var myBasic = echarts.init(document.getElementById('basic'));
    var myTalent = echarts.init(document.getElementById('talent'));
    var myJobTitle = echarts.init(document.getElementById('jobTitle'));
    var myCredentials = echarts.init(document.getElementById('credentials'));
    var mySex = echarts.init(document.getElementById('sex'));
    var myAccount = echarts.init(document.getElementById('account'));
    var myAge = echarts.init(document.getElementById('age'));

    // 职务等级划分
    var option = {
        title: {
            text: '职务等级划分',
            x: 'center',
            textStyle: {
                fontWeight: 500,
                fontSize: 14
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: "{b}: ({d}%)<br/> {c}人"
        },
        series: [
            {
                name: '职务等级划分',
                type: 'pie',
                radius: '55%',
                center: ['50%', '55%'],
                data: [
                    {value: ${map.job0} + 0, name: '领导班子'},
                    {value: ${map.job1} + 0, name: '中层管理人员'},
                    {value: ${map.job2} + 0, name: '一般管理人员'},
                    {value: ${map.job3} + 0, name: '一线生产工人'},
                    {value: ${map.job4} + 0, name: '其它'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    //人才信息划分
    var option1 = {
        title: {
            text: '人才信息',
            x: 'center',
            textStyle: {
                fontWeight: 500,
                fontSize: 14
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: "{b}: ({d}%)<br/> {c}人"
        },
        series: [
            {
                name: '人才信息',
                type: 'pie',
                radius: '55%',
                center: ['50%', '55%'],
                data: [
                    {value: ${map.education0} + 0, name: '初中及以下'},
                    {value: ${map.education1} + 0, name: '高中'},
                    {value: ${map.education2} + 0, name: '技校'},
                    {value: ${map.education3} + 0, name: '中专'},
                    {value: ${map.education4} + 0, name: '专科'},
                    {value: ${map.education5} + 0, name: '本科'},
                    {value: ${map.education6} + 0, name: '硕士'},
                    {value: ${map.education7} + 0, name: '博士'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    //技术等级划分
    var option2 = {
        title: {
            text: '技术等级划分',
            x: 'center',
            textStyle: {
                fontWeight: 500,
                fontSize: 14
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: "{b}: ({d}%)<br/> {c}人"
        },
        series: [
            {
                name: '技术等级划分',
                type: 'pie',
                radius: '55%',
                center: ['50%', '55%'],
                data: [
                    {value: ${map.technology0} + 0, name: '未取证'},
                    {value: ${map.technology1} + 0, name: '初级'},
                    {value: ${map.technology2} + 0, name: '中级'},
                    {value: ${map.technology3} + 0, name: '高级'},
                    {value: ${map.technology4} + 0, name: '技师'},
                    {value: ${map.technology5} + 0, name: '高级技师'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    //年龄划分
    var option5 = {
        title: {
            text: '年龄划分',
            x: 'center',
            textStyle: {
                fontWeight: 500,
                fontSize: 14
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: "{b}: ({d}%)<br/> {c}人"
        },
        series: [
            {
                name: '年龄划分',
                type: 'pie',
                radius: '55%',
                center: ['50%', '55%'],
                data: [ //年龄段：35（含）以下，36-45（含），46-55(含)，56以上
                    {value: ${map.age0}, name: '35(含)以下'},
                    {value: ${map.age1} + 0, name: '36-45(含)'},
                    {value: ${map.age2} + 0, name: '46-55(含)'},
                    {value: ${map.age3} + 0, name: '56(含)以上'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    //职称划分
    var option3 = {
        title: {
            text: '职称划分',
            x: 'center',
            textStyle: {
                fontWeight: 500,
                fontSize: 14
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: "{b}: ({d}%)<br/> {c}人"
        },
        series: [
            {
                name: '职称划分',
                type: 'pie',
                radius: '55%',
                center: ['50%', '55%'],
                data: [
                    {value: ${map.title0} + 0, name: '未取得职称'},
                    {value: ${map.title1} + 0, name: '员级'},
                    {value: ${map.title2} + 0, name: '助理'},
                    {value: ${map.title3} + 0, name: '中级'},
                    {value: ${map.title4} + 0, name: '副高级'},
                    {value: ${map.title5} + 0, name: '正高级'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    // 性别分析图
    var sexOption = {
        title: {
            text: '性别划分',
            x: 'center',
            textStyle: {
                fontWeight: 500,
                fontSize: 14
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: "{b}: ({d}%)<br/> {c}人"
        },
        series: [
            {
                name: '性别划分',
                type: 'pie',
                radius: '55%',
                center: ['50%', '55%'],
                data: [
                    {value: ${map.man}, name: '男'},
                    {value: ${map.woman}, name: '女'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    },
                    normal:{
                        color:function(params) {
                            //自定义颜色
                            var colorList = [
                                '#03A9F4', '#E91E63',
                            ];
                            return colorList[params.dataIndex]
                        }
                    }
                }
            }
        ]
    };

    // 户口性质划分
    var option4 = {
        title: {
            text: '户口性质划分',
            x: 'center',
            textStyle: {
                fontWeight: 500,
                fontSize: 14
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: "{b}: ({d}%)<br/> {c}人"
        },
        series: [
            {
                name: '户口性质划分',
                type: 'pie',
                radius: '55%',
                center: ['50%', '55%'],
                data: [//0.本埠城镇，1.本埠农村，2.外埠城镇，3.外埠农村
                    {value: ${map.account0} + 0, name: '本埠城镇'},
                    {value: ${map.account1} + 0, name: '本埠农村'},
                    {value: ${map.account2} + 0, name: '外埠城镇'},
                    {value: ${map.account3} + 0, name: '外埠农村'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myBasic.setOption(option);
    myTalent.setOption(option1);
    myJobTitle.setOption(option2);
    myCredentials.setOption(option3);
    mySex.setOption(sexOption);
    myAccount.setOption(option4);
    myAge.setOption(option5);
    window.onresize = function () {
        myBasic.resize();
        myTalent.resize();
        myJobTitle.resize();
        myCredentials.resize();
        mySex.resize();
        myAccount.resize();
        myAge.resize();
    };
</script>
</html>
