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
    <title>数据预警</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/static/js/echarts/echarts.js"></script>

</head>
<style>
    .container{
        position:absolute;
        left:100px;
        top:10px;
        height:160px;
        border:1px solid #ccc;
    }
    s{
        display:block;
        height:0px;      // 为了取出border中间的空隙
        width:0px;        // 为了取出border中间的空隙
    position:absolute;
        left:-20px;
        top:10px;
        border-width:10px;
        border-color:transparent black transparent transparent;
        font-size:0;    //为了清除ie6浏览器中上下不是三角形的情况
    line-height:0;  //为了清除ie6浏览器中上下不是三角形的情况
    border-style:dashed solid dashed dashed;
    }
    i{
        display:block;
        height:0px;
        width:0px;
        position:absolute;
        left:-10px;
        top:-10px;
        border-width:10px;
        border-color:transparent white transparent transparent;
        font-size:0;
        line-height:0;
        border-style:dashed solid dashed dashed;
    }
</style>
<body style="padding:15px 8px 500px 8px;background-color: #fff7f7">

    <div class="my_echars_div_block" >
        <div>
            <div class="boxtitle">
                <span>一号机组实时数据预警</span>
                <div style="height: 100%;padding-left: 55%;float: left;">
                    <p style="float: left;font-size: 12px;" >无预警：</p>
                    <span class="example_span" style="background-color: green;    display: block;width: 15px;height: 50%;margin-right: 10px;margin-top: 10px;border-radius: 5px;"></span>
                    <p style="float: left;font-size: 12px;" >一级预警：</p>
                     <span  style="background-color: blue;    display: block;width: 15px;height: 50%;margin-right: 10px;margin-top: 10px;border-radius: 5px;"></span>
                    <p style="float: left;font-size: 12px;" >二级预警：</p>
                    <span  style="background-color: yellow;    display: block;width: 15px;height: 50%;margin-right: 10px;margin-top: 10px;border-radius: 5px;" ></span>
                    <p style="float: left;font-size: 12px;" >三级预警：</p>
                    <span style="background-color: red;    display: block;width: 15px;height: 50%;margin-right: 10px;margin-top: 10px;border-radius: 5px;" ></span>
                </div>
            </div>
        </div>
        <div>
            <table class="warning_table">

                <thead>
                    <th>生产日期</th>
                    <th>生产时间</th>
                    <th>配比号</th>
                    <th>配比名称</th>
                    <%--<th>车号</th>--%>
                    <th>盘号</th>
                    <%--<th>生产人</th>--%>
                    <%--<th>工程名称</th>--%>
                </thead>

                <tbody>

                    <tr class="warning_table_even">
                        <td id="crew1_produce_date"></td>
                        <td id="crew1_produce_time"></td>
                        <td id="crew1_produce_ratio_id"></td>
                        <td id="crew1_pro_name"></td>
                        <%--<td id="crew1_produce_car_num"></td>--%>
                        <td id="crew1_produce_disc_num"></td>
                        <%--<td id="crew1_produce_user"></td>--%>
                        <%--<td id="crew1_project_name"></td>--%>

                    </tr>
                </tbody>
            </table>
        </div>
        <div class="div_container">
            <table class="warning_table">

                <thead>
                    <th>材料</th>
                    <th>模板配比</th>
                    <th>实际配比</th>
                    <th>偏差比</th>
                    <th>预警级别</th>
                    <th>三盘平均配比</th>
                </thead>

                <tbody id="crew1_material" >


                </tbody>

            </table>
        </div>
        <div class="div_echar" style="border: solid 1px #d6d6d6;" >

            <li >

                <div>

                    <div class="boxtitle" style="background: #aff0f3;height: 30px;line-height: 32px;" >
                        <span>一号机组三盘产品平均级配曲线图</span>
                        <button  onclick="editWarningLevel()" style="background-color: #aff0f3;width: 105px;height: 100%color: #121010;margin-left: 35%;margin-top: 1.5%;" >预警级别设置</button>
                    </div>
                    <div id="chart7" class="charts_2"></div>

                </div>

                <script type="text/javascript">
                    var myChart7= echarts.init(document.getElementById('chart7'));
                    // 指定图表的配置项和数据
                    var colors = ['#5793f3', '#d14a61', '#675bba'];
                    var option7= {
                        legend: {
                            data:['合成级配','实际级配','上限','中值','下限']
                        },
                        grid: {
                            left: '2%',
                            right: '2%',
                            bottom: '3%',
                            containLabel: true
                        },
                        tooltip: {
                            trigger: 'axis'
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
            </li>
        </div>


    </div>

    <div class="my_echars_div_block" >

        <div>
            <div class="boxtitle" >
                <span>二号机组实时数据预警</span>
            </div>
        </div>
        <div>
            <table class="warning_table">

                <thead>
                    <th>生产日期</th>
                    <th>生产时间</th>
                    <th>配比号</th>
                    <th>配比名称</th>
                    <%--<th>车号</th>--%>
                    <th>盘号</th>
                    <%--<th>生产人</th>--%>
                    <%--<th>工程名称</th>--%>
                </thead>

                <tbody  id="crew2_message" >

                <tr class="warning_table_even">
                    <td id="crew2_produce_date"></td>
                    <td id="crew2_produce_time"></td>
                    <td id="crew2_produce_ratio_id"></td>
                    <td id="crew2_pro_name"></td>
                    <%--<td id="crew2_produce_car_num"></td>--%>
                    <td id="crew2_produce_disc_num"></td>
                    <%--<td id="crew2_produce_user"></td>--%>
                    <%--<td id="crew2_project_name"></td>--%>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="div_container">
            <table class="warning_table">

                <thead>
                    <th>材料</th>
                    <th>模板配比</th>
                    <th>实际配比</th>
                    <th>偏差比</th>
                    <th>预警级别</th>
                    <th>三盘平均配比</th>
                </thead>

                <tbody id="crew2_material" >

                </tbody>

            </table>
        </div>
        <div class="div_echar" style="border: solid 1px #d6d6d6;line-height: 32px;"  >

            <li>

                <div>

                    <div class="boxtitle"  style="background: #aff0f3;height: 30px;line-height: 32px;" >
                        <span>二号机组三盘产品平均级配曲线图</span>
                    </div>
                    <div id="chart4" class="charts_2"></div>

                </div>

                <script type="text/javascript">
                    var myChart4 = echarts.init(document.getElementById('chart4'));
                    // 指定图表的配置项和数据
                    var colors = ['#5793f3', '#d14a61', '#675bba'];
                    var option4 ={
                        legend: {
                            data:['合成级配','实际级配','上限','中值','下限']
                        },
                        grid: {
                            left: '2%',
                            right: '2%',
                            bottom: '3%',
                            containLabel: true
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
            </li>
        </div>
    </div>

    <div  id="formDiv" style="display: none;">
    <form class="layui-form layui-form-pane" style="height: 80%" id="fromData">
        <%--<input id="storeId" name="storeId" type="hidden">--%>
        <div class="layui-form-item" id="fromHerd" style="margin-top: 15px;margin-left: 30px;margin-bottom: 0px;">
            <div class="layui-inline">
                <label class="layui-form-label" style="margin-right: 30px;">材料</label>
                <div class="layui-input-inline" style="width: 100px;margin-right: 20px;">
                    <input type="text" name="id" placeholder="id" autocomplete="off" class="layui-input" style="display: none;">
                    <label class="layui-form-label" style="margin-right: 30px;">一级预警上限</label>
                </div>
                <div class="layui-input-inline" style="width: 100px;margin-right: 20px;">
                    <label class="layui-form-label" style="margin-right: 30px;">一级预警下限</label>
                </div>
                <div class="layui-input-inline" style="width: 100px;margin-right: 20px;">
                    <label class="layui-form-label" style="margin-right: 30px;">二级预警上限</label>
                </div>
                <div class="layui-input-inline" style="width: 100px;margin-right: 20px;">
                    <label class="layui-form-label" style="margin-right: 30px;">二级预警下限</label>
                </div>
                <div class="layui-input-inline" style="width: 100px;margin-right: 20px;">
                    <label class="layui-form-label" style="margin-right: 30px;">三级预警上限</label>
                </div>
                <div class="layui-input-inline" style="width: 100px;margin-right: 20px;">
                    <label class="layui-form-label" style="margin-right: 30px;">三级预警下限</label>
                </div>
            </div>
        </div>

        <div class="layui-form-item" >
            <div class="layui-input-block">
                <button class="layui-btn" type="button" id="saveLevel">保存</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    </div>
    <div class="layui-layer layui-layer-tips" id="warning" type="tips" times="10" showtime="4000" contype="object" style="z-index: 19891024; position:absolute; width: 210px; display: none;"><div id="" class="layui-layer-content" style="background-color: rgb(53, 149, 204);">我是另外一个tips，只不过我长得跟之前那位稍有些不一样。<i class="layui-layer-TipsG layui-layer-TipsT" style="border-right-color: rgb(53, 149, 204);"></i></div><span class="layui-layer-setwin"></span></div>
    <%--js获取路径--%>
    <input id="path" type="hidden" value="${path}"/>
</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/layui/layui.js"></script>
<script type="text/javascript" src="/static/js/qc/quality_warning.js"></script>
</html>