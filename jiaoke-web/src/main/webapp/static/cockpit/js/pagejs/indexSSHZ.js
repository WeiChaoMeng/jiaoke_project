(function () {
    /**
     * 左一、右一图表级配图
     */
    getRealTimeData();
    /**
     * 左右两个机组产品构成图
     */
    showTwoCrewProduct();
    var main = document.getElementById("main");
    var hei = document.body.clientHeight;
    //如果不加时间控制，滚动会过度灵敏，一次翻好几屏
    var startTime = 0, //翻屏起始时间
        endTime = 0,
        now = 0;

    //浏览器兼容
    if ((navigator.userAgent.toLowerCase().indexOf("firefox")!=-1)){
        document.addEventListener("DOMMouseScroll",scrollFun,false);
    }
    else if (document.addEventListener) {
        document.addEventListener("mousewheel",scrollFun,false);
    }
    else if (document.attachEvent) {
        document.attachEvent("onmousewheel",scrollFun);
    }
    else{
        document.onmousewheel = scrollFun;
    }

    //滚动事件处理函数
    function scrollFun(event){

        startTime = new Date().getTime();
        var delta = event.detail || (-event.wheelDelta);
        //mousewheel事件中的 “event.wheelDelta” 属性值：返回的如果是正值说明滚轮是向上滚动
        //DOMMouseScroll事件中的 “event.detail” 属性值：返回的如果是负值说明滚轮是向上滚动
        if ((endTime - startTime) < -1000){
            if(delta>0){
                //向下滚动
                now = now - hei;
                toPage(now);
            }
            if(delta<0 ){
                //向上滚动
                now = now + hei;
                toPage(now);
            }
            endTime = new Date().getTime();
        }
        else{
            event.preventDefault();
        }
    }
    function toPage(now){
        var show = $('#page1').css('display');
        if (show =='block'){
            $('#page1').css('display','none');
            $('#page2').css('display','block');

        }else {
            $('#page2').css('display','none');
            $('#page1').css('display','block');
        }

        // $("#main").animate({top:(now+'px')},1000);     //jquery实现动画效果
        //setTimeout("main.style.top = now + 'px'",1000);     javascript 实现动画效果
    }

})(jQuery);


/**
 * 定时调用
 */
setInterval(getRealTimeData,40000);
function getRealTimeDataEcharsTemp(){
    var basePath = $("#path").val();
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

    option9.xAxis.data = crew1discNum;
    option9.series[0].data = crew1warehouse;
    option9.series[1].data = crew1mixture;
    option9.series[2].data = crew1asphalt;
    option9.series[3].data = crew1aggregate;
    option9.series[4].data = crew1duster;
    myChart9.setOption(option9);

    option1.xAxis.data = crew2discNum;
    option1.series[0].data = crew2warehouse;
    option1.series[1].data = crew2mixture;
    option1.series[2].data = crew2asphalt;
    option1.series[3].data = crew2aggregate;
    option1.series[4].data = crew2duster;
    myChart1.setOption(option1);
}

/**
 * 展示基本信息
 */
function  getRealTimeData() {
    var basePath = $("#path").val();
    $.ajax({
        url:basePath + "/getRealTimeData.do",
        // url:"http://47.105.114.70/getRealTimeData.do",
        type:"get",
        dataType:"json",
        success:function (res) {
            renderDataToPage(res);
        }

    });

    /*******echars温度图表方法********/
    getRealTimeDataEcharsTemp();
    /*******echars材料图表方法********/
    showGradingCurve();
    /*******油石比图表方法********/
    getAsphaltAggregateRatio();
};
function getAsphaltAggregateRatio() {
    var basePath = $("#path").val();
    $.ajax({
        url:basePath + "/getAsphaltAggregateRatio.do",
        type:"get",
        dataType:"json",
        success:function (res) {
            if (res.message === 'success'){
                var xList = res.body.xList;
                var dataList = res.body.dataList;
                var ration = res.body.ration;
                showAsphaltAggregateRatio(xList,dataList,ration);
            }
            if (res.message === 'empty'){
                console.log("当前数据不足两条");
            }
            if (res.message === 'error'){
                console.log("后台错误，请联系管理员");
            }
        }
    })
}
/**
 * 展示基本信息
 * @param listStr
 */
function renderDataToPage(listStr) {

    if (listStr){
        for (var i=0;i<listStr.length;i++){
            var todayDate = getNowFormatDate();
            if ( listStr[i].crewNum == 'crew1' ){
                var proDate = new Date(listStr[i].produce_date);
                if (todayDate - proDate != 0  ) {
                    $("#crew1_date").html("生产日期：" + listStr[i].produce_date);
                    $("#crew1_time").html("生产时间：" + listStr[i].produce_time);
                    if (listStr[i].pro_name){
                        $("#crew1_ratio_name").html("产品类型：" + listStr[i].pro_name);
                        $("#aar1_title").html(listStr[i].pro_name + "三日内同类型产品油石比走势图");
                    } else {
                        $("#crew1_ratio_name").html('产品类型：未找到产品类型');
                    };
                    var stone = listStr[i].material_stone_2 == 0? Number(listStr[i].material_stone_1).toFixed(1):Number(listStr[i].material_stone_2).toFixed(1);
                    $("#crew1_stone").html("矿粉总量：" + stone +  "<i>%</i>");
                    $("#crew1_asphalt").html("沥青含量：" +  listStr[i].material_asphalt+ "<i>%</i>");
                    $("#crew1_regenerate").html("再生料含量：" + listStr[i].material_regenerate+ "<i>%</i>");
                    $("#crew1_additive").html("添加剂含量：" + listStr[i].material_additive+ "<i>%</i>");

                    // $("#crew1_data_warehouse1").html(listStr[i].temperature_warehouse_1 + " <i>℃</i>");
                    // $("#crew1_data_duster").html(listStr[i].temperature_duster+ " <i>℃</i>");
                    // $("#crew1_data_temasphalt").html(listStr[i].temperature_asphalt+ " <i>℃</i>");
                    // $("#crew1_data_aggregate").html(listStr[i].temperature_aggregate+ " <i>℃</i>");
                }
            }else {
                var proDate = new Date(listStr[i].produce_date);
                if (todayDate - proDate != 0 ) {
                    $("#crew2_date").html("生产日期：" + listStr[i].produce_date);
                    $("#crew2_time").html("生产时间：" + listStr[i].produce_time);
                    if (listStr[i].pro_name){
                        $("#crew2_ratio_name").html("产品类型：" + listStr[i].pro_name);
                        $("#aar2_title").html(listStr[i].pro_name + "三日内同类型产品油石比走势图");
                    } else {
                        $("#crew2_ratio_name").html('产品类型：未找到产品类型');
                    };
                    var stone = listStr[i].material_stone_2 == 0? Number(listStr[i].material_stone_1).toFixed(1):Number(listStr[i].material_stone_2).toFixed(1);
                    $("#crew2_stone").html("矿粉总量：" + stone +  "<i>%</i>");
                    $("#crew2_asphalt").html("沥青含量：" +  listStr[i].material_asphalt+ "<i>%</i>");
                    $("#crew2_regenerate").html("再生料含量：" + listStr[i].material_regenerate+ "<i>%</i>");
                    $("#crew2_additive").html("添加剂含量：" + listStr[i].material_additive+ "<i>%</i>");
                }

            }
        }
    }



}
/**
 * 展示实时Echar
 */
function showGradingCurve() {
    var basePath = $("#path").val();
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

function showAsphaltAggregateRatio(xList,dataList,ration) {
    var crew1XList = xList.crew1XList;
    var crew2XList = xList.crew2XList
    if (crew1XList.length > 0){
        var crew1Ration = (Number(ration.crew1Ration)/(100 - Number(ration.crew1Ration)) * 100).toFixed(2);
        option3.xAxis[0].data = xList.crew1XList;
        option3.series[0].data = dataList.crew1data;
        option3.yAxis[0].max = Number(crew1Ration)+ 0.5;
        option3.yAxis[0].min = Number(crew1Ration) - 0.5;
        var yaxisUp = Number(crew1Ration) + 0.3;
        var yaxisModel = Number(crew1Ration);
        var yaxisDown = Number(crew1Ration - 0.3);
        option3.series[0].markLine.data = [{name: '上限', yAxis: yaxisUp,},{name: '模板占比',  yAxis: yaxisModel,},{name: '下限',  yAxis: yaxisDown }];
        myChart3.setOption(option3);
        window.addEventListener("resize", function () {
            myChart3.resize();
        });
    }else {
        $("#aar1_title").empty().append('三日内无该类型产品')
    }

    if (crew2XList.length > 0){
        option6.xAxis[0].data = xList.crew2XList;
        option6.series[0].data = dataList.crew2data;
        var crew2Ration = (Number(ration.crew2Ration)/(100 - Number(ration.crew2Ration)) * 100).toFixed(2);
        option6.yAxis[0].max = Number(crew2Ration) + 0.5;
        option6.yAxis[0].min = Number(crew2Ration) - 0.5;
        option6.series[0].markLine.data = [{name: '上限', yAxis: crew2Ration + 0.3},{name: '模板占比',  yAxis: crew2Ration },{name: '下限',  yAxis:  crew2Ration - 0.3}];
        myChart6.setOption(option6);
        window.addEventListener("resize", function () {
            myChart6.resize();
        });
    }else {
        $("#aar2_title").empty().append('三日内无该类型产品')
    }

}


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
                    array.push({xAxis:0.312,label: { normal: {formatter:key}}});
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

function showTwoCrewProduct() {
    var basePath = $("#path").val();
    $.ajax({
        url:basePath + "/getTodayProductList.do",
        type:"get",
        dataType:"json",
        success:function (res) {
            debugger
            if (res.message === 'success'){
                var crew1List = [];
                var crew2List = [];
                var  list = res.dataList;
                var crew1date;
                var crew2date;
                for (var i = 0;i < list.length;i++){
                    if (list[i]){
                        if (list[i].crew === 'crew1'){
                            crew1List.push([list[i].pro_name,list[i].total]);
                            crew1date = list[i].produce_date;
                        }else {
                            crew2List.push([list[i].pro_name,list[i].total]);
                            crew2date = list[i].produce_date;
                        }
                    }
                }
                showTwoCrewProChears(crew1List,crew2List);
                $("#crew1_product_title").text("一号机" + crew1date + "日产品占比图");
                $("#crew2_product_title").text("二号机" + crew2date + "日产品占比图");
            }
            if (res.message === 'empty'){
                $("#crew1_product_title").text("未查询到一号机产品");
                console.log("当前无产品");
            }
            if (res.message === 'error'){
                $("#crew2_product_title").text("未查询到二号机产品");
                console.log("后台错误，请联系管理员");
            }
        }
    })

}

function showTwoCrewProChears(crew1List,crew2List) {

    if (crew1List == null || crew1List.length === 0){
        crew1List = [["机组一今日无生产",1]];
    }
    if (crew2List == null || crew2List.length === 0){
        crew2List = [["机组二今日无生产",1]];
    }

    $('#chart5').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            } , backgroundColor: 'rgba(0,0,0,0)'
        },
        legend: {//控制图例显示位置
            layout: 'vertical',
            align: 'left',
            verticalAlign: 'top',
            borderWidth: 0,
            itemStyle:{
                "color": "#fff"
            }
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
                showInLegend:true,
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
            data: crew1List
        }]
    });
    $('#chart2').highcharts({
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
        legend: {//控制图例显示位置
            layout: 'vertical',
            align: 'left',
            verticalAlign: 'top',
            borderWidth: 0,
            itemStyle:{
                "color": "#fff"
            }
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                showInLegend:true,
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
            data: crew2List
        }]
    });
}