
(function () {
	//左上雷达图
    //var radarechart = echarts.init(document.getElementById('radar_echart'));
    //停车位数量及占比
    //var bar_l_echart = echarts.init(document.getElementById('bar_l_echart'));
    //停车场数量及占比
    // var pie_l_echart = echarts.init(document.getElementById('pie_l_echart'));
    //设备数量
    //中间地图
//  var map_c_echart = echarts.init(document.getElementById('map_c_echart'));
//  var qlztzsEchart = echarts.init(document.getElementById('container-speed'));
//  var qlztzsEchart1 = echarts.init(document.getElementById('container-rpm'));
//  var qlztzsEchart2 = echarts.init(document.getElementById('container-rpm1'));
//  var qlztzsEchart3 = echarts.init(document.getElementById('container-speed1'));
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
            new ChiFengMapSeries("热线反馈",RKvalue_chifeng),
            new ChiFengMapSeries("巡查车辆",RKvalue_chifeng1),
            new ChiFengMapSeries("应急处置",RKvalue_chifeng2),
            new ChiFengMapSeries("智能检测",RKvalue_chifeng3)
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
//      	//巡查管理统计图标
//          $('#xctj').highcharts({
//              chart: {
//                  type: 'bar',backgroundColor: 'rgba(0,0,0,0)'
//              },
//              title: {
//                  text: ''
//              }, credits:{
//                  enabled:false // 禁用版权信息
//              },
//              colors:['#72ab12','#dc380e','#ff8c01','#3a85be','#fe8c00'],
//              xAxis: [{
//                  categories: ['普通病害', '紧急24小时', '紧急48小时', '小修预养'],
//                  crosshair: true, labels: {
//                      style: {
//                          color: 'white'
//                      }
//                  },title: {
//                      text: '',
//                      style: {
//                          color: 'white'
//                      }
//                  }
//              }],
//              yAxis: [{
//                  min: 1,
//                  title: {
//                      text: ''
//                  },
//                  crosshair: true, labels: {
//                      style: {
//                          color: 'white'
//                      }
//                  },title: {
//                      text: '',
//                      style: {
//                          color: 'white'
//                      }
//                  }
//              }],
//              legend: {
//                  layout: 'vertical',
//                  align: 'right',
//                  x: 10,
//                  verticalAlign: 'top',
//                  y: 10,
//                  floating: true,
//                  backgroundColor: 'rgba(0,0,0,0)',
//                  symbolWidth:8,
//                  symbolRadius:4,
//                  symbolPadding:2,
//                  symbolHeight:8,
//                  itemStyle:
//                  { fontWeight: "normal",
//                      color:"#fff",
//                      fontSize:"12px",
//                      height:"12px"
//                  },
//                  itemHoverStyle: { color: '#fff' }
//              },
//              plotOptions: {
//                  series: {
//                      stacking: 'normal'
//                  }
//              },
//              series: [{
//                  name: '红山区',
//                  data: [5, 3, 4, 7]
//              }, {
//                  name: '松山区',
//                  data: [2, 2, 3, 2]
//              }, {
//                  name: '元宝山区',
//                  data: [3, 4, 4, 2]
//              }, {
//                  name: '其他区',
//                  data: [3, 4, 4, 2]
//              }]
//          });
 $('#xctj').highcharts({
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
                    x: -10,
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
                    min: 0,max:40,
                    title: {
                        text: ''
                    },labels: {
                        style: {
                            color: 'white'
                        }
                    }
                },xAxis: {
                    categories: ['参数1', '参数2', '参数3'],labels: {
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
                    name:'参数1',
                    data: [27, 37, 37],color:'#72ab12'
                },{
                    name:'参数2',
                    data: [27, 37, 29],color:'#dc380e'
                },{
                    name:'参数3',
                    data: [2, 3, 5],color:'#3a85be'
                }]//,colors:['#72ab12','#dc380e','#ff8c01','#3a85be','#fe8c00']
            });
            	//巡查管理统计图标
            $('#xccslc').highcharts({
                chart: {
                    zoomType: 'xy',
                    backgroundColor: 'rgba(0,0,0,0)'
                },
                credits:{
                    enabled:false // 禁用版权信息
                },
                title: {
                    text: ''
                },
                xAxis: [{
                    categories: ['参数1', '参数2', '参数3'],
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

                }],
                yAxis: [{ // Primary yAxis
                    labels: {
                        format: '{value}km',
                        style: {
                            color: 'white'
                        }
                    },
                    title: {
                        text: '巡查里程',
                        style: {
                            color: 'white'
                        }
                    }
                }, { // Secondary yAxis
                    title: {
                        text: '巡查人次',
                        style: {
                            color: Highcharts.getOptions().colors[0]
                        }
                    },
                    labels: {
                        format: '{value} ',
                        style: {
                            color: Highcharts.getOptions().colors[0]
                        }
                    },
                    opposite: true
                }],
                tooltip: {
                    shared: true
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    x: 0,
                    verticalAlign: 'top',
                    y: 0,
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
                    name: '巡查人次',
                    type: 'column',
                    yAxis: 1,
                    data: [ 71, 106, 129],color:'#ff8c01',
                    tooltip: {
                        valueSuffix: '人次'
                    }, style: {
                        //color: Highcharts.getOptions().colors[0]
                    }
                }, {
                    name: '里程',
                    type: 'spline',
                    data: [ 69, 95, 145],color:'#3a85be',
                    tooltip: {
                        valueSuffix: 'km'
                    }, style: {
                        color: 'rgba(8,220,128,0.8)'
                    }
                }]
            });
            //桥梁病害按类型统计
            $('#ldwhl').highcharts({
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
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
                        depth: 25,
                        dataLabels: {
		                    enabled: true,
		                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
		                    style: {
		                        color: 'white'
		                    }
               			 }
                    }
                },tooltip: {
                    pointFormat: '{series.name}: <b>{point.y}</b>'
                },
                series: [{
                    name: '参数',
                    data: [
                        ['中间结构', 1808],
                        ['上部结构', 1639],
                        ['下部结构', 1320]

                    ],colors:['#72ab12','#dc380e','#ff8c01','#3a85be','#fe8c00']
                }]
            });
            $('#sssjtj').highcharts({
                chart: {
                    type: 'column',backgroundColor: 'rgba(0,0,0,0)', options3d: {
                        enabled: true,
                        alpha: 10
                    }, backgroundColor: 'rgba(0,0,0,0)'
                }, credits:{
                    enabled:false // 禁用版权信息
                },
                title: {
                    text: ' '
                },
                xAxis: {
                    categories: [
                        '路面裂缝',
                        '路面龟裂',
                        '路面坑槽',
                        '路面沉陷'
                    ],
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
                    min: 0,max:1000,
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
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                }, legend: {
                    layout: 'vertical',
                    align: 'center',
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
                series: [{
                    name: '某区1',
                    data: [799, 915, 964, 992]
                }, {
                    name: '某区2',
                    data: [836, 788, 985, 934]
                }, {
                    name: '某区3',
                    data: [489, 388, 393, 414]
                }, {
                    name: '其他区',
                    data: [424, 332, 345, 397]
                }],colors:['#72ab12','#dc380e','#ff8c01','#3a85be','#fe8c00']
            });
        	//中间地图
//      	map_c_echart.setOption(map_c_option,true);
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
	//事件统计
            $('#radar_echart').highcharts({
                title: {
                    text: ' '
                },  chart: {
                    zoomType: 'xy',
                    backgroundColor: 'rgba(0,0,0,0)'
                },
                credits:{
                    enabled:false // 禁用版权信息
                },colors:['#72ab12','#dc380e','#ff8c01','#3a85be','#fe8c00'],
                xAxis: {
                    categories: [ '病害录入','病害发布', '待修复','计划小修', '不合格'],labels: {
                        style: {
                            color: 'white'
                        }
                    }
                },
                yAxis: {
                    labels: {
                        style: {
                            color: 'white'
                        }
                    },title: {
                        text: '次数 '
                    }
                },
                tooltip: {
                    valueSuffix: '次'
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    x: 10,
                    verticalAlign: 'top',
                    y: 0,
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
                    name: '红山区',
                    data: [1137, 1366,1139,1337, 126]
                }, {
                    name: '松山区',
                    data: [1262, 1533,2013,1637, 626]
                }, {
                    name: '元宝山区',
                    data: [2009, 1316, 1333,1137, 326]
                }]
            });
           var QLZTZSoption = {
                tooltip : {
                    formatter: "{a} <br/>{b} : {c}"
                },
               series: [
                   {
                       name: '修复率', splitNumber: 4,
                       type: 'gauge',
                       detail: {formatter:'{value}%'},  title : {
                       show : true,
                       offsetCenter: [0, '-120%'],       // x, y，单位px
                       textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                           fontWeight: 'bolder' ,color:'white'
                       }
                   },
                       data: [{value: 89, name: '普通病害'}],       // 分割段数，默认为5
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
                        name: '修复率', splitNumber: 4,
                        type: 'gauge',
                        detail: {formatter:'{value}%'},  title : {
                        show : true,
                        offsetCenter: [0, '-120%'],       // x, y，单位px
                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            fontWeight: 'bolder' ,color:'white'
                        }
                    },
                        data: [{value: 100, name: '紧急24小时'}],       // 分割段数，默认为5
                        axisLine: {            // 坐标轴线
                            lineStyle: {       // 属性lineStyle控制线条样式
                                color: [[0.2, 'red'],[0.8, '#48b'],[1, 'green']],
                                width: 2
                            }
                        }
                    }
                ]
            };
            var QLZTZSoption2 = {
                tooltip : {
                    formatter: "{a} <br/>{b} : {c}"
                },
                series: [
                    {
                        name: '修复率', splitNumber: 4,
                        type: 'gauge',
                        detail: {formatter:'{value}%'},  title : {
                        show : true,
                        offsetCenter: [0, '-120%'],       // x, y，单位px
                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            fontWeight: 'bolder' ,color:'white'
                        }
                    },
                        data: [{value: 98, name: '紧急48小时'}],       // 分割段数，默认为5
                        axisLine: {            // 坐标轴线
                            lineStyle: {       // 属性lineStyle控制线条样式
                                color: [[0.2, 'red'],[0.8, '#48b'],[1, 'green']],
                                width: 2
                            }
                        }
                    }
                ]
            };
            var QLZTZSoption3 = {
                tooltip : {
                    formatter: "{a} <br/>{b} : {c}"
                },
                series: [
                    {
                        name: '修复率', splitNumber: 4,
                        type: 'gauge',
                        detail: {formatter:'{value}%'},  title : {
                        show : true,
                        offsetCenter: [0, '-120%'],       // x, y，单位px
                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            fontWeight: 'bolder' ,color:'white'
                        }
                    },
                        data: [{value: 89, name: '小修预养'}],       // 分割段数，默认为5
                        axisLine: {            // 坐标轴线
                            lineStyle: {       // 属性lineStyle控制线条样式
                                color: [[0.2, 'red'],[0.8, '#48b'],[1, 'green']],
                                width: 2
                            }
                        }
                    }
                ]
            };
//          qlztzsEchart.setOption(QLZTZSoption);
//          qlztzsEchart1.setOption(QLZTZSoption1);
//          qlztzsEchart2.setOption(QLZTZSoption2);
//          qlztzsEchart3.setOption(QLZTZSoption3);
            ////自适应ldwhlEchart
            //var LDWHoption = {
            //    tooltip : {
            //        trigger: 'axis'
            //    }
            //    ,
            //    legend: {
            //        data:[
            //            '市电路灯','太阳能路灯','风光路灯','钢制路灯',
            //        ],textStyle:{
            //            color:'white'
            //        }
            //    }
            //    ,
            //    grid: {y: 70, y2:30, x2:20},
            //    xAxis : [
            //        {
            //            type : 'category',
            //            data : ['红山区','松山区','元宝区','其他'],
            //            axisLabel: {
            //            show: true,
            //            textStyle: {
            //                color: 'white'
            //            }
            //         }
            //        },
            //        {
            //            type : 'category',
            //            axisLine: {show:false},
            //            axisTick: {show:false},
            //            axisLabel: {show:false},
            //            splitArea: {show:false},
            //            splitLine: {show:false},
            //            data : ['红山区','松山区','元宝区','其他']
            //        }
            //    ],
            //    yAxis : [
            //        {
            //            type : 'value',
            //            axisLabel:{formatter:'{value}盏',textStyle:{color:'white'}}
            //        }
            //    ],
            //    series : [
            //        {
            //            name:'市电路灯',
            //            type:'bar',
            //            itemStyle: {normal: {color:'rgba(0,204,255,0.8)', label:{show:true}}},
            //            data:[4340,4710,2788,6975],barGap:'1%'
            //        },
            //        {
            //            name:'太阳能路灯',
            //            type:'bar',
            //            itemStyle: {normal: {color:'rgba(8,220,128,0.8)', label:{show:true,textStyle:{color:'#27727B'}}}},
            //            data:[2600,3120,2087,6650],barGap:'1%'
            //        },
            //        {
            //            name:'风光路灯',
            //            type:'bar',
            //            //xAxisIndex:1,
            //            itemStyle: {normal: {color:'rgba(250,5,218,0.8)', label:{show:true}}},
            //            data:[5291,6035,3689,9000],barGap:'1%'
            //        },
            //        {
            //            name:'钢制路灯',
            //            type:'bar',
            //           // xAxisIndex:1,
            //            itemStyle: {normal: {color:'rgba(255,204,0,0.8)', label:{show:true,formatter:function(p){return p.value > 0 ? (p.value +'+'):'';}}}},
            //            data:[3303,4030,2817,9030],barGap:'1%'
            //        }
            //    ]
            //};
            //ldwhlEchart.setOption(LDWHoption);

            //事件统计
            $('#radar_echart').highcharts({
                title: {
                    text: ' '
                },  chart: {
                    zoomType: 'xy',
                    backgroundColor: 'rgba(0,0,0,0)'
                },colors:['#72ab12','#dc380e','#ff8c01','#3a85be','#fe8c00'],
                credits:{
                    enabled:false // 禁用版权信息
                },
                xAxis: {
                    categories: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],labels: {
                        style: {
                            color: 'white'
                        }
                    }
                },
                yAxis: {
                    labels: {
                        style: {
                            color: 'white'
                        }
                    },title: {
                        text: '次数 '
                    }
                },
                tooltip: {
                    valueSuffix: '次'
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    x: 10,
                    verticalAlign: 'top',
                    y: 0,
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
                    name: '2015年',
                    data: [7, 6, 9, 14, 18, 21, 22, 26, 23, 18, 13, 9]
                }, {
                    name: '2016年',
                    data: [2, 3, 3, 11, 17, 22, 24, 24, 20, 14, 8, 2]
                }, {
                    name: '2017年',
                    data: [9, 6, 3, 8, 13, 17, 18, null, null, null, null, null]
                }]
            });
            window.onresize = function () {
                //radarechart.resize();
                // bar_l_echart.resize();
                // pie_l_echart.resize();
                // bar_c_echart.resize();
//              map_c_echart.resize();
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