<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="utf-8">
<title>生产记录</title>
<link href="/static/css/default.css" rel="stylesheet" type="text/css">
<link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id = 'link'>
<link type="text/css" rel="stylesheet" href="/static/slider/css/carousel.css">
<script src="/static/js/echarts/echarts.js"></script>
<script src="/static/js/echarts/uimaker.js"></script>
</head>

<body style="padding:auto;">


        <c:forEach items="${baseMap.ratioNumList}" var="ratioNum">

            <div class="infolist1">
                <div class="infoboxleft">
                    <div class="boxtitle">
                        <span>${ratioNum}号配比</span>
                        <a href="qc_dm_data_number.jsp" target="_self">更多
                            <i class="iconfont">&#xeba8;</i>
                        </a>
                    </div>

                    <div class="boxdown">
                        <table class="simpletable">

                            <thead>
                            <th>产品盘号</th>
                            <th>生产时间</th>
                            <th>客户名</th>
                            <th>操作</th>
                            </thead>
                            <tbody>
                            <c:forEach items="${baseMap.producedList}"  varStatus="status" var="produced">

                                <c:if test="${produced.produce_proportioning_num  ==  ratioNum}">

                                    <tr>
                                        <td>${produced.produce_disc_num}</td>

                                        <td>${produced.produce_time}</td>

                                        <td>${produced.produce_custom_num}</td>
                                        <td>
                                            <a href="qc_dm_data_detail.jsp" target="_self" class="selected" id="">
                                                <i class="toolico iconfont">&#xe970;</i>查看</a>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <c:forEach items="${baseMap.rationProSVG}" var="producedSVG" varStatus="i">
                <c:if test="${producedSVG.rationNum == ratioNum}" >
                    <div class="chartbox4">
                        <div class="my_echars_title">
                            <span  >${ratioNum}号配比产品平均图</span>
                            <a href="javascript:;" name="${ratioNum}" class="proSVG" >更多
                                <i class="iconfont">&#xeba8;</i>
                            </a>
                        </div>
                        <div id="chart${i.count}" class="charts"></div>

                        <script type="text/javascript">
                            var myChart${i.count} = echarts.init(document.getElementById('chart${i.count}'));
                            // 指定图表的配置项和数据
                            var colors = ['#5793f3', '#d14a61', '#675bba'];
                            var option${i.count} =  {
                                tooltip: {
                                    trigger: 'axis'
                                },
                                legend: {
                                    data:['上限配比','实际配比','下限配比']
                                },
                                grid: {
                                    left: '3%',
                                    right: '4%',
                                    bottom: '3%',
                                    containLabel: true
                                },
                                toolbox: {
                                    feature: {
                                        saveAsImage: {}
                                    }
                                },
                                xAxis: {
                                    type: 'category',
                                    boundaryGap: false,
                                    data:  ['骨料1', '骨料2', '骨料3', '骨料4', '骨料5', '骨料6', '石粉', '沥青', '再生料', '添加剂']
                                },
                                yAxis: {
                                    type: 'value'
                                },
                                grid: {
                                    left: '3%',
                                    right: '4%',
                                    bottom: '3%',
                                    containLabel: true
                                },
                                yAxis: {
                                    type: 'log',
                                    name: 'y'
                                },
                                <c:forEach items="${baseMap.rationMessageList}" var="ration">
                                    <c:if test="${producedSVG.rationNum == ration.crew1ModeleId || producedSVG.rationNum == ration.crew2ModeleId }" >
                                        series: [
                                            {
                                                name:'上线配比',
                                                type:'line',
                                                data: [     <fmt:formatNumber value="${ration.repertoryOne + 2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertoryTwo + 2}" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertoryThree +2}" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertoryFour + 2}" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertoryFive + 2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertorySix + 2}" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.breeze + 1}" pattern="#.00"/>,
                                                    <fmt:formatNumber value=" ${ration.ratioStone + 2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.ratioRegenerate1 > ration.ratioRegenerate2 ? ration.ratioRegenerate1+ 2 :ration.ratioRegenerate2+ 2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.ratioAdditive + 2 }" pattern="#.00"/>]
                                            },
                                            {
                                                name:'实际配比',
                                                type:'line',
                                                data: [${producedSVG.aggregate_1}, ${producedSVG.aggregate_2}, ${producedSVG.aggregate_3}, ${producedSVG.aggregate_4}, ${producedSVG.aggregate_5}, ${producedSVG.aggregate_6}, ${producedSVG.stone_1 > producedSVG.stone_2 ? producedSVG.stone_1:producedSVG.stone_2 }, ${producedSVG.asphalt}, ${producedSVG.regenerate}, ${producedSVG.additive}]
                                            },
                                            {
                                                name:'下限配比',
                                                type:'line',
                                                data: [     <fmt:formatNumber value="${ration.repertoryOne - 2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertoryTwo - 2}" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertoryThree -2}" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertoryFour - 2}" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertoryFive - 2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertorySix - 2}" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.breeze - 1}" pattern="#.00"/>,
                                                    <fmt:formatNumber value=" ${ration.ratioStone - 2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.ratioRegenerate1 > ration.ratioRegenerate2 ? ration.ratioRegenerate1 - 2 :ration.ratioRegenerate2 - 2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.ratioAdditive - 2 }" pattern="#.00"/>]
                                            }]
                                    </c:if>

                                </c:forEach>
                            };

                            myChart${i.count}.setOption(option${i.count});
                            window.addEventListener("resize", function () {
                                myChart${i.count}.resize();
                            });
                        </script>

                    </div>
                </c:if>
            </c:forEach>

        </c:forEach>



    <div class="infolist1">

        <div class="infoboxleft">
            <div class="boxtitle">
                <span>客户分类产品统计</span>
                <%--qc_dm_data_number.jsp--%>
                <a href="javascript:;" target="_self">更多
                    <i class="iconfont">&#xeba8;</i>
                </a>
            </div>

            <div class="boxdown">
                <table class="simpletable">

                    <thead>
                        <th>模板号</th>
                        <th>总盘数</th>
                        <th>生产时间</th>
                        <th>客户名</th>
                        <th>操作</th>
                    </thead>

                    <tbody>
                    <c:forEach items="${baseMap.userProList}" var="userPro" begin="0" end="7" >
                        <tr>
                            <td>${userPro.rationNum}</td>
                            <td>${userPro.total}</td>
                            <td>${userPro.startTime}</td>
                            <td>${userPro.userName}</td>
                            <td>
                                <a href="#" class="selected" id="">
                                    <i class="toolico iconfont">&#xe970;</i>查看</a>
                            </td>
                        </tr>
                    </c:forEach>


                    </tbody>

                </table>
            </div>

        </div>
    </div>

    <div class="chartbox4">
        <div class="my_echars_title">
            <span>当日客户产量占比图</span>
        </div>
        <div id="chart500" class="charts"></div>

        <script type="text/javascript">
            var myChart500 = echarts.init(document.getElementById('chart500'));
            // 指定图表的配置项和数据
            var colors = ['#5793f3', '#d14a61', '#675bba'];
            var option500 =  {
                    title: {
                        text: '',
                        subtext: '',
                        x: 'center'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data: [
                            <c:forEach items="${baseMap.userProTotal}"  var="userPro" varStatus="sta">
                                    <c:choose>
                                        <c:when test="${sta.last}">
                                            '${userPro.userName}'
                                        </c:when>
                                        <c:otherwise>
                                            '${userPro.userName}',
                                        </c:otherwise>
                                    </c:choose>
                            </c:forEach>
                        ]},
                    series: [
                        {
                            name: '占比总量',
                            type: 'pie',
                            radius: '55%',
                            center: ['50%', '60%'],
                            data: [
                                <c:forEach items="${baseMap.userProTotal}" var="userList" varStatus="stus">
                                    <c:choose>
                                        <c:when test="${sta.last}">
                                            { value:${userList.userTotal}, name:'${userList.userName}'}
                                        </c:when>
                                        <c:otherwise>
                                            { value:${userList.userTotal}, name:'${userList.userName}'},
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            ],
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };
            myChart500.setOption(option500);
            window.addEventListener("resize", function () {
                myChart500.resize();
            });
        </script>

        <!--查看模板弹出-->
        <div id="showSVGBrk" class="form_background"  style="display:none;" ></div>
        <div id="showSVG" class="dm_form_model" style="display:none;" >
            <table class="dm_form_table">
                <tbody>

                <tr>
                    <td colspan="4">
                        <input type="text" id="proNam" disabled="disabled"  style="width: 97%;font-size: 24px;padding-bottom: 13px;padding-left: 30%;" class="dm_forminput dm_inputstyle" style="width: 72%;" value="">
                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">配比编号：</td>
                    <td>
                        <input type="number" disabled="disabled" id="rationNum" class="dm_forminput dm_inputstyle" value="3">
                    </td>
                    <td class="dm_tlabels">产品总数(盘)：</td>
                    <td>
                        <input type="number" id="procount" class="dm_forminput dm_inputstyle" value="5">
                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">骨料1总量(kg)：</td>
                    <td>
                        <input type="number"  disabled="disabled" id="aggregate_1" class="dm_forminput dm_inputstyle" value="17">
                    </td>
                    <td class="dm_tlabels">骨料2总量(kg)：</td>
                    <td>
                        <input type="number" disabled="disabled" id="aggregate_2" class="dm_forminput dm_inputstyle" value="35">
                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">骨料3总量(kg)：</td>
                    <td>
                        <input type="number" disabled="disabled" id="aggregate_3" class="dm_forminput dm_inputstyle" value="75">
                    </td>
                    <td class="dm_tlabels">骨料4总量(kg)：</td>
                    <td>
                        <input type="number" disabled="disabled"  id="aggregate_4" class="dm_forminput dm_inputstyle" value="85">
                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">骨料5总量(kg)：</td>
                    <td>
                        <input type="number" disabled="disabled" id="aggregate_5" class="dm_forminput dm_inputstyle" value="5">
                    </td>
                    <td class="dm_tlabels">骨料6总量(kg)：</td>
                    <td>
                        <input type="number" disabled="disabled" id="aggregate_6" class="dm_forminput dm_inputstyle" value="1">
                    </td>
                </tr>


                <tr>
                    <td class="dm_tlabels">石粉1总量(kg)：</td>
                    <td>
                        <input type="number" disabled="disabled" id="stone_1" class="dm_forminput dm_inputstyle" value="157">
                    </td>
                    <td class="dm_tlabels">石粉2总量(kg)：</td>
                    <td>
                        <input type="number" disabled="disabled" id="stone_2"  class="dm_forminput dm_inputstyle" value="152">
                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">沥青总量(kg)：</td>
                    <td>
                        <input type="number" disabled="disabled" id="asphalt" class="dm_forminput dm_inputstyle" value="52">
                    </td>
                    <td class="tlabels">再生料总量(kg)：</td>
                    <td>
                        <input type="number" disabled="disabled" id="regenerate" class="dm_forminput dm_inputstyle" value="37">
                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">添加剂总量(kg)：</td>
                    <td>
                        <input type="number" disabled="disabled" id="additive" class="dm_forminput dm_inputstyle" value="52">
                    </td>
                    <td class="tlabels">材料总使用量(kg)：</td>
                    <td>
                        <input type="number" disabled="disabled" id="total" class="dm_forminput dm_inputstyle" value="37">
                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                        <input type="text" disabled="disabled"  style="color: #000;outline: 0;background: #fff;padding-top: 1%;font-size: 18px;padding-bottom: 9px;padding-left: 35%;" style="width: 72%;" value="平均配比信息">
                    </td>
                    <table class="gridtable">
                        <tr>
                            <th>骨料1</th>
                            <th>骨料2</th>
                            <th>骨料3</th>
                            <th>骨料4</th>
                            <th>骨料5</th>
                            <th>骨料6</th>
                            <th>石粉1</th>
                            <th>石粉2</th>
                            <th>沥青</th>
                            <th>再生料</th>
                            <th>添加剂</th>
                            <th>1仓温度</th>
                            <th>混合料温度</th>
                            <th>除尘器入口温度</th>
                            <th>沥青温度</th>
                            <th>骨料温度</th>
                        </tr>
                        <tr>
                            <td id="aggregate_1_svg" ><i>%</i></td>
                            <td id="aggregate_2_svg" ><i>%</i></td>
                            <td id="aggregate_3_svg" ><i>%</i></td>
                            <td id="aggregate_4_svg" ><i>%</i></td>
                            <td id="aggregate_5_svg" ><i>%</i></td>
                            <td id="aggregate_6_svg" ><i>%</i></td>
                            <td id="stone_1_svg" ><i>%</i></td>
                            <td id="stone_2_svg" ><i>%</i></td>
                            <td id="asphalt_svg" ><i>%</i></td>
                            <td id="regenerate_svg" ><i>%</i></td>
                            <td id="additive_svg" ><i>%</i></td>
                            <td id="warehouse_1_svg"><i>℃</i></td>
                            <td id="mixture_svg" ><i>℃</i></td>
                            <td id="duster_svg" ><i>℃</i></td>
                            <td id="temAsphalt_svg" ><i>℃</i></td>
                            <td id="aggregate_svg" ><i>℃</i></td>
                        </tr>
                    </table>
                </tr>


                </tbody>

            </table>

            <div class="form_btn">
                <input type="submit"  id="btn"  value="打印" class="btn_save">
                <input type="button" id="from_click"  value="关闭" class="btn_cancel">
            </div>

            </form>
        </div>

    <div style="width: 100%; height: 125%;" ></div>

</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>

<script type="text/javascript">


    $('#from_click').click(function () {
        $('#addSVGBrk,#showSVG').hide();
    });

    //展示选定配比号相关信息
    $(".proSVG").click(function () {
        that_ = this;
        var raionNum = this.name;
        //获取当天各模板总数
        var proTotalList = ${baseMap.produceTotal};
        //获取当天各模板实际配比
        var proSVGList = ${baseMap.ProSVG};
        $("#proNam").val("今日"+raionNum + "号配比生产信息");
        // var objArr = eval("(" + proTotalList + ")");
        for (var i in proTotalList) {
            for (var k in proTotalList[i]){
                if (raionNum == proTotalList[i].rationNum ){
                    $("#" + k).val(proTotalList[i][k]);
                }
            }
        }

        for(var i in proSVGList){
            if (raionNum == proSVGList[i].rationNum ){
                for (var y in proSVGList[i]) {
                    if ( y == 'warehouse_1' || y == 'mixture' || y == 'duster' || y == 'temAsphalt' || y == 'aggregate'){
                        $("#" + y + "_svg").html(proSVGList[i][y] + "<i>℃</i>");
                    }else {
                        $("#" + y + "_svg").html(proSVGList[i][y] + "<i>%</i>");
                    }

                }
            }
        }
        $('#addSVGBrk,#showSVG').show();
    })

    //点击查看模板
    function closeShowRatio() {
        $('#showRatioBrk,#showRatio').hide();
    }

</script>

</html>
