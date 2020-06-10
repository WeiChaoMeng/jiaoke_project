(function () {
    //页面加载时候的函数
    //查找当日生产的产品
    getThisDayProduct();
    //查询温度曲线
    getThisDayMaxProductTemperature();
    //进入时查询预警占比
    getWarningProportion();
    //进入时查询级配图
    getProductSvgGrading();
    //进入时查询基本信息
    getProductBasicMsg();
})(jQuery);

//文字滚动
$("。ul_listIn .list_lh").myScroll({
    speed:40, //数值越大，速度越慢
    rowHeight:35 //li的高度
});
//日期函数
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
            alert($("#startDate").val());
            alert(value);
        }
    });
});

/**
 *  进入时加载饼图
 */
function getThisDayProduct() {
    var basePath = $("#path").val();
    $.ajax({
        url: basePath + "/getThisDayProduct.do",
        type: "get",
        dataType: "json",
        success:function (res) {
            var msg = res.message;
            var proDuctList = res.dataList;
            var barArry = [];
            var barNameArray = [];
            if (msg === 'success'){
                var colorList = [[
                    '#ff7f50', '#87cefa', '#da70d6', '#32cd32', '#6495ed',
                    '#ff69b4', '#ba55d3', '#cd5c5c', '#ffa500', '#40e0d0',
                    '#1e90ff', '#ff6347', '#7b68ee', '#d0648a', '#ffd700',
                    '#6b8e23', '#4ea397', '#3cb371', '#b8860b', '#7bd9a5'
                ],
                    [
                        '#ff7f50', '#87cefa', '#da70d6', '#32cd32', '#6495ed',
                        '#ff69b4', '#ba55d3', '#cd5c5c', '#ffa500', '#40e0d0',
                        '#1e90ff', '#ff6347', '#7b68ee', '#00fa9a', '#ffd700',
                        '#6b8e23', '#ff00ff', '#3cb371', '#b8860b', '#30e0e0'
                    ],
                    [
                        '#929fff', '#9de0ff', '#ffa897', '#af87fe', '#7dc3fe',
                        '#bb60b2', '#433e7c', '#f47a75', '#009db2', '#024b51',
                        '#0780cf', '#765005', '#e75840', '#26ccd8', '#3685fe',
                        '#9977ef', '#f5616f', '#f7b13f', '#f9e264', '#50c48f'
                    ]][2];
                for (var i = 0; i < proDuctList.length;i++){
                    barArry.push({
                        "name": proDuctList[i].pro_name,
                        "value": proDuctList[i].total,
                        "symbolSize": 70 + ((proDuctList.length - i) * 5),
                        "z":proDuctList[i].produce_proportioning_num,
                        "draggable": true,
                        "itemStyle": {
                            "normal": {
                                "shadowBlur": 100,
                                "shadowColor": colorList[i],
                                "color": colorList[i]
                            }
                        }
                    });
                    barNameArray.push(proDuctList[i].pro_name);
                }
                setBarEchars(barArry,barNameArray);
            } else if (proDuctList.length === 0){
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.msg('本日两个机组无生产');
                });
            } else {
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.msg('查询本日工程失败');
                });
            }
        }
    })
}
/**
 *  进入时加载当日产量最高产品温度走势
 */
function getThisDayMaxProductTemperature() {
    var basePath = $("#path").val();
    $.ajax({
        url: basePath + "/getThisDayMaxProductTemperature.do",
        type: "get",
        dataType: "json",
        success:function (res) {
            var msg = res.message;
            var proDuctList = res.dataList;
            var warehouse1Array = [];
            var mixtureArray = [];
            var dusterArray = [];
            var asphaltArray = [];
            var aggregateArray = [];
            var xData = [];
            if (proDuctList.length === 0){
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.msg('查询温度曲线图失败');
                });
            } else if (msg === 'success'){
                for (var i = 0; i < proDuctList.length;i++){
                    warehouse1Array.push(proDuctList[i].temperature_warehouse_1);
                    mixtureArray.push(proDuctList[i].temperature_mixture);
                    dusterArray.push(proDuctList[i].temperature_duster);
                    asphaltArray.push(proDuctList[i].temperature_asphalt);
                    aggregateArray.push(proDuctList[i].temperature_aggregate);
                    var arr = proDuctList[i].dateTime.split(" ");
                    xData.push(arr[0] + "\n" + arr[1]);
                }
                setLineEchars(warehouse1Array,mixtureArray,dusterArray,asphaltArray,aggregateArray,xData);
            } else {
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.msg('查询本日工程失败');
                });
            }
        }
    })
}

/**
 * 进入时查询预警占比
 */
function getWarningProportion() {
    var basePath = $("#path").val();
    $.ajax({
        url: basePath + "/getWarningProportion.do",
        type: "get",
        dataType: "json",
        success:function (res) {
            var msg = res.message;
            var proDuctList = res.dataList;
            if (msg === 'success'){
                var strHtml = " ";
                for (var i = 0; i < proDuctList.length;i++){

                    strHtml +='<li>'
                        + '<div class="liIn liIn' + (i+1) + '">'
                        + ' <div class="liIn_left"><span class="bot"></span><span class="zi">' + proDuctList[i].proDuctName +'</span></div>'
                        + '<div class="liIn_line"><div class="line_lineIn" style="width:' + proDuctList[i].proportion +'%;"></div></div>'
                        + '<p class="num">' + proDuctList[i].proportion +'%</p>'
                        + '</div>'
                        + '</li>';
                }
                $("#list_ul").empty().append(strHtml);

            } else if (proDuctList.length === 0){
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.msg('报警比例信息查询失败');
                });
            } else {
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.msg('报警比例信息查询失败');
                });
            }
        }
    })
}
/**
 * 进入时查询平均级配曲线
 */
function getProductSvgGrading() {
    var basePath = $("#path").val();
    $.ajax({
        url: basePath + "/getProductSvgGrading.do",
        type: "get",
        dataType: "json",
        success:function (res) {
            var msg = res.message;
            var proDuctList = res.dataList;
            var ration = res.ration;
            if (msg === 'success'){
                setGradingEchar(proDuctList,ration);
            } else if (proDuctList.length === 0){
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.msg('报警比例信息查询失败');
                });
            } else {
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.msg('报警比例信息查询失败');
                });
            }
        }
    })
}

/**
 * 进入时查询基本信息
 */
function getProductBasicMsg() {
    var basePath = $("#path").val();
    $.ajax({
        url: basePath + "/getProductBasicMsg.do",
        type: "get",
        dataType: "json",
        success:function (res) {
            var msg = res.message;
            var proDuctList = res.dataList;
            var ration = res.ration;
            if (msg === 'success'){
                setBasicMsg(proDuctList);
            } else if (proDuctList.length === 0){
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.msg('报警比例信息查询失败');
                });
            } else {
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.msg('报警比例信息查询失败');
                });
            }
        }
    })
}

/**
 * 展示饼图
 * @param barArry
 * @param barNameArray
 */
function setBarEchars(barArry,barNameArray) {

    //获取dom容器
    var myChart = echarts.init(document.getElementById('chartmain_bing'));

//跳转代码
    myChart.on('click', function(params) {
        alert(params.name);
        alert(params.data.z);
    });



    option = {
        tooltip: {},
        animationDurationUpdate: function(idx) {
            // 越往后的数据延迟越大
            return idx * 100;
        },
        animationEasingUpdate: 'bounceIn',
        color: ['#fff', '#fff', '#fff'],
        series: [{
            type: 'graph',
            layout: 'force',
            force: {
                repulsion: 200,
                edgeLength: 10
            },
            roam: true,
            label: {
                normal: {
                    show: true
                }
            },
            data: barArry
        }]
    }

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
}

/**
 * 展示温度线图
 * 
 */
function setLineEchars(warehouse1Array,mixtureArray,dusterArray,asphaltArray,aggregateArray,xData) {
    //获取dom容器
    var myChart = echarts.init(document.getElementById('chartmain'));
    option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross'
            }
        },
        legend: {
            x: '20%',
            top: '2%',
            textStyle: {
                color: '#f2f2f2',
            },
            icon: 'circle',
            data: ['一仓温度','混合料温度','沥青温度','骨料温度','除尘器温度']
        },
        grid: {
            right: '2%',
            bottom: '2%',
            left: '2%',
            top: '5%',
            containLabel: true
        },
        xAxis: [{
            type: 'category',
            data: xData,
            name: '时间',
            nameTextStyle: {
                color: '#d4ffff'
            },
            axisLine: {
                lineStyle: {
                    color: '#0B4CA9'
                }
            },
            axisTick: {
                show: false,
            },
            axisLabel: {
                show: true,
                textStyle: {
                    color: "#FFF",
                    fontSize: 12,
                },
                //interval:0,
                //rotate:30
            },
        }],
        yAxis: [{
            type: 'value',
            name: '吨',
            nameTextStyle: {
                color: '#d4ffff'
            },
            max:250,
            min:50,
            position: 'left',
            axisLine: {
                lineStyle: {
                    color: '#0B4CA9'
                }
            },
            splitLine: {
                lineStyle: {
                    color: "#0B4CA9",
                }

            },
            axisLabel: {
                color: '#d4ffff',
                fontSize: 12,
            }
        }, ],
        series: [{
            name: '一仓温度',
            type: 'line',
            yAxisIndex: 0,
            symbolSize: 12,
            itemStyle: {
                normal: {
                    color: '#FC30EE',
                }
            },
            data: warehouse1Array
        },
            {
                name: '混合料温度',
                type: 'line',
                yAxisIndex: 0,
                symbolSize: 12,
                itemStyle: {
                    normal: {
                        color: '#f198a5',
                    }
                },
                data: mixtureArray
            },
            {
                name: '沥青温度',
                type: 'line',
                yAxisIndex: 0,
                symbolSize: 12,
                itemStyle: {
                    normal: {
                        color: '#7df156',
                    }
                },
                data: asphaltArray
            },
            {
                name: '骨料温度',
                type: 'line',
                yAxisIndex: 0,
                symbolSize: 12,
                itemStyle: {
                    normal: {
                        color: '#f1094d',
                    }
                },
                data: aggregateArray
            },
            {
                name: '除尘器温度',
                type: 'line',
                yAxisIndex: 0,
                symbolSize: 12,
                itemStyle: {
                    normal: {
                        color: '#5471f1',
                    }
                },
                data: dusterArray
            }

        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
}

/**
 * 展示及配图
 *
 */
function setGradingEchar(gradingList,ration) {
    //获取dom容器
    var myChart = echarts.init(document.getElementById('chartmain_zhe'));
    gradingList = JSON.parse(gradingList);
    for (var j = 0;j < gradingList.length;j++) {
        // 指定图表的配置项和数据
        var colors = ['#5793f3', '#d14a61', '#675bba'];
        var option= {
            legend: {
                data:['合成级配','实际级配','上限','中值','下限'],
                x:'left',
                top:'5%',
                left:'35%',
                textStyle:{
                    color : '#96ceb4'
                }
            },
            grid:{
                left: '0.7%',
                right: '2%',
                bottom: '0.7%',
                containLabel: true
            },
            tooltip: {
                trigger: 'item'
            },
            xAxis: {
                type: 'value',
                // name: '筛孔',
                nameGap: 16,
                nameTextStyle: {
                    color: '#96ceb4',
                    fontSize: 14
                },
                min:0,
                max:7,
                splitLine: {
                    show: false
                },
                axisLabel: { //轴标签
                    show: false//不显示
                    // rotate:90
                },
                axisTick: { //轴刻度
                    show: false //不显示
                },
                axisLine: { //轴线
                    lineStyle: { //样式
                        color: '#96ceb4' //颜色
                    }
                },
                // axisLabel:{
                //     interval: 0,
                //     formatter: function (value) {
                //         //x轴的文字改为竖版显示
                //         var str = value.split("");
                //         return str.join("\n");
                //     }
                // }
            },
            yAxis: {
                type: 'value',
                // name: '占比 %',
                nameLocation: 'end',
                nameGap: 20,
                position: 'left',
                offset: 3,
                max:100,
                min:0,
                scale: true,
                nameTextStyle: {
                    color: '#fff',
                    fontSize: 16
                },
                axisLine: {
                    onZero: false,
                    lineStyle: {
                        color: '#96ceb4'
                    }
                },
                splitLine: {
                    show: true,
                    lineStyle: {
                        color: '#96ceb4'
                    }
                }
            },
            series: [
                {
                    type: 'line',
                    markLine: {
                        symbol: ['none', 'none'],
                        silent: true,
                        label: {
                            rotate:90,
                            normal: {
                                position: "start"
                            }
                        },
                        lineStyle: {
                            normal: {
                                type: 'solid',
                                width:0.6,
                                color: '#96ceb4'
                            }
                        },
                        data: []
                    }
                },
                {
                    id: 'a',
                    type: 'line',
                    name:'合成级配',
                    symbolSize:6,
                    lineStyle: {
                        normal: {
                            type: 'solid',
                            width:0.6,
                            color: '#96ceb4'
                        }
                    },
                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                },
                {
                    id: 'b',
                    type: 'line',
                    name:'实际级配',
                    symbolSize:6,
                    lineStyle: {
                        normal: {
                            type: 'solid',
                            color: '#23c6c8'
                        }
                    },
                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                },
                {
                    id: 'c',
                    type: 'line',
                    name:'上限',
                    symbolSize:6,
                    lineStyle: {
                        normal: {
                            type: 'solid',
                            color: '#ed5565'
                        }
                    },
                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                },
                {
                    id: 'd',
                    type: 'line',
                    name:'中值',
                    symbolSize:6,
                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                },
                {
                    id: 'e',
                    type: 'line',
                    name:'下限',
                    symbolSize:6,
                    lineStyle: {
                        normal: {
                            type: 'solid',
                            color: '#ed5565'
                        }
                    },
                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                }
            ]
        };

        var arr = returnJsonArray(gradingList[j][ration]['moudleList']);
        var temArray  = returnArrayToJson(gradingList[j][ration]['moudleList']);

        if(arr.length > 0){
            option.xAxis.max = arr[arr.length - 1][0];
        }
        option.series[0].markLine.data = temArray;
        option.series[1].data = returnJsonArray(gradingList[j][ration]['moudleList']);
        option.series[2].data = returnJsonArray(gradingList[j][ration]['realList']);
        option.series[3].data = returnJsonArray(gradingList[j][ration]['upList']);
        option.series[4].data = returnJsonArray(gradingList[j][ration]['midList']);
        option.series[5].data = returnJsonArray(gradingList[j][ration]['downList']);
        myChart.setOption(option);
        window.addEventListener("resize", function () {
            myChart.resize();
        });
    }

}

function setBasicMsg(proDuctList) {
    for (var i = 0; i < proDuctList.length;i++){
        var svgTotal = proDuctList[i].avgTotal;
        $("#pro_date").empty().append(proDuctList[i].produce_date);
        $("#pro_name").empty().append(proDuctList[i].pro_name);
        $("#pro_total").empty().append((proDuctList[i].total).toFixed(1) + "吨");
        var svgAsphalt = (proDuctList[i].materialAsphalt/svgTotal *100).toFixed(1);
        var svgAdditive = (proDuctList[i].materialAdditive/svgTotal *100).toFixed(1);
        debugger
        $("#asphalt_proportion").empty().append(svgAsphalt + "%" );
        $("#additive_proportion").empty().append(svgAdditive + "%");
        $("#warehouse_1").empty().append((proDuctList[i].warehouse1).toFixed(1) + "℃");
    }
}

//遍历json，返回指定格式数据
function returnJsonArray(jsonArray) {
    var array = new Array();

    for (var i = 0 ; i < jsonArray.length; i++) {

        for (var key in jsonArray[i]){

            var temArray = new Array();


            switch (key) {
                case '0.075':
                    temArray.push(0.312);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
                case '0.15':
                    temArray.push(0.426);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
                case '0.3':
                    temArray.push(0.582);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
                case '0.6':
                    temArray.push(0.795);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
                case '1.18':
                    temArray.push(1.007);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
                case '2.36':
                    temArray.push(1.472);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
                case '4.75':
                    temArray.push(2.016);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
                case '6.7':
                    temArray.push(2.354);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
                case '7.0':
                    temArray.push(2.400);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
                case '7.2':
                    temArray.push(2.431);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
                case '9.5':
                    temArray.push(2.754);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
                case '13.2':
                    temArray.push(3.193);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;

                case '16':
                    temArray.push(3.482);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
                case '19':
                    temArray.push(3.762);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
                case '26.5':
                    temArray.push(4.370);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
                case '31.5':
                    temArray.push(4.723);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
                case '37.5':
                    temArray.push(5.109);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
                case '53':
                    temArray.push(5.969);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
                case '63':
                    temArray.push(6.452);
                    temArray.push(parseFloat(jsonArray[i][key]));
                    break;
            }

            array.push(temArray);
        }
    }
    array.sort(sortNumber);

    return array;
}

//返回筛孔数组，用于X轴
function returnArrayToJson(json) {

    var array = new Array();

    for (var i = 0 ; i < json.length; i++){
        for (var key in json[i]){
            switch (key) {
                case '0.075':
                    array.push({xAxis:0.312,label: {rotate:90, formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}});
                    break;
                case '0.15':
                    array.push({xAxis:0.426,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
                case '0.3':
                    array.push({xAxis:0.582,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
                case '0.6':
                    array.push({xAxis:0.795,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
                case '1.18':
                    array.push({xAxis:1.007,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
                case '2.36':
                    array.push({xAxis:1.472,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
                case '4.75':
                    array.push({xAxis:2.016,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
                case '6.7':
                    array.push({xAxis:2.354,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
                case '7.0':
                    array.push({xAxis:2.400,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
                case '7.2':
                    array.push({xAxis:2.431,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
                case '9.5':
                    array.push({xAxis:2.754,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
                case '13.2':
                    array.push({xAxis:3.193,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
                case '16':
                    array.push({xAxis:3.482,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
                case '19':
                    array.push({xAxis:3.762,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
                case '26.5':
                    array.push({xAxis:4.370,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
                case '31.5':
                    array.push({xAxis:4.723,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
                case '37.5':
                    array.push({xAxis:5.109,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
                case '53':
                    array.push({xAxis:5.969,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
                case '63':
                    array.push({xAxis:6.452,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#96ceb4'}}}});
                    break;
            }

        }
    }

    return array;
}

//排序
function sortNumber(a, b)
{
    return a[0] - b[0]
}