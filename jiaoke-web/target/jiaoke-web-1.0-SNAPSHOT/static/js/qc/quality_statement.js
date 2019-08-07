$(function(){
    basePath  = $("#path").val();
    getMonthStatementToEchars();
    getMonthStatementData();
});


function getMonthStatementToEchars() {
    $.ajax({
        url:basePath + "/getMonthStatementToEchars.do",
        // url:"http://47.105.114.70/getRealTimeData.do",
        type:"get",
        dataType:"json",
        success:function (res) {
            var array1 = [];
            var array2 = [];

            for (var i = 0; i < res.length;i++){

                if (res[i].crewnum == 'crew1') {
                    switch (res[i].leve) {
                        case 3:
                            array1.push({"value":res[i]['count'],"name":"三级预警"});

                            break;
                        case 2:
                            array1.push({"value":res[i]['count'],"name":"二级预警"});
                            break;
                        case 1:
                            array1.push({"value":res[i]['count'],"name":"一级预警"});
                            break;
                        default:
                            array1.push({"value":res[i]['count'],"name":"无预警"});
                    }
                }else {
                    switch (res[i].leve) {
                        case 3:
                            array2.push({"value":res[i]['count'],"name":"三级预警","itemStyle":"{color:'\t#FF4500'}"});
                            break;
                        case 2:
                            array2.push({"value":res[i]['count'],"name":"二级预警","itemStyle":"{color:'#4169E1'}"});
                            break;
                        case 1:
                            array2.push({"value":res[i]['count'],"name":"一级预警","itemStyle":"{color:'#AFEEEE'}"});
                            break;
                        default:
                            array2.push({"value":res[i]['count'],"name":"无预警","itemStyle":"{color:'#48D1CC'}"});
                    }
                }
            }

            if ( array1.length != 0){
                option14.series[0].data = array1;
                myChart14.setOption(option14);
                window.addEventListener("resize", function () {
                    myChart14.resize();
                });
                option.series[0].data = array1;
                myChart1.setOption(option,true);
                window.addEventListener("resize", function () {
                    myChart1.resize();
                });
            }

            if (array2.length != 0){
                option7.series[0].data = array2;
                myChart7.setOption(option7,true);
                window.addEventListener("resize", function () {
                    myChart7.resize();
                });
                option15.series[0].data = array2;
                myChart15.setOption(option15);
                window.addEventListener("resize", function () {
                    myChart15.resize();
                });
            }

        },
        fall: function () {
            layer.alert('获取失败')
        }
    })
}
//首页上月相关统计数据
function getMonthStatementData() {
    $.ajax({
        url:basePath + "/getMonthStatementToData.do",
        // url:"http://47.105.114.70/getRealTimeData.do",
        type:"get",
        dataType:"json",
        success:function (res) {
            for (var k in res) {
                switch (k) {
                    case 'dateAndCount':
                        for (var i =0; i < res.dateAndCount.length;i++){
                            var crew = res[k][i]['crew'];
                            if (crew == 'crew1'){

                                $('#crew1_month_start_date').val(res.dateAndCount[i]['startDate']);
                                $('#crew1_month_end_date').val(res.dateAndCount[i]['endDate']);
                                $('#crew1_month_prototal').val(res.dateAndCount[i]['totalPro']);
                                $('#crew1_month_total').val(res.dateAndCount[i]['total']);

                                //月
                                $('#crew1_LastMonth_start_date').val(res.dateAndCount[i]['startDate']);
                                $('#crew1_LastMonth_end_date').val(res.dateAndCount[i]['endDate']);
                                $('#crew1_LastMonth_prototal').val(res.dateAndCount[i]['totalPro']);
                                $('#crew1_LastMonth_total').val(res.dateAndCount[i]['total']);
                            }else {
                                $('#crew2_month_start_date').val(res.dateAndCount[i]['startDate']);
                                $('#crew2_month_end_date').val(res.dateAndCount[i]['endDate']);
                                $('#crew2_month_prototal').val(res.dateAndCount[i]['totalPro']);
                                $('#crew2_month_total').val(res.dateAndCount[i]['total']);
                                //月
                                $('#crew2_LastMonth_start_date').val(res.dateAndCount[i]['startDate']);
                                $('#crew2_LastMonth_end_date').val(res.dateAndCount[i]['endDate']);
                                $('#crew2_LastMonth_prototal').val(res.dateAndCount[i]['totalPro']);
                                $('#crew2_LastMonth_total').val(res.dateAndCount[i]['total']);
                            }
                        }
                        break;
                    case 'materialMaxLever':
                        for (var i =0; i < res.materialMaxLever.length;i++) {
                            var crew_materialMaxLever = res[k][i]['crew'];
                            if (crew_materialMaxLever == 'crew1') {
                                $('#crew1_month_material_name').val(res.materialMaxLever[i]['material_name']);
                                $('#crew1_month_maxDeviation').val(res.materialMaxLever[i]['maxDeviation']);
                                //月
                                $('#crew1_LastMonth_material_name').val(res.materialMaxLever[i]['material_name']);
                                $('#crew1_LastMonth_maxDeviation').val(res.materialMaxLever[i]['maxDeviation']);
                            } else {
                                $('#crew2_month_material_name').val(res.materialMaxLever[i]['material_name']);
                                $('#crew2_month_maxDeviation').val(res.materialMaxLever[i]['maxDeviation']);
                                //月
                                $('#crew2_LastMonth_material_name').val(res.materialMaxLever[i]['material_name']);
                                $('#crew2_LastMonth_maxDeviation').val(res.materialMaxLever[i]['maxDeviation']);
                            }
                        }
                        break;
                    case 'maxRationAndcount':
                        for (var i =0; i < res.maxRationAndcount.length;i++) {
                            var crew_maxRationAndcount = res[k][i]['crew'];
                            if (crew_maxRationAndcount == 'crew1') {
                                $('#crew1_month_ration_name').val(res.maxRationAndcount[i]['produce_proportioning_num']);
                                $('#crew1_month_count').val(res.maxRationAndcount[i]['count']);
                                //月
                                $('#crew1_LastMonth_ration_name').val(res.maxRationAndcount[i]['produce_proportioning_num']);
                                $('#crew1_LastMonth_count').val(res.maxRationAndcount[i]['count']);
                            } else {
                                $('#crew2_month_ration_name').val(res.maxRationAndcount[i]['produce_proportioning_num']);
                                $('#crew2_month_count').val(res.maxRationAndcount[i]['count']);
                                //月
                                $('#crew2_LastMonth_ration_name').val(res.maxRationAndcount[i]['produce_proportioning_num']);
                                $('#crew2_LastMonth_count').val(res.maxRationAndcount[i]['count']);
                            }
                        }
                        break;
                }
            }
        },
        fall: function () {
            layer.alert('获取失败')
        }
    })
}

function yearFrom() {
    $.ajax({
        url:basePath + "/getYearStatementDateAndDate.do",
        type:"get",
        dataType:"json",
        success:function (res) {

            for (var k in res){
                switch (k) {
                    case 'lastYearDateList':
                        $('#monthList').empty();
                        $('#monthOption').empty();

                        for (var i =0; i < res.lastYearDateList.length;i++) {
                            $('#monthOption').append('<option>'+ res.lastYearDateList[i]['dates'] + '</option>');
                            $('#monthList').append('<li><a href="#">路驰' + res.lastYearDateList[i]['dates'] + '年产品报表</a></li>');
                        }
                        break;
                    case 'lastYearAndCount':
                        for (var i =0; i < res.lastYearAndCount.length;i++){
                            var crew = res[k][i]['crew'];
                            if (crew == 'crew1'){
                                $('#year1_start_date').val(res.lastYearAndCount[i]['startDate']);
                                $('#year1_end_date').val(res.lastYearAndCount[i]['endDate']);
                                $('#year1_product_count').val(res.lastYearAndCount[i]['totalPro']);
                                $('#year1_material_total').val(res.lastYearAndCount[i]['total']);
                            }else {
                                $('#year2_start_date').val(res.lastYearAndCount[i]['startDate']);
                                $('#year2_end_date').val(res.lastYearAndCount[i]['endDate']);
                                $('#year2_product_count').val(res.lastYearAndCount[i]['totalPro']);
                                $('#year2_material_total').val(res.lastYearAndCount[i]['total']);
                            }
                        }
                        break;
                    case 'lastYearMaterialMaxLever':
                        debugger
                        for (var i =0; i < res.lastYearMaterialMaxLever.length;i++) {
                            var crew_materialMaxLever = res[k][i]['crew'];
                            if (crew_materialMaxLever == 'crew1') {
                                $('#year1_material_name').val(res.lastYearMaterialMaxLever[i]['material_name']);
                                $('#year1_maxDeviation').val(res.lastYearMaterialMaxLever[i]['maxDeviation']);
                            } else {
                                $('#year2_material_name').val(res.lastYearMaterialMaxLever[i]['material_name']);
                                $('#year2_maxDeviation').val(res.lastYearMaterialMaxLever[i]['maxDeviation']);
                            }
                        }
                        break;
                    case 'lastYearMaxRationAndcount':
                        for (var i =0; i < res.lastYearMaxRationAndcount.length;i++) {
                            var crew_maxRationAndcount = res[k][i]['crew'];
                            if (crew_maxRationAndcount == 'crew1') {
                                $('#year1_ration_name').val(res.lastYearMaxRationAndcount[i]['produce_proportioning_num']);
                                $('#year1_count').val(res.lastYearMaxRationAndcount[i]['count']);
                            } else {
                                $('#year2_ration_name').val(res.lastYearMaxRationAndcount[i]['produce_proportioning_num']);
                                $('#year2_count').val(res.lastYearMaxRationAndcount[i]['count']);
                            }
                        }
                        break;
                    case 'lastYearEcharsData':
                        var array1 = [];
                        var array2 = [];

                        for (var i = 0; i < res.lastYearEcharsData.length;i++){

                            if (res.lastYearEcharsData[i].crewnum == 'crew1') {
                                switch (res.lastYearEcharsData[i].leve) {
                                    case 3:
                                        array1.push({"value":res.lastYearEcharsData[i]['count'],"name":"三级预警"});

                                        break;
                                    case 2:
                                        array1.push({"value":res.lastYearEcharsData[i]['count'],"name":"二级预警"});
                                        break;
                                    case 1:
                                        array1.push({"value":res.lastYearEcharsData[i]['count'],"name":"一级预警"});
                                        break;
                                    default:
                                        array1.push({"value":res.lastYearEcharsData[i]['count'],"name":"无预警"});
                                }
                            }else {
                                switch (res.lastYearEcharsData[i].leve) {
                                    case 3:
                                        array2.push({"value":res.lastYearEcharsData[i]['count'],"name":"三级预警","itemStyle":"{color:'\t#FF4500'}"});
                                        break;
                                    case 2:
                                        array2.push({"value":res.lastYearEcharsData[i]['count'],"name":"二级预警","itemStyle":"{color:'#4169E1'}"});
                                        break;
                                    case 1:
                                        array2.push({"value":res.lastYearEcharsData[i]['count'],"name":"一级预警","itemStyle":"{color:'#AFEEEE'}"});
                                        break;
                                    default:
                                        array2.push({"value":res.lastYearEcharsData[i]['count'],"name":"无预警","itemStyle":"{color:'#48D1CC'}"});
                                }
                            }
                        }

                        if ( array1.length != 0){
                            option11.series[0].data = array1;
                            myChart11.setOption(option11);
                            window.addEventListener("resize", function () {
                                myChart11.resize();
                            });
                        }

                        if (array2.length != 0){
                            option12.series[0].data = array2;
                            myChart12.setOption(option12,true);
                            window.addEventListener("resize", function () {
                                myChart12.resize();
                            });
                        }
                        break;
                }
            }
        }
    })
}
function yearSeason() {

}
function yearMonth() {
    $.ajax({
        url:basePath + "/getMonthDateList.do",
        type:"get",
        dataType:"json",
        success:function (res) {
            for (var i = 0; i < res.length;i++){
                for (var k in res[i]){
                    $("#monthOption").append('<option value="'+res[i][k] + '">' + res[i][k] + '</option>');
                }
            }
        }
    })
}