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
    <title>无标题文档</title>
    <link href="../../static/css/default.css" rel="stylesheet" type="text/css">
    <link href="../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <link type="text/css" rel="stylesheet" href="../../static/slider/css/carousel.css">
    <script src="../../static/js/echarts/echarts.js"></script>
    <script src="../../static/js/echarts/uimaker.js"></script>
</head>

<body>

<div>
    <div>

        <!--top-->
        <div class="div_top">
            <iframe src="../../static/lbt/index.html" id="iframe" name="right" width="100%" height="100%"
                    frameborder="0"
                    scrolling="auto"></iframe>
        </div>

        <div class="wrap">
            <div class="div_left2">
                <ul>
                    <li>
                        <div class="listbox">
                            <i class="iconfont">&#xe64c;</i>
                            <em>25
                                <p>待办事项</p>
                            </em>
                        </div>
                    </li>
                    <li>
                        <div class="listbox">
                            <i class="iconfont">&#xe6f3;</i>
                            <em>16
                                <p>待签公文</p>
                            </em>
                        </div>
                    </li>

                    <li>
                        <div class="listbox">
                            <i class="iconfont">&#xe672;</i>
                            <em>198
                                <p>本月会议</p>
                            </em>
                        </div>
                    </li>
                    <li>
                        <div class="listbox">
                            <i class="iconfont">&#xe70f;</i>
                            <em>10
                                <p>公告信息</p>
                            </em>
                        </div>
                    </li>

                    <li>
                        <div class="listbox">
                            <i class="iconfont">&#xe974;</i>
                            <em>15
                                <p>日程计划</p>
                            </em>
                        </div>
                    </li>
                    <li>
                        <div class="listbox" style="margin-right: 0">
                            <i class="iconfont">&#xe76c;</i>
                            <em>7
                                <p>行业动态</p>
                            </em>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="infolist1">

                <div class="infoboxleft">
                    <div class="boxtitle"><span>党建学习</span><a href="#">更多<i class="iconfont">&#xeba8;</i></a></div>

                    <div class="boxdown">
                        <ul class="textlist">
                            <li style="height: 55px;">
                                <strong><a href="#"></a>习近平向各国共产党赴华参加纪念马克思诞辰200周年专题研讨会致贺信</strong>
                                <a href="#" target="_blank" style="margin-left: 20px">近日，全国政协副主席、党组副书记张庆黎和全国政协副主席、党组成员刘奇葆、夏宝龙分别率专题调研组，分3路赴辽宁、青海、贵州、广西、宁夏、湖北等6省区围绕政协系统党的建设开展专题调研。
                                    调研采取座谈和实地走访相结合的方式进行。调研组深入基层，实地了解市县政协机…</a>
                                <i>11-10</i>
                            </li>

                            <li style="height: 55px;">
                                <strong>
                                    <a href="#"></a>他为扶贫耗尽了心血”——追记江西驻村扶贫干部胡学发</a>
                                </strong>
                                <a href="#" target="_blank" style="margin-left: 20px">“低保户吴正国反映，其本人患癌症，希望给予帮助。由于吴不属于贫困户，不在帮扶范围，但会在合适的时候给予必要的帮助。”“蜜橘生长情况不好，有减产趋势，经向村委班子了解，今年雨水不足，影响了蜜橘生长，虫害也比往年厉害些。”……</a>
                                <i>11-10</i>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>

            <div class="inforight">
                <div class="infoboxright">
                    <div class="boxtitle"><span>行业新闻</span><a href="#">更多<i class="iconfont">&#xeba8;</i></a></div>
                    <ul class="textlist">
                        <li><span></span><a href="#">海口一沥青搅拌站占用林地 秀英检察院督促整改</a><i>11-10</i></li>
                        <li><span></span><a href="#">国道228线石井段“白改黑”工程实验段完成沥青摊铺</a><i>11-09</i></li>
                        <li><span></span><a href="#">預計8月31日機場至吉林方向高速施工提前一個月結束</a><i>11-08</i></li>
                        <li><span></span><a href="#">平赞高速公路微新庄隧道右线顺利贯通</a><i>11-07</i></li>
                        <li><span></span><a href="#">津沧高速公路改造工程计划2018年底正式开建</a><i>11-06</i></li>
                        <li><span></span><a href="#">振奋丨大永高速拟于6月底开工（过大关昭阳永善）！</a><i>11-05</i></li>
                        <li><span></span><a href="#">市交通运输局组织召开绵西高速公路建设推进会</a><i>11-04</i></li>
                        <li><span></span><a href="#">关于征集第四届全国绿色公路技术交流会论文的通知</a><i>11-03</i></li>
                        <li><span></span><a href="#">六盘水：积极推进六枝至安龙高速公路建设</a><i>11-02</i></li>
                    </ul>
                </div>
            </div>

            <div class="pubBox achievement">
                <div class="cont">
                    <ul>
                        <li class="mainPic"><span>玉树援建结古供水厂</span><a href="javascript:void(0);"><img
                                src="../../static/images/test/8.JPG" alt=""></a></li>
                        <li class="smallPic"><span>首都机场收费站</span><a href="javascript:void(0);"><img
                                src="../../static/images/test/2.jpg" alt=""></a></li>
                        <li class="smallPic"><span>张花高速高墩施工</span><a href="javascript:void(0);"><img
                                src="../../static/images/test/3.jpg" alt=""></a></li>

                        <li class="middlePic"><span>郭公庄水厂全景</span><a href="javascript:void(0);"><img
                                src="../../static/images/test/4.jpg" alt=""></a></li>
                        <li class="middlePic"><span>长安街大修</span><a href="javascript:void(0);"><img
                                src="../../static/images/test/5.jpg" alt=""></a></li>
                        <li class="smallPic"><span>地铁4号线动物园站</span><a href="javascript:void(0);"><img
                                src="../../static/images/test/6.jpg" alt=""></a></li>
                        <li class="smallPic"><span>中环广场</span><a href="javascript:void(0);"><img
                                src="../../static/images/test/7.jpg" alt=""></a></li>
                    </ul>
                </div>
            </div>

        </div>

    </div>

</div>

</body>
<!--<script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>-->
<script type="text/javascript" src="../../static/js/jquery.min.js"></script>
<script type="text/javascript" src="../../static/slider/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="../../static/slider/js/jquery.carousel.js"></script>
<script type="text/javascript" src="../../static/js/skin.js"></script>
<script>
</script>


</html>
