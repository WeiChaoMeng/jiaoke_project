



/******************************** 数据渲染Start********************************************/
function  getRealTimeData() {
    $.ajax({
        url:"http://localhost:8080/getRealTimeData.do",
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
}

function renderDataToPage(listStr) {

    if (listStr){
        for (var i=0;i<listStr.length;i++){

            if ( listStr[i].crewNum == 'crew1' ){

                $("#crew1_basic_date").html(listStr[i].produce_date);
                $("#crew1_basic_time").html(listStr[i].produce_time);
                $("#crew1_basic_ratio").html(listStr[i].produce_proportioning_num);
                $("#crew1_basic_carNum").html(listStr[i].produce_car_num);
                $("#crew1_basic_discNum").html(listStr[i].produce_disc_num);
                $("#crew1_basic_userNum").html(listStr[i].produce_custom_num);
                $("#crew1_data_Aggregate1").html(listStr[i].material_aggregate_1 + "<i>%</i>");
                $("#crew1_data_Aggregate2").html(listStr[i].material_aggregate_2 + "<i>%</i>");
                $("#crew1_data_Aggregate3").html(listStr[i].material_aggregate_3 + "<i>%</i>");
                $("#crew1_data_Aggregate4").html(listStr[i].material_aggregate_4 + "<i>%</i>");
                $("#crew1_data_Aggregate5").html(listStr[i].material_aggregate_5 + "<i>%</i>");
                $("#crew1_data_Aggregate6").html(listStr[i].material_aggregate_6 + "<i>%</i>");
                $("#crew1_data_warehouse1").html(listStr[i].temperature_warehouse_1 + " <i>℃</i>");
                $("#crew1_data_duster").html(listStr[i].temperature_duster+ " <i>℃</i>");

                $("#crew1_data_stone1").html(listStr[i].material_stone_1+ "<i>%</i>");
                $("#crew1_data_stone2").html(listStr[i].material_stone_2+ "<i>%</i>");
                $("#crew1_data_asphalt").html(listStr[i].material_asphalt+ "<i>%</i>");
                $("#crew1_data_regenerate").html(listStr[i].material_regenerate+ "<i>%</i>");
                $("#crew1_data_additive").html(listStr[i].material_additive+ "<i>%</i>");
                $("#crew1_data_total").html(listStr[i].material_total+ "<i>Kg</i>");
                $("#crew1_data_temasphalt").html(listStr[i].temperature_asphalt+ " <i>℃</i>");
                $("#crew1_data_aggregate").html(listStr[i].temperature_aggregate+ " <i>℃</i>");

            }else {

                $("#crew2_basic_date").html(listStr[i].produce_date);
                $("#crew2_basic_time").html(listStr[i].produce_time);
                $("#crew2_basic_ratio").html(listStr[i].produce_proportioning_num);
                $("#crew2_basic_carNum").html(listStr[i].produce_car_num);
                $("#crew2_basic_discNum").html(listStr[i].produce_disc_num);
                $("#crew2_basic_userNum").html(listStr[i].produce_custom_num);
                $("#crew2_data_Aggregate1").html(listStr[i].material_aggregate_1 + "<i>%</i>");
                $("#crew2_data_Aggregate2").html(listStr[i].material_aggregate_2 + "<i>%</i>");
                $("#crew2_data_Aggregate3").html(listStr[i].material_aggregate_3 + "<i>%</i>");
                $("#crew2_data_Aggregate4").html(listStr[i].material_aggregate_4 + "<i>%</i>");
                $("#crew2_data_Aggregate5").html(listStr[i].material_aggregate_5 + "<i>%</i>");
                $("#crew2_data_Aggregate6").html(listStr[i].material_aggregate_6 + "<i>%</i>");
                $("#crew2_data_warehouse1").html(listStr[i].temperature_warehouse_1 + " <i>℃</i>");
                $("#crew2_data_duster").html(listStr[i].temperature_duster+ " <i>℃</i>");
                $("#crew2_data_stone1").html(listStr[i].material_stone_1+ "<i>%</i>");
                $("#crew2_data_stone2").html(listStr[i].material_stone_2+ "<i>%</i>");
                $("#crew2_data_asphalt").html(listStr[i].material_asphalt+ "<i>%</i>");
                $("#crew2_data_regenerate").html(listStr[i].material_regenerate+ "<i>%</i>");
                $("#crew2_data_additive").html(listStr[i].material_additive+ "<i>%</i>");
                $("#crew2_data_total").html(listStr[i].material_total+ "<i>Kg</i>");
                $("#crew2_data_temasphalt").html(listStr[i].temperature_asphalt+ " <i>℃</i>");
                $("#crew2_data_aggregate").html(listStr[i].temperature_aggregate+ " <i>℃</i>");

            }
        }
    }

}
/******************************** 数据渲染End********************************************/



/******************************** Echart材料比渲染Start********************************************/
function getRealTimeDataEcharsMaterial() {
    $.ajax({
        url:"http://localhost:8080/getRealTimeDataEcharsMaterial.do",
        // url:"http://47.105.114.70/getRealTimeDataEcharsMaterial.do",
        type:"post",
        dataType:"json",
        success:function (res) {
            eachMaterialList(res);
        }
    })
}

function eachMaterialList(res) {

    var crew1upArray = new Array();
    var crew1realArray = new Array();
    var crew1downArray = new Array();

    var crew2upArray = new Array();
    var crew2realArray = new Array();
    var crew2downArray = new Array();

    for (var i = 0; i < res.length;i++){

        if (res[i].crewNum == 'crew1'){

            crew1upArray.push(Number(res[i].repertory_one) + 15);
            crew1upArray.push(Number(res[i].repertory_two) + 15);
            crew1upArray.push(Number(res[i].repertory_three) + 15);
            crew1upArray.push(Number(res[i].repertory_four) + 15);
            crew1upArray.push(Number(res[i].repertory_five) + 15);
            crew1upArray.push(Number(res[i].repertory_six) + 15);
            crew1upArray.push(Number(res[i].breeze) + 15);
            crew1upArray.push(Number(res[i].ratio_stone) + 15);
            crew1upArray.push(Number(res[i].ratio_regenerate1) + Number(res[i].ratio_regenerate2)+ 15);
            crew1upArray.push(Number(res[i].ratio_additive) + 15);
            crew1upArray.push(Number(res[i].temperature_asphalt) + 15);
            crew1upArray.push(Number(res[i].temperature_aggregate) + 15);
            crew1upArray.push(Number(res[i].temperature_mixture) + 15);

            crew1realArray.push((Number(res[i].material_aggregate_1)/Number(res[i].material_total) *100).toFixed(2))
            crew1realArray.push((Number(res[i].material_aggregate_2)/Number(res[i].material_total) *100).toFixed(2))
            crew1realArray.push(((Number(res[i].material_aggregate_3)/Number(res[i].material_total)) *100).toFixed(2))
            crew1realArray.push(((Number(res[i].material_aggregate_4)/Number(res[i].material_total)) *100).toFixed(2))
            crew1realArray.push(((Number(res[i].material_aggregate_5)/Number(res[i].material_total)) *100).toFixed(2))
            crew1realArray.push(((Number(res[i].material_aggregate_6)/Number(res[i].material_total)) *100).toFixed(2))
            var material_stone = Number(res[i].material_stone_1) > Number(res[i].material_stone_2) ? Number(res[i].material_stone_1):Number(res[i].material_stone_2);
            crew1realArray.push(((material_stone/Number(res[i].material_total)) *100).toFixed(2))
            crew1realArray.push(((Number(res[i].material_asphalt)/Number(res[i].material_total)) *100).toFixed(2))
            crew1realArray.push(((Number(res[i].material_regenerate)/Number(res[i].material_total)) *100).toFixed(2))
            crew1realArray.push(((Number(res[i].material_additive)/Number(res[i].material_total)) *100).toFixed(2))
            crew1realArray.push(res[i].temperature_asphalt)
            crew1realArray.push(res[i].temperature_aggregate)
            crew1realArray.push(res[i].temperature_mixture)

        }else {
            crew2upArray.push(Number(res[i].repertory_one) + 15);
            crew2upArray.push(Number(res[i].repertory_two) + 15);
            crew2upArray.push(Number(res[i].repertory_three) + 15);
            crew2upArray.push(Number(res[i].repertory_four) + 15);
            crew2upArray.push(Number(res[i].repertory_five) + 15);
            crew2upArray.push(Number(res[i].repertory_six) + 15);
            crew2upArray.push(Number(res[i].breeze) + 15);
            crew2upArray.push(Number(res[i].ratio_stone) + 15);
            crew2upArray.push(Number(res[i].ratio_regenerate1) + Number(res[i].ratio_regenerate2)+ 15);
            crew2upArray.push(Number(res[i].ratio_additive) + 15);
            crew2upArray.push(Number(res[i].temperature_asphalt) + 15);
            crew2upArray.push(Number(res[i].temperature_aggregate) + 15);
            crew2upArray.push(Number(res[i].temperature_mixture) + 15);


            crew2realArray.push((Number(res[i].material_aggregate_1)/Number(res[i].material_total) *100).toFixed(2))
            crew2realArray.push((Number(res[i].material_aggregate_2)/Number(res[i].material_total) *100).toFixed(2))
            crew2realArray.push(((Number(res[i].material_aggregate_3)/Number(res[i].material_total)) *100).toFixed(2))
            crew2realArray.push(((Number(res[i].material_aggregate_4)/Number(res[i].material_total)) *100).toFixed(2))
            crew2realArray.push(((Number(res[i].material_aggregate_5)/Number(res[i].material_total)) *100).toFixed(2))
            crew2realArray.push(((Number(res[i].material_aggregate_6)/Number(res[i].material_total)) *100).toFixed(2))
            var material_stone = Number(res[i].material_stone_1) > Number(res[i].material_stone_2) ? Number(res[i].material_stone_1):Number(res[i].material_stone_2);
            crew2realArray.push(((material_stone/Number(res[i].material_total)) *100).toFixed(2))
            crew2realArray.push(((Number(res[i].material_asphalt)/Number(res[i].material_total)) *100).toFixed(2))
            crew2realArray.push(((Number(res[i].material_regenerate)/Number(res[i].material_total)) *100).toFixed(2))
            crew2realArray.push(((Number(res[i].material_additive)/Number(res[i].material_total)) *100).toFixed(2))
            crew2realArray.push(res[i].temperature_asphalt)
            crew2realArray.push(res[i].temperature_aggregate)
            crew2realArray.push(res[i].temperature_mixture)
        }
    }

    for (var i = 0; i < crew2upArray.length; i++){
        crew2downArray[i] = crew2upArray[i] -30;
    }

    for (var i = 0; i < crew1upArray.length; i++){
        crew1downArray[i] = crew1upArray[i] -30;
    }

    option7.series[0].data = crew1upArray;
    option7.series[1].data = crew1realArray;
    option7.series[2].data = crew1downArray;
    myChart7.setOption(option7);

    option4.series[0].data = crew2upArray;
    option4.series[1].data = crew2realArray;
    option4.series[2].data = crew2downArray;
    myChart4.setOption(option4);

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
        url:"http://localhost:8080/getRealTimeDataEcharsTemp.do",
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
    myChart1.setOption(option1,true);

    option5.xAxis.data = crew2discNum;
    option5.series[0].data = crew2warehouse;
    option5.series[1].data = crew2mixture;
    option5.series[2].data = crew2asphalt;
    option5.series[3].data = crew2aggregate;
    option5.series[4].data = crew2duster;
    myChart5.setOption(option5,true);
}

window.addEventListener("resize", function () {
    myChart1.resize();
});
window.addEventListener("resize", function () {
    myChart5.resize();
});
/******************************** Echart温度图表渲染nd********************************************/
window.setInterval(getRealTimeData,3000);

// 初始化
(function ($) {
    getRealTimeData();
})(jQuery);