
(function () {
    //左上雷达图
    //var radarechart = echarts.init(document.getElementById('radar_echart'));
    //停车位数量及占比
    //var bar_l_echart = echarts.init(document.getElementById('bar_l_echart'));
    //停车场数量及占比
    // var pie_l_echart = echarts.init(document.getElementById('pie_l_echart'));
    //设备数量
    //中间地图
    var map_c_echart = echarts.init(document.getElementById('map_c_echart'));
    var qlztzsEchart = echarts.init(document.getElementById('container-speed'));
    var qlztzsEchart1 = echarts.init(document.getElementById('container-rpm'));
    //var ldwhlEchart = echarts.init(document.getElementById('ldlxtj'));
    //右上线上线下排行榜图
    // var bar_r_echart = echarts.init(document.getElementById('bar_r_echart'));
    //车位配比
    //var line_r_echart = echarts.init(document.getElementById('line_r_echart'));
    //定义某个地市要显示的区县
    var displayCountry = [];
    //赤峰的省市区县
    var RKvalue_chifeng = [
        {
            name:'红山区',
            value:'123'

        },
        {
            name:'松山区',
            value:456
        },
        {
            name:'元宝山区',
            value:678
        },
        {
            name:'阿鲁科尔沁旗',
            value:0
        },
        {
            name:'巴林左旗',
            value:0
        },
        {
            name:'巴林右旗',
            value:0
        },
        {
            name:'林西县',
            value:0
        },
        {
            name:'克什克腾旗',
            value:0
        },
        {
            name:'翁牛特旗',
            value:0
        },
        {
            name:'喀喇沁旗',
            value:0
        },
        {
            name:'宁城县',
            value:0
        },
        {
            name:'敖汉旗',
            value:0
        }
    ];
    var RKvalue_chifeng = [
        {
            name:'红山区',
            value:103

        },
        {
            name:'松山区',
            value:103

        },
        {
            name:'元宝山区',
            value:10

        },
        {
            name:'阿鲁科尔沁旗',
            value:10

        },
        {
            name:'巴林左旗',
            value:103

        },
        {
            name:'巴林右旗',
            value:103

        },
        {
            name:'林西县',
            value:103

        },
        {
            name:'克什克腾旗',
            value:103

        },
        {
            name:'翁牛特旗',
            value:103

        },
        {
            name:'喀喇沁旗',
            value:103

        },
        {
            name:'宁城县',
            value:103

        },
        {
            name:'敖汉旗',
            value:103

        }
    ];
    var RKvalue_chifeng1 = [
        {
            name:'红山区',
            value:32

        },
        {
            name:'松山区',
            value:312
        },
        {
            name:'元宝山区',
            value:32
        },
        {
            name:'阿鲁科尔沁旗',
            value:422
        },
        {
            name:'巴林左旗',
            value:232
        },
        {
            name:'巴林右旗',
            value:322
        },
        {
            name:'林西县',
            value:132
        },
        {
            name:'克什克腾旗',
            value:32
        },
        {
            name:'翁牛特旗',
            value:29
        },
        {
            name:'喀喇沁旗',
            value:33
        },
        {
            name:'宁城县',
            value:34
        },
        {
            name:'敖汉旗',
            value:132
        }
    ];
    var RKvalue_chifeng2 = [
        {
            name:'红山区',
            value:18

        },
        {
            name:'松山区',
            value:24
        },
        {
            name:'元宝山区',
            value:12
        },
        {
            name:'阿鲁科尔沁旗',
            value:32
        },
        {
            name:'巴林左旗',
            value:18
        },
        {
            name:'巴林右旗',
            value:66
        },
        {
            name:'林西县',
            value:78
        },
        {
            name:'克什克腾旗',
            value:28
        },
        {
            name:'翁牛特旗',
            value:48
        },
        {
            name:'喀喇沁旗',
            value:38
        },
        {
            name:'宁城县',
            value:118
        },
        {
            name:'敖汉旗',
            value:128
        }
    ];
    var RKvalue_chifeng3 = [
        {
            name:'红山区',
            value:'3200'

        },
        {
            name:'松山区',
            value:'323'
        },
        {
            name:'元宝山区',
            value:'234'
        },
        {
            name:'阿鲁科尔沁旗',
            value:'128'
        },
        {
            name:'巴林左旗',
            value:'300'
        },
        {
            name:'巴林右旗',
            value:'639'
        },
        {
            name:'林西县',
            value:'231'
        },
        {
            name:'克什克腾旗',
            value:'320'
        },
        {
            name:'翁牛特旗',
            value:'780'
        },
        {
            name:'喀喇沁旗',
            value:'156'
        },
        {
            name:'宁城县',
            value:'380'
        },
        {
            name:'敖汉旗',
            value:'30'
        }
    ];
    function ChiFengMapSeries(name,dataValue){
        var obj = {
            // center:[118.361313,42.27018],//中心点
            // zoom:1.5,//当前视角的缩放比例。
            // roam:'scale',//是否支持鼠标缩放
            //selectedMode:true,//选中模式，表示是否支持多个选中，默认关闭
            name:name,
            type:'map',
            map:'chifeng',

            // markPoint:{
            //     symbol:'circle'
            // },
            label: {
                normal: {
                    show: true
                },
                emphasis: {
                    show: true
                }
            },
            mapLocation:{
                y:60
            },
            itemStyle: {
                normal: {
                    borderWidth: 1,
                    borderColor: 'rgba(147,191,245,.3)',

                    label: {
                        show: false,
                        textStyle: {
                            color: "#fff"
                        }
                    }
                },
                emphasis:{
                    areaColor: '#fff',
                    label: {
                        show: false,
                        textStyle: {
                            color: "#00a2ff"
                        }
                    }
                }
            },
            markPoint:{
                symbol:'image://./../img/cf_map_icon.png',
                silent:true,
                symbolSize:[17, 17],
                data: [

                    {
                        name: '',
                        coord: [118.973508,42.147919]
                    },
                    {
                        name: '',
                        coord: [118.528685,42.498721]
                    },
                    {
                        name: '',
                        coord: [117.337082,42.934712]
                    },
                    {
                        name: '',
                        coord: [120.016476,42.428608]
                    },
                    {
                        name: '',
                        coord: [119.294298,42.159577]
                    },
                    {
                        name: '',
                        coord: [118.390652,41.816981]
                    },
                    {
                        name: '',
                        coord: [119.026903,42.764439]
                    },
                    {
                        name: '',
                        coord: [118.662191,43.951086]
                    },
                    {
                        name: '',
                        coord: [118.730749,41.616497]
                    },
                    {
                        name: '',
                        coord: [118.053212,43.750996]
                    },
                    {
                        name: '',
                        coord: [119.393627,44.411986]
                    },
                    {
                        name: '',
                        coord: [120.070303,44.345238]
                    },
                ],
                label:{
                    normal:{
                        show:false
                    },
                    emphasis:{
                        show:false
                    }

                }
            },

            data:dataValue
        };
        return obj;

    };

    var map_c_option = {
        tooltip: {
            trigger: 'item',
            formatter: function(params) {
                var res = params.name+'<br/>';
                var myseries = map_c_option.series;
                for (var i = 0; i < myseries.length; i++) {
                    res+= myseries[i].name;
                    for(var j=0;j<myseries[i].data.length;j++){
                        if(myseries[i].data[j].name==params.name){
                            res+= ' : '+ myseries[i].data[j].value+'<br/>';
                        }
                    }
                }
                return res;
            }
        },

        // dataRange:{
        //     show:false,
        // },
        visualMap: {
            show: false,
            min: 1,
            max: 10000,
            itemWidth: 0,//图形的宽度，即长条的宽度
            itemHeight: 90,//图形的高度，即长条的高度
            left: 5,
            bottom: 0,
            //text: ['High', 'Low'],
            realtime: false,//拖拽时，是否实时更新
            calculable: false,//是否显示拖拽用的手柄
            inRange: {
                color: ['rgba(29,71,193,.3)', 'rgba(33,77,203,.7)','rgba(29,71,193,.2)','rgba(33,77,203,.6)']
            }
        },
        series:[
            //前三项位置固定，后面的动态添加
            new ChiFengMapSeries("桥梁传感器",RKvalue_chifeng),
            new ChiFengMapSeries("泵站设备",RKvalue_chifeng1),
            new ChiFengMapSeries("视频设备",RKvalue_chifeng2)
            //new ChiFengMapSeries("绿化",RKvalue_chifeng3)
            /*new ChiFengMapSeries("地磁数")*/
        ]
    };

    var fun = {
        init:function () {

            $('#line_r_echart').highcharts({
                chart: {
                    zoomType: 'xy',
                    type:'column',
                    options3d: {
                        enabled: false,
                        alpha: 15,
                        beta: 15,
                        depth: 50,
                        viewDistance: 25
                    }, backgroundColor: 'rgba(0,0,0,0)'
                },
                title: {
                    text: ''
                }, credits:{
                    enabled:false // 禁用版权信息
                },
                xAxis: [{
                    categories: ['红山区', '松山区', '元宝山区', '其他区'],
                    crosshair: true
                }],
                yAxis: [{ // Primary yAxis
                    labels: {
                        format: '{value}km',
                        style: {
                            color: Highcharts.getOptions().colors[2]
                        }
                    },
                    title: {
                        text: '里程',
                        style: {
                            color: Highcharts.getOptions().colors[2]
                        }
                    },
                    opposite: true
                }, { // Secondary yAxis
                    gridLineWidth: 0,
                    title: {
                        text: '桥梁数',
                        style: {
                            color: Highcharts.getOptions().colors[0]
                        }
                    },
                    labels: {
                        format: '{value} 座',
                        style: {
                            color: Highcharts.getOptions().colors[0]
                        }
                    }
                }],
                tooltip: {
                    shared: true
                },colors:['#72ab12','#dc380e','#ff8c01','#3a85be','#fe8c00'],
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    x: 0,
                    verticalAlign: 'top',
                    y: 10,
                    floating: true,
                    backgroundColor: 'rgba(0,0,0,0)',
                    symbolWidth:8,
                    symbolRadius:4,
                    symbolPadding:2,
                    symbolHeight:8,
                    itemStyle:
                    { fontWeight: "normal",
                        color:"#fff",
                        fontSize:"12px",
                        height:"12px"
                    },
                    itemHoverStyle: { color: '#fff' }
                },
                series: [{
                    name: '里程',
                    type: 'column',
                    yAxis: 0,
                    data: [1416.9, 1016,1015, 7129.2],
                    tooltip: {
                        valueSuffix: 'km'
                    }
                }, {
                    name: '桥梁数',
                    type: 'column',
                    yAxis: 1,
                    data: [35, 55, 26,200],
                    marker: {
                        enabled: false
                    },
                    dashStyle: 'shortdot',
                    tooltip: {
                        valueSuffix: '座'
                    }
                }]
            });
            //泵站抽水量与降水量趋势
            $('#ldwhl').highcharts({
                chart: {
                    type: 'spline',backgroundColor: 'rgba(0,0,0,0)'
                }, credits:{
                    enabled:false // 禁用版权信息
                },colors:['#72ab12','#dc380e','#ff8c01','#3a85be','#fe8c00'],
                title: {
                    text: ''
                },
                xAxis: {
                    type: 'datetime',
                    labels: {
                        overflow: 'justify'
                    },crosshair: true, labels: {
                        style: {
                            color: 'white'
                        }
                    },title: {
                        text: '',
                        style: {
                            color: 'white'
                        }
                    }
                },
                yAxis: {
                    min: 0,
                    minorGridLineWidth: 0,
                    gridLineWidth: 0,crosshair: true, labels: {
                        style: {
                            color: 'white'
                        }
                    },title: {
                        text: '流量 (㎥/s)',
                        style: {
                            color: 'white'
                        }
                    }
                },
                tooltip: {
                    valueSuffix: ' ㎥/s'
                },
                plotOptions: {
                    spline: {
                        lineWidth: 4,
                        states: {
                            hover: {
                                lineWidth: 5
                            }
                        },
                        marker: {
                            enabled: false
                        },
                        pointInterval: 3600000*24*20, // one hour
                        pointStart: Date.UTC(2015, 3, 3, 0, 0, 0)
                    }
                },
                series: [{
                    name: '降雨量',
                    data: [4.3, 5.1, 4.3, 5.2, 5.4, 4.7, 3.5, 4.1, 5.6, 7.4, 6.9, 7.1,
                        7.9, 7.9, 7.5, 6.7, 7.7, 7.7, 7.4, 7.0, 7.1, 5.8, 5.9, 7.4,
                        8.2, 8.5, 9.4, 8.1, 10.9, 10.4, 10.9, 12.4, 12.1, 9.5, 7.5,
                        7.1, 7.5, 8.1, 6.8, 3.4, 2.1, 1.9, 2.8, 2.9, 1.3, 4.4, 4.2,
                        3.0, 3.0]
                }, {
                    name: '排水量',
                    data: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.0, 0.3, 0.0,
                        0.0, 0.4, 0.0, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                        0.0, 0.6, 1.2, 1.7, 0.7, 2.9, 4.1, 2.6, 3.7, 3.9, 1.7, 2.3,
                        3.0, 3.3, 4.8, 5.0, 4.8, 5.0, 3.2, 2.0, 0.9, 0.4, 0.3, 0.5, 0.4]
                }],legend: {
                    layout: 'vertical',
                    align: 'right',
                    x: 10,
                    verticalAlign: 'top',
                    y: 10,
                    floating: true,
                    backgroundColor: 'rgba(0,0,0,0)',
                    symbolWidth:8,
                    symbolRadius:4,
                    symbolPadding:2,
                    symbolHeight:8,
                    itemStyle:
                    { fontWeight: "normal",
                        color:"#fff",
                        fontSize:"12px",
                        height:"12px"
                    },
                    itemHoverStyle: { color: '#fff' }
                },
                navigation: {
                    menuItemStyle: {
                        fontSize: '10px'
                    }
                }
            });
            //巡查管理统计图标
            $('#xctj').highcharts({
                chart: {
                    type: 'bar',
                    options3d: {
                        enabled: true,
                        alpha: 0,
                        beta: 0,
                        depth: 25,
                        viewDistance: 25
                    },backgroundColor: 'rgba(0,0,0,0)'
                },colors:['#72ab12','#dc380e','#ff8c01','#3a85be','#fe8c00'],
                title: {
                    text: ''
                },
                xAxis: {
                    categories: ['中兴智能', '万安科技', '宇视', '海康', '其他'],
                    crosshair: true, labels: {
                        style: {
                            color: 'white'
                        }
                    },title: {
                        text: '',
                        style: {
                            color: 'white'
                        }
                    }
                },
                yAxis: {
                    min: 0, crosshair: true, labels: {
                        style: {
                            color: 'white'
                        }
                    },title: {
                        text: '设备数量/台',
                        style: {
                            color: 'white'
                        }
                    },
                    labels: {
                        overflow: 'justify',color:'white'
                    }
                },
                tooltip: {
                    valueSuffix: ' 台'
                },
                plotOptions: {
                    bar: {
                        dataLabels: {
                            enabled: false,
                            allowOverlap: true
                        }
                    }
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    x: 0,
                    verticalAlign: 'top',
                    y: 50,
                    floating: true,
                    backgroundColor: 'rgba(0,0,0,0)',
                    symbolWidth:8,
                    symbolRadius:4,
                    symbolPadding:2,
                    symbolHeight:8,
                    itemStyle:
                    { fontWeight: "normal",
                        color:"#fff",
                        fontSize:"12px",
                        height:"12px"
                    },
                    itemHoverStyle: { color: '#fff' }
                },
                credits: {
                    enabled: false
                },
                series: [{
                    name: '红山区',
                    data: [107, 31, 635, 203, 231]
                }, {
                    name: '松山区',
                    data: [133, 156, 547, 408, 136]
                }, {
                    name: '元宝山区',
                    data: [973, 914, 454, 732, 334]
                }, {
                    name: '其他区',
                    data: [373, 314, 254, 432, 134]
                }]
            });
            //泵站抽水量与降水量趋势

            //中间地图
            map_c_echart.setOption(map_c_option,true);
            //currentIndex = -1;
            //var dataLen = map_c_option.series[0].data.length;
            // 取消之前高亮的图形
            //map_c_echart.dispatchAction({
            //    type: 'downplay',
            //    seriesIndex: 0,
            //    dataIndex: currentIndex
            //});
            //currentIndex = (currentIndex + 1) % dataLen;
            // 高亮当前图形
            //map_c_echart.dispatchAction({
            //    type: 'highlight',
            //    seriesIndex: 0,
            //    dataIndex:currentIndex
            //});
            // 显示 tooltip
            //map_c_echart.dispatchAction({
            //    type: 'showTip',
            //    seriesIndex: 0,
            //    dataIndex: currentIndex
            //});
            //桥梁状态指数

            var QLZTZSoption = {
                tooltip : {
                    formatter: "{a} <br/>{b} : {c}"
                },
                series: [
                    {
                        name: '设备在线率', splitNumber: 4,
                        type: 'gauge',
                        detail: {formatter:'{value}%'},  title : {
                        show : true,
                        offsetCenter: [0, '-120%'],       // x, y，单位px
                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            fontWeight: 'bolder' ,color:'white'
                        }
                    },
                        data: [{value: 90, name: '视频设备'}],       // 分割段数，默认为5
                        axisLine: {            // 坐标轴线
                            lineStyle: {       // 属性lineStyle控制线条样式
                                color: [[0.2, 'red'],[0.8, '#48b'],[1, 'green']],
                                width: 2
                            }
                        }
                    }
                ]
            };
            var QLZTZSoption1 =  {
                tooltip : {
                    formatter: "{a} <br/>{b} : {c}"
                }, splitNumber: 10,  title : {
                    show : true,
                    offsetCenter: [0, '-120%']        // x, y，单位px
                },
                series: [
                    {
                        name: '设备在线率', splitNumber: 4,
                        type: 'gauge',
                        detail: {formatter:'{value}%'},  title : {
                        show : true,
                        offsetCenter: [0, '-120%'],       // x, y，单位px
                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            fontWeight: 'bolder' ,color:'white'
                        }
                    },
                        data: [{value: 60, name: '泵站设备'}],       // 分割段数，默认为5
                        axisLine: {            // 坐标轴线
                            lineStyle: {       // 属性lineStyle控制线条样式
                                color: [[0.2, 'red'],[0.8, '#48b'],[1, 'green']],
                                width: 2
                            }
                        }
                    }
                ]
            };
            ////绿化率统计
            //$('#ldwhl').highcharts({
            //    chart: {
            //        type: 'area',backgroundColor: 'rgba(0,0,0,0)'
            //    }, credits:{
            //        enabled:false // 禁用版权信息
            //    },
            //    title: {
            //        text: ''
            //    },colors:['rgba(0,204,255,0.8)','rgba(8,220,128,0.8)','rgba(250,5,218,0.8)','rgba(255,204,0,0.8)'],
            //    xAxis: {
            //        allowDecimals: false,
            //        labels: {
            //            formatter: function () {
            //                return this.value; // clean, unformatted number for year
            //            }
            //        },title: {
            //            text: '',
            //            style: {
            //                color: 'white'
            //            }
            //        }
            //    },
            //    yAxis: {
            //        title: {
            //            text: ''
            //        },
            //        labels: {
            //            formatter: function () {
            //                return this.value  + 'k平米';
            //            }
            //        }
            //    },
            //    tooltip: {
            //        pointFormat: '{series.name} <b>{point.y}</b>k平米'
            //    },
            //    plotOptions: {
            //        area: {
            //            pointStart: 2010,
            //            marker: {
            //                enabled: false,
            //                symbol: 'circle',
            //                radius: 3,
            //                states: {
            //                    hover: {
            //                        enabled: true
            //                    }
            //                }
            //            }
            //        }
            //    },
            //    series: [{
            //        name: '草坪',
            //        data: [ 36, 131, 32, 110, 235, 369]
            //    }, {
            //        name: '灌木',
            //        data: [55, 125, 50, 120, 150, 200]
            //    }, {
            //        name: '绿篱色带',
            //        data: [25, 75, 50, 120, 150, 160]
            //    }]
            //});
            qlztzsEchart.setOption(QLZTZSoption);
            qlztzsEchart1.setOption(QLZTZSoption1);
            //自适应ldwhlEchart

            //停车位占比
            $('#radar_echart').highcharts({
                chart: {
                    type: 'column',
                    options3d: {
                        enabled: true,
                        alpha: 0,
                        beta: 0,
                        depth: 25,
                        viewDistance: 25
                    },backgroundColor: 'rgba(0,0,0,0)'
                }, credits:{
                    enabled:false // 禁用版权信息
                },
                title: {
                    text: ' '
                }, legend: {
                    layout: 'vertical',
                    align: 'right',
                    x: 0,
                    verticalAlign: 'top',
                    y: 10,
                    floating: true,
                    backgroundColor: 'rgba(0,0,0,0)',
                    symbolWidth:8,
                    symbolRadius:4,
                    symbolPadding:2,
                    symbolHeight:8,
                    itemStyle:
                    { fontWeight: "normal",
                        color:"#fff",
                        fontSize:"12px",
                        height:"12px"
                    },
                    itemHoverStyle: { color: '#fff' }
                },
                yAxis: {
                    allowDecimals: false,
                    min: 0,max:250,
                    title: {
                        text: ''
                    },labels: {
                        style: {
                            color: 'white'
                        }
                    }
                },xAxis: {
                    categories: ['红山区', '松山区', '元宝山区'],labels: {
                        style: {
                            color: 'white'
                        }
                    }
                },
                plotOptions: {
                    column: {
                        depth: 25
                    }
                },
                series: [{
                    name:'视频数量',
                    data: [229, 115, 96],color:'#72ab12'
                },{
                    name:'泵站数量',
                    data: [11, 15, 23],color:'#dc380e'
                }]//,colors:['#72ab12','#dc380e','#ff8c01','#3a85be','#fe8c00']
            });
            window.onresize = function () {
                //radarechart.resize();
                // bar_l_echart.resize();
                // pie_l_echart.resize();
                // bar_c_echart.resize();
                map_c_echart.resize();
                //line_r_echart.resize();
            }
        }





    };
    //获取某个城市要显示的区县
    function getDisplayCountryByCity(){
        var req = {
            sysCode:sysComm.sysCode,
            cityId:sysComm.cityId
        };
        if(displayCountry.length>0){
            return displayCountry;
        }
    }
    var stompClient = null;
    getDisplayCountryByCity();
    fun.init();
})();