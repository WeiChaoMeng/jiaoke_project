
var basePath  = "";
// 初始化
$(function(){
    basePath  = $("#path").val();
    getRealTimeData();
});

/******************************** 数据渲染Start********************************************/
function  getRealTimeData() {

    /*******渲染页面数据********/
    renderDataToPage();
    /*******echars温度图表方法********/
    getRealTimeDataEcharsTemp();
    /*******echars材料图表方法********/
    getRealTimeDataEcharsMaterial();
}


//获取实时数据
function renderDataToPage(){
    debugger
    $.ajax({
        url:basePath +"/getRealTimeSurveillanceFalse.do",
        type:"post",
        success:function (res) {
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
    })
}
window.setInterval(getRealTimeData,3000);

/******************************** 数据渲染End********************************************/



/******************************** Echart材料比渲染Start********************************************/
function getRealTimeDataEcharsMaterial() {
    $.ajax({
        url:basePath + "/getFalseDataToChars.do",
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
            //各材料上下限展现
            var one_up = (res[i].repertory_one) == 0? 0 : Number(res[i].repertory_one) +2;
            crew1upArray.push(one_up);
            var two_up = Number(res[i].repertory_two) == 0 ? 0 : Number(res[i].repertory_two) +2;
            crew1upArray.push(two_up);
            var three_up = Number(res[i].repertory_three) == 0 ? 0 : Number(res[i].repertory_three) + 5;
            crew1upArray.push(three_up);
            var four_up = Number(res[i].repertory_four) == 0 ? 0 : Number(res[i].repertory_four) + 5;
            crew1upArray.push(four_up);
            var five_up = Number(res[i].repertory_five) == 0 ? 0 : Number(res[i].repertory_five) + 5;
            crew1upArray.push(five_up);
            var six_up = Number(res[i].repertory_six) == 0 ? 0 : Number(res[i].repertory_six) + 5;
            crew1upArray.push(six_up);
            var breeze_up = Number(res[i].breeze) == 0 ? 0 : Number(res[i].breeze) + 1;
            crew1upArray.push(breeze_up);
            var stone_up = Number(res[i].ratio_stone) == 0 ? 0 : Number(res[i].ratio_stone) + 2;
            crew1upArray.push(stone_up);
            var regenerate_up = Number(res[i].ratio_regenerate1) + Number(res[i].ratio_regenerate2) == 0 ? 0 : Number(res[i].ratio_regenerate1) + Number(res[i].ratio_regenerate2)  + 5;
            crew1upArray.push(regenerate_up);
            var additive_up = Number(res[i].ratio_additive) == 0 ? 0 : Number(res[i].ratio_additive) + 2;
            crew1upArray.push(additive_up);


            var crew1_total = Number(res[i].material_total)
            var crew1_material_aggregate_1 = Number(res[i].material_aggregate_1) - Number(res[i].material_aggregate_2);
            var crew1_material_aggregate_2 = Number(res[i].material_aggregate_2) - Number(res[i].material_aggregate_3);
            var crew1_material_aggregate_3 = Number(res[i].material_aggregate_3) - Number(res[i].material_aggregate_4);
            var crew1_material_aggregate_4 = Number(res[i].material_aggregate_4) - Number(res[i].material_aggregate_5);
            var crew1_material_aggregate_5 = Number(res[i].material_aggregate_5) - Number(res[i].material_aggregate_6);
            var crew1_material_aggregate_6 = Number(res[i].material_aggregate_6)

            crew1realArray.push((crew1_material_aggregate_1/crew1_total * 100).toFixed(2))
            crew1realArray.push((crew1_material_aggregate_2/crew1_total * 100).toFixed(2))
            crew1realArray.push((crew1_material_aggregate_3/crew1_total * 100).toFixed(2))
            crew1realArray.push((crew1_material_aggregate_4/crew1_total * 100).toFixed(2))
            crew1realArray.push((crew1_material_aggregate_5/crew1_total * 100).toFixed(2))
            crew1realArray.push((crew1_material_aggregate_6/crew1_total * 100).toFixed(2))

            var material_stone = Number(res[i].material_stone_1) > Number(res[i].material_stone_2) ? Number(res[i].material_stone_1):Number(res[i].material_stone_2);
            crew1realArray.push(((material_stone/Number(res[i].material_total)) *100).toFixed(2))
            crew1realArray.push(((Number(res[i].material_asphalt)/Number(res[i].material_total)) *100).toFixed(2))
            crew1realArray.push(((Number(res[i].material_regenerate)/Number(res[i].material_total)) *100).toFixed(2))
            crew1realArray.push(((Number(res[i].material_additive)/Number(res[i].material_total)) *100).toFixed(2))


            var one_down1 = (res[i].repertory_one) == 0? 0 : Number(res[i].repertory_one) - 2;
            var two_down1 = Number(res[i].repertory_two) == 0 ? 0 : Number(res[i].repertory_two) - 2;
            var three_down1 = Number(res[i].repertory_three) == 0 ? 0 : Number(res[i].repertory_three) - 5;
            var four_down1 = Number(res[i].repertory_four) == 0 ? 0 : Number(res[i].repertory_four) - 5;
            var five_down1 = Number(res[i].repertory_five) == 0 ? 0 : Number(res[i].repertory_five) - 5;
            var six_down1 = Number(res[i].repertory_six) == 0 ? 0 : Number(res[i].repertory_six)  - 5;
            var breeze_down1 = Number(res[i].breeze) == 0 ? 0 : Number(res[i].breeze) - 1;
            var stone_down1 = Number(res[i].ratio_stone) == 0 ? 0 : Number(res[i].ratio_stone) - 2;
            var regenerate_down1 = Number(res[i].ratio_regenerate1) + Number(res[i].ratio_regenerate2) == 0 ? 0 : Number(res[i].ratio_regenerate1) + Number(res[i].ratio_regenerate2)  -  5;
            var additive_down1 = Number(res[i].ratio_additive) == 0 ? 0 : Number(res[i].ratio_additive) - 2;

            crew1downArray.push(one_down1);
            crew1downArray.push(two_down1);
            crew1downArray.push(three_down1);
            crew1downArray.push(four_down1);
            crew1downArray.push(five_down1);
            crew1downArray.push(six_down1);
            crew1downArray.push(breeze_down1);
            crew1downArray.push(stone_down1);
            crew1downArray.push(regenerate_down1);
            crew1downArray.push(additive_down1);

        }else {

            //各材料上下限展现
            var one_up2 = (res[i].repertory_one) == 0? 0 : Number(res[i].repertory_one) +2;
            crew2upArray.push(one_up2);
            var two_up2 = Number(res[i].repertory_two) == 0 ? 0 : Number(res[i].repertory_two) +2;
            crew2upArray.push(two_up2);
            var three_up2 = Number(res[i].repertory_three) == 0 ? 0 : Number(res[i].repertory_three) + 5;
            crew2upArray.push(three_up2);
            var four_up2 = Number(res[i].repertory_four) == 0 ? 0 : Number(res[i].repertory_four) + 5;
            crew2upArray.push(four_up2);
            var five_up2 = Number(res[i].repertory_five) == 0 ? 0 : Number(res[i].repertory_five) + 5;
            crew2upArray.push(five_up2);
            var six_up2 = Number(res[i].repertory_six) == 0 ? 0 : Number(res[i].repertory_six) + 5;
            crew2upArray.push(six_up2);
            var breeze_up2 = Number(res[i].breeze) == 0 ? 0 : Number(res[i].breeze) + 1;
            crew2upArray.push(breeze_up2);
            var stone_up2 = Number(res[i].ratio_stone) == 0 ? 0 : Number(res[i].ratio_stone) + 2;
            crew2upArray.push(stone_up2);
            var regenerate_up2 = Number(res[i].ratio_regenerate1) + Number(res[i].ratio_regenerate2) == 0 ? 0 : Number(res[i].ratio_regenerate1) + Number(res[i].ratio_regenerate2)  + 5;
            crew2upArray.push(regenerate_up2);
            var additive_up2 = Number(res[i].ratio_additive) == 0 ? 0 : Number(res[i].ratio_additive) + 2;
            crew2upArray.push(additive_up2);



            var crew2_total = Number(res[i].material_total)
            var crew2_material_aggregate_1 = Number(res[i].material_aggregate_1) - Number(res[i].material_aggregate_2);
            var crew2_material_aggregate_2 = Number(res[i].material_aggregate_2) - Number(res[i].material_aggregate_3);
            var crew2_material_aggregate_3 = Number(res[i].material_aggregate_3) - Number(res[i].material_aggregate_4);
            var crew2_material_aggregate_4 = Number(res[i].material_aggregate_4) - Number(res[i].material_aggregate_5);
            var crew2_material_aggregate_5 = Number(res[i].material_aggregate_5) - Number(res[i].material_aggregate_6);
            var crew2_material_aggregate_6 = Number(res[i].material_aggregate_6)

            crew2realArray.push((crew2_material_aggregate_1/crew2_total * 100).toFixed(2))
            crew2realArray.push((crew2_material_aggregate_2/crew2_total * 100).toFixed(2))
            crew2realArray.push((crew2_material_aggregate_3/crew2_total * 100).toFixed(2))
            crew2realArray.push((crew2_material_aggregate_4/crew2_total * 100).toFixed(2))
            crew2realArray.push((crew2_material_aggregate_5/crew2_total * 100).toFixed(2))
            crew2realArray.push((crew2_material_aggregate_6/crew2_total * 100).toFixed(2))

            var material_stone = Number(res[i].material_stone_1) > Number(res[i].material_stone_2) ? Number(res[i].material_stone_1):Number(res[i].material_stone_2);
            crew2realArray.push(((material_stone/Number(res[i].material_total)) *100).toFixed(2))
            crew2realArray.push(((Number(res[i].material_asphalt)/Number(res[i].material_total)) *100).toFixed(2))
            crew2realArray.push(((Number(res[i].material_regenerate)/Number(res[i].material_total)) *100).toFixed(2))
            crew2realArray.push(((Number(res[i].material_additive)/Number(res[i].material_total)) *100).toFixed(2))



            var one_down2 = (res[i].repertory_one) == 0? 0 : Number(res[i].repertory_one) - 2;
            var two_down2 = Number(res[i].repertory_two) == 0 ? 0 : Number(res[i].repertory_two) - 2;
            var three_down2 = Number(res[i].repertory_three) == 0 ? 0 : Number(res[i].repertory_three) - 5;
            var four_down2 = Number(res[i].repertory_four) == 0 ? 0 : Number(res[i].repertory_four) - 5;
            var five_down2 = Number(res[i].repertory_five) == 0 ? 0 : Number(res[i].repertory_five) - 5;
            var six_down2 = Number(res[i].repertory_six) == 0 ? 0 : Number(res[i].repertory_six) - 5;
            var breeze_down2 = Number(res[i].breeze) == 0 ? 0 : Number(res[i].breeze) - 1;
            var stone_down2 = Number(res[i].ratio_stone) == 0 ? 0 : Number(res[i].ratio_stone) - 2;
            var regenerate_down2 = Number(res[i].ratio_regenerate1) + Number(res[i].ratio_regenerate2) == 0 ? 0 : Number(res[i].ratio_regenerate1) + Number(res[i].ratio_regenerate2) - 5;
            var additive_down2 = Number(res[i].ratio_additive) == 0 ? 0 : Number(res[i].ratio_additive) - 2;

            crew2downArray.push(one_down2);
            crew2downArray.push(two_down2);
            crew2downArray.push(three_down2);
            crew2downArray.push(four_down2);
            crew2downArray.push(five_down2);
            crew2downArray.push(six_down2);
            crew2downArray.push(breeze_down2);
            crew2downArray.push(stone_down2);
            crew2downArray.push(regenerate_down2);
            crew2downArray.push(additive_down2);


        }
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

