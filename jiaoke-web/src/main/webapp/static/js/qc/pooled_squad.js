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

    getAllSquadTotal(formatwdate,nowformatwdate);

    getAllSquadRegenerate(formatwdate,nowformatwdate);

    geAllSquadProduct(formatwdate,nowformatwdate);

    getAllSquadProductMakeUp(formatwdate,nowformatwdate);
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

    getAllSquadTotal(startDate,endDate);

    getAllSquadRegenerate(startDate,endDate);

    geAllSquadProduct(startDate,endDate);

    getAllSquadProductMakeUp(startDate,endDate);
}

/**
 * 查询日期范围内总产量（图一）
 * @param startDate
 * @param lastDate
 */
function getAllSquadTotal(startDate,lastDate) {
    $.ajax({
        url: basePath + "/getAllSquadTotal.do",
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
                    for (var i = 0;i < list.length;i++ ) {
                        if (list[i].crew === 'crew1') {
                            if (list[i].total > 0 && list[i].produce_people === '王长忠'){
                                $("#crew1_WCZ").html(list[i].total + "吨")
                            }
                            if (list[i].total > 0 && list[i].produce_people === '杜健民'){
                                $("#crew1_DJM").html(list[i].total + "吨")
                            }
                            if (list[i].total > 0 && list[i].produce_people === '王欢'){
                                $("#crew1_WH").html(list[i].total + "吨")
                            }
                        }else {
                            if (list[i].total > 0 && list[i].produce_people === '张德全'){
                                $("#crew2_ZDQ").html(list[i].total + "吨")
                            }
                            if (list[i].total > 0 && list[i].produce_people === '范玉彬'){
                                $("#crew2_FYB").html(list[i].total + "吨")
                            }
                            if (list[i].total > 0 && list[i].produce_people === '赵文明'){
                                    $("#crew2_ZWM").html(list[i].total + "吨")
                            }
                        }

                    }
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
 * 查询所有小组满100吨可添加未添加情况
 * @param startDate
 * @param lastDate
 */
function getAllSquadRegenerate(startDate,lastDate) {
    $.ajax({
        url: basePath + "/getAllSquadRegenerate.do",
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
                    var total = [];
                    var regeneratetotal = [];
                    var xAxis = [];
                    for (var i = 0; i < list.length ; i++) {
                        var produce_people =  list[i].produce_people;
                        if (!xAxis.includes(produce_people)){
                            xAxis.push(produce_people)
                        }
                    }
                    for (var i = 0; i < xAxis.length ; i++){
                        total.push({
                            "name":xAxis[i],
                            "value":0
                        });
                        regeneratetotal.push({
                            "name":xAxis[i],
                            "value":0
                        });
                    }

                    for (var i = 0; i < list.length ; i++) {
                        var producePeople =  list[i].produce_people;
                            for (var j = 0;j < total.length;j++){
                                var pDate = total[j].name;
                                if (producePeople === pDate ){
                                    total[j].value = list[i].total;
                                    regeneratetotal[j].value = list[i].reagenerate;
                                    break
                                }
                            }

                    }

                    init_myChart1(regeneratetotal,total,xAxis);
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
 * 查询所有产品类型的产品总量
 * @param startDate
 * @param lastDate
 */
function geAllSquadProduct(startDate,lastDate) {
    $.ajax({
        url: basePath + "/geAllSquadProduct.do",
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
                            xData.push(list[i].produce_people);
                            totalData.push(list[i].total);
                            regenerateData.push(list[i].reagenerate);
                        }
                        htm += '<li >'
                            + '<div>' + list[i].produce_people + '</div>'
                            + '<div>' + (list[i].crew === "crew1" ? "机组一":"机组二") + '</div>'
                            + '<div>' + list[i].total + '</div>'
                            + '<div>' + list[i].reagenerate + '</div>'
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
function getAllSquadProductMakeUp(startDate,lastDate) {
    $.ajax({
        url: basePath + "/getAllSquadProductMakeUp.do",
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
                    var crew1WCZ = [];
                    var crew1DJM = [];
                    var crew1WH = [];
                    var crew2ZDQ = [];
                    var crew2FYB = [];
                    var crew2ZWM     = [];
                    for (var i = 0;i < list.length;i++){
                        var producePeople = list[i].produce_people;
                        var regeneration_type = list[i].regeneration_type;
                        var proName = '';
                        switch (regeneration_type) {
                            case 1:
                                proName = '无再生类型';
                                break
                            case 2:
                                proName = '可添加再生类型';
                                break
                            case 3:
                                proName = '不可添加再生类型';
                                break
                        }
                        var total = list[i].total;
                        switch (producePeople) {
                            case "王长忠":
                                crew1WCZ.push({"name":proName,"value":total});
                                break;
                            case "杜健民":
                                crew1DJM.push({"name":proName,"value":total});
                                break;
                            case "王欢":
                                crew1WH.push({"name":proName,"value":total});
                                break;
                            case "张德全":
                                crew2ZDQ.push({"name":proName,"value":total});
                                break;
                            case "范玉彬":
                                crew2FYB.push({"name":proName,"value":total});
                                break;
                            case "赵文明":
                                crew2ZWM.push({"name":proName,"value":total});
                                break;
                        }
                    }
                    debugger
                    //更新王长忠生产产品类型占比
                    init_myChart6(crew1WCZ);
                    //更新杜健民生产产品类型占比
                    init_myChart7(crew1DJM);
                    //更新王欢生产产品类型占比
                    init_myChart8(crew1WH);
                    //更新张德全生产产品类型占比
                    init_myChart9(crew2ZDQ);
                    //更新范玉彬生产产品类型占比
                    init_myChart10(crew2FYB);
                    //更新赵文明生产产品类型占比
                    init_myChart11(crew2ZWM);
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
var myChart8 = echarts.init(document.getElementById('main8'));
var myChart9 = echarts.init(document.getElementById('main9'));
var myChart10 = echarts.init(document.getElementById('main10'));
var myChart11 = echarts.init(document.getElementById('main11'));


function init_myChart1(regenerateData,totalData,xData) {

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
                    res += '' + params[i].seriesName + ' : ' + params[i].value + ' 吨 ' + '<br>';
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
                    res += '' + params[i].seriesName + ' : ' + params[i].value + ' 吨' + '<br>';
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



function init_myChart6(seriesData){

    var colorList = ['#73DDFF', '#73ACFF', '#FDD56A', '#FDB36A', '#FD866A', '#9E87FF', '#58D5FF'];
    option = {
        title: {
            text: '品种',
            x: 'center',
            y: 'center',
            textStyle: {
                color: '#fff'
            }
        },
        tooltip: {
            trigger: 'item',
            borderColor: 'rgba(255,255,255,.3)',
            backgroundColor: 'rgba(13,5,30,.6)',
            borderWidth: 1,
            padding: 5,
            formatter: function(parms) {
                var str = parms.marker + "" + parms.data.name + "</br>" +
                    "产量：" + parms.data.value + "吨</br>" +
                    "占比：" + parms.percent + "%";
                return str;
            }
        },
        legend: {
            type: "scroll",
            orient: 'vertical',
            left: 'left',
            align: 'auto',
            top: 'middle',
            textStyle: {
                color: '#fff'
            },
            data: ['无再生类型','可添加再生类型','不可添加再生类型']
        },
        series: [{
            type: 'pie',
            z: 3,
            center: ['50%', '50%'],
            radius: ['25%', '45%'],
            clockwise: true,
            avoidLabelOverlap: true,
            hoverOffset: 15,
            itemStyle: {
                normal: {
                    color: function(params) {
                        return colorList[params.dataIndex]
                    }
                }
            },
            label: {
                show: true,
                position: 'outside',
                formatter: '{a|{b}：{d}%}\n{hr|}',
                rich: {
                    hr: {
                        backgroundColor: 't',
                        borderRadius: 3,
                        width: 3,
                        height: 3,
                        padding: [3, 3, 0, -12]
                    },
                    a: {
                        padding: [-30, 15, -20, 15]
                    }
                }
            },
            labelLine: {
                normal: {
                    length: 20,
                    length2: 30,
                    lineStyle: {
                        width: 1
                    }
                }
            },
            data: seriesData
        }, {
            name:'第一层环',
            type: 'pie',
            z: 2,
            tooltip:{
                show:false
            },
            center: ['50%', '50%'],
            radius: ['45%', '58%'],
            hoverAnimation: false,
            clockWise: false,
            itemStyle: {
                normal: {
                    // shadowBlur: 40,
                    // shadowColor: 'rgba(0, 255, 255,.3)',
                    color: 'rgba(1,15,80,.4)',
                },
                emphasis:{
                    color: 'rgba(1,15,80,.4)',
                }
            },
            label: {
                show: false
            },
            data: [100]
        }, {
            name:'第二层环',
            type: 'pie',
            z: 1,
            tooltip:{
                show:false
            },
            center: ['50%', '50%'],
            radius: ['58%', '76%'],
            hoverAnimation: false,
            clockWise: false,
            itemStyle: {
                normal: {
                    // shadowBlur: 40,
                    // shadowColor: 'rgba(0, 255, 255,.3)',
                    color: 'rgba(0,15,69,.2)',
                },
                emphasis:{
                    color: 'rgba(0,15,69,.2)',
                }
            },
            label: {
                show: false
            },
            data: [100]
        }]
    };

// 使用刚指定的配置项和数据显示图表。
    myChart6.setOption(option);
}
function init_myChart7(seriesData){
    var colorList = ['#73DDFF', '#73ACFF', '#FDD56A', '#FDB36A', '#FD866A', '#9E87FF', '#58D5FF'];
    option = {
        title: {
            text: '品种',
            x: 'center',
            y: 'center',
            textStyle: {
                color: '#fff'
            }
        },
        tooltip: {
            trigger: 'item',
            borderColor: 'rgba(255,255,255,.3)',
            backgroundColor: 'rgba(13,5,30,.6)',
            borderWidth: 1,
            padding: 5,
            formatter: function(parms) {
                var str = parms.marker + "" + parms.data.name + "</br>" +
                    "产量：" + parms.data.value + "吨</br>" +
                    "占比：" + parms.percent + "%";
                return str;
            }
        },
        legend: {
            type: "scroll",
            orient: 'vertical',
            left: 'left',
            align: 'auto',
            top: 'middle',
            textStyle: {
                color: '#fff'
            },
            data:  ['无再生类型','可添加再生类型','不可添加再生类型']
        },
        series: [{
            type: 'pie',
            z: 3,
            center: ['50%', '50%'],
            radius: ['25%', '45%'],
            clockwise: true,
            avoidLabelOverlap: true,
            hoverOffset: 15,
            itemStyle: {
                normal: {
                    color: function(params) {
                        return colorList[params.dataIndex]
                    }
                }
            },
            label: {
                show: true,
                position: 'outside',
                formatter: '{a|{b}：{d}%}\n{hr|}',
                rich: {
                    hr: {
                        backgroundColor: 't',
                        borderRadius: 3,
                        width: 3,
                        height: 3,
                        padding: [3, 3, 0, -12]
                    },
                    a: {
                        padding: [-30, 15, -20, 15]
                    }
                }
            },
            labelLine: {
                normal: {
                    length: 20,
                    length2: 30,
                    lineStyle: {
                        width: 1
                    }
                }
            },
            data: seriesData
        }, {
            name:'第一层环',
            type: 'pie',
            z: 2,
            tooltip:{
                show:false
            },
            center: ['50%', '50%'],
            radius: ['45%', '58%'],
            hoverAnimation: false,
            clockWise: false,
            itemStyle: {
                normal: {
                    // shadowBlur: 40,
                    // shadowColor: 'rgba(0, 255, 255,.3)',
                    color: 'rgba(1,15,80,.4)',
                },
                emphasis:{
                    color: 'rgba(1,15,80,.4)',
                }
            },
            label: {
                show: false
            },
            data: [100]
        }, {
            name:'第二层环',
            type: 'pie',
            z: 1,
            tooltip:{
                show:false
            },
            center: ['50%', '50%'],
            radius: ['58%', '76%'],
            hoverAnimation: false,
            clockWise: false,
            itemStyle: {
                normal: {
                    // shadowBlur: 40,
                    // shadowColor: 'rgba(0, 255, 255,.3)',
                    color: 'rgba(0,15,69,.2)',
                },
                emphasis:{
                    color: 'rgba(0,15,69,.2)',
                }
            },
            label: {
                show: false
            },
            data: [100]
        }]
    };


// 使用刚指定的配置项和数据显示图表。
    myChart7.setOption(option);
}
function init_myChart8(seriesData){

    var colorList = ['#73DDFF', '#73ACFF', '#FDD56A', '#FDB36A', '#FD866A', '#9E87FF', '#58D5FF'];
    option = {
        title: {
            text: '品种',
            x: 'center',
            y: 'center',
            textStyle: {
                color: '#fff'
            }
        },
        tooltip: {
            trigger: 'item',
            borderColor: 'rgba(255,255,255,.3)',
            backgroundColor: 'rgba(13,5,30,.6)',
            borderWidth: 1,
            padding: 5,
            formatter: function(parms) {
                var str = parms.marker + "" + parms.data.name + "</br>" +
                    "产量：" + parms.data.value + "吨</br>" +
                    "占比：" + parms.percent + "%";
                return str;
            }
        },
        legend: {
            type: "scroll",
            orient: 'vertical',
            left: 'left',
            align: 'auto',
            top: 'middle',
            textStyle: {
                color: '#fff'
            },
            data:  ['无再生类型','可添加再生类型','不可添加再生类型']
        },
        series: [{
            type: 'pie',
            z: 3,
            center: ['50%', '50%'],
            radius: ['25%', '45%'],
            clockwise: true,
            avoidLabelOverlap: true,
            hoverOffset: 15,
            itemStyle: {
                normal: {
                    color: function(params) {
                        return colorList[params.dataIndex]
                    }
                }
            },
            label: {
                show: true,
                position: 'outside',
                formatter: '{a|{b}：{d}%}\n{hr|}',
                rich: {
                    hr: {
                        backgroundColor: 't',
                        borderRadius: 3,
                        width: 3,
                        height: 3,
                        padding: [3, 3, 0, -12]
                    },
                    a: {
                        padding: [-30, 15, -20, 15]
                    }
                }
            },
            labelLine: {
                normal: {
                    length: 20,
                    length2: 30,
                    lineStyle: {
                        width: 1
                    }
                }
            },
            data: seriesData
        }, {
            name:'第一层环',
            type: 'pie',
            z: 2,
            tooltip:{
                show:false
            },
            center: ['50%', '50%'],
            radius: ['45%', '58%'],
            hoverAnimation: false,
            clockWise: false,
            itemStyle: {
                normal: {
                    // shadowBlur: 40,
                    // shadowColor: 'rgba(0, 255, 255,.3)',
                    color: 'rgba(1,15,80,.4)',
                },
                emphasis:{
                    color: 'rgba(1,15,80,.4)',
                }
            },
            label: {
                show: false
            },
            data: [100]
        }, {
            name:'第二层环',
            type: 'pie',
            z: 1,
            tooltip:{
                show:false
            },
            center: ['50%', '50%'],
            radius: ['58%', '76%'],
            hoverAnimation: false,
            clockWise: false,
            itemStyle: {
                normal: {
                    // shadowBlur: 40,
                    // shadowColor: 'rgba(0, 255, 255,.3)',
                    color: 'rgba(0,15,69,.2)',
                },
                emphasis:{
                    color: 'rgba(0,15,69,.2)',
                }
            },
            label: {
                show: false
            },
            data: [100]
        }]
    };


// 使用刚指定的配置项和数据显示图表。
    myChart8.setOption(option);
}
function init_myChart9(seriesData){

    var colorList = ['#73DDFF', '#73ACFF', '#FDD56A', '#FDB36A', '#FD866A', '#9E87FF', '#58D5FF'];
    option = {
        title: {
            text: '品种',
            x: 'center',
            y: 'center',
            textStyle: {
                color: '#fff'
            }
        },
        tooltip: {
            trigger: 'item',
            borderColor: 'rgba(255,255,255,.3)',
            backgroundColor: 'rgba(13,5,30,.6)',
            borderWidth: 1,
            padding: 5,
            formatter: function(parms) {
                var str = parms.marker + "" + parms.data.name + "</br>" +
                    "产量：" + parms.data.value + "吨</br>" +
                    "占比：" + parms.percent + "%";
                return str;
            }
        },
        legend: {
            type: "scroll",
            orient: 'vertical',
            left: 'left',
            align: 'auto',
            top: 'middle',
            textStyle: {
                color: '#fff'
            },
            data:  ['无再生类型','可添加再生类型','不可添加再生类型']
        },
        series: [{
            type: 'pie',
            z: 3,
            center: ['50%', '50%'],
            radius: ['25%', '45%'],
            clockwise: true,
            avoidLabelOverlap: true,
            hoverOffset: 15,
            itemStyle: {
                normal: {
                    color: function(params) {
                        return colorList[params.dataIndex]
                    }
                }
            },
            label: {
                show: true,
                position: 'outside',
                formatter: '{a|{b}：{d}%}\n{hr|}',
                rich: {
                    hr: {
                        backgroundColor: 't',
                        borderRadius: 3,
                        width: 3,
                        height: 3,
                        padding: [3, 3, 0, -12]
                    },
                    a: {
                        padding: [-30, 15, -20, 15]
                    }
                }
            },
            labelLine: {
                normal: {
                    length: 20,
                    length2: 30,
                    lineStyle: {
                        width: 1
                    }
                }
            },
            data: seriesData
        }, {
            name:'第一层环',
            type: 'pie',
            z: 2,
            tooltip:{
                show:false
            },
            center: ['50%', '50%'],
            radius: ['45%', '58%'],
            hoverAnimation: false,
            clockWise: false,
            itemStyle: {
                normal: {
                    // shadowBlur: 40,
                    // shadowColor: 'rgba(0, 255, 255,.3)',
                    color: 'rgba(1,15,80,.4)',
                },
                emphasis:{
                    color: 'rgba(1,15,80,.4)',
                }
            },
            label: {
                show: false
            },
            data: [100]
        }, {
            name:'第二层环',
            type: 'pie',
            z: 1,
            tooltip:{
                show:false
            },
            center: ['50%', '50%'],
            radius: ['58%', '76%'],
            hoverAnimation: false,
            clockWise: false,
            itemStyle: {
                normal: {
                    // shadowBlur: 40,
                    // shadowColor: 'rgba(0, 255, 255,.3)',
                    color: 'rgba(0,15,69,.2)',
                },
                emphasis:{
                    color: 'rgba(0,15,69,.2)',
                }
            },
            label: {
                show: false
            },
            data: [100]
        }]
    };


// 使用刚指定的配置项和数据显示图表。
    myChart9.setOption(option);
}
function init_myChart10(seriesData){

    var colorList = ['#73DDFF', '#73ACFF', '#FDD56A', '#FDB36A', '#FD866A', '#9E87FF', '#58D5FF'];
    option = {
        title: {
            text: '品种',
            x: 'center',
            y: 'center',
            textStyle: {
                color: '#fff'
            }
        },
        tooltip: {
            trigger: 'item',
            borderColor: 'rgba(255,255,255,.3)',
            backgroundColor: 'rgba(13,5,30,.6)',
            borderWidth: 1,
            padding: 5,
            formatter: function(parms) {
                var str = parms.marker + "" + parms.data.name + "</br>" +
                    "产量：" + parms.data.value + "吨</br>" +
                    "占比：" + parms.percent + "%";
                return str;
            }
        },
        legend: {
            type: "scroll",
            orient: 'vertical',
            left: 'left',
            align: 'auto',
            top: 'middle',
            textStyle: {
                color: '#fff'
            },
            data:  ['无再生类型','可添加再生类型','不可添加再生类型']
        },
        series: [{
            type: 'pie',
            z: 3,
            center: ['50%', '50%'],
            radius: ['25%', '45%'],
            clockwise: true,
            avoidLabelOverlap: true,
            hoverOffset: 15,
            itemStyle: {
                normal: {
                    color: function(params) {
                        return colorList[params.dataIndex]
                    }
                }
            },
            label: {
                show: true,
                position: 'outside',
                formatter: '{a|{b}：{d}%}\n{hr|}',
                rich: {
                    hr: {
                        backgroundColor: 't',
                        borderRadius: 3,
                        width: 3,
                        height: 3,
                        padding: [3, 3, 0, -12]
                    },
                    a: {
                        padding: [-30, 15, -20, 15]
                    }
                }
            },
            labelLine: {
                normal: {
                    length: 20,
                    length2: 30,
                    lineStyle: {
                        width: 1
                    }
                }
            },
            data: seriesData
        }, {
            name:'第一层环',
            type: 'pie',
            z: 2,
            tooltip:{
                show:false
            },
            center: ['50%', '50%'],
            radius: ['45%', '58%'],
            hoverAnimation: false,
            clockWise: false,
            itemStyle: {
                normal: {
                    // shadowBlur: 40,
                    // shadowColor: 'rgba(0, 255, 255,.3)',
                    color: 'rgba(1,15,80,.4)',
                },
                emphasis:{
                    color: 'rgba(1,15,80,.4)',
                }
            },
            label: {
                show: false
            },
            data: [100]
        }, {
            name:'第二层环',
            type: 'pie',
            z: 1,
            tooltip:{
                show:false
            },
            center: ['50%', '50%'],
            radius: ['58%', '76%'],
            hoverAnimation: false,
            clockWise: false,
            itemStyle: {
                normal: {
                    // shadowBlur: 40,
                    // shadowColor: 'rgba(0, 255, 255,.3)',
                    color: 'rgba(0,15,69,.2)',
                },
                emphasis:{
                    color: 'rgba(0,15,69,.2)',
                }
            },
            label: {
                show: false
            },
            data: [100]
        }]
    };


// 使用刚指定的配置项和数据显示图表。
    myChart10.setOption(option);
}
function init_myChart11(seriesData){

    var colorList = ['#73DDFF', '#73ACFF', '#FDD56A', '#FDB36A', '#FD866A', '#9E87FF', '#58D5FF'];
    option = {
        title: {
            text: '品种',
            x: 'center',
            y: 'center',
            textStyle: {
                color: '#fff'
            }
        },
        tooltip: {
            trigger: 'item',
            borderColor: 'rgba(255,255,255,.3)',
            backgroundColor: 'rgba(13,5,30,.6)',
            borderWidth: 1,
            padding: 5,
            formatter: function(parms) {
                var str = parms.marker + "" + parms.data.name + "</br>" +
                    "产量：" + parms.data.value + "吨</br>" +
                    "占比：" + parms.percent + "%";
                return str;
            }
        },
        legend: {
            type: "scroll",
            orient: 'vertical',
            left: 'left',
            align: 'auto',
            top: 'middle',
            textStyle: {
                color: '#fff'
            },
            data:  ['无再生类型','可添加再生类型','不可添加再生类型']
        },
        series: [{
            type: 'pie',
            z: 3,
            center: ['50%', '50%'],
            radius: ['25%', '45%'],
            clockwise: true,
            avoidLabelOverlap: true,
            hoverOffset: 15,
            itemStyle: {
                normal: {
                    color: function(params) {
                        return colorList[params.dataIndex]
                    }
                }
            },
            label: {
                show: true,
                position: 'outside',
                formatter: '{a|{b}：{d}%}\n{hr|}',
                rich: {
                    hr: {
                        backgroundColor: 't',
                        borderRadius: 3,
                        width: 3,
                        height: 3,
                        padding: [3, 3, 0, -12]
                    },
                    a: {
                        padding: [-30, 15, -20, 15]
                    }
                }
            },
            labelLine: {
                normal: {
                    length: 20,
                    length2: 30,
                    lineStyle: {
                        width: 1
                    }
                }
            },
            data: seriesData
        }, {
            name:'第一层环',
            type: 'pie',
            z: 2,
            tooltip:{
                show:false
            },
            center: ['50%', '50%'],
            radius: ['45%', '58%'],
            hoverAnimation: false,
            clockWise: false,
            itemStyle: {
                normal: {
                    // shadowBlur: 40,
                    // shadowColor: 'rgba(0, 255, 255,.3)',
                    color: 'rgba(1,15,80,.4)',
                },
                emphasis:{
                    color: 'rgba(1,15,80,.4)',
                }
            },
            label: {
                show: false
            },
            data: [100]
        }, {
            name:'第二层环',
            type: 'pie',
            z: 1,
            tooltip:{
                show:false
            },
            center: ['50%', '50%'],
            radius: ['58%', '76%'],
            hoverAnimation: false,
            clockWise: false,
            itemStyle: {
                normal: {
                    // shadowBlur: 40,
                    // shadowColor: 'rgba(0, 255, 255,.3)',
                    color: 'rgba(0,15,69,.2)',
                },
                emphasis:{
                    color: 'rgba(0,15,69,.2)',
                }
            },
            label: {
                show: false
            },
            data: [100]
        }]
    };


// 使用刚指定的配置项和数据显示图表。
    myChart11.setOption(option);
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