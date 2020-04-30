(function () {
    /**
     * 左一图表
     */
    showMonthChar();

    /**
     * 居中图表
     */
    showMidChar();
    /**
     * 右一图表
     */
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
    showThisMonthRegenerate()
})();

/**
 * 左一图表
 */
function showMonthChar() {

    var basePath = $("#path").val();
    //ajax查后台数据
    $.ajax({
        url:basePath + "/getThisMonthTwoCrewData.do",
        type:"get",

        dataType:"json",
        success:function (res) {
            var crew1Total = 0;
            var crew2Total = 0;
            if (res.message === "success"){
                var dataArry = res.dataList;
                for (var i = 0 ; i < dataArry.length;i++){
                    if (dataArry[i].crew === "crew1"){
                        crew1Total = dataArry[i].total;
                    }else {
                        crew2Total = dataArry[i].total;
                    }
                }

            }
            if (res.message === "error"){
                alert("后台错误，请联系管理员！");
            }
            showOption(crew1Total,crew2Total);
        }
    });
}

function showOption(crew1Total,crew2Total) {


    option = {
        title: {
        },
        animation:false,
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
            showContent:true,
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
                },{
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
    var myChart1 = echarts.init(document.getElementById('radar_echart'));
    // 使用刚指定的配置项和数据显示图表。
    myChart1.setOption(option);
    window.addEventListener("resize",function(){
        myChart1.resize();
    });
}

/**
 * 右一图表
 */
function showYearChar() {
    var basePath = $("#path").val();
    //ajax查后台数据
    $.ajax({
        url:basePath + "/getThisYearTwoCrewData.do",
        type:"get",
        dataType:"json",
        success:function (res) {
            var crew1Total = 0;
            var crew2Total = 0;
            if (res.message === "success"){
                var dataArry = res.dataList;
                for (var i = 0 ; i < dataArry.length;i++){
                    if (dataArry[i].crew === "crew1"){
                        crew1Total = dataArry[i].total;
                    }else {
                        crew2Total = dataArry[i].total;
                    }
                }
            }
            //更新中间总产量
            $("#yield").empty().append("<span id='parkplace'> "+ (crew1Total + crew2Total).toFixed(1) + "万吨</span>")
            if (res.message === "error"){
                alert("后台错误，请联系管理员！");
            }
            showYearOption(crew1Total,crew2Total);
        }
    });
}

function showYearOption(crew1Total,crew2Total) {
    option = {
        title: {
        },
        animation:false,
        grid: {
            top: "5%",
            left: "3%",
            bottom: "5%",
            right: "2%",
            containLabel: true
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            },
            showContent:true,
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
            position:'right',
            axisLabel: {
                textStyle: {
                    color: "#5dcbe8"
                },
                formatter: "{value} 万吨"
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
                    value: crew1Total.toFixed(2),
                    itemStyle: {
                        normal: {
                            color: '#41cdc5',
                            borderColor: 'rgba(137,189,2,0.27)'
                        }
                    }
                },{
                    name: "二号机组",
                    value: crew2Total.toFixed(2),
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
    var myChart1 = echarts.init(document.getElementById('right_one'));
    // 使用刚指定的配置项和数据显示图表。
    myChart1.setOption(option);
    window.addEventListener("resize",function(){
        myChart1.resize();
    });
}
/**
 * 居中图表
 */
function showMidChar() {
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('echart3'));
    option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                lineStyle: {
                    color: '#57617B'
                }
            }
        },
        legend: {

            //icon: 'vertical',
            data: ['参数1', '参数2','参数3'],
            //align: 'center',
            // right: '35%',
            top:'0',
            textStyle: {
                color: "#fff"
            },
            // itemWidth: 15,
            // itemHeight: 15,
            itemGap: 20,
        },
        grid: {
            left: '0',
            right: '20',
            top:'10',
            bottom: '20',
            containLabel: true
        },
        xAxis: [{
            type: 'category',
            boundaryGap: false,
            axisLabel: {
                show: true,
                textStyle: {
                    color: 'rgba(255,255,255,.6)'
                }
            },
            axisLine: {
                lineStyle: {
                    color: 'rgba(255,255,255,.1)'
                }
            },
            data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
        }, {

        }],
        yAxis: [{
            axisLabel: {
                show: true,
                textStyle: {
                    color: 'rgba(255,255,255,.6)'
                }
            },
            axisLine: {
                lineStyle: {
                    color: 'rgba(255,255,255,.1)'
                }
            },
            splitLine: {
                lineStyle: {
                    color: 'rgba(255,255,255,.1)'
                }
            }
        }],
        series: [{
            name: '参数1',
            type: 'line',
            smooth: true,
            symbol: 'circle',
            symbolSize: 5,
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
                        color: 'rgba(24, 163, 64, 0.3)'
                    }, {
                        offset: 0.8,
                        color: 'rgba(24, 163, 64, 0)'
                    }], false),
                    shadowColor: 'rgba(0, 0, 0, 0.1)',
                    shadowBlur: 10
                }
            },
            itemStyle: {
                normal: {
                    color: '#cdba00',
                    borderColor: 'rgba(137,189,2,0.27)',
                    borderWidth: 12
                }
            },
            data: [220, 182, 191, 134, 150, 120, 110, 125, 145, 122, 165, 122]
        }, {
            name: '参数2',
            type: 'line',
            smooth: true,
            symbol: 'circle',
            symbolSize: 5,
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
                        color: 'rgba(39, 122,206, 0.3)'
                    }, {
                        offset: 0.8,
                        color: 'rgba(39, 122,206, 0)'
                    }], false),
                    shadowColor: 'rgba(0, 0, 0, 0.1)',
                    shadowBlur: 10
                }
            },
            itemStyle: {
                normal: {
                    color: '#277ace',
                    borderColor: 'rgba(0,136,212,0.2)',
                    borderWidth: 12
                }
            },
            data: [120, 110, 125, 145, 122, 165, 122, 220, 182, 191, 134, 150]
        }, {
            name: '参数3',
            type: 'line',
            smooth: true,
            symbol: 'circle',
            symbolSize: 5,
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
                        color: 'rgba(39, 122,206, 0.3)'
                    }, {
                        offset: 0.8,
                        color: 'rgba(39, 122,206, 0)'
                    }], false),
                    shadowColor: 'rgba(0, 0, 0, 0.1)',
                    shadowBlur: 10
                }
            },
            itemStyle: {
                normal: {
                    color: '#ce0cc8',
                    borderColor: 'rgba(0,136,212,0.2)',
                    borderWidth: 12
                }
            },
            data: [20, 201, 90, 78, 30, 109, 221, 88, 70, 39, 55, 180]
        }]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    window.addEventListener("resize",function(){
        myChart.resize();
    });
}

/**
 * 查询本年开工情况
 */
function showProductionDays(){
    var basePath = $("#path").val();
    //ajax查后台数据
    $.ajax({
        url:basePath + "/getProductionDays.do",
        type:"get",
        dataType:"json",
        success:function (res) {
            if (res.message === "success"){
                var dataArry = res.dataList;
                var crew1Num = 0;
                var crew2Num = 0;
                for (var i = 0 ; i < dataArry.length;i++){
                    if (dataArry[i].crew === "crew1"){
                        crew1Num = dataArry[i].crewCount;
                    }else {
                        crew2Num = dataArry[i].crewCount;
                    }
                }
                var crewNum = crew1Num > crew2Num? crew1Num:crew2Num;

                $("#production_days").empty().append("<span id='parknum'>第" + crewNum +  "天</span>")

            }
            if (res.message === "error"){
                alert("后台错误，请联系管理员！");
            }
        }
    });
}
/**
 * 查询再生料总量
 */
function showMaterialRegenerate(){
    var basePath = $("#path").val();
    //ajax查后台数据
    $.ajax({
        url:basePath + "/getMaterialRegenerate.do",
        type:"get",
        dataType:"json",
        success:function (res) {
            debugger
            if (res.message === "success"){
                var dataArry = res.dataList;
                var crew1Num = 0;
                var crew2Num = 0;
                for (var i = 0 ; i < dataArry.length;i++){
                    if (dataArry[i].crew === "crew1"){
                        crew1Num = dataArry[i].total;
                    }else {
                        crew2Num = dataArry[i].total;
                    }
                }
                var sum = (crew1Num + crew2Num).toFixed(1);

                $("#usageAmount").empty().append("<span>" + sum +  "吨</span>");

            }
            if (res.message === "error"){
                alert("后台错误，请联系管理员！");
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
        url:basePath + "/getThisMonthRegenerate.do",
        type:"get",
        dataType:"json",
        success:function (res) {
            debugger
            if (res.message === "success"){
                var dataArry = res.dataList;
                var crew1Num = 0;
                var crew2Num = 0;
                for (var i = 0 ; i < dataArry.length;i++){
                    if (dataArry[i].crew === "crew1"){
                        crew1Num = dataArry[i].total;
                    }else {
                        crew2Num = dataArry[i].total;
                    }
                }
                var sum = (crew1Num + crew2Num).toFixed(1);

                $("#thisUsageAmount").empty().append("<span>" + sum +  "吨</span>");

            }
            if (res.message === "error"){
                alert("后台错误，请联系管理员！");
            }
        }
    });
}