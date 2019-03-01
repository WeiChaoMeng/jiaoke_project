
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <title>产品信息</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <script src="/static/js/echarts/echarts.js"></script>
    <script type="text/javascript" src="/static/js/jquery.js"></script>
</head>

<body style="padding:15px 8px 500px 8px;">

<div class="">
    <div class="">
        <div class="boxtitle">
            <span>产品详细数据信息</span>
        </div>

        <div class="boxdown">
            <table class="simpletable">
                <thead>
                <th style="width: 70px">生产日期</th>
                <th style="width: 70px">生产时间</th>
                <th style="width: 70px">盘号</th>
                <th style="width: 70px ">配比号</th>
                <th style="width: 70px">骨料1</th>
                <th style="width: 70px">骨料2</th>
                <th style="width: 70px">骨料3</th>
                <th style="width: 70px">骨料4</th>
                <th style="width: 70px">骨料5</th>
                <th style="width: 70px">骨料6</th>
                <th style="width: 70px ">石粉2</th>
                <th style="width: 70px ">石粉1</th>
                <th style="width: 70px ">沥青</th>
                <th style="width: 70px ">再生料</th>
                <th style="width: 70px ">添加剂</th>
                <th style="width: 100px">合计(kg)</th>

                </thead>

                <tbody>
                <tr></tr>
                <tr>
                    <td>${proBase.produce_date}</td>
                    <td>${proBase.produce_time}</td>
                    <td>${proBase.produce_disc_num}</td>
                    <td>${proBase.produce_proportioning_num}</td>
                    <td>${proBase.material_aggregate_1 - proBase.material_aggregate_2}</td>
                    <td>${proBase.material_aggregate_2 - proBase.material_aggregate_3}</td>
                    <td>${proBase.material_aggregate_3 - proBase.material_aggregate_4}</td>
                    <td>${proBase.material_aggregate_4 - proBase.material_aggregate_5}</td>
                    <td>${proBase.material_aggregate_5 - proBase.material_aggregate_6}</td>
                    <td>${proBase.material_aggregate_6}</td>
                    <td>${proBase.material_stone_1}</td>
                    <td>${proBase.material_stone_2}</td>
                    <td>${proBase.material_asphalt}</td>
                    <td>${proBase.material_regenerate}</td>
                    <td>${proBase.material_additive}</td>
                    <td>${proBase.material_total}</td>
                </tr>

                </tbody>
                <thead>
                <th style="width: 100px ">1仓温度</th>
                <th style="width: 100px ">混合料温度</th>
                <th style="width: 100px ">除尘器入口温度</th>
                <th style="width: 100px ">沥青温度</th>
                <th style="width: 100px ">再生料温度</th>
                <th style="width: 100px ">骨料1比例</th>
                <th style="width: 100px ">骨料2比例</th>
                <th style="width: 100px ">骨料3比例</th>
                <th style="width: 100px ">骨料4比例</th>
                <th style="width: 100px ">骨料5比例</th>
                <th style="width: 100px ">骨料6比例</th>
                <th style="width: 100px ">矿料1比例</th>
                <th style="width: 100px ">沥青占比</th>
                <th style="width: 100px ">再生料占比</th>
                </thead>
                <tbody>
                <td>${proBase.temperature_warehouse_1}</td>
                <td>${proBase.temperature_mixture}</td>
                <td>${proBase.temperature_duster}</td>
                <td>${proBase.temperature_asphalt}</td>
                <td>${proBase.temperature_aggregate}</td>
                <td id="one">0</td>
                <td id="two" >0</td>
                <td id="three" >0</td>
                <td id="four" >0</td>
                <td id="five" >0</td>
                <td id="six" >0</td>
                <td id="k" >0</td>
                <td id="l" >0</td>
                <td id="z" >0</td>
                <c:forEach items="${proMessage}" var="item">
                    <script type="text/javascript">

                        switch ('${item.material_name}') {
                            case '骨料1' :
                                $('#one').text(${item.actual_ratio});
                                break;
                            case '骨料2' :
                                $('#two').text(${item.actual_ratio});
                                break;
                            case '骨料3' :
                                $('#three').text(${item.actual_ratio});
                                break;
                            case '骨料4' :
                                $('#four').text(${item.actual_ratio});
                                break;
                            case '骨料5' :
                                $('#five').text(${item.actual_ratio});
                                break;
                            case '骨料6' :
                                $('#six').text(${item.actual_ratio});
                                break;
                            case '矿粉' :
                                $('#k').text(${item.actual_ratio});
                                break;
                            case '沥青' :
                                $('#l').text(${item.actual_ratio});
                                break;
                            case '再生料' :
                                $('#z').text(${item.actual_ratio});
                                break;
                        }
                    </script>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>

<div class="divbox">

    <div class="">
        <div class="boxtitle"><span>产品预警信息</span></div>
        <div class="boxdown">
            <table class="simpletable">
                <thead>
                <th>材料名称</th>
                <th>实际占比</th>
                <th>模板占比</th>
                <th>占比差</th>
                <th>预警级别</th>
                </thead>

                <tbody>
                <c:forEach items="${proMessage}" var="item" varStatus="sta">
                    <c:choose>
                        <c:when test="${fn:contains(item.material_name,'温度')}">
                            <tr>
                                <td>${item.material_name}</td>
                                <td>${item.actual_ratio}<i>℃</i></td>
                                <td>${item.moudle_ratio}<i>℃</i></td>
                                <td>${item.deviation_ratio}<i>℃</i></td>
                                <td>${item.warning_level == 0? '无预警':item.warning_level}${item.warning_level == 0? "":"级预警"}</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td>${item.material_name}</td>
                                <td>${item.actual_ratio}<i>%</i></td>
                                <td>${item.moudle_ratio}<i>%</i></td>
                                <td>${item.deviation_ratio}<i>%</i></td>
                                <td>${item.warning_level == 0? '无预警':item.warning_level}${item.warning_level == 0? "":"级预警"}</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                </tbody>

            </table>
        </div>

    </div>
</div>



<div class="divbox_realtime">
    <div>
        <div class="boxtitle">

        </div>
        <div id="chart2" class="charts1"></div>
    </div>

    <script type="text/javascript">
        var myChart2 = echarts.init(document.getElementById('chart2'));
        // 指定图表的配置项和数据
        var colors = ['#5793f3', '#d14a61', '#675bba'];
        var option2 =  {
                title: {
                    text: '产品材料构成图',
                    subtext: ''
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['上限占比','实际占比', '下限占比']
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataZoom: {
                            yAxisIndex: 'none'
                        },
                        dataView: { readOnly: false },
                        magicType: { type: ['line', 'bar'] },
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    // boundaryGap: false,
                    data: ['骨料1','骨料2','骨料3','骨料4','骨料5','骨料6','矿粉','沥青','再生料']
                },
                yAxis: {
                    type: 'value',
                    axisLabel: {
                        formatter: '{value} %'
                    }
                },
                series: [
                    {
                        name: '上限占比',
                        type: 'bar',
                        data:getUpData('up'),
                        formatter: '{value} %'
                    },
                    {
                        name: '实际占比',
                        type: 'bar',
                        data: getUpData('real'),
                        formatter: '{value} %'
                    },
                    {
                        name: '下限占比',
                        type: 'bar',
                        data: getUpData('down'),
                        formatter: '{value} %'
                    }
                ]
            };

            function getUpData(tem){
                var upArray = new Array(9);
                var realArray = new Array(9);
                var downArray = new Array(9);



                <c:forEach items="${proMessage}" var="item" varStatus="sta">
                <c:choose>
                <c:when test="${item.material_name == '骨料1'}">
                    upArray[0] = ${item.moudle_ratio + 2};
                realArray[0] = ${item.actual_ratio};
                downArray[0] = ${item.moudle_ratio - 2};

                </c:when>
                <c:when test="${item.material_name == '骨料2'}">
                upArray[1] = ${item.moudle_ratio + 2};
                realArray[1] = ${item.actual_ratio};
                downArray[1] = ${item.moudle_ratio - 2};

                </c:when>
                <c:when test="${item.material_name == '骨料3'}">
                upArray[2] = ${item.moudle_ratio + 4};
                realArray[2] = ${item.actual_ratio};
                downArray[2] = ${item.moudle_ratio - 4};

                </c:when>
                <c:when test="${item.material_name == '骨料4'}">
                upArray[3] = ${item.moudle_ratio + 4};
                realArray[3] = ${item.actual_ratio};
                downArray[3] = ${item.moudle_ratio - 4};

                </c:when>
                <c:when test="${item.material_name == '骨料5'}">
                upArray[4] = ${item.moudle_ratio + 4};
                realArray[4] = ${item.actual_ratio};
                downArray[4] = ${item.moudle_ratio - 4};

                </c:when>
                <c:when test="${item.material_name == '骨料6'}">

                upArray[5] = ${item.moudle_ratio + 4};
                realArray[5] = ${item.actual_ratio};
                downArray[5] = ${item.moudle_ratio - 4};

                </c:when>
                <c:when test="${item.material_name == '矿粉'}">
                upArray[6] = ${item.moudle_ratio +1};
                realArray[6] = ${item.actual_ratio};
                downArray[6] = ${item.moudle_ratio - 1};

                </c:when>
                <c:when test="${item.material_name == '沥青'}">
                upArray[7] = ${item.moudle_ratio + 1};
                realArray[7] = ${item.actual_ratio};
                downArray[7] = ${item.moudle_ratio - 1};

                </c:when>
                <c:when test="${item.material_name == '再生料'}">
                upArray[8] = ${item.moudle_ratio + 1};
                realArray[8] = ${item.actual_ratio};
                downArray[8] = ${item.moudle_ratio - 1};
                </c:when>
                </c:choose>
                </c:forEach>

                for (var i = 0; i < upArray.length ; i ++){
                    upArray[i] =  isNaN(upArray[i]) ? 0:upArray[i];
                    realArray[i] = isNaN(realArray[i]) ? 0:realArray[i];
                    downArray[i] = isNaN(downArray[i] )? 0:downArray[i];
                }
                switch (tem) {
                    case 'up':
                        return upArray;
                        break;
                    case 'real':
                        return realArray;
                        break;
                    case 'down':
                        return downArray;
                        break;
                    default:
                        return '';
                }
            }
            myChart2.setOption(option2);
            window.addEventListener("resize", function () {
                myChart2.resize();
            });
    </script>
</div>

<div class="divbox_realtime">
    <div>
        <div class="boxtitle">

        </div>
        <div id="chart7" class="charts1"></div>
    </div>
    <script type="text/javascript">
        var myChart7= echarts.init(document.getElementById('chart7'));
        // 指定图表的配置项和数据
        var colors = ['#5793f3', '#d14a61', '#675bba'];
        var option7= {
            title: {
                text: '产品级配曲线图'
            },
            legend: {
                data:['合成级配','实际级配','上限','中值','下限']
            },
            grid: {

            },
            tooltip: {
                trigger: 'item'
            },
            xAxis: {
                type: 'value',
                name: '筛孔',
                nameGap: 16,
                nameTextStyle: {
                    color: '#000',
                    fontSize: 14
                },
                min:0,
                max:7,
                splitLine: {
                    show: false
                },
                axisLabel: { //轴标签
                    show: false //不显示
                },
                axisTick: { //轴刻度
                    show: false //不显示
                },
                axisLine: { //轴线
                    lineStyle: { //样式
                        color: '#000' //颜色
                    }
                }
            },
            yAxis: {
                type: 'value',
                name: '占比 %',
                nameLocation: 'end',
                nameGap: 20,
                position: 'left',
                offset: 3,
                max:100,
                min:0,
                scale: true,
                nameTextStyle: {
                    color: '#fff',
                    fontSize: 16
                },
                axisLine: {
                    onZero: false,
                    lineStyle: {
                        color: '#000'
                    }
                },
                splitLine: {
                    show: true,
                    lineStyle: {
                        color: '#000'
                    }
                }
            },
            series: [
                {
                    type: 'line',
                    markLine: {
                        symbol: ['none', 'none'],
                        silent: true,
                        label: {
                            normal: {
                                position: "start"
                            }
                        },
                        lineStyle:{
                            color: '#000'
                        },
                        data: []
                    }
                },
                {
                    id: 'a',
                    type: 'line',
                    name:'合成级配',
                    symbolSize:6,
                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                },
                {
                    id: 'b',
                    type: 'line',
                    name:'实际级配',
                    symbolSize:6,
                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                },
                {
                    id: 'c',
                    type: 'line',
                    name:'上限',
                    symbolSize:6,
                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                },
                {
                    id: 'd',
                    type: 'line',
                    name:'中值',
                    symbolSize:6,
                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                },
                {
                    id: 'e',
                    type: 'line',
                    name:'下限',
                    symbolSize:6,
                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                }
            ]
        };


    </script>
</div>
<input  type="hidden"  id="path" value="${path}" >
<input  type="hidden"  id="crewNum" value="${crewNum}" >
<input  type="hidden"  id="id" value="${proBase.Id}" >
</li>

</body>

<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>

<script type="text/javascript">
    $(function(){
        getRealTimeDataEcharsMaterial();
    });


    /******************************** Echart材料比渲染Start********************************************/
    function getRealTimeDataEcharsMaterial() {

        debugger
        var basePath = $("#path").val();
        var crewNum =$("#crewNum").val() ;
        var id =$("#id").val() ;

        $.ajax({
            url:basePath + "/getProductMessageById.do",
            // url:"http://47.105.114.70/getRealTimeDataEcharsMaterial.do",
            type:"post",
            data:{"crewNum":crewNum,"id":id},
            dataType:"json",
            success:function (res) {
                eachMaterialList(res);
            }
        })
    }

    function eachMaterialList(res) {


        for (var i = 0; i < res.length;i++){


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

        }



    }
    window.addEventListener("resize", function () {
        myChart7.resize();
    });
    /******************************** Echart材料比渲染End********************************************/





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
                        array.push({xAxis:0.312,label: {normal: {formatter: key+""}}});
                        break;
                    case '0.15':
                        array.push({xAxis:0.426,label: {normal: {formatter: key+""}}});
                        break;
                    case '0.3':
                        array.push({xAxis:0.582,label: {normal: {formatter: key+""}}});
                        break;
                    case '0.6':
                        array.push({xAxis:0.795,label: {normal: {formatter: key+""}}});
                        break;
                    case '1.18':
                        array.push({xAxis:1.007,label: {normal: {formatter: key+""}}});
                        break;
                    case '2.36':
                        array.push({xAxis:1.472,label: {normal: {formatter: key+""}}});
                        break;
                    case '4.75':
                        array.push({xAxis:2.016,label: {normal: {formatter: key+""}}});
                        break;
                    case '9.5':
                        array.push({xAxis:2.754,label: {normal: {formatter: key+""}}});
                        break;
                    case '13.2':
                        array.push({xAxis:3.193,label: {normal: {formatter: key+""}}});
                        break;

                    case '16':
                        array.push({xAxis:3.482,label: {normal: {formatter: key+""}}});
                        break;
                    case '19':
                        array.push({xAxis:3.762,label: {normal: {formatter: key+""}}});
                        break;
                    case '26.5':
                        array.push({xAxis:4.370,label: {normal: {formatter: key+""}}});
                        break;
                    case '31.5':
                        array.push({xAxis:4.723,label: {normal: {formatter: key+""}}});
                        break;
                    case '37.5':
                        array.push({xAxis:5.109,label: {normal: {formatter: key+""}}});
                        break;
                    case '53':
                        array.push({xAxis:5.969,label: {normal: {formatter: key+""}}});
                        break;
                    case '63':
                        array.push({xAxis:6.452,label: {normal: {formatter: key+""}}});
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
</script>
</html>
