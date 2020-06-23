
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <title>产品平均信息</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <script type="text/javascript" src="/static/js/jquery.js"></script>
    <script src="/static/js/echarts/echarts.js"></script>

</head>

<body style="padding:15px 8px 500px 8px;">

<div class="">
    <div class="">
        <div class="boxtitle">
            <span>产品平均数据</span>
        </div>

        <div class="boxdown">
            <table class="simpletable">
                <thead>
                <th style="width: 70px ">配比名称</th>
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
                    <td>${productModelRationSVG.pro_name}</td>
                    <td><fmt:formatNumber value="${productSVG.material_aggregate_1 - productSVG.material_aggregate_2}" pattern="0.00"/><em></em>kg</td></td>
                    <td><fmt:formatNumber value="${productSVG.material_aggregate_2 - productSVG.material_aggregate_3}" pattern="0.00"/><em></em>kg</td></td>
                    <td><fmt:formatNumber value="${productSVG.material_aggregate_3 - productSVG.material_aggregate_4}" pattern="0.00"/><em></em>kg</td></td>
                    <td><fmt:formatNumber value="${productSVG.material_aggregate_4 - productSVG.material_aggregate_5}" pattern="0.00"/><em></em>kg</td></td>
                    <td><fmt:formatNumber value="${productSVG.material_aggregate_5 - productSVG.material_aggregate_6}" pattern="0.00"/><em></em>kg</td></td>
                    <td>${productSVG.material_aggregate_6}<em>kg</em></td>
                    <td>${productSVG.material_stone_1}<em>kg</em></td>
                    <td>${productSVG.material_stone_2}<em>kg</em></td>
                    <td>${productSVG.material_asphalt}<em>kg</em></td>
                    <td>${productSVG.material_regenerate}<em>kg</em></td>
                    <td>${productSVG.material_additive}<em>kg</em></td>
                    <td>${productSVG.material_total}<em>kg</em></td>
                </tr>

                </tbody>
                <thead>
                <th style="width: 100px ">1仓温度</th>
                <th style="width: 100px ">混合料温度</th>
                <th style="width: 100px ">除尘器入口温度</th>
                <th style="width: 100px ">沥青温度</th>
                <th style="width: 100px ">骨料温度</th>
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
                <td>${productSVG.temperature_warehouse_1}<em>℃</em></td>
                <td>${productSVG.temperature_mixture}<em>℃</em></td>
                <td>${productSVG.temperature_duster}<em>℃</em></td>
                <td>${productSVG.temperature_asphalt}<em>℃</em></td>
                <td>${productSVG.temperature_aggregate}<em>℃</em></td>
                <td id="one">${productRationSVG.material_aggregate_1}<em>%</em></td>
                <td id="two" >${productRationSVG.material_aggregate_2}<em>%</em></td>
                <td id="three" >${productRationSVG.material_aggregate_3}<em>%</em></td>
                <td id="four" >${productRationSVG.material_aggregate_4}<em>%</em></td>
                <td id="five" >${productRationSVG.material_aggregate_5}<em>%</em></td>
                <td id="six" >${productRationSVG.material_aggregate_6}<em>%</em></td>
                <td id="k" >${productRationSVG.material_stone_1 == '0'? productRationSVG.material_stone_2:productRationSVG.material_stone_1}<em>%</em></td>
                <td id="l" >${productRationSVG.material_asphalt}<em>%</em></td>
                <td id="z" >${productRationSVG.material_regenerate}<em>%</em></td>
                </tbody>
            </table>
        </div>

    </div>
</div>

<div class="divbox">

    <div class="">
        <div class="boxtitle"><span>产品平均占比与模板对比</span></div>
        <div class="boxdown">
            <table class="simpletable">
                <thead>
                <th>材料名称</th>
                <th>实际占比</th>
                <th>模板占比</th>
                <th>占比差</th>
                </thead>

                <tbody>
                    <tr>
                        <td>骨料1</td>
                        <td>${productRationSVG.material_aggregate_1}<i>%</i></td>
                        <td>${productModelRationSVG.repertory_one}<i>%</i></td>
                        <td><fmt:formatNumber value="${productRationSVG.material_aggregate_1 - productModelRationSVG.repertory_one}" pattern="0.00"/><i>%</i></td>
                    </tr>
                    <tr>
                        <td>骨料2</td>
                        <td>${productRationSVG.material_aggregate_2}<i>%</i></td>
                        <td>${productModelRationSVG.repertory_two}<i>%</i></td>
                        <td><fmt:formatNumber value="${productRationSVG.material_aggregate_2 - productModelRationSVG.repertory_two}" pattern="0.00"/><i>%</i></td>
                    </tr>
                    <tr>
                        <td>骨料3</td>
                        <td>${productRationSVG.material_aggregate_3}<i>%</i></td>
                        <td>${productModelRationSVG.repertory_three}<i>%</i></td>
                        <td><fmt:formatNumber value="${productRationSVG.material_aggregate_3 - productModelRationSVG.repertory_three}" pattern="0.00"/><i>%</i></td>
                    </tr>
                    <tr>
                        <td>骨料4</td>
                        <td>${productRationSVG.material_aggregate_4}<i>%</i></td>
                        <td>${productModelRationSVG.repertory_four}<i>%</i></td>
                        <td><fmt:formatNumber value="${productRationSVG.material_aggregate_4 - productModelRationSVG.repertory_four}" pattern="0.00"/><i>%</i></td>
                    </tr>
                    <tr>
                        <td>骨料5</td>
                        <td>${productRationSVG.material_aggregate_5}<i>%</i></td>
                        <td>${productModelRationSVG.repertory_five}<i>%</i></td>
                        <td><fmt:formatNumber value="${productRationSVG.material_aggregate_5 - productModelRationSVG.repertory_five}" pattern="0.00"/><i>%</i></td>
                    </tr>
                    <tr>
                        <td>骨料6</td>
                        <td>${productRationSVG.material_aggregate_6}<i>%</i></td>
                        <td>${productModelRationSVG.repertory_six}<i>%</i></td>
                        <td><fmt:formatNumber value="${productRationSVG.material_aggregate_6 - productModelRationSVG.repertory_six}" pattern="0.00"/><i>%</i></td>
                    </tr>
                    <tr>
                        <td>矿粉</td>
                                <td>${productRationSVG.breezeReal}<i>%</i></td>
                                <td>${productModelRationSVG.breeze}<i>%</i></td>
                                <td><fmt:formatNumber value="${productRationSVG.breezeReal - productModelRationSVG.breeze}" pattern="0.00"/><i>%</i></td>
                    </tr>
                    <tr>
                        <td>沥青</td>
                        <td>${productRationSVG.material_asphalt}<i>%</i></td>
                        <td>${productModelRationSVG.ratio_stone}<i>%</i></td>
                        <td><fmt:formatNumber value="${productRationSVG.material_asphalt - productModelRationSVG.ratio_stone}" pattern="0.00"/><i>%</i></td>
                    </tr>
                    <tr>
                        <td>再生料</td>
                        <td>${productRationSVG.material_regenerate}<i>%</i></td>
                        <td><fmt:formatNumber value="${productModelRationSVG.ratio_regenerate1 + productModelRationSVG.ratio_regenerate2}" pattern="0.00"/><i>%</i></td>
                        <td><fmt:formatNumber value="${productRationSVG.material_regenerate - productModelRationSVG.ratio_regenerate1 - productModelRationSVG.ratio_regenerate2}" pattern="0.00"/><i>%</i></td>
                    </tr>
                    <tr>
                        <td>骨料温度</td>
                        <td>${productSVG.temperature_aggregate}<i>℃</i></td>
                        <td>${productModelRationSVG.temperature_aggregate } - ${productModelRationSVG.temperature_aggregate_up }<i>℃</i></td>
                        <c:choose>
                            <c:when test="${fn:trim(productSVG.temperature_aggregate) ge fn:trim(productModelRationSVG.temperature_aggregate_up)}">
                                <td><fmt:formatNumber value="${fn:trim(productSVG.temperature_aggregate) - fn:trim(productModelRationSVG.temperature_aggregate_up)}" pattern="0.00"/><i>℃</i></td>
                            </c:when>
                            <c:when test="${fn:trim(productSVG.temperature_aggregate) le fn:trim(productModelRationSVG.temperature_aggregate)}">
                                <td><fmt:formatNumber value="${fn:trim(productSVG.temperature_aggregate) - fn:trim(productModelRationSVG.temperature_aggregate)}" pattern="0.00"/><i>℃</i></td>
                            </c:when>
                            <c:otherwise>
                                <td>正常</td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                    <tr>
                        <td>混合料温度</td>
                        <td>${productSVG.temperature_mixture}<i>℃</i></td>
                        <td>${productModelRationSVG.temperature_mixture } - ${productModelRationSVG.temperature_mixture_up }<i>℃</i></td>

                        <c:choose>
                            <c:when test="${fn:trim(productSVG.temperature_mixture) ge fn:trim(productModelRationSVG.temperature_mixture_up)}">
                                <td><fmt:formatNumber value="${fn:trim(productSVG.temperature_mixture ) - fn:trim(productModelRationSVG.temperature_mixture_up)}" pattern="0.00"/><i>℃</i></td>
                            </c:when>
                            <c:when test="${fn:trim(productSVG.temperature_mixture) le fn:trim(productModelRationSVG.temperature_mixture)}">
                                <td><fmt:formatNumber value="${fn:trim(productSVG.temperature_mixture) - fn:trim(productModelRationSVG.temperature_mixture)}" pattern="0.00"/><i>℃</i></td>
                            </c:when>
                            <c:otherwise>
                                <td>正常</td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                    <tr>
                        <td>沥青温度</td>
                        <td>${productSVG.temperature_asphalt}<i>℃</i></td>
                        <td>${productModelRationSVG.temperature_asphalt } - ${productModelRationSVG.temperature_asphalt_up }<i>℃</i></td>
                        <c:choose>
                            <c:when test="${fn:trim(productSVG.temperature_asphalt) ge fn:trim(productModelRationSVG.temperature_asphalt_up)}">
                                <td><fmt:formatNumber value="${fn:trim(productSVG.temperature_asphalt) - fn:trim(productModelRationSVG.temperature_asphalt_up)}" pattern="0.00"/><i>℃</i></td>
                            </c:when>
                            <c:when test="${fn:trim(productSVG.temperature_asphalt) le fn:trim(productModelRationSVG.temperature_asphalt)}">
                                <td><fmt:formatNumber value="${fn:trim(productSVG.temperature_asphalt) - productModelRationSVG.temperature_asphalt}" pattern="0.00"/><i>℃</i></td>
                            </c:when>
                            <c:otherwise>
                                <td>正常</td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
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
                    text: '产品平均材料构成图',
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


                upArray[0] = ${productModelRationSVG.repertory_one == 0? 0:productModelRationSVG.repertory_one + 2};
                realArray[0] = ${productRationSVG.material_aggregate_1};
                downArray[0] = ${productModelRationSVG.repertory_one == 0? 0:productModelRationSVG.repertory_one- 2};


                upArray[1] = ${productModelRationSVG.repertory_two == 0? 0:productModelRationSVG.repertory_two + 2};
                realArray[1] = ${productRationSVG.material_aggregate_2};
                downArray[1] = ${productModelRationSVG.repertory_two == 0? 0:productModelRationSVG.repertory_two- 2};

                upArray[2] = ${productModelRationSVG.repertory_three == 0? 0:productModelRationSVG.repertory_three + 4};
                realArray[2] = ${productRationSVG.material_aggregate_3};
                downArray[2] = ${productModelRationSVG.repertory_three == 0? 0:productModelRationSVG.repertory_three - 4};

                upArray[3] = ${productModelRationSVG.repertory_four == 0? 0:productModelRationSVG.repertory_four + 4};
                realArray[3] = ${productRationSVG.material_aggregate_4};
                downArray[3] = ${productModelRationSVG.repertory_four == 0? 0:productModelRationSVG.repertory_four - 4};

                upArray[4] = ${productModelRationSVG.repertory_five == 0? 0:productModelRationSVG.repertory_five + 4};
                realArray[4] = ${productRationSVG.material_aggregate_5};
                downArray[4] = ${productModelRationSVG.repertory_five == 0? 0:productModelRationSVG.repertory_five - 4};


                upArray[5] = ${productModelRationSVG.repertory_six == 0? 0:productModelRationSVG.repertory_six + 4};
                realArray[5] = ${productRationSVG.material_aggregate_6};
                downArray[5] = ${productModelRationSVG.repertory_six == 0? 0:productModelRationSVG.repertory_six - 4};

                upArray[6] = ${productModelRationSVG.breeze == 0? 0:productModelRationSVG.breeze + 1};
                realArray[6] = ${productRationSVG.material_stone_1 >= productRationSVG.material_stone_2?  productRationSVG.material_stone_1:productRationSVG.material_stone_2};
                downArray[6] = ${productModelRationSVG.breeze == 0? 0:productModelRationSVG.breeze - 1};

                upArray[7] = ${productModelRationSVG.ratio_stone == 0? 0:productModelRationSVG.ratio_stone + 1};
                realArray[7] = ${productRationSVG.material_asphalt};
                downArray[7] = ${productModelRationSVG.ratio_stone  == 0? 0:productModelRationSVG.ratio_stone - 1};

                upArray[8] = ${(productModelRationSVG.ratio_regenerate1 + productModelRationSVG.ratio_regenerate2) == 0? 0:productModelRationSVG.ratio_regenerate1 + productModelRationSVG.ratio_regenerate2 + 1};
                realArray[8] = ${productRationSVG.material_regenerate};
                downArray[8] = ${(productModelRationSVG.ratio_regenerate1 + productModelRationSVG.ratio_regenerate2) == 0? 0:productModelRationSVG.ratio_regenerate1 + productModelRationSVG.ratio_regenerate2 - 1};

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
        var option7= {
            title: {
                text: '平均级配曲线图'
            },
            legend: {
                data:['合成级配','实际级配','上限','中值','下限']
            },
            grid: {

            },
            tooltip: {
                trigger: 'axis',
                formatter: function(params, ticket, callback) {
                    return  '筛孔:' + returnX(params[0].value[0]) + '的通过率<br/>'
                        +params[0].marker  + params[0].seriesName + ' :  ' + (params[0].value[1]).toFixed(1)+'%<br/>'
                        +params[1].marker  + params[1].seriesName+':  '+(params[1].value[1]).toFixed(1)+'%<br/>'
                        +params[2].marker  + params[2].seriesName+':  '+(params[2].value[1]).toFixed(1)+'%<br/>'
                        +params[3].marker  + params[3].seriesName+':  '+(params[3].value[1]).toFixed(1)+'%<br/>'
                        +params[4].marker  + params[4].seriesName+':  '+(params[4].value[1]).toFixed(1)+'%<br/>';
                }
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
                        lineStyle: {
                            normal: {
                                type: 'solid',
                                width:0.6,
                                color: '#000000'
                            }
                        },
                        data: []
                    }
                },
                {
                    type: 'line',
                    name:'合成级配',
                    symbolSize:6,
                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                },
                {
                    type: 'line',
                    name:'实际级配',
                    symbolSize:6,
                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                },
                {
                    type: 'line',
                    name:'上限',
                    symbolSize:6,
                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                },
                {
                    type: 'line',
                    name:'中值',
                    symbolSize:6,
                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                },
                {
                    type: 'line',
                    name:'下限',
                    symbolSize:6,
                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                }
            ]
        };


    </script>
</div>
</li>


</body>

<script type="text/javascript" src="/static/js/common.js"></script>

<script type="text/javascript">
    $(function(){
        var result = ${productGrading};
        eachMaterialList(result);
    });


    /******************************** Echart材料比渲染Start********************************************/

    function eachMaterialList(res) {

        for (var i = 0; i < res.length;i++){

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
            } else {
                var arr = returnJsonArray(res[i]['crew2']['moudleList']);
                var temArray  = returnArrayToJson(res[i]['crew2']['moudleList']);

                option7.xAxis.max = arr[arr.length - 1][0];
                option7.series[0].markLine.data = temArray;
                option7.series[1].data = returnJsonArray(res[i]['crew2']['moudleList']);
                option7.series[2].data = returnJsonArray(res[i]['crew2']['realList']);
                option7.series[3].data = returnJsonArray(res[i]['crew2']['upList']);
                option7.series[4].data = returnJsonArray(res[i]['crew2']['midList']);
                option7.series[5].data = returnJsonArray(res[i]['crew2']['downList']);
                myChart7.setOption(option7);
                window.addEventListener("resize", function () {
                    myChart7.resize();
                });
            }
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
</script>
</html>
