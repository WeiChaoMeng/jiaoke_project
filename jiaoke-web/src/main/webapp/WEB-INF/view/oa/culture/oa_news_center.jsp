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
    <title>新闻中心</title>
    <link href="../../../../static/css/oa/oa_common.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
</head>

<body style="padding:15px 8px 0px 8px;">

<table width="100%" height="100%">
    <tbody>
    <tr class="news_headlines_color">
        <td width="50%">
            <table width="100%" height="100%">
                <tbody>
                <tr>
                    <td class="news_headlines_left">
                        <span class="news_headlines_left_content">新闻中心</span>
                    </td>
                </tr>
                </tbody>
            </table>
        </td>

        <td width="50%">
            <div class="news_headlines_right">

                <!--标题-->
                <div id="div2" class="head_right_side_input news_title">
                    <input type="text">
                </div>

                <!--发布人-->
                <div id="div3" class="head_right_side_input news_publisher">
                    <input type="text">
                </div>

                <!--发布部门-->
                <div id="div4" class="head_right_side_input news_department">
                    <input type="text">
                </div>

                <!--关键字-->
                <div id="div5" class="head_right_side_input news_keywords">
                    <input type="text">
                </div>

                <!--摘要-->
                <div id="div6" class="head_right_side_input news_summary">
                    <input type="text">
                </div>

                <!--条件查询-->
                <div id="div1" class="head_right_side">
                    <select id="condition4">
                        <option value="0">- -查询条件- -</option>
                        <option value="1">标题</option>
                        <option value="2">发布人</option>
                        <option value="3">发布部门</option>
                        <option value="4">关键字</option>
                        <option value="5">摘要</option>
                    </select>
                </div>
            </div>
        </td>

    </tr>
    <tr>
        <td colspan="2">
            <div style="width: 100%">
                <div>
                    <div class="unit_news_title">单位新闻</div>
                </div>
                <div>
                    <table class="simpletable simpletable_color">

                        <thead>
                        <th width="40%">标题</th>
                        <th>发布部门</th>
                        <th>发布人</th>
                        <th>发布时间</th>
                        <th>关键字</th>
                        <th>摘要</th>
                        <th>点击数</th>
                        </thead>

                        <tbody>

                        <tr></tr>
                        <tr class="even">
                            <td>顺义沥青厂为一线职工送清凉</td>
                            <td>办公室</td>
                            <td>张三</td>
                            <td>2018-06-22 10:55</td>
                            <td>顺义</td>
                            <td>烈日酷暑为职工送清凉</td>
                            <td>12</td>
                        </tr>

                        <tr class="even">
                            <td>党建结对凝聚发展合力，精准帮扶贡献国企力量</td>
                            <td>办公室</td>
                            <td>李四</td>
                            <td>2018-06-11 14:19</td>
                            <td>发展,贡献</td>
                            <td>落实北京市精准帮扶工作和党员双报到工作</td>
                            <td>20</td>
                        </tr>

                        <tr class="even">
                            <td>通州沥青厂为京秦高速供料</td>
                            <td>办公室</td>
                            <td>赵武</td>
                            <td>2018-06-07 14:42</td>
                            <td>京秦</td>
                            <td>京秦告诉</td>
                            <td>14</td>
                        </tr>

                        <tr class="even">
                            <td>长安街改造工程荣获第十三届中国土木工程詹天佑奖</td>
                            <td>办公室</td>
                            <td>马六</td>
                            <td>2016-05-03 14:34</td>
                            <td>长安街改造</td>
                            <td>第十三届中国土木工程詹天佑奖</td>
                            <td>23</td>
                        </tr>

                        <tr class="even">
                            <td>怀柔厂党支部组织参观焦庄户地道战遗址纪念馆</td>
                            <td>办公室</td>
                            <td>老七</td>
                            <td>2018-06-07 09:00:00</td>
                            <td>怀柔</td>
                            <td>参观学习焦庄户地道战遗址纪念馆</td>
                            <td>43</td>
                        </tr>

                        </tbody>

                    </table>
                </div>

                <div class="unit_news_foot_left">
                    <div class="unit_news_margin">
                        <span class="unit_news_margin_content">管理员:系统管理员</span>

                    </div>
                    <div class="unit_news_foot_right">
                        <input type="button" value="新闻发布" class="press_release_button">
                        <a>更多</a>
                    </div>
                </div>

                <div style="clear: both"></div>

                <div>
                    <div class="unit_news_title">企业荣誉</div>
                </div>
                <div>
                    <table class="simpletable">

                        <thead>
                        <th width="40%">标题</th>
                        <th>发布部门</th>
                        <th>发布人</th>
                        <th>发布时间</th>
                        <th>关键字</th>
                        <th>摘要</th>
                        <th>点击数</th>
                        </thead>

                        <tbody>

                        <tr></tr>
                        <tr class="even">
                            <td>顺义沥青厂为一线职工送清凉</td>
                            <td>办公室</td>
                            <td>张三</td>
                            <td>2018-06-22 10:55</td>
                            <td>顺义</td>
                            <td>烈日酷暑为职工送清凉</td>
                            <td>12</td>
                        </tr>

                        <tr class="even">
                            <td>党建结对凝聚发展合力，精准帮扶贡献国企力量</td>
                            <td>办公室</td>
                            <td>李四</td>
                            <td>2018-06-11 14:19</td>
                            <td>发展,贡献</td>
                            <td>落实北京市精准帮扶工作和党员双报到工作</td>
                            <td>20</td>
                        </tr>

                        <tr class="even">
                            <td>通州沥青厂为京秦高速供料</td>
                            <td>办公室</td>
                            <td>赵武</td>
                            <td>2018-06-07 14:42</td>
                            <td>京秦</td>
                            <td>京秦告诉</td>
                            <td>14</td>
                        </tr>

                        <tr class="even">
                            <td>长安街改造工程荣获第十三届中国土木工程詹天佑奖</td>
                            <td>办公室</td>
                            <td>马六</td>
                            <td>2016-05-03 14:34</td>
                            <td>长安街改造</td>
                            <td>第十三届中国土木工程詹天佑奖</td>
                            <td>23</td>
                        </tr>

                        <tr class="even">
                            <td>怀柔厂党支部组织参观焦庄户地道战遗址纪念馆</td>
                            <td>办公室</td>
                            <td>老七</td>
                            <td>2018-06-07 09:00:00</td>
                            <td>怀柔</td>
                            <td>参观学习焦庄户地道战遗址纪念馆</td>
                            <td>43</td>
                        </tr>

                        </tbody>

                    </table>
                </div>

                <div class="unit_news_foot_left">
                    <div class="unit_news_margin">
                        <span class="unit_news_margin_content">管理员:系统管理员</span>

                    </div>
                    <div class="unit_news_foot_right">
                        <a>更多</a>
                    </div>
                </div>

            </div>
        </td>
    </tr>
    </tbody>
</table>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/oa/oa_common.js"></script>
</html>
