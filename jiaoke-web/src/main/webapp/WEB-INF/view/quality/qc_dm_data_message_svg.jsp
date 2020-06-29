
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
    <title>20盘产品平均信息</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/static/js/jquery.js"></script>
    <script src="/static/js/echarts/echarts.js"></script>

</head>
<style>
    .leftMenuDiv{
        position: fixed;
        right:94%;
        top:35%;
        border-radius: 5px;
        width: 80px;
        height: 200px;
        background-color: #d3d7dc;
        -webkit-transition: opacity .5s,width .1s,margin .5s;
    }

    .leftMenuImage{
        position: fixed;
        right:94%;
        top:35%;
        background-image: url(/static/images/qc/leftMenu.png);
        width: 80px;
        height: 80px;
        display: block;
        margin: 60px auto;
        background-repeat: no-repeat;
        background-size: 100% 100%;
        -moz-background-size: 100% 100%;
    }
    .rightMenuDiv{
        position: fixed;
        left:94%;
        top:35%;
        border-radius: 5px;
        width: 80px;
        height: 200px;
        background-color: #d3d7dc;
        -webkit-transition: opacity .5s,width .1s,margin .5s;
    }
    .rightMenuImage{
        position: fixed;
        left:94%;
        top:35%;
        background-image: url(/static/images/qc/rightMenu.png);
        width: 80px;
        height: 80px;
        display: block;
        margin: 60px auto;
        background-repeat: no-repeat;
        background-size: 100% 100%;
        -moz-background-size: 100% 100%;
    }
</style>
<body style="padding:15px 8px 500px 8px;">

<div class="">
    <div class="">
        <div class="boxtitle">
            <span>产品平均数据</span>
        </div>

        <div class="boxdown">
            <table class="simpletable">
                <thead>
                <th style="width: 70px " >配比名称</th>
                <th style="width: 70px">骨料1</th>
                <th style="width: 70px" >骨料2</th>
                <th style="width: 70px">骨料3</th>
                <th style="width: 70px">骨料4</th>
                <th style="width: 70px">骨料5</th>
                <th style="width: 70px">骨料6</th>
                <th style="width: 70px ">石粉2</th>
                <th style="width: 70px ">石粉1</th>
                <th style="width: 70px ">沥青</th>
                <th style="width: 70px " >再生料</th>
                <th style="width: 70px " >添加剂</th>
                <th style="width: 100px">合计(kg)</th>
                </thead>

                <tbody>
                <tr></tr>
                <tr>
                    <td id="pro_names"></td>
                    <td  id="material_aggregate_1_svg"><em></em>kg</td></td>
                    <td id="material_aggregate_2_svg"><em></em>kg</td></td>
                    <td  id="material_aggregate_3_svg"><em></em>kg</td></td>
                    <td  id="material_aggregate_4_svg"><em></em>kg</td></td>
                    <td  id="material_aggregate_5_svg"><em></em>kg</td></td>
                    <td  id="material_aggregate_6_svg"><em>kg</em></td>
                    <td  id="material_stone_2_svg"><em>kg</em></td>
                    <td  id="material_stone_1_svg"><em>kg</em></td>
                    <td  id="material_asphalt_svg"><em>kg</em></td>
                    <td id="material_regenerate_svg"><em>kg</em></td>
                    <td id="material_additive_svg"><em>kg</em></td>
                    <td  id="material_total_svg"><em>kg</em></td>
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
                <th style="width: 100px ">矿料比例</th>
                <th style="width: 100px ">沥青占比</th>
                <th style="width: 100px ">再生料占比</th>
                </thead>
                <tbody>
                <td id="temperature_warehouse_1_svg"><em>℃</em></td>
                <td id="temperature_mixture_svg"><em>℃</em></td>
                <td id="temperature_duster_svg"><em>℃</em></td>
                <td id="temperature_asphalt_svg"><em>℃</em></td>
                <td id="temperature_aggregate_svg"><em>℃</em></td>
                <td id="material_aggregate_1_real_up"><em>%</em></td>
                <td id="material_aggregate_2_real_up" ><em>%</em></td>
                <td id="material_aggregate_3_real_up" ><em>%</em></td>
                <td id="material_aggregate_4_real_up" ><em>%</em></td>
                <td id="material_aggregate_5_real_up" ><em>%</em></td>
                <td id="material_aggregate_6_real_up" ><em>%</em></td>
                <td id="breeze_real_up" ><em>%</em></td>
                <td id="ratio_stone_real_up" ><em>%</em></td>
                <td id="ratio_regenerate_real_up" ><em>%</em></td>
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

                </thead>

                <tbody>
                    <tr>
                        <td>骨料1</td>
                        <td id="material_aggregate_1_real"><i>%</i></td>
                        <td id="repertory_one"><i>%</i></td>

                    </tr>
                    <tr>
                        <td>骨料2</td>
                        <td  id="material_aggregate_2_real"><i>%</i></td>
                        <td id="repertory_two"><i>%</i></td>

                    </tr>
                    <tr>
                        <td>骨料3</td>
                        <td id="material_aggregate_3_real"><i>%</i></td>
                        <td id="repertory_three"><i>%</i></td>

                    </tr>
                    <tr>
                        <td>骨料4</td>
                        <td id="material_aggregate_4_real"><i>%</i></td>
                        <td id="repertory_four"><i>%</i></td>

                    </tr>
                    <tr>
                        <td>骨料5</td>
                        <td id="material_aggregate_5_real"><i>%</i></td>
                        <td id="repertory_five"><i>%</i></td>

                    </tr>
                    <tr>
                        <td>骨料6</td>
                        <td id="material_aggregate_6_real"><i>%</i></td>
                        <td  id="repertory_six"><i>%</i></td>

                    </tr>
                    <tr>
                        <td>矿粉</td>
                        <td id="breeze_real"><i>%</i></td>
                        <td id="breeze"><i>%</i></td>

                    </tr>
                    <tr>
                        <td>沥青</td>
                        <td id="ratio_stone_real"><i>%</i></td>
                        <td id="ratio_stone"><i>%</i></td>

                    </tr>
                    <tr>
                        <td>再生料</td>
                        <td  id="ratio_regenerate_real"><i>%</i></td>
                        <td id="ratio_regenerate"><i>%</i></td>

                    </tr>
                    <tr>
                        <td>骨料温度</td>
                        <td id="temperature_aggregate_real"><i>℃</i></td>
                        <td id="temperature_aggregate"><i>℃</i></td>

                    </tr>

                    <tr>
                        <td>混合料温度</td>
                        <td id="temperature_mixture_real"><i>℃</i></td>
                        <td id="temperature_mixture"><i>℃</i></td>

                    </tr>
                    <tr>
                        <td>沥青温度</td>
                        <td id="temperature_asphalt_real"><i>℃</i></td>
                        <td id="temperature_asphalt"><i>℃</i></td>

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
        <div id="chart7" class="charts1"></div>
    </div>
    <script type="text/javascript">
        var myChart7= echarts.init(document.getElementById('chart7'));
        // 指定图表的配置项和数据
        var colors = ['#5793f3', '#d14a61', '#675bba'];
        var option7= {
            title: {
                text: '平均级配曲线图'
            },
            legend: {
                data:['合成级配','实际级配','上限','中值','下限']
            },
            grid: {

            },
            toolbox: {
                feature: {
                    dataZoom: {
                        yAxisIndex: 'none'
                    },
                    restore: {},
                    saveAsImage: {}
                }
            },
            tooltip: {
                trigger: 'axis',
                formatter: function(params, ticket, callback) {
                    return  '筛孔:' + returnX(params[0].value[0])  + '的通过率<br/>'
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
</li>

<%--左右按钮逻辑--%>
<div id="menuDiv" style="opacity: 0;" onmouseover="showMenus();" onmouseout="closeMenus();">
    <a href="javascript:;" onclick="chageMessage('up');">
        <div class="leftMenuDiv"></div>
        <i class="leftMenuImage" ></i>
    </a>
    <a href="javascript:;" onclick="chageMessage('down');">
        <div class="rightMenuDiv"></div>
        <i class="rightMenuImage" ></i>
    </a>
</div>
<input  id="path" value="${path}" type="hidden" >
</body>

<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/layer/layer.js"></script>
<script type="text/javascript">
    $(function(){

        var jsonStr = localStorage.getItem("ProductSVG");
        showProMessage(jsonStr);
        getProSVGRationAndModelRation(jsonStr);

        //查看平均及配图
        var obj = JSON.parse(jsonStr);
        obj.crewNum = obj.crewNum == 'data1'? 'crew1':'crew2';
        getGrading(JSON.stringify(obj));
    });

    function showMenus(){
        var box = document.getElementById("menuDiv");
        box.style.opacity = 1;
    };
    function closeMenus(){
        var box = document.getElementById("menuDiv");
        box.style.opacity = 0;
    }
    function chageMessage(condition){

        var countIndex = localStorage.getItem("countIndex");
        var jsonList = localStorage.getItem("ProductSVG");
        var index = Number(localStorage.getItem("index"));

        switch (condition) {
            case 'up':
                if (index == 1){
                    layer.msg("当前为第一页");
                    break;
                }else {
                    parent.showTwentyProductSVG(index - 1);
                    break;
                }
            case 'down':

                if (index == countIndex){
                    layer.msg("当前为最后一页");
                    break;
                } else {
                    parent.showTwentyProductSVG(index + 1);
                    break;
                }
        }
    }


    /********************************  文本渲染Start********************************************/
    function showProMessage(jsonStr) {
        var obj = JSON.parse(jsonStr);
        $("#pro_names").text(obj.pro_name);
        $("#material_aggregate_6_svg").prepend(obj.material_aggregate_6.toFixed(2));
        $("#material_aggregate_6_real").prepend(((obj.material_aggregate_6.toFixed(2)/obj.material_total)*100).toFixed(2));
        $("#material_aggregate_6_real_up").prepend(((obj.material_aggregate_6.toFixed(2)/obj.material_total)*100).toFixed(2));
        $("#material_aggregate_5_real_up").prepend((((obj.material_aggregate_5 - obj.material_aggregate_6).toFixed(2)/obj.material_total) *100).toFixed(2));
        $("#material_aggregate_5_real").prepend((((obj.material_aggregate_5 - obj.material_aggregate_6).toFixed(2)/obj.material_total) *100).toFixed(2));
        $("#material_aggregate_5_svg").prepend(((obj.material_aggregate_5 - obj.material_aggregate_6).toFixed(2)));
        $("#material_aggregate_4_real_up").prepend((((obj.material_aggregate_4 - obj.material_aggregate_5).toFixed(2))/obj.material_total *100).toFixed(2));
        $("#material_aggregate_4_real").prepend((((obj.material_aggregate_4 - obj.material_aggregate_5).toFixed(2))/obj.material_total *100).toFixed(2));
        $("#material_aggregate_4_svg").prepend(((obj.material_aggregate_4 - obj.material_aggregate_5).toFixed(2)));

        $("#material_aggregate_3_real_up").prepend(((obj.material_aggregate_3 - obj.material_aggregate_4).toFixed(2)/obj.material_total *100).toFixed(2));
        $("#material_aggregate_3_real").prepend(((obj.material_aggregate_3 - obj.material_aggregate_4).toFixed(2)/obj.material_total *100).toFixed(2));
        $("#material_aggregate_3_svg").prepend((obj.material_aggregate_3 - obj.material_aggregate_4).toFixed(2));

        $("#material_aggregate_2_real_up").prepend(((obj.material_aggregate_2 - obj.material_aggregate_3).toFixed(2)/obj.material_total *100).toFixed(2));
        $("#material_aggregate_2_real").prepend(((obj.material_aggregate_2 - obj.material_aggregate_3).toFixed(2)/obj.material_total *100).toFixed(2));
        $("#material_aggregate_2_svg").prepend((obj.material_aggregate_2 - obj.material_aggregate_3).toFixed(2));

        $("#material_aggregate_1_real_up").prepend(((obj.material_aggregate_2 - obj.material_aggregate_3).toFixed(2)/obj.material_total *100).toFixed(2));
        $("#material_aggregate_1_real").prepend(((obj.material_aggregate_1 - obj.material_aggregate_2).toFixed(2)/obj.material_total *100).toFixed(2));
        $("#material_aggregate_1_svg").prepend((obj.material_aggregate_1 - obj.material_aggregate_2).toFixed(2));

        $("#material_stone_1_svg").prepend(obj.material_stone_1.toFixed(2));
        $("#material_stone_2_svg").prepend(obj.material_stone_2.toFixed(2));
        var breeze = obj.material_stone_1 > obj.material_stone_2? obj.material_stone_1:obj.material_stone_2;

        $("#breeze_real").prepend((breeze/obj.material_total *100).toFixed(2));
        $("#breeze_real_up").prepend((breeze/obj.material_total *100).toFixed(2));

        $("#material_additive_svg").prepend(obj.material_additive);
        $("#ratio_stone_real").prepend((obj.material_asphalt.toFixed(2)/obj.material_total *100).toFixed(2));
        $("#ratio_stone_real_up").prepend((obj.material_asphalt.toFixed(2)/obj.material_total *100).toFixed(2));
        $("#material_asphalt_svg").prepend(obj.material_asphalt.toFixed(2));

        $("#ratio_regenerate_real_up").prepend((obj.material_regenerate.toFixed(2)/obj.material_total *100).toFixed(2));
        $("#ratio_regenerate_real").prepend((obj.material_regenerate.toFixed(2)/obj.material_total *100).toFixed(2));
        $("#material_regenerate_svg").prepend(obj.material_regenerate.toFixed(2));
        $("#material_total_svg").prepend(obj.material_total.toFixed(2));
        $("#temperature_warehouse_1_svg").prepend(obj.temperature_warehouse_1.toFixed(2));
        $("#temperature_warehouse_1_real").prepend(obj.temperature_warehouse_1.toFixed(2));
        $("#temperature_mixture_svg").prepend(obj.temperature_mixture.toFixed(2));
        $("#temperature_mixture_real").prepend(obj.temperature_mixture.toFixed(2));
        $("#temperature_duster_svg").prepend(obj.temperature_duster.toFixed(2));
        $("#temperature_duster_real").prepend(obj.temperature_duster.toFixed(2));
        $("#temperature_asphalt_svg").prepend(obj.temperature_asphalt.toFixed(2));
        $("#temperature_asphalt_real").prepend(obj.temperature_asphalt.toFixed(2));
        $("#temperature_aggregate_svg").prepend(obj.temperature_aggregate.toFixed(2));
        $("#temperature_aggregate_real").prepend(obj.temperature_aggregate.toFixed(2));
    }
    //渲染
    function getProSVGRationAndModelRation(jsonStr) {
        var path = $("#path").val();
        $.ajax({
            type: "POST",
            url: path + "/getProSVGRationAndModelRation.do",
            data:{"ProductSVG":jsonStr},
            dataType:"json",
            success: function(msg){
                for(var p in msg){//遍历json数组时，这么写p为索引，0,1
                    $("#" + p).prepend(msg[p]);

                }
                debugger
                //更新状态
                // localStorage.getItem("ProductSVGAndModel");
                // localStorage.setItem("ProductSVGAndModel",msg);
                $("#ratio_regenerate").prepend(msg.ratio_regenerate1 + msg.ratio_regenerate2 + msg.ratio_regenerate3);
                $("#temperature_asphalt").empty();
                $("#temperature_asphalt").prepend(msg.temperature_asphalt + "-" + msg.temperature_asphalt_up);
                $("#temperature_aggregate").empty();
                $("#temperature_aggregate").prepend(msg.temperature_aggregate + "-" + msg.temperature_aggregate_up);
                $("#temperature_mixture").empty();
                $("#temperature_mixture").prepend(msg.temperature_mixture + "-" + msg.temperature_mixture_up);
            }
        });
        
    }
    /********************************  文本渲染End********************************************/

    

    /******************************** Echart材料比渲染Start********************************************/
    
    function getGrading(jsonStr) {
        var path = $("#path").val();
        $.ajax({
            type: "POST",
            url: path + "/getProductSvgGrading.do",
            data:{"ProductSVG":jsonStr},
            dataType:"json",
            success:function (res) {
                eachMaterialList(res);
            }
        })
    }

    function eachMaterialList(res) {
        debugger

        for (var i = 0; i < res.length;i++){


            var arr = res[i]['crew1'];

            if (res[i]['crew1']){


                var arr = returnJsonArray(res[i]['crew1']['moudleList']);
                var temArray  = returnArrayToJson(res[i]['crew1']['moudleList']);

                if(arr){
                    option7.xAxis.max = arr[arr.length - 1][0];
                }
                debugger
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
                    option7.xAxis.max = temArr[temArr.length - 1][0];
                }

                option7.series[0].markLine.data = returnArrayToJson(res[i]['crew2']['moudleList']);
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
</script>
</html>
