
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
//  var qlztzsEchart = echarts.init(document.getElementById('container-speed'));
//  var qlztzsEchart1 = echarts.init(document.getElementById('container-rpm'));
    var ldwhlEchart = echarts.init(document.getElementById('ldlxtj'));
        var ldgdztEchart = echarts.init(document.getElementById('ldgdzt'));
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
                //color: ['rgba(29,71,193,.3)', 'rgba(33,77,203,.7)','rgba(29,71,193,.2)','rgba(33,77,203,.6)']
                color:['#72ab12','#dc380e','#ff8c01','#3a85be']
            }
        },
        series:[
        	//前三项位置固定，后面的动态添加
            new ChiFengMapSeries("道路",RKvalue_chifeng),
            new ChiFengMapSeries("桥梁",RKvalue_chifeng1),
            new ChiFengMapSeries("设施",RKvalue_chifeng2),
            new ChiFengMapSeries("绿化",RKvalue_chifeng3)
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
                },
                colors:['rgba(0,204,255,0.8)','rgba(8,220,128,0.8)','rgba(250,5,218,0.8)','rgba(255,204,0,0.8)'],
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

            $('#xctj').highcharts({
                chart: {
                    type: 'column',
                    options3d: {
                        enabled: true,
                        alpha: 0,
                        beta: 0,
                        viewDistance: 25,
                        depth: 40, backgroundColor: 'rgba(0,0,0,0)'
                    },backgroundColor: 'rgba(0,0,0,0)'
                },title:'',
                credits:{
                    enabled:false // 禁用版权信息
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
                },xAxis: {
                    categories: ['参数1', '参数2', '参数3'],
                    labels: {
                        format: '{value} ',
                        style: {
                            color: 'white'
                        }
                    }
                },
                yAxis: {
                    allowDecimals: false,
                    min: 0,
                    title: {
                        text: ''
                    }, labels: {
                        format: '{value} ',
                        style: {
                            color: 'white'
                        }
                    }
                },
                tooltip: {
                    headerFormat: '<b>{point.key}</b><br>',
                    pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y}座'
                },
                plotOptions: {
                    column: {
                        stacking: 'normal',
                        depth: 70
                    }
                },
                series: [{
                    name: '参数1',
                    data: [5, 3, 4],
                    stack: 'male'
                }, {
                    name: '参数2',
                    data: [3, 4, 4],
                    stack: 'male'
                }, {
                    name: '参数3',
                    data: [2, 5, 6],
                    stack: 'male'
                }, {
                    name: '参数4',
                    data: [3, 1, 4],
                    stack: 'male'
                }]
            });
             $('#sssjtj').highcharts({
                chart: {
                    type: 'column',
                    options3d: {
                        enabled: true,
                        alpha: 0,
                        beta: 0,
                        viewDistance: 25,
                        depth: 40, backgroundColor: 'rgba(0,0,0,0)'
                    },backgroundColor: 'rgba(0,0,0,0)'
                },title:'',
                credits:{
                    enabled:false // 禁用版权信息
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
                },xAxis: {
                    categories: ['参数1', '参数2', '参数3'],
                    labels: {
                        format: '{value} ',
                        style: {
                            color: 'white'
                        }
                    }
                },
                yAxis: {
                    allowDecimals: false,
                    min: 0,
                    title: {
                        text: ''
                    }, labels: {
                        format: '{value} ',
                        style: {
                            color: 'white'
                        }
                    }
                },
                tooltip: {
                    headerFormat: '<b>{point.key}</b><br>',
                    pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y}座'
                },
                plotOptions: {
                    column: {
                        stacking: 'normal',
                        depth: 70
                    }
                },
                series: [{
                    name: '参数',
                    data: [12,14,13],
                    stack: 'male'
                }]
            });

             $('#ldwhl').highcharts({
                chart: {
                    type: 'column',
                    options3d: {
                        enabled: true,
                        alpha: 0,
                        beta: 0,
                        viewDistance: 25,
                        depth: 40, backgroundColor: 'rgba(0,0,0,0)'
                    },backgroundColor: 'rgba(0,0,0,0)'
                },title:'',
                credits:{
                    enabled:false // 禁用版权信息
                },colors:['#dc380e','#dc380e','#ff8c01','#3a85be','#fe8c00'],
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
                },xAxis: {
                    categories: ['参数1', '参数2', '参数3'],
                    labels: {
                        format: '{value} ',
                        style: {
                            color: 'white'
                        }
                    }
                },
                yAxis: {
                    allowDecimals: false,
                    min: 0,
                    title: {
                        text: ''
                    }, labels: {
                        format: '{value} ',
                        style: {
                            color: 'white'
                        }
                    }
                },
                tooltip: {
                    headerFormat: '<b>{point.key}</b><br>',
                    pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y}棵'
                },
                plotOptions: {
                    column: {
                        stacking: 'normal',
                        depth: 70
                    }
                },
                series: [{
                    name: '参数',
                    data: [12213,14314,11323],
                    stack: 'male'
                }]
            });
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
                       name: '状态指数', splitNumber: 4,
                       type: 'gauge',
                       detail: {formatter:'{value}'},  title : {
                       show : true,
                       offsetCenter: [0, '-120%'],       // x, y，单位px
                       textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                           fontWeight: 'bolder' ,color:'white'
                       }
                   },
                       data: [{value: 100, name: '松洲桥'}],       // 分割段数，默认为5
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
                },  title : {
                    show : true,
                    offsetCenter: [0, '-120%']        // x, y，单位px
                },
                series: [
                    {
                        name: '状态指数', splitNumber: 4,
                        type: 'gauge',
                        detail: {formatter:'{value}'},  title : {
                        show : true,
                        offsetCenter: [0, '-120%'],       // x, y，单位px
                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            fontWeight: 'bolder' ,color:'white'
                        }
                    },
                        data: [{value: 60, name: '昭乌达桥'}],       // 分割段数，默认为5
                        axisLine: {            // 坐标轴线
                            lineStyle: {       // 属性lineStyle控制线条样式
                                color: [[0.2, 'red'],[0.8, '#48b'],[1, 'green']],
                                width: 2
                            }
                        }
                    }
                ]
            };
//          //绿化率统计
//          $('#ldwhl').highcharts({
//              chart: {
//                  type: 'area',backgroundColor: 'rgba(0,0,0,0)'
//              }, max: 100, credits:{
//                  enabled:false // 禁用版权信息
//              },
//              title: {
//                  text: ''
//              },colors:['#72ab12','#dc380e','#3a85be','#fe8c00'],
//              xAxis: {
//                  allowDecimals: false,
//                  labels: {
//                      formatter: function () {
//                          return this.value; // clean, unformatted number for year
//                      }
//                  },title: {
//                      text: '',
//                      style: {
//                          color: 'white'
//                      }
//                  }
//              },
//              yAxis: {
//                  title: {
//                      text: ''
//                  },max:100,
//                  labels: {
//                      formatter: function () {
//                          return this.value  + '%';
//                      }
//                  }
//              },
//              tooltip: {
//                  pointFormat: '{series.name} <b>{point.y}</b>%'
//              },
//              plotOptions: {
//                  area: {
//                      pointStart: 2010,
//                      marker: {
//                          enabled: false,
//                          symbol: 'circle',
//                          radius: 3,
//                          states: {
//                              hover: {
//                                  enabled: true
//                              }
//                          }
//                      }
//                  }
//              },
//              series: [{
//                  name: '草坪',
//                  data: [ 36, 91, 32, 90, 35, 69]
//              }]
//          });
            var ldgdlxOption = {
                tooltip : {
                    trigger: 'axis'
                }
                ,
                legend: {
                    data:[
                        '参数1','参数2','参数3','参数4',
                    ],textStyle:{
                        color:'white'
                    }
                }
                ,
                grid: {y: 23, y2:50, x2:20},
                xAxis : [
                    {
                        type : 'category',
                        data : ['参数1','参数2','参数3'],
                        axisLabel: {
                        show: true,
                        textStyle: {
                            color: 'white'
                        }
                     }
                    },
                    {
                        type : 'category',
                        axisLine: {show:false},
                        axisTick: {show:false},
                        axisLabel: {show:false},
                        splitArea: {show:false},
                        splitLine: {show:false},
                        data : ['参数1','参数2','参数3']
                    }
                ],
                yAxis : [
                    {
                        type : 'value',
                        axisLabel:{formatter:'{value}盏',textStyle:{color:'white'}}
                    }
                ],
                series : [//colors:['#72ab12','#dc380e','#3a85be','#fe8c00'],
                    {
                        name:'参数1',
                        type:'bar',
                        itemStyle: {normal: {color:'#72ab12', label:{show:true}}},
                        data:[3340,2710,2788],barGap:'20%'
                    },
                    {
                        name:'参数2',
                        type:'bar',
                        itemStyle: {normal: {color:'#FE3F72', label:{show:true,textStyle:{color:'#27727B'}}}},
                        data:[1600,3120,2087],barGap:'20%'
                    },
                    {
                        name:'参数3',
                        type:'bar',
                        //xAxisIndex:1,
                        itemStyle: {normal: {color:'#dc380e', label:{show:true}}},
                        data:[1291,1035,1689],barGap:'20%'
                    },
                    {
                        name:'参数4',
                        type:'bar',
                       // xAxisIndex:1,
                        itemStyle: {normal: {color:'#fe8c00', label:{show:true,formatter:function(p){return p.value > 0 ? (p.value +'+'):'';}}}},
                        data:[7303,4030,4817],barGap:'20%'
                    }
                ]
            };
            ldgdztEchart.setOption(ldgdlxOption);
//          qlztzsEchart.setOption(QLZTZSoption);
//          qlztzsEchart1.setOption(QLZTZSoption1);
            //自适应ldwhlEchart
            var LDWHoption = {
                tooltip : {
                    trigger: 'axis'
                }
                ,
                legend: {
                    data:[
                        '参数1','参数2','参数3','参数4','其他'
                    ],textStyle:{
                        color:'white'
                    }
                }
                ,
                grid: {y: 23, y2:50, x2:20},
                xAxis : [
                    {
                        type : 'category',
                        data : ['参数1','参数2','参数3'],
                        axisLabel: {
                        show: true,
                        textStyle: {
                            color: 'white'
                        }
                     }
                    },
                    {
                        type : 'category',
                        axisLine: {show:false},
                        axisTick: {show:false},
                        axisLabel: {show:false},
                        splitArea: {show:false},
                        splitLine: {show:false},
                        data : ['参数1','参数2','参数3']
                    }
                ],
                yAxis : [
                    {
                        type : 'value',
                        axisLabel:{formatter:'{value}个',textStyle:{color:'white'}}
                    }
                ],
                series : [//colors:['#72ab12','#dc380e','#3a85be','#fe8c00'],
                    {
                        name:'参数1',
                        type:'bar',
                        itemStyle: {normal: {color:'#72ab12', label:{show:true}}},
                        data:[1340,1710,1788,1975],barGap:'20%'
                    },
                    {
                        name:'参数2',
                        type:'bar',
                        itemStyle: {normal: {color:'#FE3F72', label:{show:true,textStyle:{color:'#27727B'}}}},
                        data:[1600,1120,1087,1650],barGap:'20%'
                    },
                    {
                        name:'参数3',
                        type:'bar',
                        //xAxisIndex:1,
                        itemStyle: {normal: {color:'#dc380e', label:{show:true}}},
                        data:[1291,1035,1689,1000],barGap:'20%'
                    },
                    {
                        name:'参数4',
                        type:'bar',
                       // xAxisIndex:1,
                        itemStyle: {normal: {color:'#fe8c00', label:{show:true,formatter:function(p){return p.value > 0 ? (p.value +'+'):'';}}}},
                        data:[1303,1030,817,130],barGap:'20%'
                    },
                    {
                        name:'其他',
                        type:'bar',
                       // xAxisIndex:1,
                        itemStyle: {normal: {color:'#fe8c00', label:{show:true,formatter:function(p){return p.value > 0 ? (p.value +'+'):'';}}}},
                        data:[333,330,817,430],barGap:'20%'
                    }
                ]
            };
            ldwhlEchart.setOption(LDWHoption);

            //停车位占比
            $('#radar_echart').highcharts({
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45,beta:0
                    }, backgroundColor: 'rgba(0,0,0,0)'
                },
                title: {
                    text: ' '
                }, credits:{
                    enabled:false // 禁用版权信息
                },
                plotOptions: {
                    pie: {
                        innerSize: 100,
                        depth: 15, dataLabels: {
                            enabled: true,
                            format: '{point.name}: {point.y}公里',  
                            style: {
		                        color: 'white'
		                    }
                        }  
                    }
                },tooltip: {
                    pointFormat: '{series.name}: <b>{point.y}km</b>'
                },
                series: [{
                    name: '公路等级',
                    data: [
                        ['快速路', 18],
                        ['快速辅路', 5],
                        ['主干道', 120],
                        ['次干道', 30],
                        ['支路', 44]
                    ],colors:['#72ab12','#dc380e','#ff8c01','#3a85be','#fe8c00']
                }]
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