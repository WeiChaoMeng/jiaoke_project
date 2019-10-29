
(function ($) {
    //获取本周生产产量
    getThisWeekData();
    //获取本月生产产量
    getThisMonthData();
    //获取本年生产产量
    getThisYearData();
    //获取截至目前为止所有产量
    getAlldata();

    //获取上月每天产量
    getLastMonthData();
    //获取上个月对比信息
    monthContrast ();
    //个月完成占比
    allMonthPercent();
    //查询今年各月生产天数
    getEveryMonthDays();
    //获取今年产量与计划产量
    getThisYearDataAndPlan();
    
    //获取本月渲染
    getMonthNumToPage();
})(jQuery);



function getThisWeekData() {

    //path
    var basePath = $("#path").val();
    //获取本周开始日期与今日日期
    var nowTemp = new Date();//当前时间

    var oneDayLong = 24*60*60*1000 ;//一天的毫秒数

    var c_time = nowTemp.getTime() ;//当前时间的毫秒时间

    var c_day = nowTemp.getDay()||7;//当前时间的星期几

    var m_time = c_time - (c_day-1)*oneDayLong;//当前周一的毫秒时间

    var monday = new Date(m_time);//设置周一时间对象

    var m_year = monday.getFullYear();

    var m_month = monday.getMonth()+1;

    var m_date = monday.getDate();

    var time2 = dateFtt("yyyy-MM-dd",new Date());

    $("#weekDate").text(m_year+'-'+m_month+'-'+m_date + ' 至 ' + time2);


    //后台获取生产量
    $.ajax({
        url:basePath + "/getThisWeekData.do",
        type:"get",
        dataType:"json",
        async: false,
        success:function (res) {
            $("#weekTotal").text(Math.floor(res.total/1000 * 100)/100);
        }
    })
};

function getThisMonthData() {
    //path
    var basePath = $("#path").val();
    var monthFirstDay = getMonth("s",0);
    var time2 = dateFtt("yyyy-MM-dd",new Date());
    $("#monthDate").text(monthFirstDay + " 至 " + time2);

    //后台获取生产量
    $.ajax({
        url:basePath + "/getThisMonthData.do",
        type:"get",
        dataType:"json",
        async: false,
        success:function (res) {
            $("#monthData").text(Math.floor(res.total/1000 * 100)/100);
        }
    })

}
function getThisYearData() {
    var basePath = $("#path").val();
    var time2 = dateFtt("yyyy",new Date());
    $("#yearDate").text(time2);

    //后台获取生产量
    $.ajax({
        url:basePath + "/getThisYearData.do",
        type:"get",
        dataType:"json",
        success:function (res) {
            $("#yearData").text(Math.floor(res.total/1000 * 100)/100);
        }
    })
}

function getAlldata() {
    //path
    var basePath = $("#path").val();
    var time2 = dateFtt("yyyy-MM-dd",new Date());
    //后台获取生产量
    $.ajax({
        url:basePath + "/getAllData.do",
        type:"get",
        dataType:"json",
        success:function (res) {

            $("#sumDate").text(res.firstDate + " 至 " + time2 );
            $("#sumData").text(Math.floor(res.total/1000 * 100)/100);
        }
    })
}

function getLastMonthData() {
    //path
    var basePath = $("#path").val();
    $.ajax({
        url:basePath + "/getLastMonthData.do",
        type:"get",
        dataType:"json",
        success:function (res) {
            if (res){
                debugger
                var dataArray = [];
                for(var i in res){
                    var temDate = res[i].proDate;
                    if (temDate.split("")[0] === '0'){
                        var temStr = temDate.split("")[1];
                        dataArray.push([temStr,res[i].total]);
                    }else {
                        dataArray.push([temDate,res[i].total]);
                    }

                }
                option.series[0].data = dataArray;
                myChart1.setOption(option);
                window.addEventListener("resize", function () {
                    myChart1.resize();
                });
            } else {
                layer.msg("上月无生产")
            }
        }
    })
}

function monthContrast () {
    //path
    var basePath = $("#path").val();
    $.ajax({
        url:basePath + "/getMonthContrast.do",
        type:"get",
        dataType:"json",
        async: false,
        success:function (res) {
            if (res){
                $("#lastMonthTonDiv").attr("lay-percent",res.lastMonthPercent + "%");
                $("#lastMonthTonSpan").text(res.lastMonthPercent + "%");
                $("#lastMonthDishDiv").attr("lay-percent",res.lastMonthCountPercent + "%");
                $("#lastMonthDishSpan").text(res.lastMonthCountPercent + "%");
                $("#lastMonthIncomeDiv").attr("lay-percent",res.lastMonthPercent + "%");
                $("#lastMonthIncomeSpan").text(res.lastMonthPercent);
            }
        }
    })
}

function allMonthPercent() {
    //path
    var basePath = $("#path").val();
    $.ajax({
        url:basePath + "/getAllMonthPercent.do",
        type:"get",
        dataType:"json",
        async: false,
        success:function (res) {

            if (res){
                option3.series[0].data = res;
                // 使用刚指定的配置项和数据显示图表。
                myChart3.setOption(option3);
                window.addEventListener("resize", function () {
                    myChart3.resize();
                });
            }
        }
    })
}

function getEveryMonthDays() {
    //path
    var basePath = $("#path").val();
    $.ajax({
        url:basePath + "/getEveryMonthDays.do",
        type:"get",
        dataType:"json",
        async: false,
        success:function (res) {

            if (res){
                var xArray = [];
                var yArray = [];
                for (var i = 0; i < res.length;i++){
                    yArray.push(res[i].totals);
                    xArray.push(res[i].dates);
                }
                option4.xAxis[0].data = xArray;
                option4.series[0].data = yArray;
                // 使用刚指定的配置项和数据显示图表。
                myChart4.setOption(option4);
                window.addEventListener("resize", function () {
                    myChart4.resize();
                });
            }
        }
    })
}

function addYearMessage() {
    layer.open({
        type: 1,
        skin: '预计产量添加', //加上边框
        area: ['700px', '350px'], //宽高
        content: $("#addFrom")
    });
}

function getThisYearDataAndPlan() {
    //path
    var basePath = $("#path").val();
    $.ajax({
        url:basePath + "/getThisYearDataAndPlan.do",
        type:"get",
        dataType:"json",
        success:function (res) {
            if (res.messages == 'error'){
                layer.msg("生成计划与对比产量图失败");
            } else {
                var plan = res.totals;
                var yearTotal = res.total;

                option2.series[0].data[0].value = Math.round(yearTotal);
                option2.series[0].data[1].value = Math.round(plan - yearTotal);
                option2.series[1].data[0].value = Math.round(plan) ;
                option2.series[1].label.normal.formatter= '目标值\r\n\r\n'+ Math.round(plan);
                // 使用刚指定的配置项和数据显示图表。
                myChart2.setOption(option2);
                window.addEventListener("resize", function () {
                    myChart2.resize();
                });
            }
        }
    })
}

function sendFromData() {
    //path
    var basePath = $("#path").val();
    var total = $("#setTotal").val();
    var dates = $("#dates").val();
    if (total && dates ){
        $.ajax({
            url:basePath + "/sendYearTotalFromData.do",
            type:"post",
            data:{
                "dates":dates,
                "total":total
            },
            dataType:"json",
            success:function (res) {
                if (res.messages == 'success'){
                    layer.msg("添加成功");
                } else {
                    layer.msg("添加失败,该日期产量已添加");
                }
            }
        })
    }else {
        layer.msg("请填写相关信息")
    }

}
function gotoERP() {
    window.open("http://119.90.97.107:9002/",'_blank');
}

function getMonthNumToPage() {
    var now = new Date();
    var month = (now.getMonth() + 1) - 1 ;
    $("#monthD").empty().text(month + "月生产吨数");
    $("#monthP").empty().text(month + "月生产盘数");
    $("#monthS").empty().text(month + "月收入");
    var thisMonth = now.getMonth() + 1;
    $("#thisMonth").empty().text(thisMonth + "月产量折线图");
}


function dateFtt(fmt,date)
{ //author: meizz
    var o = {
        "M+" : date.getMonth()+1,     //月份
        "d+" : date.getDate(),     //日
        "h+" : date.getHours(),     //小时
        "m+" : date.getMinutes(),     //分
        "s+" : date.getSeconds(),     //秒
        "q+" : Math.floor((date.getMonth()+3)/3), //季度
        "S" : date.getMilliseconds()    //毫秒
    };
    if(/(y+)/.test(fmt))
        fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)
        if(new RegExp("("+ k +")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
    return fmt;
}



//本月第一天日期函数
function getMonth(type, months) {
    var d = new Date();
    var year = d.getFullYear();
    var month = d.getMonth() + 1;
    if (Math.abs(months) > 12) {
        months = months % 12;
    };
    if (months != 0) {
        if (month + months > 12) {
            year++;
            month = (month + months) % 12;
        } else if (month + months < 1) {
            year--;
            month = 12 + month + months;
        } else {
            month = month + months;
        };
    };
    month = month < 10 ? "0" + month: month;
    var date = d.getDate();
    var firstday = year + "-" + month + "-" + "01";
    var lastday = "";
    if (month == "01" || month == "03" || month == "05" || month == "07" || month == "08" || month == "10" || month == "12") {
        lastday = year + "-" + month + "-" + 31;
    } else if (month == "02") {
        if ((year % 4 == 0 && year % 100 != 0) || (year % 100 == 0 && year % 400 == 0)) {
            lastday = year + "-" + month + "-" + 29;
        } else {
            lastday = year + "-" + month + "-" + 28;
        };
    } else {
        lastday = year + "-" + month + "-" + 30;
    };
    var day = "";
    if (type == "s") {
        day = firstday;
    } else {
        day = lastday;
    };
    return day;
};





