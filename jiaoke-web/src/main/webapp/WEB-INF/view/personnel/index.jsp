<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2019-8-8
  Time: 10:25
  To change this template use File  sssssssC     | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人事管理</title>
    <link rel="stylesheet" type="text/css" href="../../../static/css/personnel/personnelCommon.css">
    <script src="../../../static/js/echarts/echarts.js"></script>
</head>
<body>
<div style="    padding: 15px;position: relative;">

    <div style="margin: -7.5px;">

        <div style="padding: 7.5px;width: 16.66%;float: left;position: relative;display: block;box-sizing: border-box;">
            <div style="border-radius: 2px;margin:0;box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .05);background: #efefef;">
                <div style="position: relative;padding: 10px 15px;line-height: 80px;text-align: center;">
                    <span>在职<h2 style="border: 0;padding: 0;display: inline-block;margin: 0 5px;color: #ffbc00;">85</h2>人</span>
                </div>
            </div>
        </div>

        <div style="padding: 7.5px;width: 16.66%;float: left;position: relative;display: block;box-sizing: border-box;">
            <div style="border-radius: 2px;margin:0;box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .05);background: #efefef;">
                <div style="position: relative;padding: 10px 15px;line-height: 80px;text-align: center;">
                    <span>正式<h2 style="border: 0;padding: 0;display: inline-block;margin: 0 5px;color: #ffbc00;">54</h2>人</span>
                </div>
            </div>
        </div>

        <div style="padding: 7.5px;width: 16.66%;float: left;position: relative;display: block;box-sizing: border-box;">
            <div style="border-radius: 2px;margin:0;box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .05);background: #efefef;">
                <div style="position: relative;padding: 10px 15px;line-height: 80px;text-align: center;">
                    <span>劳务<h2 style="border: 0;padding: 0;display: inline-block;margin: 0 5px;color: #ffbc00;">30</h2>人</span>
                </div>
            </div>
        </div>

        <div style="padding: 7.5px;width: 16.66%;float: left;position: relative;display: block;box-sizing: border-box;">
            <div style="border-radius: 2px;margin:0;box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .05);background: #efefef;">
                <div style="position: relative;padding: 10px 15px;line-height: 80px;text-align: center;">
                    <span>即将转正<h2
                            style="border: 0;padding: 0;display: inline-block;margin: 0 5px;color: #ffbc00;">1</h2>人</span>
                </div>
            </div>
        </div>

        <div style="padding: 7.5px;width: 16.66%;float: left;position: relative;display: block;box-sizing: border-box;">
            <div style="border-radius: 2px;margin:0;box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .05);background: #efefef;">
                <div style="position: relative;padding: 10px 15px;line-height: 80px;text-align: center;">
                    <span>待离职<h2 style="border: 0;padding: 0;display: inline-block;margin: 0 5px;color: #ffbc00;">1</h2>人</span>
                </div>
            </div>
        </div>

        <div style="padding: 7.5px;width: 16.66%;float: left;position: relative;display: block;box-sizing: border-box;">
            <div style="border-radius: 2px;margin:0;box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .05);background: #efefef;">
                <div style="position: relative;padding: 10px 15px;line-height: 80px;text-align: center;">
                    <span>即将到期合同<h2
                            style="border: 0;padding: 0;display: inline-block;margin: 0 5px;color: #ffbc00;">1</h2>人</span>
                </div>
            </div>
        </div>

        <div style="padding: 7.5px;width: 100%;float: left;position: relative;display: block;box-sizing: border-box;">

            <div style="margin: -7.5px;">

                <div style="padding: 7.5px;width: 25%;float: left;position: relative;display: block;box-sizing: border-box;">
                    <div style="border-radius: 2px;background-color:#efefef;box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .05);">
                        <div style="position: relative;height: 42px;line-height: 42px;padding: 0 15px;border-bottom: 1px solid #f6f6f6;color: #333;border-radius: 2px 2px 0 0;font-size: 14px;">
                            人员基本信息
                        </div>

                        <div style="height: 300px;-webkit-tap-highlight-color: transparent;user-select: none;position: relative;background: rgb(255, 255, 255);padding: 10px 15px;line-height: 24px;">
                            <div id="basic" style="width: 100%;height: 100%"></div>
                        </div>
                    </div>
                </div>

                <div style="padding: 7.5px;width: 25%;float: left;position: relative;display: block;box-sizing: border-box;">
                    <div style="border-radius: 2px;background-color: #efefef;box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .05);">
                        <div style="position: relative;height: 42px;line-height: 42px;padding: 0 15px;border-bottom: 1px solid #f6f6f6;color: #333;border-radius: 2px 2px 0 0;font-size: 14px;">
                            人才信息
                        </div>

                        <div style="height: 300px;-webkit-tap-highlight-color: transparent;user-select: none;position: relative;background: rgb(255, 255, 255);padding: 10px 15px;line-height: 24px;">
                            <div id="talent" style="width: 100%;height: 100%"></div>
                        </div>
                    </div>
                </div>

                <div style="padding: 7.5px;width: 25%;float: left;position: relative;display: block;box-sizing: border-box;">
                    <div style="border-radius: 2px;background-color: #efefef;box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .05);">
                        <div style="position: relative;height: 42px;line-height: 42px;padding: 0 15px;border-bottom: 1px solid #f6f6f6;color: #333;border-radius: 2px 2px 0 0;font-size: 14px;">
                            职称情况
                        </div>

                        <div style="height: 300px;-webkit-tap-highlight-color: transparent;user-select: none;position: relative;background: rgb(255, 255, 255);padding: 10px 15px;line-height: 24px;">
                            <div id="jobTitle" style="width: 100%;height: 100%"></div>
                        </div>
                    </div>
                </div>

                <div style="padding: 7.5px;width: 25%;float: left;position: relative;display: block;box-sizing: border-box;">
                    <div style="border-radius: 2px;background-color: #efefef;box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .05);">
                        <div style="position: relative;height: 42px;line-height: 42px;padding: 0 15px;border-bottom: 1px solid #f6f6f6;color: #333;border-radius: 2px 2px 0 0;font-size: 14px;">
                            持证情况
                        </div>

                        <div style="height: 300px;-webkit-tap-highlight-color: transparent;user-select: none;position: relative;background: rgb(255, 255, 255);padding: 10px 15px;line-height: 24px;">
                            <div id="credentials" style="width: 100%;height: 100%"></div>
                        </div>
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

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '人员基本信息',
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{b}: ({d}%)<br/> {c}人"
        },
        color: ['#91c7ae', '#21aff3'],
        series: [
            {
                name: '人员基本信息',
                type: 'pie',
                radius: '55%',
                center: ['50%', '60%'],
                data: [
                    {value: 55, name: '正式'},
                    {value: 30, name: '劳务'}
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

    var option1 = {
        title: {
            text: '人才信息',
            x: 'center'
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
                center: ['50%', '60%'],
                data: [
                    {value: 2, name: '高中'},
                    {value: 4, name: '大专'},
                    {value: 49, name: '本科'},
                    {value: 22, name: '研究生'},
                    {value: 5, name: '硕士'},
                    {value: 3, name: '博士'}
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

    var option2 = {
        title: {
            text: '职称情况',
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{b}: ({d}%)<br/> {c}人"
        },
        series: [
            {
                name: '职称情况',
                type: 'pie',
                radius: '55%',
                center: ['50%', '60%'],
                data: [
                    {value: 5, name: '初级'},
                    {value: 35, name: '中级'},
                    {value: 45, name: '高级'}
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

    var option3 = {
        title: {
            text: '持证情况',
            x: 'center'
        },
        color: ['#3398DB'],
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            },
            formatter: "{b}: {c}人"
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                data: ['证书1', '证书2', '证书3', '证书4', '证书5', '证书6'],
                axisTick: {
                    alignWithLabel: true
                }
            }
        ],
        yAxis: [
            {
                type: 'value'
            }
        ],
        series: [
            {
                name: '持证情况',
                type: 'bar',
                barWidth: '60%',
                data: [10, 52, 41, 65, 33, 22]
            },
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myBasic.setOption(option);
    myTalent.setOption(option1);
    myJobTitle.setOption(option2);
    myCredentials.setOption(option3);
    window.onresize = function () {
        myBasic.resize();
        myTalent.resize();
        myJobTitle.resize();
        myCredentials.resize();
    };
</script>
</html>
