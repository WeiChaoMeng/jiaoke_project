(function () {
    /**
     * 左一、右一图表级配图
     */
    getRealTimeData();


})();

/**
 * 定时调用
 */
setInterval(getRealTimeData(),40000);


/**
 * 展示基本信息
 */
function  getRealTimeData() {
    var basePath = $("#path").val();
    $.ajax({
        url:basePath + "/getRealTimeData.do",
        // url:"http://47.105.114.70/getRealTimeData.do",
        type:"get",
        dataType:"json",
        success:function (res) {
            renderDataToPage(res);
        }

    })
    /*******echars温度图表方法********/
    // getRealTimeDataEcharsTemp();
    /*******echars材料图表方法********/
    showGradingCurve();
    /*******油石比图表方法********/
    getAsphaltAggregateRatio();
};
function getAsphaltAggregateRatio() {
    var basePath = $("#path").val();
    $.ajax({
        url:basePath + "/getAsphaltAggregateRatio.do",
        type:"get",
        dataType:"json",
        success:function (res) {
            if (res.message === 'success'){
                var xList = res.body.xList;
                var dataList = res.body.dataList;
                var ration = res.body.ration;
                showAsphaltAggregateRatio(xList,dataList,ration);
            }
            if (res.message === 'empty'){
                console.log("当前数据不足两条");
            }
            if (res.message === 'error'){
                console.log("后台错误，请联系管理员");
            }
        }
    })
}
/**
 * 展示基本信息
 * @param listStr
 */
function renderDataToPage(listStr) {

    if (listStr){
        for (var i=0;i<listStr.length;i++){
            var todayDate = getNowFormatDate();
            if ( listStr[i].crewNum == 'crew1' ){
                var proDate = new Date(listStr[i].produce_date);
                if (todayDate - proDate != 0  ) {
                    $("#crew1_date").html("生产日期：" + listStr[i].produce_date);
                    $("#crew1_time").html("生产时间：" + listStr[i].produce_time);
                    if (listStr[i].pro_name){
                        $("#crew1_ratio_name").html("产品类型：" + listStr[i].pro_name);
                        $("#aar1_title").html(listStr[i].pro_name + "三日内同类型产品油石比走势图");
                    } else {
                        $("#crew1_ratio_name").html('产品类型：未找到产品类型');
                    };
                    var stone = listStr[i].material_stone_2 == 0? Number(listStr[i].material_stone_1).toFixed(1):Number(listStr[i].material_stone_2).toFixed(1);
                    $("#crew1_stone").html("矿粉总量：" + stone +  "<i>%</i>");
                    $("#crew1_asphalt").html("沥青含量：" +  listStr[i].material_asphalt+ "<i>%</i>");
                    $("#crew1_regenerate").html("再生料含量：" + listStr[i].material_regenerate+ "<i>%</i>");
                    $("#crew1_additive").html("添加剂含量：" + listStr[i].material_additive+ "<i>%</i>");

                    // $("#crew1_data_warehouse1").html(listStr[i].temperature_warehouse_1 + " <i>℃</i>");
                    // $("#crew1_data_duster").html(listStr[i].temperature_duster+ " <i>℃</i>");
                    // $("#crew1_data_temasphalt").html(listStr[i].temperature_asphalt+ " <i>℃</i>");
                    // $("#crew1_data_aggregate").html(listStr[i].temperature_aggregate+ " <i>℃</i>");
                }
            }else {
                var proDate = new Date(listStr[i].produce_date);
                if (todayDate - proDate != 0 ) {
                    $("#crew2_date").html("生产日期：" + listStr[i].produce_date);
                    $("#crew2_time").html("生产时间：" + listStr[i].produce_time);
                    if (listStr[i].pro_name){
                        $("#crew2_ratio_name").html("产品类型：" + listStr[i].pro_name);
                        $("#aar2_title").html(listStr[i].pro_name + "三日内同类型产品油石比走势图");
                    } else {
                        $("#crew2_ratio_name").html('产品类型：未找到产品类型');
                    };
                    var stone = listStr[i].material_stone_2 == 0? Number(listStr[i].material_stone_1).toFixed(1):Number(listStr[i].material_stone_2).toFixed(1);
                    $("#crew2_stone").html("矿粉总量：" + stone +  "<i>%</i>");
                    $("#crew2_asphalt").html("沥青含量：" +  listStr[i].material_asphalt+ "<i>%</i>");
                    $("#crew2_regenerate").html("再生料含量：" + listStr[i].material_regenerate+ "<i>%</i>");
                    $("#crew2_additive").html("添加剂含量：" + listStr[i].material_additive+ "<i>%</i>");
                }

            }
        }
    }



}
/**
 * 展示实时Echar
 */
function showGradingCurve() {
    var basePath = $("#path").val();
    $.ajax({
        url:basePath + "/getRealTimeDataEcharsMaterial.do",
        // url:"http://47.105.114.70/getRealTimeDataEcharsMaterial.do",
        type:"post",
        dataType:"json",
        success:function (res) {
            eachMaterialList(res);
        }
    })
}

function eachMaterialList(res) {


    for (var i = 0; i < res.length;i++){

        var arr = res[i]['crew1'];

        if (res[i]['crew1']){

            var arr = returnJsonArray(res[i]['crew1']['moudleList']);
            var temArray  = returnArrayToJson(res[i]['crew1']['moudleList']);

            if(arr){
                option7.xAxis.max = arr[arr.length - 1][0];
            }
            option7.series[0].markLine.data = temArray;
            option7.series[1].data = returnJsonArray(res[i]['crew1']['moudleList']);
            option7.series[2].data = returnJsonArray(res[i]['crew1']['realList']);
            option7.series[3].data = returnJsonArray(res[i]['crew1']['upList']);
            option7.series[4].data = returnJsonArray(res[i]['crew1']['midList']);
            option7.series[5].data = returnJsonArray(res[i]['crew1']['downList']);
            myChart7.setOption(option7);
            window.addEventListener("resize", function () {
                myChart7.resize();
            });

        }else {
            var temArr = returnJsonArray(res[i]['crew2']['moudleList']);
            if(temArr){
                option4.xAxis.max = temArr[temArr.length - 1][0];
            }
            option4.series[0].markLine.data = returnArrayToJson(res[i]['crew2']['moudleList']);
            option4.series[1].data = returnJsonArray(res[i]['crew2']['moudleList']);
            option4.series[2].data = returnJsonArray(res[i]['crew2']['realList']);
            option4.series[3].data = returnJsonArray(res[i]['crew2']['upList']);
            option4.series[4].data = returnJsonArray(res[i]['crew2']['midList']);
            option4.series[5].data = returnJsonArray(res[i]['crew2']['downList']);
            myChart4.setOption(option4);
            window.addEventListener("resize", function () {
                myChart4.resize();
            });
        }
    }



}
window.addEventListener("resize", function () {
    myChart7.resize();
});
window.addEventListener("resize", function () {
    myChart4.resize();
});

function showAsphaltAggregateRatio(xList,dataList,ration) {

    option3.xAxis[0].data = xList.crew1XList;
    option6.xAxis[0].data = xList.crew2XList;
    option3.series[0].data = dataList.crew1data;
    option6.series[0].data = dataList.crew2data;
    var crew1Ration = Number(ration.crew1Ration);
    var crew2Ration = Number(ration.crew2Ration);
    option3.yAxis[0].max = Number(crew1Ration)+ 0.5;
    option3.yAxis[0].min = Number(crew1Ration) - 0.5;
    option6.yAxis[0].max = Number(crew2Ration) + 0.5;
    option6.yAxis[0].min = Number(crew2Ration) - 0.5;

    var yaxisUp = Number(crew1Ration) + 0.3;
    var yaxisModel = Number(crew1Ration);
    var yaxisDown = Number(crew1Ration - 0.3);

    option3.series[0].markLine.data = [{name: '上限', yAxis: yaxisUp,},{name: '模板占比',  yAxis: yaxisModel,},{name: '下限',  yAxis: yaxisDown }];
    option6.series[0].markLine.data = [{name: '上限', yAxis: crew2Ration + 0.3},{name: '模板占比',  yAxis: crew2Ration },{name: '下限',  yAxis:  crew2Ration - 0.3}];

    myChart3.setOption(option3);
    window.addEventListener("resize", function () {
        myChart3.resize();
    });

    myChart6.setOption(option6);
    window.addEventListener("resize", function () {
        myChart6.resize();
    });
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
                    array.push({xAxis:0.312,label: { normal: {formatter:key}}});
                    break;
                case '0.15':
                    array.push({xAxis:0.426,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
                    break;
                case '0.3':
                    array.push({xAxis:0.582,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
                    break;
                case '0.6':
                    array.push({xAxis:0.795,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
                    break;
                case '1.18':
                    array.push({xAxis:1.007,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
                    break;
                case '2.36':
                    array.push({xAxis:1.472,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
                    break;
                case '4.75':
                    array.push({xAxis:2.016,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
                    break;
                case '6.7':
                    array.push({xAxis:2.354,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
                    break;
                case '7.0':
                    array.push({xAxis:2.400,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
                    break;
                case '7.2':
                    array.push({xAxis:2.431,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
                    break;
                case '9.5':
                    array.push({xAxis:2.754,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
                    break;
                case '13.2':
                    array.push({xAxis:3.193,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
                    break;
                case '16':
                    array.push({xAxis:3.482,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
                    break;
                case '19':
                    array.push({xAxis:3.762,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
                    break;
                case '26.5':
                    array.push({xAxis:4.370,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
                    break;
                case '31.5':
                    array.push({xAxis:4.723,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
                    break;
                case '37.5':
                    array.push({xAxis:5.109,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
                    break;
                case '53':
                    array.push({xAxis:5.969,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
                    break;
                case '63':
                    array.push({xAxis:6.452,label: {rotate:90, normal: {formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}}});
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

function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}