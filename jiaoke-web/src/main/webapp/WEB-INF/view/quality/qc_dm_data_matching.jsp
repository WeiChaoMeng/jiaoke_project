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
                            <span  >${ratioNum.pro_name}产品级配图</span>
                            <a href="javascript:;" name="${ratioNum.produce_proportioning_num}" id="${ratioNum.pro_name}" class="proSVG" >更多
                                <i class="iconfont">&#xeba8;</i>
                            </a>
                        </div>
                        <div id="chart${ratioNum.produce_proportioning_num}" class="charts"></div>

                        <script type="text/javascript">

                        </script>



                    </div>
                </c:if>
            </c:forEach>

        </c:forEach>


<%--客户分类--%>
    <div class="infolist1">

        <div class="infoboxleft">
            <div class="boxtitle">
                <span>工程分类产品统计</span>
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
                                <a href="javascript:void(0)" class="selected" onclick="showMsgByUserAndDate('${userPro.projectName}','${userPro.produceDate}')">
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
            <span>当日工程产量占比图</span>
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
                    <%--legend: {--%>
                        <%--orient: 'vertical',--%>
                        <%--// left: 'left',--%>
                        <%--data: [--%>
                            <%--<c:forEach items="${userProTotal}"  var="userPro" varStatus="sta">--%>
                                    <%--<c:choose>--%>
                                        <%--<c:when test="${sta.last}">--%>
                                            <%--'${userPro.projectName == null? "未查询到工程":userPro.projectName}'--%>
                                        <%--</c:when>--%>
                                        <%--<c:otherwise>--%>
                                            <%--'${userPro.projectName == null? "未查询到工程":userPro.projectName}',--%>
                                        <%--</c:otherwise>--%>
                                    <%--</c:choose>--%>
                            <%--</c:forEach>--%>
                        <%--]},--%>
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
                                            { value:${userList.userTotal}, name:'${userList.projectName == null? "未查询到工程":userList.projectName}'}
                                        </c:when>
                                        <c:otherwise>
                                            { value:${userList.userTotal}, name:'${userList.projectName == null? "未查询到工程":userList.projectName}'},
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
            <div id="point" style="width: 100%">
                <table class="dm_form_table">
                <tbody>

                <tr>
                    <td colspan="4" style="width: 97%;font-size: 24px;padding-bottom: 13px;padding-left: 35%;" id="proNam">
                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">产品总数(盘)：</td>
                    <td class="dm_forminput dm_inputstyle" id="procount"  >

                    </td>
                    <td class="tlabels">材料总使用量(吨)：</td>
                    <td id="total" class="dm_forminput dm_inputstyle" >

                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">骨料1总量(吨)：</td>
                    <td id="aggregate_1" class="dm_forminput dm_inputstyle" >

                    </td>
                    <td class="dm_tlabels">骨料2总量(吨)：</td>
                    <td id="aggregate_2" class="dm_forminput dm_inputstyle" >

                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">骨料3总量(吨)：</td>
                    <td id="aggregate_3" class="dm_forminput dm_inputstyle" >

                    </td>
                    <td class="dm_tlabels">骨料4总量(吨)：</td>
                    <td id="aggregate_4" class="dm_forminput dm_inputstyle" >

                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">骨料5总量(吨)：</td>
                    <td id="aggregate_5" class="dm_forminput dm_inputstyle" >

                    </td>
                    <td class="dm_tlabels">骨料6总量(吨)：</td>
                    <td id="aggregate_6" class="dm_forminput dm_inputstyle" >

                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">骨料7总量(吨)：</td>
                    <td id="aggregate_7" class="dm_forminput dm_inputstyle" >
                    </td>
                    <td class="dm_tlabels">骨料8总量(吨)：</td>
                    <td id="aggregate_8" class="dm_forminput dm_inputstyle" >

                    </td>
                </tr>


                <tr>
                    <td class="dm_tlabels">骨料9总量(吨)：</td>
                    <td id="aggregate_9" class="dm_forminput dm_inputstyle" >

                    </td>
                    <td class="dm_tlabels">骨料10总量(吨)：</td>
                    <td id="aggregate_10" class="dm_forminput dm_inputstyle" >

                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">石粉1总量(吨)：</td>
                    <td id="stone_1" class="dm_forminput dm_inputstyle" >

                    </td>
                    <td class="dm_tlabels">石粉2总量(吨)：</td>
                    <td id="stone_2" class="dm_forminput dm_inputstyle"  >

                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">石粉3总量(吨)：</td>
                    <td id="stone_3" class="dm_forminput dm_inputstyle" >
                    </td>
                    <td class="dm_tlabels">石粉4总量(吨)：</td>
                    <td id="stone_4" class="dm_forminput dm_inputstyle"  >
                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">沥青总量(吨)：</td>
                    <td id="asphalt" class="dm_forminput dm_inputstyle" >

                    </td>
                    <td class="tlabels">再生料总量(吨)：</td>
                    <td id="regenerate" class="dm_forminput dm_inputstyle" >

                    </td>
                </tr>

                <tr>
                    <td class="dm_tlabels">添加剂1总量(吨)：</td>
                    <td id="additive" class="dm_forminput dm_inputstyle" >

                    </td>
                    <td class="dm_tlabels">添加剂2总量(吨)：</td>
                    <td id="additive1" class="dm_forminput dm_inputstyle" >

                    </td>
                </tr>
                <tr>
                    <td class="dm_tlabels">添加剂3总量(吨)：</td>
                    <td id="additive2" class="dm_forminput dm_inputstyle" >

                    </td>
                    <td class="dm_tlabels">添加剂4总量(吨)：</td>
                    <td id="additive3" class="dm_forminput dm_inputstyle" >

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
                            <th>骨料7</th>
                            <th>骨料8</th>
                            <th>骨料9</th>
                            <th>骨料10</th>
                            <th>混合料温度</th>
                            <th>除尘器入口温度</th>
                        </tr>
                        <tr>
                            <td id="aggregate_1_svg" ><i>%</i></td>
                            <td id="aggregate_2_svg" ><i>%</i></td>
                            <td id="aggregate_3_svg" ><i>%</i></td>
                            <td id="aggregate_4_svg" ><i>%</i></td>
                            <td id="aggregate_5_svg" ><i>%</i></td>
                            <td id="aggregate_6_svg" ><i>%</i></td>
                            <td id="aggregate_7_svg" ><i>%</i></td>
                            <td id="aggregate_8_svg" ><i>%</i></td>
                            <td id="aggregate_9_svg" ><i>%</i></td>
                            <td id="aggregate_10_svg" ><i>%</i></td>
                            <td id="mixture_svg" ><i>℃</i></td>
                            <td id="duster_svg" ><i>℃</i></td>
                        </tr>
                    </table>
                    <table class="gridtable">
                        <tr>
                            <th>石粉1</th>
                            <th>石粉2</th>
                            <th>石粉3</th>
                            <th>石粉4</th>
                            <th>沥青</th>
                            <th>再生料</th>
                            <th>添加剂1</th>
                            <th>添加剂2</th>
                            <th>添加剂3</th>
                            <th>添加剂4</th>
                            <th>沥青温度</th>
                            <th>骨料温度</th>
                        </tr>
                        <tr>
                            <td id="stone_1_svg" ><i>%</i></td>
                            <td id="stone_2_svg" ><i>%</i></td>
                            <td id="stone_3_svg" ><i>%</i></td>
                            <td id="stone_4_svg" ><i>%</i></td>
                            <td id="asphalt_svg" ><i>%</i></td>
                            <td id="regenerate_svg" ><i>%</i></td>
                            <td id="additive_svg" ><i>%</i></td>
                            <td id="additive1_svg" ><i>%</i></td>
                            <td id="additive2_svg" ><i>%</i></td>
                            <td id="additive3_svg" ><i>%</i></td>
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
                            <th>骨料7</th>
                            <th>骨料8</th>
                            <th>骨料9</th>
                            <th>骨料10</th>
                            <th>混合料温度</th>
                            <th>除尘器温度</th>
                        </tr>
                        <tr>
                            <td id="repertoryOne" ><i>%</i></td>
                            <td id="repertoryTwo" ><i>%</i></td>
                            <td id="repertoryThree" ><i>%</i></td>
                            <td id="repertoryFour" ><i>%</i></td>
                            <td id="repertoryFive" ><i>%</i></td>
                            <td id="repertorySix" ><i>%</i></td>
                            <td id="repertorySeven" ><i>%</i></td>
                            <td id="repertoryEight" ><i>%</i></td>
                            <td id="repertoryNine" ><i>%</i></td>
                            <td id="repertoryTen" ><i>%</i></td>
                            <td id="temperatureMilling"><i>℃</i></td>
                            <td id="temperatureMixture" ><i>℃</i></td>
                        </tr>
                    </table>
                    <table class="gridtable">
                        <tr>
                            <th>石粉1</th>
                            <th>石粉2</th>
                            <th>石粉3</th>
                            <th>石粉4</th>
                            <th>沥青</th>
                            <th>再生料1</th>
                            <th>再生料2</th>
                            <th>再生料3</th>
                            <th>添加剂1</th>
                            <th>添加剂2</th>
                            <th>添加剂3</th>
                            <th>添加剂4</th>
                            <th>沥青温度</th>
                            <th>骨料温度</th>
                        </tr>
                        <tr>
                            <td id="breeze" ><i>%</i></td>
                            <td id="breezeTwo" ><i>%</i></td>
                            <td id="breezeThree" ><i>%</i></td>
                            <td id="breezeFour" ><i>%</i></td>
                            <td id="ratioStone" ><i>%</i></td>
                            <td id="ratioRegenerate1" ><i>%</i></td>
                            <td id="ratioRegenerate2" ><i>%</i></td>
                            <td id="ratioRegenerate3" ><i>%</i></td>
                            <td id="ratioAdditive" ><i>%</i></td>
                            <td id="ratioAdditiveTwo" ><i>%</i></td>
                            <td id="ratioAdditiveThree" ><i>%</i></td>
                            <td id="ratioAdditiveFour" ><i>%</i></td>
                            <td id="temperatureAsphalt" ><i>℃</i></td>
                            <td id="temperatureAggregate" ><i>℃</i></td>
                        </tr>
                    </table>
                </tr>

                </tbody>
            </table>
                <div style="height: 300px;width: 100%;margin-top: 20px;" id="svgDiv" >
                    <img src="" id="printImg" style="height: 250px;display: none;" />
                    <div id="svgChart" style="height: 250px;"></div>
                </div>
            </div>
            <div class="form_btn">
                <input type="submit"  id="btn" onclick="print()" value="打印" class="btn_save">
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
    $(function(){
        showGradingChears();
    });

    $('#from_click').click(function () {
        $('#addSVGBrk,#showSVG').hide();
    });

    //展示选定配比号相关信息
    $(".proSVG").click(function () {
        $("#printImg").hide();
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
                if (raionNum == proTotalList[i].rationNum){
                    $("#" + k).empty();
                    if (k === 'rationNum' || k === 'procount' ){
                        $("#" + k).append(proTotalList[i][k]);
                    }else {
                        $("#" + k).append((Number(proTotalList[i][k])/1000).toFixed(2));
                    }

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
        //平均级配曲线图展示
        var gradingList = ${gradingMap};
        for (var i = 0;i < gradingList.length;i++){
            if (gradingList[i][raionNum]){
                    $("#svgChart").width($(document.body).width()*0.75);
                    $("#printImg").width($(document.body).width()*0.75);
                    var arr = returnJsonArray(gradingList[i][raionNum]['moudleList']);
                    var temArray  = returnArrayToJson(gradingList[i][raionNum]['moudleList']);

                    var myChart= echarts.init(document.getElementById('svgChart'),'light');
                    // 指定图表的配置项和数据
                    var colors = ['#5793f3', '#d14a61', '#675bba'];
                    var option= {
                        title: {
                            text: '平均级配曲线图',
                            x: 'left',
                            textStyle:{
                                color:'#685489',
                                fontSize: 16
                            },
                            padding: [25,0,0,40]
                        },
                        animation:false,
                        legend: {
                            data:['合成级配','实际级配','上限','中值','下限'],
                            x:'right',
                            orient:'vertical',
                            itemGap:20,
                            top:'25%',
                            left:'85%',
                        },
                        grid:{
                            left: '10%',
                            bottom: '3%',
                            containLabel: true
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
                            // name: '筛孔',
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
                                show: false//不显示
                                // rotate:90
                            },
                            axisTick: { //轴刻度
                                show: false //不显示
                            },
                            axisLine: { //轴线
                                lineStyle: { //样式
                                    color: '#000' //颜色
                                }
                            },
                            // axisLabel:{
                            //     interval: 0,
                            //     formatter: function (value) {
                            //         //x轴的文字改为竖版显示
                            //         var str = value.split("");
                            //         return str.join("\n");
                            //     }
                            // }
                        },
                        yAxis: {
                            type: 'value',
                            // name: '占比 %',
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
                                        rotate:90,
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
                                lineStyle: {
                                    normal: {
                                        type: 'solid',
                                        width:0.6,
                                        color: '#96ceb4'
                                    }
                                },
                                data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                            },
                            {
                                id: 'b',
                                type: 'line',
                                name:'实际级配',
                                symbolSize:6,
                                lineStyle: {
                                    normal: {
                                        type: 'solid',
                                        color: '#23c6c8'
                                    }
                                },
                                data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                            },
                            {
                                id: 'c',
                                type: 'line',
                                name:'上限',
                                symbolSize:6,
                                lineStyle: {
                                    normal: {
                                        type: 'solid',
                                        color: '#ed5565'
                                    }
                                },
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
                                lineStyle: {
                                    normal: {
                                        type: 'solid',
                                        color: '#ed5565'
                                    }
                                },
                                data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                            }
                        ]
                    };
                    if(arr){
                        option.xAxis.max = arr[arr.length - 1][0];
                    }

                    option.series[0].markLine.data = temArray;
                    option.series[1].data = returnJsonArray(gradingList[i][raionNum]['moudleList']);
                    option.series[2].data = returnJsonArray(gradingList[i][raionNum]['realList']);
                    option.series[3].data = returnJsonArray(gradingList[i][raionNum]['upList']);
                    option.series[4].data = returnJsonArray(gradingList[i][raionNum]['midList']);
                    option.series[5].data = returnJsonArray(gradingList[i][raionNum]['downList']);
                    myChart.setOption(option,'light');
                    window.addEventListener("resize", function () {
                        myChart.resize();
                    });

                // 把echarts图片转成64编码的图片
                var img = new Image();
                var imgSrc = myChart.getDataURL();
                $("#printImg").attr("src", imgSrc);
            }
        }
        layer.open({
            type: 1,
            area: ['85%', '95%'], //宽高
            content: $("#showSVG")
        });
        // $('#addSVGBrk,#showSVG').show();
    })

    //点击查看模板
    function closeShowRatio() {
        $('#showRatioBrk,#showRatio').hide();
    }

    //打印相关
    function  print(){
        // 渲染到图表上面展示
        $("#printImg").show();
        //这里要使用延时加载，才不会在图片还没渲染出来的时候就调用打印的方法
        setTimeout(function() {
            $("#point").jqprint({
                debug: true, //如果是true则可以显示iframe查看效果（iframe默认高和宽都很小，可以再源码中调大），默认是false
                importCSS: true, //true表示引进原来的页面的css，默认是true。（如果是true，先会找$("link[media=print]")，若没有会去找$("link")中的css文件）
                printContainer: true, //表示如果原来选择的对象必须被纳入打印（注意：设置为false可能会打破你的CSS规则）。
                operaSupport: true//表示如果插件也必须支持歌opera浏览器，在这种情况下，它提供了建立一个临时的打印选项卡。默认是true
            });
        },1000);
    }

    function showMsgByUserAndDate(userNum,proDate) {
        var basePath  = $("#path").val();
        $.ajax({
            url: basePath + "/getMsgByUserAndDate.do",
            type:"post",
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
    //展示级配图
    function showGradingChears() {
        var rationList = ${ProSVG};
        var gradingList = ${gradingMap};
        debugger
        for (var i = 0;i < rationList.length;i++){
            var ration = rationList[i].rationNum;
            for (var j = 0;j < gradingList.length;j++){
                    if (gradingList[j][ration]){
                        var myChart = "chart" + ration;
                        var chart  = echarts.init(document.getElementById(myChart));
                        // 指定图表的配置项和数据
                        var colors = ['#5793f3', '#d14a61', '#675bba'];
                        var option= {
                            legend: {
                                data:['合成级配','实际级配','上限','中值','下限'],
                                x:'left',
                                left:'8%'
                            },
                            grid:{
                                left: '3.7%',
                                right: '3.7%',
                                bottom: '3%',
                                containLabel: true
                            },
                            tooltip: {
                                trigger: 'axis',
                                formatter: function(params, ticket, callback) {
                                    return '筛孔:' + returnX(params[0].value[0]) + '的通过率<br/>'
                                        +params[0].marker  + params[0].seriesName + ' :  ' + (params[0].value[1]).toFixed(1)+'%<br/>'
                                        +params[1].marker  + params[1].seriesName+':  '+(params[1].value[1]).toFixed(1)+'%<br/>'
                                        +params[2].marker  + params[2].seriesName+':  '+(params[2].value[1]).toFixed(1)+'%<br/>'
                                        +params[3].marker  + params[3].seriesName+':  '+(params[3].value[1]).toFixed(1)+'%<br/>'
                                        +params[4].marker  + params[4].seriesName+':  '+(params[4].value[1]).toFixed(1)+'%<br/>';
                                }
                            },
                            xAxis: {
                                type: 'value',
                                // name: '筛孔',
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
                                    show: false//不显示
                                    // rotate:90
                                },
                                axisTick: { //轴刻度
                                    show: false //不显示
                                },
                                axisLine: { //轴线
                                    lineStyle: { //样式
                                        color: '#000' //颜色
                                    }
                                },
                                // axisLabel:{
                                //     interval: 0,
                                //     formatter: function (value) {
                                //         //x轴的文字改为竖版显示
                                //         var str = value.split("");
                                //         return str.join("\n");
                                //     }
                                // }
                            },
                            yAxis: {
                                type: 'value',
                                // name: '占比 %',
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
                                            rotate:90,
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
                                    lineStyle: {
                                        normal: {
                                            type: 'solid',
                                            width:0.6,
                                            color: '#96ceb4'
                                        }
                                    },
                                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                                },
                                {
                                    id: 'b',
                                    type: 'line',
                                    name:'实际级配',
                                    symbolSize:6,
                                    lineStyle: {
                                        normal: {
                                            type: 'solid',
                                            color: '#23c6c8'
                                        }
                                    },
                                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                                },
                                {
                                    id: 'c',
                                    type: 'line',
                                    name:'上限',
                                    symbolSize:6,
                                    lineStyle: {
                                        normal: {
                                            type: 'solid',
                                            color: '#ed5565'
                                        }
                                    },
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
                                    lineStyle: {
                                        normal: {
                                            type: 'solid',
                                            color: '#ed5565'
                                        }
                                    },
                                    data: [[0.1, 0], [-50, 10], [-56.5, 20], [-46.5, 30], [-22.1, 40]]
                                }
                            ]
                        };

                        var arr = returnJsonArray(gradingList[j][ration]['moudleList']);
                        var temArray  = returnArrayToJson(gradingList[j][ration]['moudleList']);

                        if(arr.length > 0){
                            option.xAxis.max = arr[arr.length - 1][0];
                        }
                        option.series[0].markLine.data = temArray;
                        option.series[1].data = returnJsonArray(gradingList[j][ration]['moudleList']);
                        option.series[2].data = returnJsonArray(gradingList[j][ration]['realList']);
                        option.series[3].data = returnJsonArray(gradingList[j][ration]['upList']);
                        option.series[4].data = returnJsonArray(gradingList[j][ration]['midList']);
                        option.series[5].data = returnJsonArray(gradingList[j][ration]['downList']);
                        chart.setOption(option);
                        window.addEventListener("resize", function () {
                            chart.resize();
                        });

                    }
            }
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
