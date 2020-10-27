var legal_person_data = {"uploadData":[{"count":630},{"count":986},{"count":792},{"count":642},{"count":521},{"count":573}
        ,{"count":832},{"count":747},{"count":983},{"count":836},{"count":831},{"count":633}],
    "updateData":[{"count":110},{"count":181},{"count":123},{"count":197},{"count":123},{"count":173}
        ,{"count":123},{"count":151},{"count":101},{"count":152},{"count":101},{"count":177}],
    "viewData":[{"count":651},{"count":842},{"count":223},{"count":223},{"count":221},{"count":812}
        ,{"count":928},{"count":219},{"count":613},{"count":254},{"count":981},{"count":301}]};
var people_data = {"uploadData":[{"count":1300},{"count":1686},{"count":1692},{"count":1742},{"count":1621},{"count":773}
        ,{"count":832},{"count":1047},{"count":1483},{"count":1336},{"count":831},{"count":973}],
    "updateData":[{"count":103},{"count":281},{"count":203},{"count":197},{"count":173},{"count":154}
        ,{"count":223},{"count":251},{"count":201},{"count":252},{"count":201},{"count":277}],
    "viewData":[{"count":651},{"count":842},{"count":223},{"count":223},{"count":221},{"count":812}
        ,{"count":928},{"count":219},{"count":613},{"count":254},{"count":981},{"count":301}]};
var picture_data = {"uploadData":[{"count":330},{"count":786},{"count":492},{"count":842},{"count":421},{"count":673}
        ,{"count":932},{"count":447},{"count":583},{"count":436},{"count":331},{"count":433}],
    "updateData":[{"count":10},{"count":81},{"count":23},{"count":97},{"count":23},{"count":73}
        ,{"count":23},{"count":51},{"count":01},{"count":52},{"count":01},{"count":77}],
    "viewData":[{"count":451},{"count":342},{"count":523},{"count":323},{"count":421},{"count":812}
        ,{"count":728},{"count":619},{"count":613},{"count":554},{"count":481},{"count":301}]};

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

    getProductTotal(formatwdate,nowformatwdate);

    getEverDayProdacuByDate(formatwdate,nowformatwdate);

    getAllProductTypeTotal(formatwdate,nowformatwdate);

    getTwoCrewProduct(formatwdate,nowformatwdate);
})
function showProductStatement() {
    
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

    getProductTotal(startDate,endDate);

    getEverDayProdacuByDate(startDate,endDate);

    getAllProductTypeTotal(startDate,endDate);

    getTwoCrewProduct(startDate,endDate);
}

/**
 * 查询日期范围内总产量（图一）
 * @param startDate
 * @param lastDate
 */
function getProductTotal(startDate,lastDate) {
    $.ajax({
        url: basePath + "/getProdycyTotalByDate.do",
        type: "post",
        data:{
          "startDate":  startDate,
            "lastDate":lastDate
        },
        dataType: "json",
        success:function (res) {
            var sumTotal = 0;
            if (res.message === 'success'){
                var list = res.body;
                if (list.length > 0){
                    for (var i = 0;i < list.length;i++ ) {
                        if (list[i].crew === 'crew1') {
                            $("#crew1_total").html(list[i].total + "吨")
                        }else {
                            $("#crew2_total").html(list[i].total+ "吨")
                        }
                        sumTotal += Number(list[i].total);
                    }
                    $("#total").html(sumTotal + "吨");
                }else {
                    layui.use('layer', function(){
                        layer.alert("前一个月无生产数据")
                    })

                }
            } else {
                layui.use('layer', function(){
                    layer.alert("查询生产总量失败")
                })
            }
        }
    })
}

/**
 * 查询日期范围内每日产量情况
 * @param startDate
 * @param lastDate
 */
function getEverDayProdacuByDate(startDate,lastDate) {
    $.ajax({
        url: basePath + "/getEverDayProdacuByDate.do",
        type: "post",
        data:{
            "startDate":  startDate,
            "lastDate":lastDate
        },
        dataType: "json",
        success:function (res) {
            var sumTotal = 0;
            if (res.message === 'success'){
                var list = res.body;

                if (list.length > 0){
                    var crew1 = [];
                    var crew2 = [];
                    var twoCrew = [];
                    var xAxis = [];
                    for (var i = 0; i < list.length ; i++) {
                        var product_date =  list[i].produce_date;
                        if (!xAxis.includes(product_date)){
                            xAxis.push(product_date)
                        }
                    }
                    for (var i = 0; i < xAxis.length ; i++){
                        crew1.push({
                            "name":xAxis[i],
                            "value":0
                        })
                        crew2.push({
                            "name":xAxis[i],
                            "value":0
                        })
                        twoCrew.push({
                            "name":xAxis[i],
                            "value":0
                        })
                    }

                    for (var i = 0; i < list.length ; i++) {
                        var date =  list[i].produce_date;
                        var crewNum =  list[i].crew;
                        //定义机组一数组
                        if (crewNum === 'crew1'){
                            for (var j = 0;j < crew1.length;j++){
                                var pDate = crew1[j].name;
                                if (date === pDate ){
                                    crew1[j].value = list[i].total;
                                    break
                                }
                            }
                        } else {
                            //定义机组二数组
                            for (var k = 0;k < crew2.length;k++){
                                var p2Date = crew2[k].name;
                                if (date === p2Date){
                                    crew2[k].value = list[i].total;
                                    break
                                }
                            }
                        }
                    }
                    //定义总量数组
                    for (var  r= 0;r < twoCrew.length;r++){
                        var crew1Total = crew1[r].value;
                        var crew2Total  = crew2[r].value;
                        twoCrew[r].value = Number(crew1Total) + Number(crew2Total);
                    }
                    init_myChart1(crew1,crew2,twoCrew,xAxis);
                }else {
                    layui.use('layer', function(){
                        layer.alert("前一个月无生产数据")
                    })
                }
            } else {
                layui.use('layer', function(){
                    layer.alert("查询生产总量失败")
                })
            }
        }
    })
    
}

/**
 * 查询所有产品类型的产品总量与前十产品
 * @param startDate
 * @param lastDate
 */
function getAllProductTypeTotal(startDate,lastDate) {
    $.ajax({
        url: basePath + "/getAllProductTypeTotal.do",
        type: "post",
        data:{
            "startDate":  startDate,
            "lastDate":lastDate
        },
        dataType: "json",
        success:function (res) {
            var sumTotal = 0;
            if (res.message === 'success'){
                var list = res.body;
                if (list.length > 0){
                    var xData = [];
                    var totalData = [];
                    var regenerateData = [];
                    var htm = '';
                    for (var i = 0;i < list.length;i++){
                        if (i < 10){
                            xData.push(list[i].pro_name);
                            totalData.push(list[i].total);
                            regenerateData.push(list[i].regenerateTotal);
                        }
                        htm += '<li>'
                            + '<div>' + list[i].pro_name + '</div>'
                            + '<div>' + list[i].total + '</div>'
                            + '<div>' + list[i].regenerateTotal + '</div>'
                            + '<div>' + ((list[i].regenerateTotal/list[i].total)*100).toFixed(2) + '<i>%</i></div>'
                            + '</li>';
                    }
                    $("#maquee").append(htm);
                    //更新前十
                    init_myChart5(xData,totalData,regenerateData);
                } else {
                    layui.use('layer', function(){
                        layer.alert("日期段内无生产")
                    })
                }
            } else {
                layui.use('layer', function(){
                    layer.alert("查询生产总量失败")
                })
            }
        }
    })
}

/**
 * 根据日期时间查询产品情况
 * @param startDate
 * @param lastDate
 */
function getTwoCrewProduct(startDate,lastDate) {
    $.ajax({
        url: basePath + "/getTwoCrewProduct.do",
        type: "post",
        data:{
            "startDate":  startDate,
            "lastDate":lastDate
        },
        dataType: "json",
        success:function (res) {
            if (res.message === 'success'){
                var list = res.body;
                if (list.length > 0){
                    var crew1_xData = [];
                    var crew1_totalData = [];
                    var crew1_regenerateData = [];
                    var crew2_xData = [];
                    var crew2_totalData = [];
                    var crew2_regenerateData = [];

                    for (var i = 0;i < list.length;i++){
                        var crewNum = list[i].crew;
                        if ( crewNum === 'crew1'){
                            crew1_xData.push(list[i].pro_name);
                            crew1_totalData.push(list[i].total);
                            crew1_regenerateData.push(list[i].regenerate);
                        }else {
                            crew2_xData.push(list[i].pro_name);
                            crew2_totalData.push(list[i].total);
                            crew2_regenerateData.push(list[i].regenerate);
                        }
                    }
                    //更新一号机前十
                    init_myChart6(crew1_xData,crew1_totalData,crew1_regenerateData);
                    //更新二号机前十
                    init_myChart7(crew2_xData,crew2_totalData,crew2_regenerateData);
                } else {
                    layui.use('layer', function(){
                        layer.alert("日期段内无生产")
                    })
                }
            } else {
                layui.use('layer', function(){
                    layer.alert("查询生产总量失败")
                })
            }
        }
    })
}
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
                formatter:function(value)
                {
                    var ret = "";//拼接加\n返回的类目项
                    var maxLength = 2;//每项显示文字个数
                    var valLength = value.length;//X轴类目项的文字个数
                    var rowN = Math.ceil(valLength / maxLength); //类目项需要换行的行数
                    if (rowN > 1)//如果类目项的文字大于3,
                    {
                        for (var i = 0; i < rowN; i++) {
                            var temp = "";//每次截取的字符串
                            var start = i * maxLength;//开始截取的位置
                            var end = start + maxLength;//结束截取的位置
                            //这里也可以加一个是否是最后一行的判断，但是不加也没有影响，那就不加吧
                            temp = value.substring(start, end) + "\n";
                            ret += temp; //凭借最终的字符串
                        }
                        return ret;
                    }
                    else {
                        return value;
                    }
                }



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
                "name": "生产总量",
                "type": "bar",

                "barGap": "10%",
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
                name:'再生料',
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
                    formatter:function(value)
                    {
                        var ret = "";//拼接加\n返回的类目项
                        var maxLength = 2;//每项显示文字个数
                        var valLength = value.length;//X轴类目项的文字个数
                        var rowN = Math.ceil(valLength / maxLength); //类目项需要换行的行数
                        if (rowN > 1)//如果类目项的文字大于3,
                        {
                            for (var i = 0; i < rowN; i++) {
                                var temp = "";//每次截取的字符串
                                var start = i * maxLength;//开始截取的位置
                                var end = start + maxLength;//结束截取的位置
                                //这里也可以加一个是否是最后一行的判断，但是不加也没有影响，那就不加吧
                                temp = value.substring(start, end) + "\n";
                                ret += temp; //凭借最终的字符串
                            }
                            return ret;
                        }
                        else {
                            return value;
                        }
                    }
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
                name:'生产总量',
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
                name:'再生料',
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
        this.myChart3.resize;
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