<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>质量管理</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <script type="text/javascript" src="/static/js/jquery.js"></script>
    <script src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/echarts/uimaker.js"></script>
    <script type="text/javascript" src="/static/js/common.js"></script>
</head>

<body style="padding:15px 8px 400px 8px;overflow-x: hidden;">

<div class="chartbox1">
    <div class="boxtitle"><span>上周产量统计</span></div>
    <div id="chart2" class="charts1"></div>
</div>

<script type="text/javascript">

    function dateArray(proDate,prototal,crew1Array) {

        switch (proDate) {
            case 'Monday':
                crew1Array[0] =prototal;
                break;
            case 'Tuesday':
                crew1Array[1] =prototal;
                break;
            case 'Wednesday':
                crew1Array[2] =prototal;
                break;
            case 'Thursday':
                crew1Array[3] =prototal;
                break;
            case 'Friday':
                crew1Array[4] =prototal;
                break;
            case 'Saturday':
                crew1Array[5] =prototal;
                break;
            case 'Sunday':
                crew1Array[6] =prototal;
                break;
        }

        return crew1Array;
    }
    // 基于准备好的dom，初始化echarts实例
    var myChart1 = echarts.init(document.getElementById('chart2'));

    var url = '${pageContext.request.contextPath}/getLastWeekCrewData.do';

        // 指定图表的配置项和数据
        $.ajax({
            type:'post',
            url:url,
            dataType:'json',
            async: false,
            success:function(result){

                if(result){

                    var crew1Array = new Array(0,0,0,0,0,0,0);
                    var crew2Array = new Array(0,0,0,0,0,0,0);
                    for(var i=0;i<result.length;i++){

                        if (result[i].crewNum == "crew1"){

                            crew1Array = dateArray(result[i].proDate,result[i].prototal,crew1Array);
                        }else {
                            crew2Array = dateArray(result[i].proDate,result[i].prototal,crew2Array);
                        }
                    };
                    // 指定图表的配置项和数据
                    option = {
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                            }
                        },

                        grid: {
                            x: 60,
                            x2: 40,
                            y: 10,
                            height: 200
                        },

                        calculable: true,
                        xAxis: [
                            {
                                type: 'category',
                                data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
                            }
                        ],
                        yAxis: [
                            {
                                type: 'value'
                            }
                        ],
                        series: [
                            {
                                name: '机组一',
                                type: 'bar',
                                itemStyle:{
                                    normal:{
                                        color:'#76EEC6'
                                    }
                                },
                                data: crew1Array
                            },
                            {
                                name: '机组二',
                                type: 'bar',
                                stack: '广告',
                                itemStyle:{
                                    normal:{
                                        color:'#87CEFA'
                                    }
                                },
                                data: crew2Array
                            }

                        ]
                    };
                    myChart1.hideLoading();
                    myChart1.setOption(option);
                }
            },
            error:function(errMsg){
                console.error("加载数据失败")
            }

        })

    // 使用刚指定的配置项和数据显示图表。
        myChart1.setOption(option);
        window.addEventListener("resize", function () {
            myChart1.resize();
        });

</script>

<div class="divbox">

    <div class="boxleft">
        <div class="leftbox">
            <div class="boxtitle"><span>一号机组最近生产情况</span></div>

            <div class="boxdown">
                <table class="simpletable">

                    <thead>
                    <th>产品盘号</th>
                    <th>产品重量</th>
                    <th>生产日期</th>
                    <th>生产时间</th>
                    <th>客户</th>
                    <th>机组</th>
                    <th>操作</th>
                    </thead>

                    <tbody>
                        <c:forEach items="${list}" var ="map" >
                            <c:if test="${map.crew1 eq '机组一'}">
                                <tr>
                                    <td>${map.produce_disc_num}</td>
                                    <td>${map.material_total}</td>
                                    <td>${map.produce_date}</td>
                                    <td>${map.produce_time}</td>
                                    <td>${map.produce_custom_num}</td>
                                    <td>${map.crew1}</td>
                                    <td><a href="${path}/getProductMessage.do?id=${map.Id}&crewNum=crew1" target="_self">查看</a></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>

                </table>
            </div>

        </div>
    </div>

    <div class="boxright">
        <div class="rightbox">
            <div class="boxtitle"><span>二号机组最近生产情况</span></div>

            <div class="boxdown">
                <table class="simpletable">

                    <thead>
                    <th>产品盘号</th>
                    <th>产品重量</th>
                    <th>生产日期</th>
                    <th>生产时间</th>
                    <th>客户</th>
                    <th>机组</th>
                    <th>操作</th>
                    </thead>

                    <tbody>
                    <c:forEach items="${list}" var ="map" >
                        <c:if test="${map.crew1 eq '机组二'}" >
                            <tr>
                                <td>${map.produce_disc_num}</td>
                                <td>${map.material_total}</td>
                                <td>${map.produce_date}</td>
                                <td>${map.produce_time}</td>
                                <td>${map.produce_custom_num}</td>
                                <td>${map.crew1}</td>
                                <td><a href="${path}/getProductMessage.do?id=${map.Id}&crewNum=crew2" target="_self">查看</a></td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>

                </table>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript" >


</script>
</body>
</html>
