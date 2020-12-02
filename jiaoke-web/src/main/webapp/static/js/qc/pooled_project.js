

var Tpl1 = '<li>' +
    '<p class="data-count">5681</p>' +
    '<span class="data-name">生产总量</span>' +
    '</li>' +
    '<li>' +
    '<p class="data-count">1331</p>' +
    '<span class="data-name">一号机生产量</span>' +
    '</li>' +
    '<li>' +
    '<p class="data-count">3753</p>' +
    '<span class="data-name">二号机生产量</span>' +
    '</li>' ;
var Tpl2 = '<li>' +
    '<p class="data-count">5681</p>' +
    '<span class="data-name">生产总量</span>' +
    '</li>' +
    '<li>' +
    '<p class="data-count">1331</p>' +
    '<span class="data-name">一号机生产量</span>' +
    '</li>' +
    '<li>' +
    '<p class="data-count">3753</p>' +
    '<span class="data-name">二号机生产量</span>' +
    '</li>' ;
var Tpl3 ='<li>' +
    '<p class="data-count">5681</p>' +
    '<span class="data-name">生产总量</span>' +
    '</li>' +
    '<li>' +
    '<p class="data-count">1331</p>' +
    '<span class="data-name">一号机生产量</span>' +
    '</li>' +
    '<li>' +
    '<p class="data-count">3753</p>' +
    '<span class="data-name">二号机生产量</span>' +
    '</li>' ;
$('.com-screen-content .use-data').html(Tpl1);

    var basePath = $("#path").val();
$(function(){
    setInterval('autoScroll(".maquee")',2000);
    
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#startDate',//指定元素
            type:'date',
            theme: 'molv',
            isInitValue: false
        });
        laydate.render({
            elem: '#endDate',//指定元素
            type:'date',
            theme: 'molv',
            isInitValue: false,
            done: function(value, date, endDate){
                getALLEcharDataByDate();
            }
        });

    });
    
    var nowdate = new Date();
    var y = nowdate.getFullYear();
    var m = nowdate.getMonth();
    var d = nowdate.getDate();
    var formatwdate = y+'-'+m+'-'+d;
    var nowformatwdate = y+'-'+(nowdate.getMonth()+1)+'-'+d;

    showProjectStatement(formatwdate,nowformatwdate);

})
function showProjectStatement(startDate ,endDate) {
    $.ajax({
        url: basePath + "/getPlateNumberByDate.do",
        type: "post",
        data:{
            "startDate":  startDate,
            "lastDate":endDate
        },
        dataType: "json",
        success:function (res) {
            var sumTotal = 0;
            if (res.message === 'success'){
                var list = res.body;
                if (list.length > 0){
                    var crew1Html = "";
                    var crew2Html = "";
                    for (var i = 0;i < list.length;i++ ) {
                        if (list[i].crew === 'crew1') {
                            crew1Html += '<tr>'
                                + '<th>' + list[i].startDate + '</th>'
                                + '<th>' + list[i].endDate + '</th>'
                                + '<th>' + list[i].productCount  + '</th>'
                                + '<th>' + list[i].weighCount + '</th>'
                                + '</tr>';
                        }else {
                            crew2Html += '<tr>'
                                + '<th>' + list[i].startDate + '</th>'
                                + '<th>' + list[i].endDate + '</th>'
                                + '<th>' + list[i].productCount  + '</th>'
                                + '<th>' + list[i].weighCount + '</th>'
                                + '</tr>';
                        }
                    }

                    //更新报告
                    $("#crew1Body").html(crew1Html);
                    $("#crew2Body").html(crew2Html);
                }else {
                    layui.use('layer', function(){
                        layer.alert("该时间段无生产数据")
                    })

                }
            } else {
                layui.use('layer', function(){
                    layer.alert("查询生产盘数失败")
                })
            }
        }
    })
}

function showProjectStatementPage() {
    layui.use('layer', function(){
        var layer = layui.layer;
        //执行一个laydate实例
        parent.layer.open({
            type: 1,
            shade: false,
            scrollbar:false,
            skin: 'layui-layer-demo', //样式类
            maxmin: true, //开启最大化最小化按钮
            area: ['70%', '70%'],
            shadeClose: true, //开启遮罩关闭
            content: $('#productStatement').html()
        });
    });
}
function getALLEcharDataByDate() {
    var startDate = $("#startDate").val();
    var endDate = $("#endDate").val();
    if (isBlank(startDate)){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.msg('请选择开始日期');
        });
        return
    }

    showProjectStatement(startDate,endDate);
}
function printReport(printpage) {
    $("#print_button").remove();
    var headstr = "<html><head><title></title></head><body>";
    var footstr = "</body>";
    var newstr = document.all.item(printpage).innerHTML;
    var oldstr = document.body.innerHTML;
    document.body.innerHTML = headstr+newstr+footstr;
    window.print();
    document.body.innerHTML = oldstr;
    return false;
};
// 基于准备好的dom，初始化echarts实例
var myChart1 = echarts.init(document.getElementById('main1'));
var myChart5 = echarts.init(document.getElementById('main5'));
var myChart6 = echarts.init(document.getElementById('main6'));
var myChart7 = echarts.init(document.getElementById('main7'));

getNowFormatDate();
init_myChart6();
init_myChart7();

function init_myChart1(crew1,crew2,twoCrew,xAxis) {

    option = {

        tooltip: {
            trigger: 'axis',
            formatter: function (params, ticket, callback) {
                var res = '';
                for (var i = 0, l = params.length; i < l; i++) {
                    res += '' + params[i].seriesName + '-' + params[i].data.name + ' : ' + params[i].value + '<br>';
                }
                return res;
            },
            transitionDuration: 0,
            backgroundColor: 'rgba(83,93,105,0.8)',
            borderColor: '#535b69',
            borderRadius: 8,
            borderWidth: 2,
            padding: [5, 10],
            axisPointer: {
                type: 'line',
                lineStyle: {
                    type: 'dashed',
                    color: '#ffff00'
                }
            }
        },
        legend: {
            icon: 'circle',
            itemWidth: 8,
            itemHeight: 8,
            itemGap: 10,
            top: '16',
            right: '10',
            data: ['总量','1#生产量','2#生产量'],
            textStyle: {
                fontSize: 10,
                color: '#a0a8b9'
            }
        },
        grid: {
            top:'4%',
            left: '10%',
            right: '10',
            //bottom: '10%',
            containLabel: false
        },
        xAxis: [{
            type: 'category',
            boundaryGap: false,
            axisLabel: {
                interval: 0,
                rotate:40,
                fontSize:10
            },
            axisLine: {
                show: false,
                lineStyle: {
                    color: '#a0a8b9'
                }
            },
            axisTick: {
                show: false
            },
            data: xAxis,
            offset: 10
        }],
        yAxis: [{
            type: 'value',
            axisLine: {
                show: false,
                lineStyle: {
                    color: '#a0a8b9'
                }
            },
            axisLabel: {
                margin: 10,
                textStyle: {
                    fontSize: 10
                }
            },
            splitLine: {
                lineStyle: {
                    color: '#2b3646'
                }
            },
            axisTick: {
                show: false
            }
        }],
        series: [{
            name: '数据总量',
            type: 'line',
            smooth: true,
            showSymbol: false,
            lineStyle: {
                normal: {
                    width: 2
                }
            },
            areaStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                        offset: 0,
                        color: 'rgba(137, 189, 27, 0.3)'
                    }, {
                        offset: 0.8,
                        color: 'rgba(137, 189, 27, 0)'
                    }], false),
                    shadowColor: 'rgba(0, 0, 0, 0.1)',
                    shadowBlur: 10
                }
            },
            itemStyle: {
                normal: {
                    color: '#1cc840'
                }
            },
            data: twoCrew
        }, {
            name: '一号机组',
            type: 'line',
            smooth: true,
            showSymbol: false,
            lineStyle: {
                normal: {
                    width: 2
                }
            },
            areaStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                        offset: 0,
                        color: 'rgba(219, 50, 51, 0.3)'
                    }, {
                        offset: 0.8,
                        color: 'rgba(219, 50, 51, 0)'
                    }], false),
                    shadowColor: 'rgba(0, 0, 0, 0.1)',
                    shadowBlur: 10
                }
            },
            itemStyle: {
                normal: {
                    color: '#eb5690'
                }
            },
                data: crew1
            },  {
            name: '二号机组',
            type: 'line',
            smooth: true,
            showSymbol: false,
            lineStyle: {
                normal: {
                    width: 2
                }
            },
            areaStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                        offset: 0,
                        color: 'rgba(0, 136, 212, 0.3)'
                    }, {
                        offset: 0.8,
                        color: 'rgba(0, 136, 212, 0)'
                    }], false),
                    shadowColor: 'rgba(0, 0, 0, 0.1)',
                    shadowBlur: 10
                }
            },
            itemStyle: {
                normal: {
                    color: '#43bbfb'
                }
            },
            data: crew2
        }
        ]
    };
    myChart1.setOption(option);
}


function bar(){
    option = {
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        color:['#8fc31f','#f35833','#00ccff','#ffcc00','#f5e965','#a74faf','#ff9668'],

        series : [
            {
                name: '资源总量构成',
                type: 'pie',
                radius : '20%',
                center: ['50%', '50%'],
                data:[
                    {value:435, name:'公安局'},
                    {value:679, name:'民政局'},
                    {value:848, name:'气象局'},
                    {value:348, name:'统计局'},
                    {value:679, name:'交通局'},
                    {value:848, name:'人社局'},
                    {value:1348, name:'其他'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                },
                itemStyle: {
                    normal: {
                        label:{
                            show: true,
                            //	                            position:'inside',
                            formatter: '{b} : {c} ({d}%)' ,
                            fontSize : 8,    //文字的字体大小
                        }
                    },
                    labelLine :{show:true}
                }
            }
        ]
    };
// 使用刚指定的配置项和数据显示图表。
    myChart1.setOption(option);
}

function init_myChart5(xData,totalData,regenerateData){

    option = {
        backgroundColor:"",
        grid: {
            top:'4%',
            left: '10%',
            right: '10',
            //bottom: '10%',
            containLabel: false
        },
        xAxis: {
            axisTick: {
                show: false
            },
            splitLine: {
                show: false
            },
            splitArea: {
                show: false
            },
            data: xData,
            axisLabel: {
                interval: 0,
                rotate:40,
                fontSize: 10,
                fontWeight: 100,
                textStyle: {
                    color: '#9faeb5',

                }
            },
            axisLine: {
                lineStyle: {
                    color: '#4d4d4d'
                }
            }
        },
        yAxis: {
            axisTick: {
                show: false
            },
            splitLine: {
                show: false
            },
            splitArea: {
                show: false
            },

            axisLabel: {
                textStyle: {
                    color: '#9faeb5',
                    fontSize: 10,
                }
            },
            axisLine: {
                lineStyle: {
                    color: '#4d4d4d'
                }
            }
        },
        "tooltip": {
            "trigger": "axis",
            transitionDuration: 0,
            backgroundColor: 'rgba(83,93,105,0.8)',
            borderColor: '#535b69',
            borderRadius: 8,
            borderWidth: 2,
            padding: [5, 10],
            formatter: function (params, ticket, callback) {
                var res = '';
                for (var i = 0, l = params.length; i < l; i++) {
                    res += '' + params[i].seriesName + ' : ' + params[i].value + '<br>';
                }
                return res;
            },
            axisPointer: {
                type: 'line',
                lineStyle: {
                    type: 'dashed',
                    color: '#ffff00'
                }
            }
        },
        series: [{
            name:'生产总量',
            type:"bar",
            itemStyle: {
                normal: {
                    color: {
                        type: 'linear',
                        x: 0,
                        y: 0,
                        x2: 0,
                        y2: 1,
                        colorStops: [{
                            offset: 0,
                            color: '#00d386' // 0% 处的颜色
                        }, {
                            offset: 1,
                            color: '#0076fc' // 100% 处的颜色
                        }],
                        globalCoord: false // 缺省为 false
                    },
                    barBorderRadius: 15,
                }
            },
            label: {
                normal: {
                    show: true,
                    position: "top",
                    textStyle: {
                        color: "#ffc72b",
                        fontSize: 10
                    }
                }
            },
            data: totalData,
            barWidth: 16,
        },{
            name:'再生料量',
            type:'line',
            itemStyle : {  /*设置折线颜色*/
                normal : {
                    /* color:'#c4cddc'*/
                }
            },
            data:regenerateData
        }]
    };
    myChart5.setOption(option);
}
//刷新myChart5数据



function init_myChart6(crew1_xData,crew1_totalData,crew1_regenerateData){

    option = {
        "tooltip": {
            "trigger": "axis",
            transitionDuration: 0,
            backgroundColor: 'rgba(83,93,105,0.8)',
            borderColor: '#535b69',
            borderRadius: 8,
            borderWidth: 2,
            padding: [5, 10],
            formatter: function (params, ticket, callback) {
                var res = '';
                for (var i = 0, l = params.length; i < l; i++) {
                    res += '' + params[i].seriesName + ' : ' + params[i].value + '<br>';
                }
                return res;
            },
            axisPointer: {
                type: 'line',
                lineStyle: {
                    type: 'dashed',
                    color: '#ffff00'
                }
            }
        },
        "grid": {
            "top": '40',
            "left": '30',
            "right": '10',
            "bottom": '40',
            textStyle: {
                color: "#fff"
            }
        },
        "legend": {
            right: '24',
            top: "24",
            itemWidth: 8,
            itemHeight: 12,
            textStyle: {
                color: '#fff',
                fontSize:10
            },
            "data": ['资源总量'],

        },
        "calculable": true,
        xAxis: [{
            'type': 'category',
            "axisTick": {
                "show": false
            },
            "axisLine": {
                "show": false,
                lineStyle: {
                    color: '#868c96'
                }
            },
            "axisLabel": {
                "interval": 0,
                fontSize:10,
                rotate:40
            },
            "splitArea": {
                "show": false
            },
            'data': crew1_xData,
            splitLine: {
                show: false
            }
        }],
        "yAxis": [
            {
                "type": "value",
                offset: -14,
                "splitLine": {
                    "show": false
                },
                "axisLine": {
                    "show": false,
                    lineStyle: {
                        color: '#868c96'
                    }
                },
                "axisTick": {
                    "show": false
                },
                "axisLabel": {
                    "interval": 0,
                    fontSize:10

                },
                "splitArea": {
                    "show": false
                }
            }],

        "series": [
            {
                "name": "可添加类型生产总量",
                "type": "bar",
                itemStyle: {//图形样式
                    normal: {
                        "color": '#4a4df0'
                    }
                },
                label: {
                    normal: {
                        show: true,
                        position: "top",
                        textStyle: {
                            color: "#ffc72b",
                            fontSize: 10
                        }
                    }
                },
                "data": crew1_totalData,
                barWidth: 14,
            },{
                name:'可添加类型总量',
                type:'line',
                itemStyle : {  /*设置折线颜色*/
                    normal : {
                        color:'#c7b198'
                    }
                },
                data:crew1_regenerateData,

            }
        ]
    };

// 使用刚指定的配置项和数据显示图表。
    myChart6.setOption(option);
}

function init_myChart7(crew2_xData,crew2_totalData,crew2_regenerateData){


    var colorList = [
        '#ff2600',
        '#ffc000',
        '#00ad4e',
        '#0073c2',
        '#165868',
        '#e76f00',
        '#316194',
        '#723761',
        '#00b2f1',
        '#4d6022',
        '#4b83bf',
        '#f9c813',
        '#0176c0'
    ];

    option = {
        color:colorList,
        "tooltip": {
            "trigger": "axis",
            transitionDuration: 0,
            backgroundColor: 'rgba(83,93,105,0.8)',
            borderColor: '#535b69',
            borderRadius: 8,
            borderWidth: 2,
            padding: [5, 10],
            formatter: function (params, ticket, callback) {
                var res = '';
                for (var i = 0, l = params.length; i < l; i++) {
                    res += '' + params[i].seriesName + ' : ' + params[i].value + '<br>';
                }
                return res;
            },
            axisPointer: {
                type: 'line',
                lineStyle: {
                    type: 'dashed',
                    color: '#ffff00'
                }
            }
        },
        toolbox: {
            show : true,
            feature : {
                mark : {
                    show: true
                },

            }
        },
        grid: {
            "borderWidth": 0,
            "top": '40',
            "left": '30',
            "right": '10',
            "bottom": '40',
            textStyle: {
                color: "#fff"
            }
        },
        xAxis : [
            {
                'type': 'category',
                "axisTick": {
                    "show": false
                },
                "axisLine": {
                    "show": false,
                    lineStyle: {
                        color: '#868c96'
                    }
                },
                "axisLabel": {
                    "interval": 0,
                    fontSize:10,
                    rotate:40
                },
                "splitArea": {
                    "show": false
                },
                'data': crew2_xData,
                splitLine: {
                    show: false
                },

            }
        ],
        yAxis : [
            {
                "type": "value",
                offset: -14,
                "splitLine": {
                    "show": false
                },
                "axisLine": {
                    "show": false,
                    lineStyle: {
                        color: '#868c96'
                    }
                },
                "axisTick": {
                    "show": false
                },
                "axisLabel": {
                    "interval": 0,
                    fontSize:10

                },
                "splitArea": {
                    "show": false
                }
            }

        ],
        series : [
            {
                name:'可添加类型生产总量',
                type:'bar',
                data:crew2_totalData,
                itemStyle: {
                    normal: {
                        color: function(params) {
                            // build a color map as your need.
                            var colorList = [
                                '#ff2600',
                                '#ffc000',
                                '#00ad4e',
                                '#0073c2',
                                '#165868',
                                '#e76f00',
                                '#316194',
                                '#723761',
                                '#00b2f1',
                                '#4d6022',
                                '#4b83bf',
                                '#f9c813',
                                '#0176c0'
                            ];
                            return colorList[params.dataIndex]
                        },

                    }
                },
                barWidth: 14,
                label: {
                    normal: {
                        show: true,
                        position: "top",
                        textStyle: {
                            color: "#ffc72b",
                            fontSize: 10
                        }
                    }
                },
            },
            {
                name:'可添加类型再生料总量',
                type:'line',
                itemStyle : {  /*设置折线颜色*/
                    normal : {
                        color:'#d3d5fd'
                    }
                },
                data:crew2_regenerateData
            }

        ]
    };


// 使用刚指定的配置项和数据显示图表。
    myChart7.setOption(option);
}
//获取当前时间
function getNowFormatDate() {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    var Hour =  date.getHours();       // 获取当前小时数(0-23)
    var Minute =  date.getMinutes();     // 获取当前分钟数(0-59)
    var Second = date.getSeconds();     // 获取当前秒数(0-59)
    var show_day=new Array('星期日','星期一','星期二','星期三','星期四','星期五','星期六');
    var day=date.getDay();
    if (Hour<10) {
        Hour = "0" + Hour;
    }
    if (Minute <10) {
        Minute = "0" + Minute;
    }
    if (Second <10) {
        Second = "0" + Second;
    }
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = '<div><p>'+year + '年' + month +'月' + strDate+'号</p><p>'+show_day[day]+'</p></div>';
    var HMS = Hour + ':' + Minute +':' + Second;
    var temp_time = year+'-'+month+'-'+strDate+' '+HMS;
    $('.nowTime li:nth-child(1)').html(HMS);
    $('.nowTime li:nth-child(2)').html(currentdate);
    //$('.topRec_List li div:nth-child(3)').html(temp_time);
    setTimeout(getNowFormatDate,1000);//每隔1秒重新调用一次该函数
}
var resourceDataType = $('.data-label li.active').data('type');//用于切换基础库
function urlType() {
    resourceDataType = $('.data-label li.active').data('type');
    if (resourceDataType == 1) {
        init_myChart3(legal_person_data);
        $('.com-screen-content .use-data').html(Tpl1);
    } else if (resourceDataType == 2) {
        init_myChart3(people_data);
        $('.com-screen-content .use-data').html(Tpl2);
    } else if (resourceDataType == 3) {
        init_myChart3( picture_data);
        $('.com-screen-content .use-data').html(Tpl3);
    }
}
var num =0 ;
//    资源类型定时器
function resourceType() {
    $('.data-label li').eq(num).addClass('active').siblings().removeClass('active');
    //$('.active-data-label').html($('.canvas-pic-two .data-label li.active').html());
    urlType();
    num++;
    if (num >= 3) {
        num = 0;
    }
}

//    资源类型点击切换
$('.data-label').on('click', 'li', function () {
    $(this).addClass('active').siblings().removeClass('active');
    $('.active-data-label').html($('.data-label li.active').html());
    urlType();
});
var oTimer = setInterval(resourceType, 3000);
//    hover清除定时器
$('.data-label').hover(function () {
    clearInterval(oTimer);
}, function () {
    oTimer = setInterval(resourceType, 3000);
});

/*function resize(){
	window.addEventListener("resize", () => {
  	this.myChart1.resize;
	this.myChart2.resize;
	this.myChart3.resize;
	this.myChart5.resize;
	this.myChart6.resize;
	this.myChart7.resize;
});
}*/

setInterval(function (){
    window.onresize = function () {
        this.myChart1.resize;
        this.myChart5.resize;
        this.myChart6.resize;
        this.myChart7.resize;
    }
},200)

function isBlank(s) {
    if (s == "undefined" || s == null || s == "" || s.length == 0) {
        return true;
    }
    return false;
};