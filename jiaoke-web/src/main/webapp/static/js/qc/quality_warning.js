var basePath = "";
//三级预警信息装载
var war1Name = "";
var war1Vla = "";
var war2Name = "";
var war2Vla = "";
// 初始化
(function ($) {
    // getEcharsData();
    getWarningData();
    getRealTimeDataEcharsMaterial();
    basePath = $("#path").val();

})(jQuery);
/***********************间隔执行Start*****************************/
setInterval(getWarningData, 20000);

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

             war1Name = "";
             war1Vla = "";
             war2Name = "";
             war2Vla = "";
            if (res.length) {

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
                            warningLeve = '<div  style="background-color: green;width: 35px;margin-left: 13%;height: 20px;border-radius: 5px;"></div>';
                            break;
                        case 1:
                            warningLeve = '<div  style="background-color: blue;width: 35px;margin-left: 13%;height: 20px;border-radius: 5px;"></div>';
                            break;
                        case 2:
                            warningLeve = '<div  style="background-color: yellow;width: 35px;height: 20px;margin-left: 13%;border-radius: 5px;"></div>';
                            break;
                        case 3:
                            warningLeve = '<div  style="background-color: red;width: 35px;height: 20px;margin-left: 13%;border-radius: 5px;"></div>';
                            if (res[i].produce_crewNum  === 1){
                                if (war1Name === ""){
                                    war1Name += res[i].material_name;
                                    war1Vla += res[i].deviation_ratio;
                                }else {
                                    war1Name += "、" + res[i].material_name;
                                    war1Vla += "、" + res[i].deviation_ratio;
                                }
                            }else {
                                if (war2Name === ""){
                                    war2Name += res[i].material_name;
                                    war2Vla += res[i].deviation_ratio;
                                }else {
                                    war2Name += "、" + res[i].material_name;
                                    war2Vla += "、" + res[i].deviation_ratio;
                                }
                            }
                            break;
                    }

                    /****************渲染材料数据*****************/
                    if (res[i].material_name == '沥青温度' || res[i].material_name == '混合料温度' || res[i].material_name == '骨料温度'||res[i].material_name == '一仓温度') {
                        var tempHtml = "";
                        if (res[i].warning_level === 3){
                            tempHtml = '<tr class="warning_table_even" style="background-color: #e494a4">'
                                + '<td>' + res[i].material_name + '</td>'
                                + '<td>' + res[i].moudle_ratio + '<i>℃</i></td>'
                                + '<td>' + res[i].actual_ratio + '<i>℃</i></td>'
                                + '<td>' + res[i].deviation_ratio + '<i>℃</i></td>'
                                + '<td>' + warningLeve + '</td>'
                                + '<td>' + res[i].avg_real_ration + '<i>℃</i></td>'
                                + '</tr>';
                        }else {
                            tempHtml = '<tr class="warning_table_even" >'
                                + '<td>' + res[i].material_name + '</td>'
                                + '<td>' + res[i].moudle_ratio + '<i>℃</i></td>'
                                + '<td>' + res[i].actual_ratio + '<i>℃</i></td>'
                                + '<td>' + res[i].deviation_ratio + '<i>℃</i></td>'
                                + '<td>' + warningLeve + '</td>'
                                + '<td>' + res[i].avg_real_ration + '<i>℃</i></td>'
                                + '</tr>';
                        }
                        $(materialStr).append(tempHtml)
                    } else {
                        var subHtml = "";
                        if (res[i].warning_level === 3){
                            subHtml = '<tr class="warning_table_even" style="background-color: #e494a4">'
                                + '<td>' + res[i].material_name + '</td>'
                                + '<td>' + res[i].moudle_ratio + '<i>℃</i></td>'
                                + '<td>' + res[i].actual_ratio + '<i>℃</i></td>'
                                + '<td>' + res[i].deviation_ratio + '<i>℃</i></td>'
                                + '<td>' + warningLeve + '</td>'
                                + '<td>' + res[i].avg_real_ration + '<i>%</i></td>'
                                + '</tr>';
                        }else {
                            subHtml = '<tr class="warning_table_even" >'
                                + '<td>' + res[i].material_name + '</td>'
                                + '<td>' + res[i].moudle_ratio + '<i>℃</i></td>'
                                + '<td>' + res[i].actual_ratio + '<i>℃</i></td>'
                                + '<td>' + res[i].deviation_ratio + '<i>℃</i></td>'
                                + '<td>' + warningLeve + '</td>'
                                + '<td>' + res[i].avg_real_ration + '<i>%</i></td>'
                                + '</tr>';
                        }
                        $(materialStr).append(subHtml);
                    }

                }

            }
        }
    })

    getRealTimeDataEcharsMaterial();
    // getEcharsData();
}

//显示预警信息



$("#crew1_material").hover(
    function () {
        var msg = "";
        if (war1Name === ""){
            msg = "当前产品无预警";
        }else {
            msg =  "一号机组材料：" + war1Name + "偏差较大，已经构成三级报警。偏差值为："+ war1Vla ;
        }
        layui.use('layer', function() {
            var layer = layui.layer;
            layer.tips(msg, $("#warning"), {
                tips: [2, '#3595CC'],
                time: 0,
                area: ['auto', 'auto']
            });
        });
    },
    function () {
        layui.use('layer', function() {
            var layer = layui.layer;
            layer.closeAll();
        });

    }
);


$("#crew2_material").hover(
    function () {
        var msg = "";
        if (war2Name === ""){
            msg = "当前产品无预警";
        }else {
            msg =  "一号机组材料：" + war2Name + "偏差较大，已经构成三级报警。偏差值为："+ war2Vla ;
        }
        layui.use('layer', function() {
            var layer = layui.layer;
            layer.tips(msg, $("#warning"), {
                tips: [2, '#3595CC'],
                time: 0,
                area: ['auto', 'auto']
            });
        });
    },
    function () {
        layui.use('layer', function() {
            var layer = layui.layer;
            layer.closeAll();
        });

    }
);
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


/******************************** 预警级别修改Start********************************************/
function  editWarningLevel(){

    $.ajax({
        url:basePath + "/getWarningLevelData.do",
        dataType:"json",
        success:function (res) {
            if (!res){
                layui.use('layer', function() {
                    var layer = layui.layer;
                    layer.msg("预警信息查询错误");
                });
                return
            }

            layui.use('layer', function() {
                var layer = layui.layer;
                layer.open({
                    type: 1,
                    area: ['90%', '80%'], //宽高
                    offset: '30px',
                    scrollbar:true,
                    shadeClose: true, //开启遮罩关闭
                    content: $('#formDiv')//捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
                });
            });

            var htmlStr = "";
            for (var i = 0; i < res.data.length;i++) {
                var warningLeve = res.data[i];
                htmlStr += '<div class="layui-form-item" id="' + warningLeve.material_name + '" style="margin-top: 0px;margin-left: 30px;margin-bottom: 0px;">'
                + '<div class="layui-inline">'
                + '<label class="layui-form-label" style="margin-right: 30px;">' + warningLeve.remark + '</label>'
                + '<div class="layui-input-inline" style="width: 110px;">'
                    + '<input type="text" name="id" placeholder="id" autocomplete="off" value="' + warningLeve.id + '" class="layui-input" style="display: none;">'
                + '<input type="text" name="level_one_up" value="' + warningLeve.level_one_up +'" autocomplete="off" class="layui-input">'
                + '</div>'
                + '<div class="layui-input-inline" style="width: 110px;">'
                + '<input type="text" name="level_one_down" value="' + warningLeve.level_one_down +'"  autocomplete="off" class="layui-input">'
                + '</div>'
                + '<div class="layui-input-inline" style="width: 110px;">'
                + '<input type="text" name="level_two_up" value="' + warningLeve.level_two_up +'" autocomplete="off" class="layui-input">'
                + '</div>'
                + '<div class="layui-input-inline" style="width: 110px;">'
                + '<input type="text" name="level_two_down" value="' + warningLeve.level_two_down +'" autocomplete="off" class="layui-input">'
                + '</div>'
                + '<div class="layui-input-inline" style="width: 110px;">'
                + '<input type="text" name="level_three_up" value="' + warningLeve.level_three_up +'" autocomplete="off" class="layui-input">'
                + '</div>'
                + '<div class="layui-input-inline" style="width: 110px;">'
                + '<input type="text" name="level_three_down" value="' + warningLeve.level_three_down +'"  autocomplete="off" class="layui-input">'
                + '</div>'
                + '</div>'
                + '</div>';
            }

            $("#fromHerd").after(htmlStr);

        }
    })

    // $(".layui-layer-content").css("height","500px");

}


$("#saveLevel").click(function () {
    var fromData = reFromJsonData();
    $.ajax({
        type:'POST',
        url:basePath + "/editWarningLevel.do",
        dataType:"json",
        data:{
            "fromData":JSON.stringify(fromData)
        },
        success:function (res) {
            layui.use('layer', function() {
                var layer = layui.layer;
                if (res.message === 'success'){
                        layer.closeAll();
                        layer.msg("修改完成");
                }else if (res.message === 'fail') {
                        layer.msg("修改失败");
                }else {
                        layer.msg("后台错误");
                   }
            })
        }
    })

}) ;

function geiValueByDiv(divId) {
    var res = {};
    $("#" + divId + " input").each(function (i,n) {
        var tem = $(this).attr('name');
        var val = $(this).val();
            res[''+ tem] = val;
    })
    return res;
}

function reFromJsonData() {
    var nameArray = ['aggregate1','aggregate2','aggregate3','aggregate4','aggregate5','aggregate6','breeze','asphalt','regenerate','additive','warehouse_1','temperature_mixture','temperature_asphalt','temperature_aggregate'];
    var objArray = [];
    for(var i = 0; i < nameArray.length;i++){
        var obj = geiValueByDiv(nameArray[i]);
        if (obj != null) {
            objArray.push(obj);
        }
    }

    return objArray;
}

/******************************** 预警级别修改End********************************************/




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
                    array.push({xAxis:0.312,label: {rotate:90, formatter:key},lineStyle: {normal: {type: 'solid', width:0.5, color: '#000000'}}});
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

function returnX(key) {
    var s = 0;
    key = key +'';
    switch (key) {
        case '0.312':
            s = 0.075;
            break;
        case '0.426':
            s = 0.15;
            break;
        case '0.582':
            s = 0.3;
            break;
        case '0.795':
            s = 0.6;
            break;
        case '1.007':
            s = 1.18;
            break;
        case '1.472':
            s = 2.36;
            break;
        case '2.016':
            s = 4.75;
            break;
        case '2.354':
            s = 6.7;
            break;
        case '2.4':
            s = 7.0;
            break;
        case '2.431':
            s = 7.2;
            break;
        case '2.754':
            s = 9.5;
            break;
        case '3.193':
            s = 13.2;
            break;

        case '3.482':
            s = 16;
            break;
        case '3.762':
            s = 19;
            break;
        case '4.37':
            s = 26.5;
            break;
        case '4.723':
            s = 31.5;
            break;
        case '5.109':
            s = 37.5;
            break;
        case '5.969':
            s = 53;
            break;
        case '6.452':
            s = 63;
            break;
    }

    return s;
}
/******************************** Echart材料比渲染End********************************************/


 