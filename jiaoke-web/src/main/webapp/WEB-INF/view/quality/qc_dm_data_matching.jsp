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
</head>

<body style="padding:auto;">


        <c:forEach items="${ratioNumList}" var="ratioNum">

            <div class="infolist1">
                <div class="infoboxleft">
                    <div class="boxtitle">
                        <span>${ratioNum.pro_name}</span>
                        <a href="${path}/getProListByRatioNumAndDate.do?ratioNum=${ratioNum.produce_proportioning_num}&date=${date}&crewNum=${crewNum}" target="_self">更多
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
                            <c:forEach items="${producedList}"  varStatus="status" var="produced">

                                <c:if test="${produced.produce_proportioning_num  ==  ratioNum.produce_proportioning_num}">

                                    <tr>
                                        <td>${produced.produce_disc_num}</td>

                                        <td>${produced.produce_time}</td>

                                        <td>${produced.produce_custom_num}</td>
                                        <td>
                                            <a href="${path}/getProductMessage.do?id=${produced.Id}&crewNum=${crewNum}&proDate=${produced.produce_date}" target="_self" class="selected" >
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

            <c:forEach items="${rationProSVG}" var="producedSVG" varStatus="i">
                <c:if test="${producedSVG.rationNum == ratioNum.produce_proportioning_num}" >
                    <div class="chartbox4">
                        <div class="my_echars_title">
                            <span  >${ratioNum.pro_name}产品平均图</span>
                            <a href="javascript:;" name="${ratioNum.produce_proportioning_num}" id="${ratioNum.pro_name}" class="proSVG" >更多
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
                                toolbox: {
                                    show: true,
                                    feature: {
                                        magicType: {type: ['bar', 'line']},
                                        restore: {},
                                        saveAsImage: {}
                                    }
                                },
                                xAxis: {
                                    type: 'category',
                                    // boundaryGap: false,
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
                                <c:forEach items="${rationMessageList}" var="ration">
                                    <c:if test="${producedSVG.rationNum == ration.crew1ModeleId || producedSVG.rationNum == ration.crew2ModeleId }" >
                                        series: [
                                            {
                                                name:'上限配比',
                                                type:'bar',
                                                data: [     <fmt:formatNumber value="${ration.repertoryOne == '0'? 0:ration.repertoryOne+ 2  }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertoryTwo == '0'? 0:ration.repertoryTwo+ 2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertoryThree == '0'? 0:ration.repertoryThree+ 2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertoryFour == '0'? 0:ration.repertoryFour+ 2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertoryFive == '0'? 0:ration.repertoryFive+ 2  }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertorySix == '0'? 0:ration.repertorySix+ 2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.breeze == '0'? 0:ration.breeze+ 1}" pattern="#.00"/>,
                                                    <fmt:formatNumber value=" ${ration.ratioStone == '0'? 0:ration.ratioStone+ 2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.ratioRegenerate1 + ration.ratioRegenerate2 == '0'? 0:ration.ratioRegenerate1 + ration.ratioRegenerate2+ 2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.ratioAdditive == '0'? 0:ration.ratioAdditive+ 2 }" pattern="#.00"/>]
                                            },
                                            {
                                                name:'实际配比',
                                                type:'bar',
                                                data: [${producedSVG.aggregate_1}, ${producedSVG.aggregate_2}, ${producedSVG.aggregate_3}, ${producedSVG.aggregate_4}, ${producedSVG.aggregate_5}, ${producedSVG.aggregate_6}, ${producedSVG.stone_1 > producedSVG.stone_2 ? producedSVG.stone_1:producedSVG.stone_2 }, ${producedSVG.asphalt}, ${producedSVG.regenerate}, ${producedSVG.additive}]
                                            },
                                            {
                                                name:'下限配比',
                                                type:'bar',
                                                data: [<fmt:formatNumber value="${ration.repertoryOne == '0'? 0:ration.repertoryOne -2}" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertoryTwo == '0'? 0:ration.repertoryTwo -2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertoryThree == '0'? 0:ration.repertoryThree -2}" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertoryFour == '0'? 0:ration.repertoryFour -2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertoryFive == '0'? 0:ration.repertoryFive -2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.repertorySix == '0'? 0:ration.repertorySix -2}" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.breeze == '0'? 0:ration.breeze - 1}" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.ratioStone == '0'? 0:ration.ratioStone - 2 }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.ratioRegenerate1 + ration.ratioRegenerate2 == '0'? 0:ration.ratioRegenerate1 + ration.ratioRegenerate2  - 2  }" pattern="#.00"/>,
                                                    <fmt:formatNumber value="${ration.ratioAdditive == '0'? 0:ration.ratioAdditive - 2  }" pattern="#.00"/>]
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


<%--客户分类--%>
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
                        <th>生产总量(吨)</th>
                        <th>生产时间</th>
                        <th>业主</th>
                        <th>工程名称</th>
                        <th>施工单位</th>
                        <th>操作</th>
                    </thead>

                    <tbody>
                    <c:forEach items="${userProList}" var="userPro" begin="0" end="7" >
                        <tr>
                            <td>${userPro.total}</td>
                            <td>${userPro.startTime}</td>
                            <td>${userPro.clientName}</td>
                            <td>${userPro.projectName}</td>
                            <td>${userPro.constructionUnits}</td>
                            <td>
                                <a href="javascript:void(0)" class="selected" onclick="showMsgByUserAndDate('${userPro.clientNum}','${userPro.produceDate}')">
                                    <i class="toolico iconfont" >&#xe970;</i>查看</a>
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
                            <c:forEach items="${userProTotal}"  var="userPro" varStatus="sta">
                                    <c:choose>
                                        <c:when test="${sta.last}">
                                            '${userPro.clientName}'
                                        </c:when>
                                        <c:otherwise>
                                            '${userPro.clientName}',
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
                                <c:forEach items="${userProTotal}" var="userList" varStatus="stus">
                                    <c:choose>
                                        <c:when test="${sta.last}">
                                            { value:${userList.userTotal}, name:'${userList.clientName}'}
                                        </c:when>
                                        <c:otherwise>
                                            { value:${userList.userTotal}, name:'${userList.clientName}'},
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

        <%--<!--查看模板弹出-->--%>
        <div id="showSVGBrk" class="form_background"  style="display:none;" ></div>
        <div id="showSVG" class="dm_form_model"  style="display:none;" >
            <div id="point">
            <table class="dm_form_table">
                <tbody>

                <tr>
                    <td colspan="4" style="width: 97%;font-size: 24px;padding-bottom: 13px;padding-left: 35%;" id="proNam">
                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">配比编号：</td>
                    <td class="dm_forminput dm_inputstyle" id="rationNum" >

                    </td>
                    <td class="dm_tlabels">产品总数(盘)：</td>
                    <td class="dm_forminput dm_inputstyle" id="procount"  >

                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">骨料1总量(kg)：</td>
                    <td id="aggregate_1" class="dm_forminput dm_inputstyle" >

                    </td>
                    <td class="dm_tlabels">骨料2总量(kg)：</td>
                    <td id="aggregate_2" class="dm_forminput dm_inputstyle" >

                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">骨料3总量(kg)：</td>
                    <td id="aggregate_3" class="dm_forminput dm_inputstyle" >

                    </td>
                    <td class="dm_tlabels">骨料4总量(kg)：</td>
                    <td id="aggregate_4" class="dm_forminput dm_inputstyle" >

                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">骨料5总量(kg)：</td>
                    <td id="aggregate_5" class="dm_forminput dm_inputstyle" >

                    </td>
                    <td class="dm_tlabels">骨料6总量(kg)：</td>
                    <td id="aggregate_6" class="dm_forminput dm_inputstyle" >

                    </td>
                </tr>


                <tr>
                    <td class="dm_tlabels">石粉1总量(kg)：</td>
                    <td id="stone_1" class="dm_forminput dm_inputstyle" >

                    </td>
                    <td class="dm_tlabels">石粉2总量(kg)：</td>
                    <td id="stone_2" class="dm_forminput dm_inputstyle"  >

                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">沥青总量(kg)：</td>
                    <td id="asphalt" class="dm_forminput dm_inputstyle" >

                    </td>
                    <td class="tlabels">再生料总量(kg)：</td>
                    <td id="regenerate" class="dm_forminput dm_inputstyle" >

                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">添加剂总量(kg)：</td>
                    <td id="additive" class="dm_forminput dm_inputstyle" >

                    </td>
                    <td class="tlabels">材料总使用量(kg)：</td>
                    <td id="total" class="dm_forminput dm_inputstyle" >

                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                        <input type="text" disabled="disabled"  style="color: #000;outline: 0;background: #fff;margin-top: 1%;font-size: 18px;margin-bottom: 20px;padding-left: 40%;" style="width: 72%;" value="平均配比信息">
                    </td>
                    <table class="gridtable">
                        <tr>
                            <th>骨料1</th>
                            <th>骨料2</th>
                            <th>骨料3</th>
                            <th>骨料4</th>
                            <th>骨料5</th>
                            <th>骨料6</th>
                            <th>石粉</th>
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
                            <td id="breeze_svg" ><i>%</i></td>
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

                <tr>
                    <td colspan="4">
                        <input type="text" disabled="disabled"  style="color: #000;outline: 0;background: #fff;margin-top: 1%;font-size: 18px;margin-bottom: 20px;padding-left: 15%;" style="width: 72%;" value="模板配比信息">
                    </td>
                    <table class="gridtable">
                        <tr>
                            <th>骨料1</th>
                            <th>骨料2</th>
                            <th>骨料3</th>
                            <th>骨料4</th>
                            <th>骨料5</th>
                            <th>骨料6</th>
                            <th>石粉</th>
                            <th>沥青</th>
                            <th>再生料1</th>
                            <th>再生料2</th>
                            <th>添加剂</th>
                            <th>1仓温度</th>
                            <th>混合料温度</th>
                            <th>沥青温度</th>
                            <th>骨料温度</th>
                        </tr>
                        <tr>
                            <td id="repertoryOne" ><i>%</i></td>
                            <td id="repertoryTwo" ><i>%</i></td>
                            <td id="repertoryThree" ><i>%</i></td>
                            <td id="repertoryFour" ><i>%</i></td>
                            <td id="repertoryFive" ><i>%</i></td>
                            <td id="repertorySix" ><i>%</i></td>
                            <td id="breeze" ><i>%</i></td>
                            <td id="ratioStone" ><i>%</i></td>
                            <td id="ratioRegenerate1" ><i>%</i></td>
                            <td id="ratioRegenerate2" ><i>%</i></td>
                            <td id="ratioAdditive" ><i>%</i></td>
                            <td id="temperatureMilling"><i>℃</i></td>
                            <td id="temperatureMixture" ><i>℃</i></td>
                            <td id="temperatureAsphalt" ><i>℃</i></td>
                            <td id="temperatureAggregate" ><i>℃</i></td>
                        </tr>
                    </table>
                </tr>

                </tbody>
            </table>
            </div>
            <div class="form_btn">
                <input type="submit"  id="btn" onclick="print()" value="打印" class="btn_save">
                <input type="button" id="from_click"  value="关闭" class="btn_cancel">
            </div>

            </form>
        </div>

    <div style="width: 100%; height: 125%;" ></div>

        <div class="div_dataMessage" style="display: none;"  id="promessage" >

            <div class="">
                <div class="">
                    <div class="boxtitle">
                        <span>历史产品数据</span>
                        <a href="#"  onclick="showTwentyProductSVG('1')" >二十盘平均数据<i class="iconfont"></i></a>
                        <a href="#"  onclick="print()" >打印<i class="iconfont"></i></a>
                    </div>

                    <div class="boxdown">
                        <table class="simpletable">

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

                            <tbody id="msg">

                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

        </div>
        <%--js获取路径--%>
        <input id="path" type="hidden" value="${path}"/>
</body>

<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>
<script type="text/javascript" src="/static/js/layer/layer.js"></script>
<script language="javascript" src="/static/js/qc/jquery.jqprint-0.3.js"></script>
<script type="text/javascript">


    $('#from_click').click(function () {
        $('#addSVGBrk,#showSVG').hide();
    });

    //展示选定配比号相关信息
    $(".proSVG").click(function () {
        that_ = this;
        var raionNum = this.name;
        var raionName = this.id;
        //获取当天各模板总数
        var proTotalList = ${produceTotal};
        //获取当天各模板实际配比
        var proSVGList = ${ProSVG};
        //获取当天模板配比
        var modelRaion = ${model};
        $("#proNam").empty();
        $("#proNam").append("今日"+raionName + "生产信息");
        // var objArr = eval("(" + proTotalList + ")");
        for (var i in proTotalList) {
            for (var k in proTotalList[i]){
                if (raionNum == proTotalList[i].rationNum ){
                    $("#" + k).empty();
                    $("#" + k).append(proTotalList[i][k]);
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
        for (var i in modelRaion){
            if (raionName === modelRaion[i].proName ){
                debugger
                for (var y in modelRaion[i]){
                    if (y == 'temperatureAsphalt' || y == 'temperatureAggregate' || y == 'temperatureMixture' ||  y == 'temperatureMilling' ) {
                        var temUp = y + "Up";
                        $("#" + y).html(modelRaion[i][y] + "-" +  modelRaion[i][temUp] + "<i>℃</i>");
                    }else {
                        var num = modelRaion[i][y];
                        $("#" + y).html( num + "<i>%</i>");
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

    //打印相关
    function  print(){
        $("#point").jqprint({
            debug: true, //如果是true则可以显示iframe查看效果（iframe默认高和宽都很小，可以再源码中调大），默认是false
            importCSS: true, //true表示引进原来的页面的css，默认是true。（如果是true，先会找$("link[media=print]")，若没有会去找$("link")中的css文件）
            printContainer: true, //表示如果原来选择的对象必须被纳入打印（注意：设置为false可能会打破你的CSS规则）。
            operaSupport: true//表示如果插件也必须支持歌opera浏览器，在这种情况下，它提供了建立一个临时的打印选项卡。默认是true
        });
    }

    function showMsgByUserAndDate(userNum,proDate) {
        var basePath  = $("#path").val();
        $.ajax({
            url: basePath + "/getMsgByUserAndDate.do",
            dataType:"json",
            data:{
                "userNum":userNum,
                "proDate":proDate
            },
            success:function (res) {
                if (res.message === "success"){

                } else {
                    layer.alert("获取生产信息失败")
                }
            },
            fail:function (res) {
                layer.alert("请求失败")
            }
        })
    }
</script>

</html>
