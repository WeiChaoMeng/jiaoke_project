<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>

<head>
    <meta charset="utf-8">
    <title>数据管理-汇总</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <script src="/static/js/echarts/echarts.js"></script>
</head>

<body style="padding:10px 8px 100px 8px;">

    <!--form start-->
    <!--form start-->
    <div class="data_chartbox">
        <div id="chart500" class="data_charts"></div>

        <script type="text/javascript">
            var myChart500 = echarts.init(document.getElementById('chart500'));
            // 指定图表的配置项和数据
            var valueList1 = ${baseMap.warehouse1};
            var valueList = ${baseMap.mixture};

            option = {
                title: {
                    text: '一仓温度走势图'
                },
                tooltip: {
                    trigger: 'axis'
                },
                toolbox: {
                    show: true,
                    feature: {

                        magicType: {type: ['line', 'bar']},
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis:  {
                    type: 'category',
                    boundaryGap: false,
                    data: ${baseMap.dateList}
                },
                yAxis: {
                    type: 'value',
                    axisLabel: {
                        formatter: '{value} ℃'
                    },
                    <c:choose>
                        <c:when test="${baseMap.warehouse1Max > baseMap.template.temperatureMillingUp}">
                            max:${baseMap.warehouse1Max + 5},
                        </c:when>
                        <c:otherwise>
                            max:${baseMap.template.temperatureMillingUp + 5},
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                    <c:when test="${baseMap.warehouse1Min < baseMap.template.temperatureMilling}">
                        min:${baseMap.warehouse1Min - 5},
                    </c:when>
                    <c:otherwise>
                        min:${baseMap.template.temperatureMilling - 5},
                    </c:otherwise>
                    </c:choose>


                    axisPointer: {
                        snap: true
                    }
                },
                series: [
                    {
                        name:'温度',
                        type:'line',
                        smooth: true,
                        data: ${baseMap.warehouse1},
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        },
                        markLine: {
                            data: [
                                {name: '上限', yAxis: ${baseMap.template.temperatureMillingUp}},
                                {name: '下限',  yAxis: ${baseMap.template.temperatureMilling}}
                            ]
                        }
                    }
                ]
            };
                <%--series: [{--%>
                    <%--type: 'line',--%>
                    <%--showSymbol: false,--%>
                    <%--data: [--%>
                        <%--<c:forEach begin="1" end="${fn:length(baseMap.mixture)}">--%>
                        <%--${baseMap.template.temperatureMixtureUp},--%>
                        <%--</c:forEach>--%>
                    <%--],--%>
                    <%--xAxisIndex: 1,--%>
                    <%--yAxisIndex: 1--%>
                <%--},{--%>
                    <%--type: 'line',--%>
                    <%--showSymbol: false,--%>
                    <%--data: ${baseMap.mixture},--%>
                    <%--xAxisIndex: 1,--%>
                    <%--yAxisIndex: 1--%>
                <%--},{--%>
                    <%--type: 'line',--%>
                    <%--showSymbol: false,--%>
                    <%--data: [--%>
                        <%--<c:forEach begin="1" end="${fn:length(baseMap.mixture)}">--%>
                        <%--${baseMap.template.temperatureMixture},--%>
                        <%--</c:forEach>--%>
                    <%--],--%>
                    <%--xAxisIndex: 1,--%>
                    <%--yAxisIndex: 1--%>
                <%--}]--%>
            <%--};--%>
            myChart500.setOption(option);
            window.addEventListener("resize", function () {
                myChart500.resize();
            });
        </script>
    </div>
    <div class="data_chartbox">
        <div id="chart5" class="data_charts"></div>

        <script type="text/javascript">
            var myChart5= echarts.init(document.getElementById('chart5'));
            // 指定图表的配置项和数据

            option5 = {
                title: {
                    text: '混合料温度走势图'
                },
                tooltip: {
                    trigger: 'axis'
                },
                toolbox: {
                    show: true,
                    feature: {

                        magicType: {type: ['line', 'bar']},
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis:  {
                    type: 'category',
                    boundaryGap: false,
                    data: ${baseMap.dateList}
                },
                yAxis: {
                    type: 'value',
                    axisLabel: {
                        formatter: '{value} ℃'
                    },
                    <c:choose>
                    <c:when test="${baseMap.mixtureMax > baseMap.template.temperatureMixtureUp}">
                    max:${baseMap.mixtureMax + 5},
                    </c:when>
                    <c:otherwise>
                    max:${baseMap.template.temperatureMixtureUp + 5},
                    </c:otherwise>
                    </c:choose>

                    <c:choose>
                    <c:when test="${baseMap.mixtureMin < baseMap.template.temperatureMixture}">
                    min:${baseMap.mixtureMin - 5},
                    </c:when>
                    <c:otherwise>
                    min:${baseMap.template.temperatureMixture - 5},
                    </c:otherwise>
                    </c:choose>
                    axisPointer: {
                        snap: true
                    }
                },
                series: [
                    {
                        name:'温度',
                        type:'line',
                        smooth: true,
                        data: ${baseMap.mixture},
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        },
                        markLine: {
                            data: [
                                {name: '上限', yAxis: ${baseMap.template.temperatureMixtureUp}},
                                {name: '下限',  yAxis: ${baseMap.template.temperatureMixture}}
                            ]
                        }
                    }
                ]
            };
            myChart5.setOption(option5);
            window.addEventListener("resize", function () {
                myChart5.resize();
            });
        </script>
    </div>


    <div class="data_chartbox">
        <div id="chart4" class="data_charts"></div>

        <script type="text/javascript">
            var myChart4= echarts.init(document.getElementById('chart4'));
            // 指定图表的配置项和数据

            option4 = {
                title: {
                    text: '沥青温度走势图'
                },
                tooltip: {
                    trigger: 'axis'
                },
                toolbox: {
                    show: true,
                    feature: {

                        magicType: {type: ['line', 'bar']},
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis:  {
                    type: 'category',
                    boundaryGap: false,
                    data: ${baseMap.dateList}
                },
                yAxis: {
                    type: 'value',
                    axisLabel: {
                        formatter: '{value} ℃'
                    },
                    <c:choose>
                    <c:when test="${baseMap.asphaltMax > baseMap.template.temperatureAsphaltUp}">
                    max:${baseMap.asphaltMax + 5},
                    </c:when>
                    <c:otherwise>
                    max:${baseMap.template.temperatureAsphaltUp + 5},
                    </c:otherwise>
                    </c:choose>

                    <c:choose>
                    <c:when test="${baseMap.asphaltMin < baseMap.template.temperatureAsphalt}">
                    min:${baseMap.asphaltMin - 5},
                    </c:when>
                    <c:otherwise>
                    min:${baseMap.template.temperatureAsphalt - 5},
                    </c:otherwise>
                    </c:choose>
                    axisPointer: {
                        snap: true
                    }
                },
                series: [
                    {
                        name:'温度',
                        type:'line',
                        smooth: true,
                        data: ${baseMap.asphalt},
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        },
                        markLine: {
                            data: [
                                {name: '上限', yAxis: ${baseMap.template.temperatureAsphaltUp}},
                                {name: '下限',  yAxis: ${baseMap.template.temperatureAsphalt}}
                            ]
                        }
                    }
                ]
            };

            myChart4.setOption(option4);
            window.addEventListener("resize", function () {
                myChart4.resize();
            });
        </script>
    </div>

    <div class="data_chartbox">
        <div id="chart3" class="data_charts"></div>

        <script type="text/javascript">
            var myChart3= echarts.init(document.getElementById('chart3'));
            // 指定图表的配置项和数据


            option3 = {
                title: {
                    text: '骨料温度走势图'
                },
                tooltip: {
                    trigger: 'axis'
                },
                toolbox: {
                    show: true,
                    feature: {

                        magicType: {type: ['line', 'bar']},
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis:  {
                    type: 'category',
                    boundaryGap: false,
                    data: ${baseMap.dateList}
                },
                yAxis: {
                    type: 'value',
                    axisLabel: {
                        formatter: '{value} ℃'
                    },

                    <c:choose>
                    <c:when test="${baseMap.aggregateMax > baseMap.template.temperatureAggregateUp}">
                    max:${baseMap.aggregateMax + 5},
                    </c:when>
                    <c:otherwise>
                    max:${baseMap.template.temperatureAggregateUp + 5},
                    </c:otherwise>
                    </c:choose>

                    <c:choose>
                    <c:when test="${baseMap.aggregateMin < baseMap.template.temperatureAggregate}">
                    min:${baseMap.aggregateMin - 5},
                    </c:when>
                    <c:otherwise>
                    min:${baseMap.template.temperatureAggregate - 5},
                    </c:otherwise>
                    </c:choose>

                    axisPointer: {
                        snap: true
                    }
                },
                series: [
                    {
                        name:'温度',
                        type:'line',
                        smooth: true,
                        data: ${baseMap.aggregate},
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        },
                        markLine: {
                            data: [
                                {name: '上限', yAxis: ${baseMap.template.temperatureAggregateUp}},
                                {name: '下限',  yAxis: ${baseMap.template.temperatureAggregate}}
                            ]
                        }
                    }
                ]
            };

            myChart3.setOption(option3);
            window.addEventListener("resize", function () {
                myChart3.resize();
            });
        </script>
    </div>

    <div class="divbox">
        <div id="chart7" class="charts1"></div>

        <script type="text/javascript">
            var myChart7 = echarts.init(document.getElementById('chart7'));
            // 指定图表的配置项和数据
            option7 = {
// Make gradient line here
                title: [{
                    left: 'center',
                    text: '沥青占比走势图'
                }],
                tooltip: {
                    trigger: 'axis'
                },
                toolbox: {
                    show: true,
                    feature: {

                        magicType: {type: ['line', 'bar']},
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis: [{
                    data: ${baseMap.dateList}
                }],
                yAxis: [{
                    type: 'value',
                    interval :0.5,
                    max:function (v) {
                        return (v.max + 0.2).toFixed(1)
                    },
                    min:function (v) {
                        return (v.min - 0.5) < 0? 0:(v.min - 0.5).toFixed(1)
                    },
                    axisLabel: {
                        formatter: '{value} %'
                    },
                }],
                grid: [{
                    bottom: '25%'
                }],
                series: [{
                    type: 'line',
                    showSymbol: false,
                    data: ${baseMap.asphaltRatio},
                    markLine: {
                        data: [
                            {name: '上限', yAxis: ${baseMap.template.ratioStone + 0.3}},
                            {name: '下限',  yAxis: ${baseMap.template.ratioStone - 0.3}}
                        ]
                    }
                }]
            };
            myChart7.setOption(option7);
            window.addEventListener("resize", function () {
                myChart7.resize();
            });
        </script>
    </div>

    <div class="div_dataMessage"  id="promessage" >

        <div class="">
            <div class="">
                <div class="boxtitle">
                    <span>历史产品数据</span>
                    <a href="javascript:void(0);"  onclick="showTwentyProductSVG('1')" >二十盘平均数据<i class="iconfont"></i></a>
                    <a href="javascript:void(0);"  onclick="printExcle('excelTable')"  >导出excel<i class="iconfont"></i></a>
                </div>

                <div class="boxdown">
                    <table class="simpletable" id="excelTable">

                        <thead>
                        <th>生产日期</th>
                        <th>生产时间</th>
                        <th>产品名称</th>
                        <th>盘号</th>
                        <th>骨料6</th>
                        <th>骨料5</th>
                        <th>骨料4</th>
                        <th>骨料3</th>
                        <th>骨料2</th>
                        <th>骨料1</th>
                        <th>石粉1</th>
                        <th>石粉2</th>
                        <th>沥青</th>
                        <th>再生料</th>
                        <th>添加剂</th>
                        <th>总计</th>
                        <th>一仓温度</th>
                        <th>混合料温度</th>
                        <th>沥青温度</th>
                        <th>骨料温度</th>
                        <th>除尘器温度</th>
                        </thead>

                        <tbody>
                        <c:forEach items="${baseMap.prolist}" var="item" >
                            <tr>
                                <td>${item.produce_date}</td>
                                <td>${item.produce_time}</td>
                                <td>${item.pro_name}</td>
                                <td>${item.produce_disc_num}</td>
                                <td>${item.material_aggregate_6}</td>
                                <td>${item.material_aggregate_5}</td>
                                <td>${item.material_aggregate_4}</td>
                                <td>${item.material_aggregate_3}</td>
                                <td>${item.material_aggregate_2}</td>
                                <td>${item.material_aggregate_1}</td>
                                <td>${item.material_stone_1}</td>
                                <td>${item.material_stone_2}</td>
                                <td>${item.material_asphalt}</td>
                                <td>${item.material_regenerate}</td>
                                <td>${item.material_additive}</td>
                                <td>${item.material_total}</td>
                                <td>${item.temperature_warehouse_1}</td>
                                <td>${item.temperature_mixture}</td>
                                <td>${item.temperature_asphalt}</td>
                                <td>${item.temperature_aggregate}</td>
                                <td>${item.temperature_duster}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>

    </div>
    <input  id="path" value="${path}" type="hidden" >
</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script language="javascript" src="/static/js/qc/jquery.jqprint-0.3.js"></script>
<script src="http://www.jq22.com/jquery/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="/static/js/layer/layer.js"></script>
<script language="javascript">
    function  print(){
        $("#promessage").jqprint({
            debug: true, //如果是true则可以显示iframe查看效果（iframe默认高和宽都很小，可以再源码中调大），默认是false
            importCSS: true, //true表示引进原来的页面的css，默认是true。（如果是true，先会找$("link[media=print]")，若没有会去找$("link")中的css文件）
            printContainer: true, //表示如果原来选择的对象必须被纳入打印（注意：设置为false可能会打破你的CSS规则）。
            operaSupport: true//表示如果插件也必须支持歌opera浏览器，在这种情况下，它提供了建立一个临时的打印选项卡。默认是true
        });
    }

    /**
     *
     * @param list 产品盘数数组
     * @param index 当前第几组
     */
    function showTwentyProductSVG(index) {
        var path = $("#path").val();
        var jsonList = ${baseMap.proListJson};
        var res = getSvgByList(jsonList,index);
        //将数据存入前端内存，方便弹出逻辑
        localStorage.setItem("countIndex",Math.ceil(jsonList.length/20) );
        localStorage.setItem("ProductSVG",res);
        localStorage.setItem("index",index);

        layer.closeAll();
        layer.open({
            type: 2,
            title: '20盘产品均值信息',
            shadeClose: true,
            maxmin: true,
            shade: 0.8,
            area: ['90%', '90%'],
            content: path + '/showTwentyProductSVG.do'
        });
    }
    
    function getSvgByList(jsonList,index) {
        var endArrIndex = Number(index) * 20;
        var strtArrIndex = (Number(index) - 1) * 20;
        //循环次数
        var forCount = 0;
        //各材料参数
        var crewNum;
        var pro_name;
        var proDate;
        var produce_proportioning_num ;
        var material_aggregate_6_total = 0;
        var material_aggregate_5_total = 0;
        var material_aggregate_4_total = 0;
        var material_aggregate_3_total = 0;
        var material_aggregate_2_total = 0;
        var material_aggregate_1_total = 0;
        var material_stone_1_total = 0;
        var material_stone_2_total = 0;
        var material_asphalt_total = 0;
        var material_regenerate_total = 0;
        var material_additive_total = 0;
        var material_total_total = 0;
        var temperature_warehouse_1_total = 0;
        var temperature_mixture_total = 0;
        var temperature_duster_total = 0;
        var temperature_asphalt_total = 0;
        var temperature_aggregate_total = 0;

        for (var i = strtArrIndex; i < endArrIndex;i++ ){
            if (typeof(jsonList[i]) == 'undefined') {
                break;
            }
            forCount ++;
            crewNum = jsonList[i].crewNums;
            pro_name = jsonList[i].pro_name;
            proDate = jsonList[i].produce_date;
            produce_proportioning_num = jsonList[i].produce_proportioning_num;
            material_aggregate_6_total += Number(jsonList[i].material_aggregate_6);
            material_aggregate_5_total += Number(jsonList[i].material_aggregate_5);
            material_aggregate_4_total+= Number(jsonList[i].material_aggregate_4);
            material_aggregate_3_total += Number(jsonList[i].material_aggregate_3);
            material_aggregate_2_total += Number(jsonList[i].material_aggregate_2);
            material_aggregate_1_total += Number(jsonList[i].material_aggregate_1);
            material_stone_1_total += Number(jsonList[i].material_stone_1);
            material_stone_2_total += Number(jsonList[i].material_stone_2);
            material_asphalt_total += Number(jsonList[i].material_asphalt);
            material_regenerate_total += Number(jsonList[i].material_regenerate);
            material_additive_total += Number(jsonList[i].material_additive);
            material_total_total += Number(jsonList[i].material_total);
            temperature_warehouse_1_total += Number(jsonList[i].temperature_warehouse_1);
            temperature_mixture_total += Number(jsonList[i].temperature_mixture);
            temperature_duster_total += Number(jsonList[i].temperature_duster);
            temperature_asphalt_total += Number(jsonList[i].temperature_asphalt);
            temperature_aggregate_total += Number(jsonList[i].temperature_aggregate);
        }
        var svgPro = { };

        svgPro.crewNum = crewNum;
        svgPro.pro_name = pro_name;
        svgPro.proDate = proDate;
        svgPro.produce_proportioning_num = produce_proportioning_num;
        svgPro.material_aggregate_6 = material_aggregate_6_total/forCount;
        svgPro.material_aggregate_5 = material_aggregate_5_total/forCount;
        svgPro.material_aggregate_4 = material_aggregate_4_total/forCount;
        svgPro.material_aggregate_3 = material_aggregate_3_total/forCount;
        svgPro.material_aggregate_2 = material_aggregate_2_total/forCount;
        svgPro.material_aggregate_1 = material_aggregate_1_total/forCount;
        svgPro.material_stone_1 = material_stone_1_total/forCount;
        svgPro.material_stone_2 = material_stone_2_total/forCount;
        svgPro.material_asphalt = material_asphalt_total/forCount;
        svgPro.material_regenerate = material_regenerate_total/forCount;
        svgPro.material_additive = material_additive_total/forCount;
        svgPro.material_total = material_total_total/forCount;
        svgPro.temperature_warehouse_1 = temperature_warehouse_1_total/forCount;
        svgPro.temperature_mixture = temperature_mixture_total/forCount;
        svgPro.temperature_duster = temperature_duster_total/forCount;
        svgPro.temperature_asphalt = temperature_asphalt_total/forCount;
        svgPro.temperature_aggregate = temperature_aggregate_total/forCount;

        return JSON.stringify(svgPro);
    }

    //到处Excel
    //打印表格
    var idTmr;

    function getExplorer() {
        var explorer = window.navigator.userAgent;
        //ie
        if(explorer.indexOf("MSIE") >= 0) {
            return 'ie';
        }
        //firefox
        else if(explorer.indexOf("Firefox") >= 0) {
            return 'Firefox';
        }
        //Chrome
        else if(explorer.indexOf("Chrome") >= 0) {
            return 'Chrome';
        }
        //Opera
        else if(explorer.indexOf("Opera") >= 0) {
            return 'Opera';
        }
        //Safari
        else if(explorer.indexOf("Safari") >= 0) {
            return 'Safari';
        }
    }

    function printExcle(tableid) {
        if(getExplorer() == 'ie') {
            var curTbl = document.getElementById(tableid);
            var oXL = new ActiveXObject("Excel.Application");
            var oWB = oXL.Workbooks.Add();
            var xlsheet = oWB.Worksheets(1);
            var sel = document.body.createTextRange();
            sel.moveToElementText(curTbl);
            sel.select();
            sel.execCommand("Copy");
            xlsheet.Paste();
            oXL.Visible = true;

            try {
                var fname = oXL.Application.GetSaveAsFilename("Excel.xls",
                    "Excel Spreadsheets (*.xls), *.xls");
            } catch(e) {
                print("Nested catch caught " + e);
            } finally {
                oWB.SaveAs(fname);
                oWB.Close(savechanges = false);
                oXL.Quit();
                oXL = null;
                idTmr = window.setInterval("Cleanup();", 1);
            }

        } else {
            tableToExcel(tableid)
        }
    }

    function Cleanup() {
        window.clearInterval(idTmr);
        CollectGarbage();
    }
    var tableToExcel = (function() {
        var uri = 'data:application/vnd.ms-excel;base64,',
            template = '<html><head><meta charset="UTF-8"></head><body><table  border="1">{table}</table></body></html>',
            base64 = function(
                s) {
                return window.btoa(unescape(encodeURIComponent(s)))
            },
            format = function(s, c) {
                return s.replace(/{(\w+)}/g, function(m, p) {
                    return c[p];
                })
            }
        return function(table, name) {
            if(!table.nodeType)
                table = document.getElementById(table)
            var ctx = {
                worksheet: name || 'Worksheet',
                table: table.innerHTML
            }
            window.location.href = uri + base64(format(template, ctx))
        }
    })()

    String.prototype.isBlanks = function () {
        var s = $.trim(this);
        if (s == "undefined" || s == null || s == "" || s.length == 0) {
            return true;
        }
        return false;
    };
</script>
</html>