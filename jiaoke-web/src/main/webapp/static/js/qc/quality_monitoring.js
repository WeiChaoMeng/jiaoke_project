
var basePath  = "";
// 初始化
$(function(){
    basePath  = $("#path").val();
    getRealTimeData();
});

/******************************** 数据渲染Start********************************************/
function  getRealTimeData() {

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
    getRealTimeDataEcharsTemp();
    /*******echars材料图表方法********/
    getRealTimeDataEcharsMaterial();
    /*******三盘平均数据方法********/
    getThreeProductSVG();
}

function renderDataToPage(listStr) {


    if (listStr){
        for (var i=0;i<listStr.length;i++){

            var todayDate = getNowFormatDate();
            if ( listStr[i].crewNum == 'crew1' ){

                var proDate = new Date(listStr[i].produce_date);
                if (todayDate - proDate != 0  ) {
                    $("#crew1_basic_date").html(listStr[i].produce_date);
                    $("#crew1_basic_time").html(listStr[i].produce_time);
                    $("#crew1_basic_ratio").html(listStr[i].produce_proportioning_num);

                    if (listStr[i].pro_name){
                        $("#crew1_basic_ratio_name").html(listStr[i].pro_name);
                    } else {
                        $("#crew1_basic_ratio_name").html('无配比');
                    }
                    $("#crew1_basic_carNum").html(listStr[i].produce_car_num);
                    $("#crew1_basic_discNum").html(listStr[i].produce_disc_num);
                    $("#crew1_basic_userNum").html(listStr[i].project_name);
                    $("#crew1_data_Aggregate1").html(listStr[i].material_aggregate_1 + "<i>%</i>");
                    $("#crew1_data_Aggregate2").html(listStr[i].material_aggregate_2 + "<i>%</i>");
                    $("#crew1_data_Aggregate3").html(listStr[i].material_aggregate_3 + "<i>%</i>");
                    $("#crew1_data_Aggregate4").html(listStr[i].material_aggregate_4 + "<i>%</i>");
                    $("#crew1_data_Aggregate5").html(listStr[i].material_aggregate_5 + "<i>%</i>");
                    $("#crew1_data_Aggregate6").html(listStr[i].material_aggregate_6 + "<i>%</i>");
                    $("#crew1_data_warehouse1").html(listStr[i].temperature_warehouse_1 + " <i>℃</i>");
                    $("#crew1_data_duster").html(listStr[i].temperature_duster+ " <i>℃</i>");

                    $("#crew1_data_stone1").html( listStr[i].material_stone_1+ "<i>%</i>");
                    var material_stone_2 = listStr[i].material_stone_2 == 0? 0:(listStr[i].material_stone_2 - listStr[i].material_stone_1).toFixed(1);
                    $("#crew1_data_stone2").html(material_stone_2 +  "<i>%</i>");
                    $("#crew1_data_asphalt").html(listStr[i].material_asphalt+ "<i>%</i>");
                    $("#crew1_data_regenerate").html(listStr[i].material_regenerate+ "<i>%</i>");
                    $("#crew1_data_additive").html(listStr[i].material_additive+ "<i>%</i>");
                    $("#crew1_data_total").html(listStr[i].material_total+ "<i>Kg</i>");
                    $("#crew1_data_temasphalt").html(listStr[i].temperature_asphalt+ " <i>℃</i>");
                    $("#crew1_data_aggregate").html(listStr[i].temperature_aggregate+ " <i>℃</i>");
                }


            }else {
                var proDate = new Date(listStr[i].produce_date);
                if (todayDate - proDate != 0 ) {
                    $("#crew2_basic_date").html(listStr[i].produce_date);
                    $("#crew2_basic_time").html(listStr[i].produce_time);
                    $("#crew2_basic_ratio").html(listStr[i].produce_proportioning_num);
                    if (listStr[i].pro_name){
                        $("#crew2_basic_ratio_name").html(listStr[i].pro_name);
                    } else {
                        $("#crew2_basic_ratio_name").html('无配比');
                    }
                    $("#crew2_basic_carNum").html(listStr[i].produce_car_num);
                    $("#crew2_basic_discNum").html(listStr[i].produce_disc_num);
                    $("#crew2_basic_userNum").html(listStr[i].project_name);
                    $("#crew2_data_Aggregate1").html(listStr[i].material_aggregate_1 + "<i>%</i>");
                    $("#crew2_data_Aggregate2").html(listStr[i].material_aggregate_2 + "<i>%</i>");
                    $("#crew2_data_Aggregate3").html(listStr[i].material_aggregate_3 + "<i>%</i>");
                    $("#crew2_data_Aggregate4").html(listStr[i].material_aggregate_4 + "<i>%</i>");
                    $("#crew2_data_Aggregate5").html(listStr[i].material_aggregate_5 + "<i>%</i>");
                    $("#crew2_data_Aggregate6").html(listStr[i].material_aggregate_6 + "<i>%</i>");
                    $("#crew2_data_warehouse1").html(listStr[i].temperature_warehouse_1 + " <i>℃</i>");
                    $("#crew2_data_duster").html(listStr[i].temperature_duster + " <i>℃</i>");
                    $("#crew2_data_stone1").html( listStr[i].material_stone_1 + "<i>%</i>");
                    var material_stone_2 = listStr[i].material_stone_2 == 0? 0:(listStr[i].material_stone_2 - listStr[i].material_stone_1).toFixed(1);
                    $("#crew2_data_stone2").html(material_stone_2 + "<i>%</i>");
                    $("#crew2_data_asphalt").html(listStr[i].material_asphalt + "<i>%</i>");
                    $("#crew2_data_regenerate").html(listStr[i].material_regenerate + "<i>%</i>");
                    $("#crew2_data_additive").html(listStr[i].material_additive + "<i>%</i>");
                    $("#crew2_data_total").html(listStr[i].material_total + "<i>Kg</i>");
                    $("#crew2_data_temasphalt").html(listStr[i].temperature_asphalt + " <i>℃</i>");
                    $("#crew2_data_aggregate").html(listStr[i].temperature_aggregate + " <i>℃</i>");
                }

            }
        }
    }



}



/******************************** 数据渲染End********************************************/


/******************************** 三盘平均数据渲染Start********************************************/
function getThreeProductSVG() {
    $.ajax({
        url:basePath + "/getRealTimeThreeProductSVG.do",
        type:"get",
        dataType:"json",
        success:function (listStr) {
            if (listStr){
                for (var i=0;i<listStr.length;i++){

                    var todayDate = getNowFormatDate();
                    if ( listStr[i].crewNum == 'crew1' ){

                        var proDate = new Date(listStr[i].produce_date);
                        if ( todayDate - proDate != 0  ) {

                            $("#crew1_data_Aggregate1_svg").html(listStr[i].material_aggregate_1 + "<i>Kg</i>");
                            $("#crew1_data_Aggregate2_svg").html(listStr[i].material_aggregate_2 + "<i>Kg</i>");
                            $("#crew1_data_Aggregate3_svg").html(listStr[i].material_aggregate_3 + "<i>Kg</i>");
                            $("#crew1_data_Aggregate4_svg").html(listStr[i].material_aggregate_4 + "<i>Kg</i>");
                            $("#crew1_data_Aggregate5_svg").html(listStr[i].material_aggregate_5 + "<i>Kg</i>");
                            $("#crew1_data_Aggregate6_svg").html(listStr[i].material_aggregate_6 + "<i>Kg</i>");
                            $("#crew1_data_warehouse1_svg").html(listStr[i].temperature_warehouse_1 + " <i>℃</i>");
                            $("#crew1_data_duster_svg").html(listStr[i].temperature_duster+ " <i>℃</i>");

                            $("#crew1_data_stone1_svg").html( listStr[i].material_stone_1+ "<i>Kg</i>");
                            var material_stone_2 = listStr[i].material_stone_2 == 0? 0:(listStr[i].material_stone_2 - listStr[i].material_stone_1).toFixed(1);
                            $("#crew1_data_stone2_svg").html(material_stone_2 + "<i>Kg</i>");
                            $("#crew1_data_asphalt_svg").html(listStr[i].material_asphalt+ "<i>Kg</i>");
                            $("#crew1_data_regenerate_svg").html(listStr[i].material_regenerate+ "<i>Kg</i>");
                            $("#crew1_data_additive_svg").html(listStr[i].material_additive+ "<i>Kg</i>");
                            $("#crew1_data_total_svg").html(listStr[i].material_total+ "<i>Kg</i>");
                            $("#crew1_data_temasphalt_svg").html(listStr[i].temperature_asphalt+ " <i>℃</i>");
                            $("#crew1_data_aggregate_svg").html(listStr[i].temperature_aggregate+ " <i>℃</i>");
                        }


                    }else {
                        var proDate = new Date(listStr[i].produce_date);
                        if (todayDate - proDate != 0  ) {

                            $("#crew2_data_Aggregate1_svg").html(listStr[i].material_aggregate_1 + "<i>Kg</i>");
                            $("#crew2_data_Aggregate2_svg").html(listStr[i].material_aggregate_2 + "<i>Kg</i>");
                            $("#crew2_data_Aggregate3_svg").html(listStr[i].material_aggregate_3 + "<i>Kg</i>");
                            $("#crew2_data_Aggregate4_svg").html(listStr[i].material_aggregate_4 + "<i>Kg</i>");
                            $("#crew2_data_Aggregate5_svg").html(listStr[i].material_aggregate_5 + "<i>Kg</i>");
                            $("#crew2_data_Aggregate6_svg").html(listStr[i].material_aggregate_6 + "<i>Kg</i>");
                            $("#crew2_data_warehouse1_svg").html(listStr[i].temperature_warehouse_1 + " <i>℃</i>");
                            $("#crew2_data_duster_svg").html(listStr[i].temperature_duster + " <i>℃</i>");
                            $("#crew2_data_stone1_svg").html(listStr[i].material_stone_1+ "<i>Kg</i>");
                            var material_stone_2 = listStr[i].material_stone_2 == 0? 0:(listStr[i].material_stone_2 - listStr[i].material_stone_1).toFixed(1);
                            $("#crew2_data_stone2_svg").html(material_stone_2 + "<i>Kg</i>");
                            $("#crew2_data_asphalt_svg").html(listStr[i].material_asphalt + "<i>Kg</i>");
                            $("#crew2_data_regenerate_svg").html(listStr[i].material_regenerate + "<i>Kg</i>");
                            $("#crew2_data_additive_svg").html(listStr[i].material_additive + "<i>Kg</i>");
                            $("#crew2_data_total_svg").html(listStr[i].material_total + "<i>Kg</i>");
                            $("#crew2_data_temasphalt_svg").html(listStr[i].temperature_asphalt + " <i>℃</i>");
                            $("#crew2_data_aggregate_svg").html(listStr[i].temperature_aggregate + " <i>℃</i>");
                        }

                    }
                }
            }

        }

    })
}
/******************************** 三盘平均数据渲染End********************************************/



/******************************** Echart材料比渲染Start********************************************/
function getRealTimeDataEcharsMaterial() {
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
            debugger
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
/******************************** Echart材料比渲染End********************************************/



/******************************** Echart温度图表渲染Start********************************************/
function getRealTimeDataEcharsTemp(){
    $.ajax({
        url:basePath + "/getRealTimeDataEcharsTemp.do",
        // url:"http://47.105.114.70/getRealTimeDataEcharsTemp.do",
        type:"post",
        dataType:"json",
        success:function (res) {
            eachresList(res);
        }
    })
}

function eachresList(res){

    var crew1discNum = new Array();
    var crew1warehouse = new Array();
    var crew1mixture = new Array();
    var crew1duster = new Array();
    var crew1asphalt = new Array();
    var crew1aggregate = new Array();

    var crew2discNum = new Array();
    var crew2warehouse = new Array();
    var crew2mixture = new Array();
    var crew2duster = new Array();
    var crew2asphalt = new Array();
    var crew2aggregate = new Array();

    for (var i = 0; i < res.length; i++){

        if (res[i].crewNum == 'crew1'){
            crew1discNum.push(res[i].produce_disc_num);
            crew1warehouse.push(res[i].temperature_warehouse_1);
            crew1mixture.push(res[i].temperature_mixture);
            crew1duster.push(res[i].temperature_duster);
            crew1asphalt.push(res[i].temperature_asphalt);
            crew1aggregate.push(res[i].temperature_aggregate);
        }else {
            crew2discNum.push(res[i].produce_disc_num);
            crew2warehouse.push(res[i].temperature_warehouse_1);
            crew2mixture.push(res[i].temperature_mixture);
            crew2duster.push(res[i].temperature_duster);
            crew2asphalt.push(res[i].temperature_asphalt);
            crew2aggregate.push(res[i].temperature_aggregate);
        }

    }
    option1.xAxis.data = crew1discNum;
    option1.series[0].data = crew1warehouse;
    option1.series[1].data = crew1mixture;
    option1.series[2].data = crew1asphalt;
    option1.series[3].data = crew1aggregate;
    option1.series[4].data = crew1duster;
    myChart1.setOption(option1);

    option5.xAxis.data = crew2discNum;
    option5.series[0].data = crew2warehouse;
    option5.series[1].data = crew2mixture;
    option5.series[2].data = crew2asphalt;
    option5.series[3].data = crew2aggregate;
    option5.series[4].data = crew2duster;
    myChart5.setOption(option5);
}

// window.addEventListener("resize", function () {
//     myChart1.resize();
// });
// window.addEventListener("resize", function () {
//     myChart5.resize();
// });
/******************************** Echart温度图表渲染nd********************************************/
window.setInterval(getRealTimeData,20000);


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
                    array.push({xAxis:0.312,label: {rotate:90, formatter:key}});
                    break;
                case '0.15':
                    array.push({xAxis:0.426,label: {rotate:90, normal: {formatter:key}}});
                    break;
                case '0.3':
                    array.push({xAxis:0.582,label: {rotate:90, normal: {formatter:key}}});
                    break;
                case '0.6':
                    array.push({xAxis:0.795,label: {rotate:90, normal: {formatter:key}}});
                    break;
                case '1.18':
                    array.push({xAxis:1.007,label: {rotate:90, normal: {formatter:key}}});
                    break;
                case '2.36':
                    array.push({xAxis:1.472,label: {rotate:90, normal: {formatter:key}}});
                    break;
                case '4.75':
                    array.push({xAxis:2.016,label: {rotate:90, normal: {formatter:key}}});
                    break;
                case '6.7':
                    array.push({xAxis:2.354,label: {rotate:90, normal: {formatter:key}}});
                    break;
                case '7.0':
                    array.push({xAxis:2.400,label: {rotate:90, normal: {formatter:key}}});
                    break;
                case '7.2':
                    array.push({xAxis:2.431,label: {rotate:90, normal: {formatter:key}}});
                    break;
                case '9.5':
                    array.push({xAxis:2.754,label: {rotate:90, normal: {formatter:key}}});
                    break;
                case '13.2':
                    array.push({xAxis:3.193,label: {rotate:90, normal: {formatter:key}}});
                    break;
                case '16':
                    array.push({xAxis:3.482,label: {rotate:90, normal: {formatter:key}}});
                    break;
                case '19':
                    array.push({xAxis:3.762,label: {rotate:90, normal: {formatter:key}}});
                    break;
                case '26.5':
                    array.push({xAxis:4.370,label: {rotate:90, normal: {formatter:key}}});
                    break;
                case '31.5':
                    array.push({xAxis:4.723,label: {rotate:90, normal: {formatter:key}}});
                    break;
                case '37.5':
                    array.push({xAxis:5.109,label: {rotate:90, normal: {formatter:key}}});
                    break;
                case '53':
                    array.push({xAxis:5.969,label: {rotate:90, normal: {formatter:key}}});
                    break;
                case '63':
                    array.push({xAxis:6.452,label: {rotate:90, normal: {formatter:key}}});
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