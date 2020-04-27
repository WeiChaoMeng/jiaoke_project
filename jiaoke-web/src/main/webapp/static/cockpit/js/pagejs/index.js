
(function () {
	//左上雷达图
    var radarechart = echarts.init(document.getElementById('radar_echart'));
    //停车位数量及占比
    //var bar_l_echart = echarts.init(document.getElementById('bar_l_echart'));
    //停车场数量及占比
    // var pie_l_echart = echarts.init(document.getElementById('pie_l_echart'));
    //设备数量
    //中间地图
    // var map_c_echart = echarts.init(document.getElementById('map_c_echart'));
    var qlztzsEchart = echarts.init(document.getElementById('container-speed'));
    var ldwhlEchart = echarts.init(document.getElementById('ldwhl'));
    //右上线上线下排行榜图
   // var bar_r_echart = echarts.init(document.getElementById('bar_r_echart'));
    //车位配比
    var line_r_echart = echarts.init(document.getElementById('line_r_echart'));
    //定义某个地市要显示的区县
    var displayCountry = [];
    //赤峰的省市区县
    var RKvalue_chifeng = [
        {
            name:'红山区',
            value:'123万'

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
            new ChiFengMapSeries("人口",RKvalue_chifeng),
            new ChiFengMapSeries("面积",RKvalue_chifeng1),
            new ChiFengMapSeries("GDP",RKvalue_chifeng2),
            new ChiFengMapSeries("道路里程",RKvalue_chifeng3)
            /*new ChiFengMapSeries("地磁数")*/
        ]
    };

    var fun = {
        init:function () {

            $('#radar_echart').highcharts({
                chart: {
                    zoomType: 'xy',
                    type:'column',
                    options3d: {
                        enabled: false,
                        alpha: 0,
                        beta: 0,
                        depth: 20
                    }, backgroundColor: 'rgba(0,0,0,0)'
                },
                title: {
                    text: ''
                }, credits:{
                    enabled:false // 禁用版权信息
                },
                xAxis: [{
                    categories: ['参数1', '参数2', '参数3'],
                    crosshair: true,
                    labels: {
                        style: {
                            color: 'white'
                        }
                    }
                }],
                yAxis: [{ // Primary yAxis
                    labels: {
                        format: '{value}km',
                        style: {
                            color: Highcharts.getOptions().colors[2]
                        }
                    },
                    title: {
                        text: '',
                        style: {
                            color: Highcharts.getOptions().colors[2]
                        }
                    },
                    opposite: true
                }, { // Secondary yAxis
                    gridLineWidth: 0,
                    title: {
                        text: ' ',
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
                }
                ,colors:['#72ab12','#dc380e','#ff8c01','#3a85be','#fe8c00'],
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
                    name: '参数1',
                    type: 'column',
                    yAxis: 0,
                    data: [215.16, 316,315],
                    tooltip: {
                        valueSuffix: 'km'
                    }
                }, {
                    name: '参数2',
                    type: 'column',
                    yAxis: 1,
                    data: [19, 35, 26],
                    marker: {
                        enabled: false
                    },
                    dashStyle: 'shortdot',
                    tooltip: {
                        valueSuffix: '座'
                    }
                }, {
                    name: '参数3',
                    type: 'column',
                    yAxis: 1,
                    data: [11, 23, 20],
                    marker: {
                        enabled: false
                    },
                    dashStyle: 'shortdot',
                    tooltip: {
                        valueSuffix: '个'
                    }
                }]
            });

        	//巡查管理统计图标
            $('#xctj').highcharts({
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
                    categories: ['2月', '3月', '4月', '5月', '6月', '7月'],
                    crosshair: true,
                    labels: {
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
                yAxis: [ { // Secondary yAxis
                    title: {
                        text: ' ',
                        style: {
                            color: Highcharts.getOptions().colors[0]
                        }
                    },
                    labels: {
                        format: '{value}公里 ',
                        style: {
                            color: Highcharts.getOptions().colors[0]
                        }
                    },
                    opposite: true
                },{ // Primary yAxis
                    labels: {
                        format: '{value}人次',
                        style: {
                            color: 'white'
                        }
                    },
                    title: {
                        text: ' ',
                        style: {
                            color: 'white'
                        }
                    }
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
                    name: '参数1',
                    type: 'column',
                    yAxis: 1,
                    data: [ 240, 201, 329, 244, 276, 335],color:'#ff8c01',
                    tooltip: {
                        valueSuffix: '人次'
                    }, style: {
                        //color: Highcharts.getOptions().colors[0]
                    }
                }, {
                    name: '参数2',
                    type: 'spline',
                    data: [ 4126, 4143,4145, 4182, 4915,5053],color:'#3a85be',
                    tooltip: {
                        valueSuffix: 'km'
                    }, style: {
                        color: 'rgba(8,220,128,0.8)'
                    }
                }]
            });
            //事件统计
            $('#sssjtj').highcharts({
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
                    categories: [ '二月', '三月', '四月', '五月', '六月', '七月'],labels: {
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
                        text: '  '
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
                    name: '参数1',
                    data: [737, 626,739, 744, 828, 751]
                }, {
                    name: '参数2',
                    data: [162, 133,213, 121, 157, 122]
                }, {
                    name: '参数3',
                    data: [100, 126,333,228, 432,615]
                }, {
                    name: '参数4',
                    data: [333,584,325,288, 311, 241]
                }]
            });
        	//中间地图
        	// map_c_echart.setOption(map_c_option,true);
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

            //路灯状态统计
            $('#ldwhl').highcharts({
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
                        format: '{value}%',
                        style: {
                            color: 'white'
                        }
                    },
                    title: {
                        text: ' ',
                        style: {
                            color: 'white'
                        }
                    }
                }, { // Secondary yAxis
                    title: {
                        text: ' ',
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
                    name: '参数1',
                    type: 'column',
                    yAxis: 1,
                    data: [13292,12990,14537],color:'#72ab12',
                    tooltip: {
                        valueSuffix: '%'
                    }, style: {
                        //color: Highcharts.getOptions().colors[0]
                    }
                }, {
                    name: '参数2',
                    type: 'spline',
                    data: [  11.2, 22.3 ,  19.7],color:'#ff8c01',
                    tooltip: {
                        valueSuffix: '%'
                    }, style: {
//                      color: 'rgba(8,220,128,0.8)'
                    }
                }]
            });

           var QLZTZSoption = {
               xAxis: {
                   type: 'category',
                   data: ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日'],
                   axisLine: {
                       onZero: false,
                       lineStyle: {
                           color: '#ffffff'
                       }
                   },
               },
               grid: {
                   top: 15,
                   bottom: 20
               },
               tooltip: {
                   trigger: 'item',
                   formatter: '指数 <br/>{b} : {c}'
               },
               yAxis: {
                   type: 'value',
                   axisLine: {
                       onZero: false,
                       lineStyle: {
                           color: '#ffffff'
                       }
                   },
               },
               series: [{
                   data: [267, 387, 229, 379, 309, 436, 165],
                   type: 'line'
               },
                   {
                       data: [241, 378, 489, 100, 234, 468, 389],
                       type: 'line',
                       lineStyle: {
                           normal:{
                               color: '#19fffa'
                           }
                       }
                   }]
           };

            qlztzsEchart.setOption(QLZTZSoption);

            //停车位占比
            $('#line_r_echart').highcharts({
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45,
                        beta: 0
                    } , backgroundColor: 'rgba(0,0,0,0)'
                },
                credits:{
                    enabled:false // 禁用版权信息
                },colors:['#72ab12','#dc380e','#ff8c01','#3a85be','#fe8c00'],
                title: {
                    text: ''
                },
                tooltip: {
                    pointFormat: '{series.name}: {point.y}个，占比{point.percentage:.1f}%'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        depth: 35,
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}: {point.y}个',  
                            style: {
		                        color: 'white'
		                    }
                        }  
                    }
                },
                series: [{
                    type: 'pie',
                    name: '项目',
                    data: [
                        ['参数1',   2678],
                        ['参数2',   2003],
                        {
                            name: '参数3',
                            y: 4083,
                            sliced: true,
                            selected: true
                        },
                        ['其他',    3183]
                    ]
                }]
            });
            window.onresize = function () {
                radarechart.resize();
                // bar_l_echart.resize();
                // pie_l_echart.resize();
                // bar_c_echart.resize();
                map_c_echart.resize();
                line_r_echart.resize();
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