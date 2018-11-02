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
                            <span  >今日${ratioNum}号配比产品平均走势图</span>
                            <a href="qc_dm_data_number.jsp" target="_self">更多
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
                <a href="qc_dm_data_number.jsp" target="_self">更多
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

    </div>

    </div>

    <div style="width: 100%; height: 125%;" ></div>

</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>
</html>
