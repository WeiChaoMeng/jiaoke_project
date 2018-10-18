
/***********************间隔执行Start*****************************/
window.setInterval(getWarningData, 3000);

/***********************间隔执行End*****************************/
function getWarningData() {
    $.ajax({
        // url: "http://localhost:8080/getQualityWarningData.do",
        url: "http://47.105.114.70/getQualityWarningData.do",
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
                        case "1":
                            warningLeve = "一级预警";
                            break;
                        case "2":
                            warningLeve = "二级预警";
                            break;
                        case "3":
                            warningLeve = "三级预警";
                            break;
                    }

                    /****************渲染材料数据*****************/
                    if (res[i].material_name == '沥青温度' || res[i].material_name == '混合料温度' || res[i].material_name == '骨料温度') {
                        $(materialStr).append(
                            '<tr class="warning_table_even">'
                            + '<td>' + res[i].material_name + '</td>'
                            + '<td>' + res[i].moudle_ratio + '<i>℃</i></td>'
                            + '<td>' + res[i].actual_ratio + '<i>℃</i></td>'
                            + '<td>' + res[i].deviation_ratio + '<i>℃</i></td>'
                            + '<td>' + warningLeve + '</td>'
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
                            + '</tr>'
                        )
                    }

                }
            }
        }
    })


    getEcharsData();
}

function getEcharsData() {

    $.ajax({
        // url: "http://localhost:8080/getWarningEcharsData.do",
        url: "http://47.105.114.70/getWarningEcharsData.do",
        type: "post",
        dataType: "json",
        success:function (res) {

            var crew1nameArray = new Array();
            var crew1topArray = new Array();
            var crew1downArray = new Array();
            var crew1realArray = new Array();

            var crew2nameArray = new Array();
            var crew2topArray = new Array();
            var crew2downArray = new Array();
            var crew2realArray = new Array();

            for (var k in res){
                switch (k) {
                    case "crew1nameList":
                        eachList(res[k],crew1nameArray);
                        break;
                    case "crew1topList":
                        eachList(res[k],crew1topArray);
                        break;
                    case "crew1downList":
                        eachList(res[k],crew1downArray);
                        break;
                    case "crew1realList":
                        eachList(res[k],crew1realArray);
                        break;

                    case "crew2nameList":
                        eachList(res[k],crew2nameArray);
                        break;
                    case "crew2topList":
                        eachList(res[k],crew2topArray);
                        break;
                    case "crew2downList":
                        eachList(res[k],crew2downArray);
                        break;
                    case "crew2realList":
                        eachList(res[k],crew2realArray);
                        break;
                }
            }




            option.xAxis[0].data = crew1nameArray;
            option.series[0].data = crew1topArray;
            option.series[1].data = crew1realArray;
            option.series[2].data = crew1downArray;
            myChart.setOption(option,true);
            window.onresize = myChart.resize();

            option2.xAxis[0].data = crew2nameArray;
            option2.series[0].data = crew2topArray;
            option2.series[1].data = crew2realArray;
            option2.series[2].data = crew2downArray;
            myChart2.setOption(option2,true);
            window.onresize = myChart2.resize();
        }
    })
}

/********遍历方法*********/
function eachList(inArray,toArray) {

    for (var i = 0; i < inArray.length; i++) {
        toArray[i] = inArray[i];
    }

}
// 初始化
(function ($) {
    getEcharsData()
    getWarningData();
})(jQuery);
 