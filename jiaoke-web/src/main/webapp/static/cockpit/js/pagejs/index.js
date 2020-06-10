(function () {
    /**
     * 展示机组基本信息
     */
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#basicMessage'
            ,width: '100%' //设置容器宽度
            ,height:'85%'
            ,arrow: 'none' //始终显示箭头
            ,indicator:"none"
            ,interval:'10000'
            //,anim: 'updown' //切换动画方式
        });
    });
    /**
     * 左二、左三图表
     */
    getThisMonthYield();

    /**
     * 左三图表
     */
    // showYearChar();

    /**
     * 中间数据(查询本月总产量)
     */
    showMonthChar();
    showYearChar();
    /**
     * 查询开工天数
     */
    showProductionDays();
    /**
     * 查询再生料总量
     */
    showMaterialRegenerate();
    /**
     * 查询本月再生料总量
     */
    showThisMonthRegenerate();

    /**
     * 右一文字动态
     */
    showTenProjectMessage();
})();

/**
 * 展示左一图表信息
 */


/**
 * 左一图表(弃置)
 */
function showMonthChar() {

    var basePath = $("#path").val();
    //ajax查后台数据
    $.ajax({
        url: basePath + "/getThisMonthTwoCrewData.do",
        type: "get",

        dataType: "json",
        success: function (res) {
            var crew1Total = 0;
            var crew2Total = 0;
            if (res.message === "success") {
                var dataArry = res.dataList;
                for (var i = 0; i < dataArry.length; i++) {
                    if (dataArry[i].crew === "crew1") {
                        crew1Total = dataArry[i].total;
                    } else {
                        crew2Total = dataArry[i].total;
                    }
                }
            }
            var crew1 = crew1Total? crew1Total:0;
            var crew2 = crew2Total? crew2Total:0;
            $("#thisMonthCount").empty().append("<span id='parkplace'> " + (crew1 + crew2).toFixed(1) + "吨</span>")
            if (res.message === "error") {
                layer.msg("后台错误，请联系管理员！");
            }
            // showOption(crew1Total, crew2Total);
        }
    });
}

function showOption(crew1Total, crew2Total) {

    var myChart1 = echarts.init(document.getElementById('radar_echart'));
    var option = {
        title: {},
        animation: false,
        grid: {
            top: "5%",
            left: "2%",
            bottom: "5%",
            right: "3%",
            containLabel: true
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            },
            showContent: true,
        },
        xAxis: [{
            type: "category",
            data: ["一号机组", "二号机组"],
            axisTick: {
                alignWithLabel: true
            },
            nameTextStyle: {
                color: "#fff"
            },
            axisLine: {
                lineStyle: {
                    color: "#5dcbe8"
                }
            },
            axisLabel: {
                textStyle: {
                    color: "#5dcbe8"
                },
                margin: 10
            }
        }],
        yAxis: [{
            type: "value",
            axisLabel: {
                textStyle: {
                    color: "#5dcbe8"
                },
                formatter: "{value} 吨"
            },
            splitLine: {
                lineStyle: {
                    color: "#5dcbe8"
                }
            },
            // axisLine: {
            //     show: false
            // }
            // axisLine: {
            //     lineStyle: {
            //         color: "#5dcbe8"
            //     }
            // },
            // max:function (value) {
            //     return value.max + 200;
            // }
            // axisLabel: {
            //     textStyle: {
            //         color: "#5dcbe8"
            //     },
            //     margin: 10
            // }
        }],
        series: [
            {
                type: 'bar',
                itemStyle: {
                    normal: {
                        //color: '#14b1eb',
                        opacity: .7
                    }
                },
                //silent: true,
                barWidth: "100",
                //barGap: '-100%', // Make series be overlap
                data: [{
                    name: "一号机组",
                    value: crew1Total.toFixed(0),
                    itemStyle: {
                        normal: {
                            color: '#41cdc5',
                            borderColor: 'rgba(137,189,2,0.27)'
                        }
                    }
                }, {
                    name: "二号机组",
                    value: crew2Total.toFixed(0),
                    itemStyle: {
                        normal: {
                            color: '#cd957b',
                            borderColor: 'rgba(137,189,2,0.27)'
                        }
                    }
                }]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart1.setOption(option);
    window.addEventListener("resize", function () {
        myChart1.resize();
    });
}

/**
 * 左二图表、左三图表
 */
function getThisMonthYield() {

    var basePath = $("#path").val();
    //ajax查后台数据
    $.ajax({
        url: basePath + "/getThisMonthYield.do",
        type: "get",
        dataType: "json",
        success: function (res) {
            if (res.message === "success") {
                var series = [];
                var crew1Array = [];
                var crew2Array = [];
                var crew1Gross = 0;
                var crew2Gross = 0;
                //处理一二号机组本月生产总数
                var total = res.thisMonthYield;
                for (var i = 0; i < total.length;i++){
                    var crew = total[i].crew;
                    var proSum = total[i].gross;
                    debugger
                    if (crew === 'crew1'){
                        series.push({name:'机组一本月产量',data:[proSum, null, null],stack: 'male'});
                        crew1Gross = proSum;
                    }else {
                        series.push({name:'机组二本月产量',data:[null, proSum, null],stack: 'male'});
                        crew2Gross = proSum;
                    }
                }
                var crew1 = crew1Gross? crew1Gross:0;
                var crew2 = crew2Gross? crew2Gross:0;
                //另一个柱状图
                series.push({name:'本月总产量',data:[null, null,crew1 + crew2 ],stack: 'male'});


                //处理本月各机组产品前十。左三饼图
                var monthProduct = res.thisMonthProduct;
                var serData = [];
                var otherData = 0;
                for (var j = 0; j < monthProduct.length;j++){
                    if (monthProduct[j]){
                        var total = monthProduct[j].total;
                        var proName = monthProduct[j].pro_name;
                        if (j === 0){
                            serData.push({name:proName,y:total,sliced: true, selected: true});
                        }else  if (j > 0 && j < 6){
                            serData.push([proName,total]);
                        }else {
                            otherData += total;
                        }
                    }
                };
                serData.push(["其他类型",otherData]);
                showProdauctPie(serData);
            }

            if (res.message === "error") {
                layer.msg("后台错误，请联系管理员！");
            }

            showLeftTwoEchars(series);
        }
    });
};
function showLeftTwoEchars(series) {
    $('#xctj').highcharts({
        chart: {
            type: 'column',
            options3d: {
                enabled: true,
                alpha: 0,
                beta: 0,
                viewDistance: 25,
                depth: 40, backgroundColor: 'rgba(0,0,0,0)'
            },backgroundColor: 'rgba(0,0,0,0)'
        },title:'',
        credits:{
            enabled:false // 禁用版权信息
        },colors:['#72ab12','#dc380e','#ff8c01','#3a85be','#fe8c00'],
        legend: {
            enabled: false
        },xAxis: {
            categories: ['机组一本月产量', '机组二本月产量', '本月总产量'],
            labels: {
                format: '{value} ',
                style: {
                    color: 'white'
                }
            }
        },
        yAxis: {
            allowDecimals: false,
            min: 0,
            title: {
                text: ''
            }, labels: {
                format: '{value} ',
                style: {
                    color: 'white'
                }
            }
        },
        tooltip: {
            headerFormat: '<b>{point.key}</b><br>',
            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y}吨'
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                depth: 70,
                dataLabels: { //图上是否显示数据标签
                    enabled: true,
                    align: "center",
                    formatter: function()
                    {
                        return this.y + '吨'
                    },
                    // rotation: 270,
                    // staggerLines: 0,
                },
            },

        },
        series: series
    });
};

/**
 * 左三图表
 */
function showYearChar() {
    var basePath = $("#path").val();
    //ajax查后台数据
    $.ajax({
        url: basePath + "/getThisYearTwoCrewData.do",
        type: "get",
        dataType: "json",
        success: function (res) {
            var crew1Total = 0;
            var crew2Total = 0;
            if (res.message === "success") {
                var dataArry = res.dataList;
                for (var i = 0; i < dataArry.length; i++) {
                    if (dataArry[i].crew === "crew1") {
                        crew1Total = dataArry[i].total;
                    } else {
                        crew2Total = dataArry[i].total;
                    }
                }
                var total = (Number(crew1Total) + Number(crew2Total)).toFixed(1);
                console.log(total)
                //更新中间总产量
                $("#yield").empty().append("<span id='parkplace'> " + total + "万吨</span>")
            }

            if (res.message === "error") {
                layer.msg("后台错误，请联系管理员！");
            }

            // showYearOption(crew1Total.toFixed(2), crew2Total.toFixed(2));
        }
    });
}

function showYearOption(crew1Total, crew2Total) {

    $('#sssjtj').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45
            }, backgroundColor: 'rgba(0,0,0,0)'
        },
        title: {
            text: ' '
        }, credits:{
            enabled:false // 禁用版权信息
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                innerSize: 100,
                depth: 25,
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.y}吨',
                    style: {
                        color: 'white'
                    }
                }
            }
        },tooltip: {
            pointFormat: '{point.name}: <b>{point.y}吨</b>'
        },
        series: [{
            // name: '桥梁病害',
            data: [
                ['一号机组', Number(crew1Total)],
                ['二号机组', Number(crew2Total)],

            ],colors:['#72ab12','#dc380e','#ff8c01','#3a85be','#fe8c00']
        }]
    });

}

/**
 * 正在使用
 */
function showProdauctPie(serData) {
    $('#sssjtj').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            } , backgroundColor: 'rgba(0,0,0,0)'
        },
        credits:{
            enabled:false // 禁用版权信息
        },colors:['#72ab12','#dc380e','#ff8c01','#3a85be','#fe8c00'],
        title: {
            text: ''
        },
        tooltip: {
            pointFormat: '{series.name}: {point.y}个，占比{point.percentage:.1f}%'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}: {point.y}吨',
                    style: {
                        color: 'white'
                    }
                }
            }
        },
        series: [{
            type: 'pie',
            name: '本月产品类型构成',
            data: serData
        }]
    });

}

/**
 * 查询本年开工情况
 */
function showProductionDays() {
    var basePath = $("#path").val();
    //ajax查后台数据
    $.ajax({
        url: basePath + "/getProductionDays.do",
        type: "get",
        dataType: "json",
        success: function (res) {
            if (res.message === "success") {
                var dataArry = res.dataList;
                var crew1Num = 0;
                var crew2Num = 0;
                for (var i = 0; i < dataArry.length; i++) {
                    if (dataArry[i].crew === "crew1") {
                        crew1Num = dataArry[i].crewCount;
                    } else {
                        crew2Num = dataArry[i].crewCount;
                    }
                }
                var crewNum = crew1Num > crew2Num ? crew1Num : crew2Num;

                $("#production_days").empty().append("<span id='parknum'>第" + crewNum + "天</span>")

            }
            if (res.message === "error") {
                layer.msg("后台错误，请联系管理员！");
            }
        }
    });
}

/**
 * 查询再生料总量
 */
function showMaterialRegenerate() {
    var basePath = $("#path").val();
    //ajax查后台数据
    $.ajax({
        url: basePath + "/getMaterialRegenerate.do",
        type: "get",
        dataType: "json",
        success: function (res) {
            if (res.message === "success") {
                var dataArry = res.dataList;
                var crew1Num = 0;
                var crew2Num = 0;
                for (var i = 0; i < dataArry.length; i++) {
                    if (dataArry[i].crew === "crew1") {
                        crew1Num = dataArry[i].total;
                    } else {
                        crew2Num = dataArry[i].total;
                    }
                }
                var sum = (crew1Num + crew2Num).toFixed(1);

                $("#usageAmount").empty().append("<span>" + sum + "吨</span>");

            }
            if (res.message === "error") {
                layer.msg("后台错误，请联系管理员！");
            }
        }
    });
}

/**
 * 查询本月再生料总量
 */
function showThisMonthRegenerate() {
    var basePath = $("#path").val();
    //ajax查后台数据
    $.ajax({
        url: basePath + "/getThisMonthRegenerate.do",
        type: "get",
        dataType: "json",
        success: function (res) {
            if (res.message === "success") {
                var dataArry = res.dataList;
                var crew1Num = 0;
                var crew2Num = 0;
                for (var i = 0; i < dataArry.length; i++) {
                    if (dataArry[i].crew === "crew1") {
                        crew1Num = dataArry[i].total;
                    } else {
                        crew2Num = dataArry[i].total;
                    }
                }
                var crew1 = crew1Num? crew1Num:0;
                var crew2 = crew2Num? crew2Num:0;

                var sum = (crew1 + crew2).toFixed(1);

                $("#thisUsageAmount").empty().append("<span>" + sum + "吨</span>");

            }
            if (res.message === "error") {
                layer.msg("后台错误，请联系管理员！");
            }
        }
    });
}

/**
 * 查询本年工程
 */
function showTenProjectMessage() {
    var basePath = $("#path").val();
    //ajax查后台数据
    // $.ajax({
    //     url: basePath + "/getTopTenProject.do",
    //     type: "get",
    //     dataType: "json",
    //     success: function (res) {
    //         if (res.message === "success") {
    //            var temArray = res.dataBody;
    //            $("#yearProduct").empty();
    //             var colourArry = ['#43457f','#5e508e','#0cd402','#daeeff','#f4f513','#ffb3b0','#b967ff','#5382ff','#ff71ce','#ca001e'];
    //            for (var i = 0; i < temArray.length;i++){
    //                var proName = temArray[i].project_name;
    //                proName = proName.split("(")[0] ? proName.split("(")[0]:proName;
    //                proName = proName.split("（")[0]? proName.split("（")[0]:proName;
    //
    //                $("#yearProduct").append("<li><span class='example_span' style='background-color:" + colourArry[i] + ";display: block;width: 17px;height: 13px;float: left;margin-right: 10px;margin-top: 3px;border-radius: 5px;'></span><p>" + proName +"</p></li>")
    //            }
    //
    //             $("div.list_lh").myScroll({
    //                 speed:40, //数值越大，速度越慢
    //                 rowHeight:35 //li的高度
    //             });
    //         }
    //         if (res.message === "empty"){
    //             layer.msg("当前无工程");
    //         }
    //         if (res.message === "error") {
    //             layer.msg("后台错误，请联系管理员！");
    //         }
    //     }
    // });

    var proObj = sessionStorage.getItem("projectObj");
    proObj = JSON.parse(proObj);
    var colourArry = ['#ffffe1','#e87a00','#0cd402','#efa900','#f4f513','#00ffd0','#cccb00','#5382ff','#2ec2ff','#ca001e'];
    var tem = 0;

    for(var key in proObj){
        if (key === "路驰分公司") {

        }else {
            $("#yearProduct").append("<li><span class='example_span' style='background-color:" + colourArry[tem] + ";display: block;width: 17px;height: 13px;float: left;margin-right: 10px;margin-top: 3px;border-radius: 5px;'></span><p>" + key +"</p></li>")

        }
        tem++;
    }

    $("div.list_lh").myScroll({
        speed:40, //数值越大，速度越慢
        rowHeight:35 //li的高度
    });
}

 function isBlank (str) {
    var s = $.trim(str);
    if (s == "undefined" || s == null || s == "" || s.length == 0) {
        return true;
    }
    return false;
};