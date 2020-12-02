
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

    getProductTotalAndReagenerateTotal(formatwdate,nowformatwdate);

    getTwoCrewMoreThan100Regenerate(formatwdate,nowformatwdate);

    getwoCrewMoreThan100Product(formatwdate,nowformatwdate);

    getTwoCrewMoreThan100RegenerateProduct(formatwdate,nowformatwdate);

    getRegenerateTypeTotal(formatwdate,nowformatwdate);
    //获取两个机组每日连续生产100吨未添加产品
    getTwoCrewContinuousThanProduct(formatwdate,nowformatwdate);
})
function showProductStatement() {
    layui.use('layer', function(){
        var layer = layui.layer;
        //执行一个laydate实例
            layer.open({
                type: 1,
                shadeClose: false,
                shade: false,
                scrollbar:false,
                maxmin: true, //开启最大化最小化按钮
                title: '再生料统计',
                area: ['90%', '100%'],
                content: $('#productStatement').html()//捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
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

    getProductTotalAndReagenerateTotal(startDate,endDate);

    getTwoCrewMoreThan100Regenerate(startDate,endDate);

    getwoCrewMoreThan100Product(startDate,endDate);

    getTwoCrewMoreThan100RegenerateProduct(startDate,endDate);


    getRegenerateTypeTotal(startDate,endDate);

    //获取两个机组每日连续生产100吨未添加产品
    getTwoCrewContinuousThanProduct(startDate,endDate);
}

/**
 * 查询日期范围内总产量（图一）
 * @param startDate
 * @param lastDate
 */
function getProductTotalAndReagenerateTotal(startDate,lastDate) {
    $.ajax({
        url: basePath + "/getProductTotalAndReagenerateTotal.do",
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
                    var total = 0 ;
                    var regenerateTotal = 0 ;
                    var crew1Proportion = 0;
                    var crew2Proportion = 0;
                    var totalProportion = 0;
                    for (var i = 0;i < list.length;i++ ) {
                        if (list[i].crew === 'crew1') {
                            if (list[i].total > 0 ){
                                $("#crew1_total").html(list[i].total + "吨")
                                $("#crew1_accumulative_total").html((list[i].total/10000))
                                total += list[i].total;

                            }
                            if (list[i].reagenerate > 0 ){
                                $("#crew1_regenerate_total").html(list[i].reagenerate+ "吨");
                                $("#crew1_regenerate_accumulative_total").html((list[i].reagenerate/10000))
                                regenerateTotal += list[i].reagenerate;
                            }
                            crew1Proportion = ((list[i].reagenerate/list[i].total)*100).toFixed(2);
                        }else {
                            if (list[i].total > 0 ){
                                $("#crew2_total").html(list[i].total + "吨")
                                $("#crew2_accumulative_total").html((list[i].total/10000));
                                total += list[i].total;
                            }
                            if (list[i].reagenerate > 0 ){
                                $("#crew2_regenerate_total").html(list[i].reagenerate + "吨");
                                $("#crew2_regenerate_accumulative_total").html((list[i].reagenerate/10000))
                                regenerateTotal += list[i].reagenerate;
                            }
                            crew2Proportion = ((list[i].reagenerate/list[i].total)*100).toFixed(2);
                        }

                    }
                    totalProportion = ((regenerateTotal/total)*100).toFixed(2);
                    $("#accumulative_total").html((total/10000) );
                    $("#regenerate_total").html((regenerateTotal/10000));
                    $("#crew1_comprehensive_proportion").html(crew1Proportion );
                    $("#crew2_comprehensive_proportion").html(crew2Proportion );
                    $("#total_comprehensive_proportion").html(totalProportion );
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
 * 查询两台机组满100吨可添加未添加情况
 * @param startDate
 * @param lastDate
 */
function getTwoCrewMoreThan100Regenerate(startDate,lastDate) {
    $.ajax({
        url: basePath + "/getTwoCrewMoreThan100Regenerate.do",
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
                    var crew1total = [];
                    var crew1regeneratetotal = [];
                    var crew2total = [];
                    var crew2regeneratetotal = [];
                    var xAxis = [];
                    for (var i = 0; i < list.length ; i++) {
                        var product_date =  list[i].produce_date;
                        if (!xAxis.includes(product_date)){
                            xAxis.push(product_date)
                        }
                    }
                    for (var i = 0; i < xAxis.length ; i++){
                        crew1total.push({
                            "name":xAxis[i],
                            "value":0
                        });
                        crew1regeneratetotal.push({
                            "name":xAxis[i],
                            "value":0
                        });
                        crew2total.push({
                            "name":xAxis[i],
                            "value":0
                        });
                        crew2regeneratetotal.push({
                            "name":xAxis[i],
                            "value":0
                        });
                    }

                    for (var i = 0; i < list.length ; i++) {
                        var date =  list[i].produce_date;
                        var crewNum =  list[i].crew;
                        //定义机组一数组
                        if (crewNum === 'crew1'){
                            for (var j = 0;j < crew1total.length;j++){
                                var pDate = crew1total[j].name;
                                if (date === pDate ){
                                    crew1total[j].value = list[i].total;
                                    crew1regeneratetotal[j].value = list[i].reagenerate;
                                    break
                                }
                            }
                        } else {
                            //定义机组二数组
                            for (var k = 0;k < crew2total.length;k++){
                                var p2Date = crew2total[k].name;
                                if (date === p2Date){
                                    crew2total[k].value = list[i].total;
                                    crew2regeneratetotal[k].value = list[i].reagenerate;
                                    break
                                }
                            }
                        }
                    }
                    init_myChart1(crew1total,crew1regeneratetotal,crew2total,crew2regeneratetotal,xAxis);
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
function getwoCrewMoreThan100Product(startDate,lastDate) {
    $.ajax({
        url: basePath + "/getwoCrewMoreThan100Product.do",
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
                    for (var i = 0;i < list.length;i++){
                        if (i < 10){
                            xData.push(list[i].pro_name);
                            totalData.push(list[i].total);
                            regenerateData.push(list[i].reagenerate);
                        }
                    }

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
function getTwoCrewMoreThan100RegenerateProduct(startDate,lastDate) {
    $.ajax({
        url: basePath + "/getTwoCrewMoreThan100RegenerateProduct.do",
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
                    //取出一二号机组所有日期
                    //取出一二号机组每种产品生产总量
                    var crew1_xData = [];
                    var crew1_totalData = [];
                    var crew1_regenerateData = [];
                    var crew2_xData = [];
                    var crew2_totalData = [];
                    var crew2_regenerateData = [];
                    for (var i = 0;i < list.length;i++){
                        var crewNum = list[i].crew;
                        if ( crewNum === 'crew1'){
                            crew1_xData.push(list[i].produce_date);
                            crew1_totalData.push(list[i].total);
                            crew1_regenerateData.push(list[i].reagenerate);
                        }else {
                            crew2_xData.push(list[i].produce_date);
                            crew2_totalData.push(list[i].total);
                            crew2_regenerateData.push(list[i].reagenerate);
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


/**
 * 查询除去不可添加后产品总量
 * @param startDate
 * @param lastDate
 */
function getRegenerateTypeTotal(startDate,lastDate) {
    $.ajax({
        url: basePath + "/getRegenerateTypeTotal.do",
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
                    var twoTotal = 0;
                    var twoReagenerateTotal = 0;
                    for (var i =0; i < list.length;i++){
                        var crew = list[i].crew;
                        var reagenerate = list[i].reagenerate;
                        var material_total = list[i].total;
                        if (crew === "crew1"){
                            $("#pelco-d_crew1_mixture").html(material_total/10000 );
                            $("#pelco-d_crew1_proportion").html(((reagenerate/material_total)*100).toFixed(2) );
                        } else {
                            $("#pelco-d_crew2_mixture").html(material_total/10000 );
                            $("#pelco-d_crew2_proportion").html(((reagenerate/material_total)*100).toFixed(2) );
                        }
                        twoTotal += material_total;
                        twoReagenerateTotal += reagenerate;
                    }
                    $("#pelco-d_total_mixture").html(twoTotal/10000);
                    $("#pelco-d_total_proportion").html(((twoReagenerateTotal/twoTotal)*100).toFixed(2) );
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
 * 查询两个机组每日连续生产100吨以上可添加未添加产品
 * @param startDate
 * @param lastDate
 */
function getTwoCrewContinuousThanProduct(startDate,lastDate) {
    $.ajax({
        url: basePath + "/getTwoCrewContinuousThanProduct.do",
        type: "post",
        data:{
            "startDate":  startDate,
            "lastDate":lastDate
        },
        dataType: "json",
        success:function (res) {
            if (res.message === 'success') {
                var map = res.body;
             if (map){
                var crew1Prodate = map.crew1;
                var crew2Prodate = map.crew2;
                var crew1Data = [];
                 var crew1Date = [];
                var crew1Type = [];
                 var crew2Data = [];
                 var crew2Date = [];
                 var crew2Type = [];
                for (var key in crew1Prodate) {
                    if (crew1Prodate[key].length > 0) {
                        crew1Date.push(key);
                        var total = 0;
                        for (var i = 0 ; i < crew1Prodate[key].length;i++){
                            for (var proName in crew1Prodate[key][i]){
                                var temTotal = crew1Prodate[key][i][proName].toFixed(2);
                                crew1Type.push({"proDate":key,"proType":proName,"total":temTotal});
                                total += Number(temTotal);
                            }
                        }
                        crew1Data.push({"adate":key,"total":total.toFixed(2)});
                    }
                }
                 for (var key in crew2Prodate) {
                     if (crew2Prodate[key].length > 0) {
                         crew2Date.push(key);
                         var total = 0;
                         for (var i = 0 ; i < crew2Prodate[key].length;i++){
                             for (var proName in crew2Prodate[key][i]){
                                 var temTotal = crew2Prodate[key][i][proName].toFixed(2);
                                 crew2Type.push({"proDate":key,"proType":proName,"total":temTotal});
                                 total += Number(temTotal);
                             }
                         }
                         crew2Data.push({"adate":key,"total":total.toFixed(2)});
                     }
                 }
                 crew1Date.sort(function(key1, key2) {
                     return Date.parse(key1) - Date.parse(key2)
                 })
                 crew2Date.sort(function(key1, key2) {
                     return Date.parse(key1) - Date.parse(key2)
                 })

                 var crew1ChartData = [];
                 var crew1TypeSoft = [];
                for (var i = 0; i < crew1Date.length;i++){
                    var date = crew1Date[i];
                    for (var j = 0; j < crew1Data.length;j++){
                        if (crew1Data[j].adate === date){
                            crew1ChartData.push(crew1Data[j].total);
                            break;
                        }
                    }
                    for (var k = 0; k < crew1Type.length;k++){
                        if (date === crew1Type[k].proDate){
                            crew1TypeSoft.push(crew1Type[k]);
                        }
                    }
                }
                 var crew2ChartData = [];
                 var crew2TypeSoft = [];
                 for (var i = 0; i < crew2Date.length;i++){
                     var date = crew2Date[i];
                     for (var j = 0; j < crew2Data.length;j++){
                         if (crew2Data[j].adate === date){
                             crew2ChartData.push(crew2Data[j].total);
                             break;
                         }
                     }
                     for (var k = 0; k < crew2Type.length;k++){
                         if (date === crew2Type[k].proDate){
                             crew2TypeSoft.push(crew2Type[k]);
                         }
                     }
                 }

                 init_myChart8(crew1ChartData,crew1Date);
                 init_myChart9(crew2ChartData,crew2Date);

                 //更新talle
                 var htm = "";
                 var crew1Html = "";
                 var crew2Html = "";
                 for (var i = 0; i < crew1TypeSoft.length;i++){
                     htm += '<li >'
                         + '<div>' + crew1TypeSoft[i].proDate + '</div>'
                         + '<div>' + crew1TypeSoft[i].proType + '</div>'
                         + '<div>' + "机组一" + '</div>'
                         + '<div>' + crew1TypeSoft[i].total + '</div>'
                         + '</li>';
                     crew1Html += '<tr >'
                         + '<th>' + crew1TypeSoft[i].proDate + '</th>'
                         + '<th>' + crew1TypeSoft[i].proType + '</th>'
                         + '<th>' + crew1TypeSoft[i].total + '</th>'
                         + '</tr>';
                 }
                 for (var i = 0; i < crew2TypeSoft.length;i++){
                     htm += '<li >'
                         + '<div>' + crew2TypeSoft[i].proDate + '</div>'
                         + '<div>' + crew2TypeSoft[i].proType + '</div>'
                         + '<div>' + "机组二" + '</div>'
                         + '<div>' + crew2TypeSoft[i].total + '</div>'
                         + '</li>';
                     crew2Html += '<tr >'
                         + '<th>' + crew2TypeSoft[i].proDate + '</th>'
                         + '<th>' + crew2TypeSoft[i].proType + '</th>'
                         + '<th>' + crew2TypeSoft[i].total + '</th>'
                         + '</tr>';
                 }
                 $("#maquee").append(htm);

                 //更新报告
                 $("#crew1Body").html(crew1Html);
                 $("#crew2Body").html(crew2Html);
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
var myChart8= echarts.init(document.getElementById('main8'));
var myChart9 = echarts.init(document.getElementById('main9'));

getNowFormatDate();
init_myChart6();
init_myChart7();

function init_myChart1(crew1total,crew1regeneratetotal,crew2total,crew2regeneratetotal,xAxis) {

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
            left: '7%',
            right: '10%',
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
            name: '一号机组可添加类型产品总生产',
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
            data: crew1total
        }, {
            name: '一号机组可添加类型产品再生料使用量',
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
            data: crew1regeneratetotal
        },  {
            name: '二号机组可添加类型产品总生产',
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
            data: crew2total
        },  {
            name: '二号机组可添加类型再生使用量',
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
            data: crew2regeneratetotal,
            markLine: {
                data: [{name: '100吨的水平线',yAxis: 100}],
                silent: true,
                lineStyle:{
                    color: {
                        type: 'linear',
                        x: 0,
                        y: 0,
                        x2: 0,
                        y2: 1,
                        colorStops: [{
                            offset: 0, color: 'red' // 0% 处的颜色
                        }, {
                            offset: 1, color: 'blue' // 100% 处的颜色
                        }],
                        global: false // 缺省为 false
                    }
                }
            }
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
function init_myChart8(crew1total,xAxis) {
    var fontColor = '#30eee9';
    option = {
        grid: {
            left: '5%',
            right: '5%',
            top: '7%',
            bottom: '7%',
            containLabel: true
        },
        tooltip: {
            show: true,
            trigger: 'item'
        },
        legend: {
            show:true,
            x:'center',
            y:'35',
            icon: 'stack',
            itemWidth:10,
            itemHeight:10,
            textStyle:{
                color:'#1bb4f6'
            },
            data:['未添加']
        },
        xAxis: [{
            type: 'category',
            boundaryGap: false,
            axisLabel: {
                color: fontColor,
                interval: 0,
                rotate:40,
                fontSize:10
            },
            axisLine: {
                show: true,
                lineStyle: {
                    color: '#397cbc'
                }
            },
            axisTick: {
                show: false,
            },
            splitLine: {
                show: false,
                lineStyle: {
                    color: '#195384'
                }
            },
            data: xAxis
        }],
        yAxis: [{
            type: 'value',
            name: '',
            axisLabel: {
                formatter: '{value}',
                textStyle: {
                    color: '#2ad1d2'
                }
            },
            axisLine: {
                lineStyle: {
                    color: '#27b4c2'
                }
            },
            axisTick: {
                show: false,
            },
            splitLine: {
                show: true,
                lineStyle: {
                    color: '#11366e'
                }
            }
        },

        ],
        series: [{
            name: '二号机组连续生产超过一百吨可添加未添加',
            type: 'line',
            stack: '总量',
            symbol: 'circle',
            symbolSize: 8,
            itemStyle: {
                normal: {
                    color: '#0092f6',
                    lineStyle: {
                        color: "#0092f6",
                        width: 1
                    },
                    label: {
                        show: true,
                        position: 'top',
                        textStyle: {
                            color: '#6c50f3',
                        }
                    },
                }
            },
            markPoint: {
                itemStyle: {
                    normal: {
                        color: 'red'
                    }

                }
            },

            data: crew1total
        }
        ]
    };
    myChart8.setOption(option);
}
function init_myChart9(crew1total,xAxis) {

    var fontColor = '#30eee9';
    option = {
        grid: {
            left: '5%',
            right: '5%',
            top: '7%',
            bottom: '7%',
            containLabel: true
        },
        tooltip: {
            show: true,
            trigger: 'item'
        },
        legend: {
            show:true,
            x:'center',
            y:'35',
            icon: 'stack',
            itemWidth:10,
            itemHeight:10,
            textStyle:{
                color:'#1bb4f6'
            },
            data:['未添加']
        },
        xAxis: [{
            type: 'category',
            boundaryGap: false,
            axisLabel: {
                color: fontColor,
                interval: 0,
                rotate:40,
                fontSize:10
            },
            axisLine: {
                show: true,
                lineStyle: {
                    color: '#397cbc'
                }
            },
            axisTick: {
                show: false,
            },
            splitLine: {
                show: false,
                lineStyle: {
                    color: '#195384'
                }
            },
            data: xAxis
        }],
        yAxis: [{
            type: 'value',
            name: '',
            axisLabel: {
                formatter: '{value}',
                textStyle: {
                    color: '#2ad1d2'
                }
            },
            axisLine: {
                lineStyle: {
                    color: '#27b4c2'
                }
            },
            axisTick: {
                show: false,
            },
            splitLine: {
                show: true,
                lineStyle: {
                    color: '#11366e'
                }
            }
        },

        ],
        series: [{
            name: '二号机组连续生产超过一百吨可添加未添加',
            type: 'line',
            stack: '总量',
            symbol: 'circle',
            symbolSize: 8,
            itemStyle: {
                normal: {
                    color: '#0092f6',
                    lineStyle: {
                        color: "#0092f6",
                        width: 1
                    },
                    label: {
                        show: true,
                        position: 'top',
                        textStyle: {
                            color: '#6c50f3',
                        }
                    },
                }
            },
            markPoint: {
                itemStyle: {
                    normal: {
                        color: 'red'
                    }

                }
            },

            data: crew1total
        }
        ]
    };
    myChart9.setOption(option);
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


setInterval(function (){
    window.onresize = function () {
        this.myChart1.resize;
        this.myChart5.resize;
        this.myChart6.resize;
        this.myChart7.resize;
        this.myChart8.resize;
        this.myChart9.resize;
    }
},200)

function isBlank(s) {
    if (s == "undefined" || s == null || s == "" || s.length == 0) {
        return true;
    }
    return false;
};

