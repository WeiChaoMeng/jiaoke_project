var basePath = "";
// 初始化
(function ($) {
    // getEcharsData();
    getWarningData();
    getRealTimeDataEcharsMaterial();
    basePath = $("#path").val();
})(jQuery);

/***********************间隔执行Start*****************************/
setInterval(getWarningData, 3000);

/***********************间隔执行End*****************************/

function getWarningData() {
    $.ajax({
        url: basePath + "/getQualityWarningData.do",
        type: "post",
        dataType: "json",
        success: function (res) {
            $("#crew1_material").empty();
            $("#crew2_material").empty();

            var materialStr = "";
            var messageStr = "";
            var warningLeve = "";

            if (res != "" || res != null) {

                /******************渲染基本信息**********************/
                for (var i = 0; i < res.length; i++) {

                    materialStr = "#crew" + res[i].produce_crewNum + "_" + 'material';

                    for (var k in  res[i]) {
                        messageStr = "#crew" + res[i].produce_crewNum + "_" + k;
                        $(messageStr).text(res[i][k]);
                    }

                    /****************渲染预警级别*****************/

                    switch (res[i].warning_level) {
                        case 0:
                            warningLeve = "无预警";
                            break;
                        case 1:
                            warningLeve = "一级预警";
                            break;
                        case 2:
                            warningLeve = "二级预警";
                            break;
                        case 3:
                            warningLeve = "三级预警";
                            break;
                    }

                    /****************渲染材料数据*****************/
                    if (res[i].material_name == '沥青温度' || res[i].material_name == '混合料温度' || res[i].material_name == '骨料温度'||res[i].material_name == '一仓温度') {
                        $(materialStr).append(
                            '<tr class="warning_table_even">'
                            + '<td>' + res[i].material_name + '</td>'
                            + '<td>' + res[i].moudle_ratio + '<i>℃</i></td>'
                            + '<td>' + res[i].actual_ratio + '<i>℃</i></td>'
                            + '<td>' + res[i].deviation_ratio + '<i>℃</i></td>'
                            + '<td>' + warningLeve + '</td>'
                            + '<td>' + res[i].avg_real_ration + '<i>℃</i></td>'
                            + '</tr>'
                        )
                    } else {
                        $(materialStr).append(
                            '<tr class="warning_table_even">'
                            + '<td>' + res[i].material_name + '</td>'
                            + '<td>' + res[i].moudle_ratio + '<i>%</i></td>'
                            + '<td>' + res[i].actual_ratio + '<i>%</i></td>'
                            + '<td>' + res[i].deviation_ratio + '<i>%</i></td>'
                            + '<td>' + warningLeve + '</td>'
                            + '<td>' + res[i].avg_real_ration + '<i>%</i></td>'
                            + '</tr>'
                        )
                    }

                }
            }
        }
    })

    getRealTimeDataEcharsMaterial();
    // getEcharsData();
}

// function getEcharsData() {
//
//     $.ajax({
//         url: basePath + "/getWarningEcharsData.do",
//         // url: "http://47.105.114.70/getWarningEcharsData.do",
//         type: "post",
//         dataType: "json",
//         success:function (res) {
//
//             var crew1nameArray = new Array();
//             var crew1topArray = new Array();
//             var crew1downArray = new Array();
//             var crew1realArray = new Array();
//
//             var crew2nameArray = new Array();
//             var crew2topArray = new Array();
//             var crew2downArray = new Array();
//             var crew2realArray = new Array();
//
//             for (var k in res){
//                 switch (k) {
//                     case "crew1nameList":
//                         eachList(res[k],crew1nameArray);
//                         break;
//                     case "crew1topList":
//                         eachList(res[k],crew1topArray);
//                         break;
//                     case "crew1downList":
//                         eachList(res[k],crew1downArray);
//                         break;
//                     case "crew1realList":
//                         eachList(res[k],crew1realArray);
//                         break;
//
//                     case "crew2nameList":
//                         eachList(res[k],crew2nameArray);
//                         break;
//                     case "crew2topList":
//                         eachList(res[k],crew2topArray);
//                         break;
//                     case "crew2downList":
//                         eachList(res[k],crew2downArray);
//                         break;
//                     case "crew2realList":
//                         eachList(res[k],crew2realArray);
//                         break;
//                 }
//             }
//
//
//
//
//             option.xAxis[0].data = crew1nameArray;
//             option.series[0].data = crew1topArray;
//             option.series[1].data = crew1realArray;
//             option.series[2].data = crew1downArray;
//             myChart.setOption(option,true);
//             window.onresize = myChart.resize();
//
//             option2.xAxis[0].data = crew2nameArray;
//             option2.series[0].data = crew2topArray;
//             option2.series[1].data = crew2realArray;
//             option2.series[2].data = crew2downArray;
//             myChart2.setOption(option2,true);
//             window.onresize = myChart2.resize();
//         }
//     })
// }
//
// /********遍历方法*********/
// function eachList(inArray,toArray) {
//
//     for (var i = 0; i < inArray.length; i++) {
//         toArray[i] = inArray[i];
//     }


/******************************** Echart材料比渲染Start********************************************/
function getRealTimeDataEcharsMaterial() {
    $.ajax({
        url:basePath + "/getWarningEcharsData.do",
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

            option7.xAxis.max = arr[arr.length - 1][0];
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

            option4.xAxis.max = temArr[temArr.length - 1][0];
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
                    array.push({xAxis:0.312,label: {normal: {formatter:'\n' +  key+""}}});
                    break;
                case '0.15':
                    array.push({xAxis:0.426,label: {normal: {formatter: key+"" }}});
                    break;
                case '0.3':
                    array.push({xAxis:0.582,label: {normal: {formatter:'\n\n' +  key+""}}});
                    break;
                case '0.6':
                    array.push({xAxis:0.795,label: {normal: {formatter: key+""}}});
                    break;
                case '1.18':
                    array.push({xAxis:1.007,label: {normal: {formatter:'\n\n' +  key+""}}});
                    break;
                case '2.36':
                    array.push({xAxis:1.472,label: {normal: {formatter: key+"" }}});
                    break;
                case '4.75':
                    array.push({xAxis:2.016,label: {normal: {formatter:'\n\n' +  key+""}}});
                    break;
                case '6.7':
                    array.push({xAxis:2.354,label: {normal: {formatter: key+""}}});
                    break;
                case '7.0':
                    array.push({xAxis:2.400,label: {normal: {formatter:'\n\n' +  key+""}}});
                    break;
                case '7.2':
                    array.push({xAxis:2.431,label: {normal: {formatter: key+""}}});
                    break;
                case '9.5':
                    array.push({xAxis:2.754,label: {normal: {formatter:'\n\n' +  key+""}}});
                    break;
                case '13.2':
                    array.push({xAxis:3.193,label: {normal: {formatter: key+""}}});
                    break;
                case '16':
                    array.push({xAxis:3.482,label: {normal: {formatter:'\n\n' + key+""}}});
                    break;
                case '19':
                    array.push({xAxis:3.762,label: {normal: {formatter: key+""}}});
                    break;
                case '26.5':
                    array.push({xAxis:4.370,label: {normal: {formatter: '\n\n' + key+"" }}});
                    break;
                case '31.5':
                    array.push({xAxis:4.723,label: {normal: {formatter: key+""}}});
                    break;
                case '37.5':
                    array.push({xAxis:5.109,label: {normal: {formatter:'\n\n' + key}}});
                    break;
                case '53':
                    array.push({xAxis:5.969,label: {normal: {formatter: key+""}}});
                    break;
                case '63':
                    array.push({xAxis:6.452,label: {normal: {formatter:'\n\n' + key}}});
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
/******************************** Echart材料比渲染End********************************************/


 