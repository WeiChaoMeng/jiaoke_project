<%--
Created by IntelliJ IDEA.
User: Melone
Date: 2020/10/12
Time: 13:54
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <!--<link rel="stylesheet" href="../../../static/fonts/iconfont.css">-->
    <link href='../../../static/css/qc/pooledProduct.css' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="../../../static/layui/css/layui.css">
    <script src="../../../static/js/jquery.min.js"></script>
    <script src="../../../static/js/jquery.js"></script>
    <script src="../../../static/layui/layui.js"></script>
    <script src="../../../static/js/echarts/echarts.js"></script>
</head>
<style type="text/css">
    table {
        border-collapse: collapse;
        margin: 0 auto;
        text-align: center;
    }

    table td, table th {
        border: 1px solid #cad9ea;
        color: #666;
        height: 30px;
        width: 25%;
    }

    table thead th {
        background-color: #f2fdfe;
        width: 100px;
    }

    table tr:nth-child(odd) {
        background: #fff;
    }

    table tr:nth-child(even) {
        background: #F5FAFA;
    }
    h2{
        margin-left: 40%;
        font-weight: bold;
        color: #5e5a5a;
    }
    .titleDiv{
        margin: 1% 5%;
        font-weight: bold;
        color: #5e5a5a;
    }
</style>
<body>

<div class="container-content">
    <div class="top">
        <div class="count-base">
            <ul class="use-data" style="height: 32%;">
                <li style="width: 46%;">
                    <p class="data-count" id="crew1_total">0</p>
                    <span class="data-name">一号机总量</span>
                </li>
                <li style="width: 46%;">
                    <p class="data-count" id="crew1_regenerate_total"> 0</p>
                    <span class="data-name">一号机再生使用总量</span>
                </li>
                <li style="width: 46%;">
                    <p class="data-count" id="crew2_total">0</p>
                    <span class="data-name">二号机总量</span>
                </li>
                <li style="width: 46%;">
                    <p class="data-count" id="crew2_regenerate_total">0</p>
                    <span class="data-name">二号机再生使用总量</span>
                </li>
            </ul>
            <div class="com-count-title"></div>
            <div class="com-screen-content">
                <div data-type="2" style="height: 15%;margin-top: 10%;">
                    <div class="selectDiv">
                        <input type="text" class="layui-input" autocomplete="off" placeholder="开始日期" id="startDate">
                        <input type="text" class="layui-input" autocomplete="off" placeholder="结束日期" id="endDate">
                        <input type="button" class="layui-input" autocomplete="off" value="查看报告"
                               onclick="showProductStatement()">
                    </div>
                </div>
            </div>
            <span class="left-top"></span>
            <span class="right-top"></span>
            <span class="left-bottom"></span>
            <span class="right-bottom"></span>
        </div>
        <div class="count-resource q1">
            <div class="com-count-title">两台机组每日生产可添加未添加情况</div>
            <div class="com-screen-content2">
                <div class="com-screen-content">
                    <div id="main1" style="margin-top:10px;width:100%;height:300px;"></div>
                </div>
                <span class="left-top"></span>
                <span class="right-top"></span>
                <span class="left-bottom"></span>
                <span class="right-bottom"></span>
            </div>
        </div>
    </div>

    <div class="mid">
        <div class="count-share w1">
            <div class="com-count-title">两台机组连续生产100吨可添加未添加产品</div>
            <div class="com-screen-content">
                <div class="topRec_List">
                    <dl>
                        <dd>生产时间</dd>
                        <dd>产品类型</dd>
                        <dd>机组号</dd>
                        <dd>总产量(t)</dd>

                    </dl>
                    <div class="maquee">
                        <ul id="maquee">

                        </ul>
                    </div>
                </div>
            </div>
            <span class="left-top"></span>
            <span class="right-top"></span>
            <span class="left-bottom"></span>
            <span class="right-bottom"></span>
        </div>
        <div class="count-share w2">
            <div class="com-count-title">可添加类型产量前十产品柱状图</div>
            <div class="com-screen-content">
                <div id="main5" style="width:100%;height:300px;"></div>
            </div>
            <span class="left-top"></span>
            <span class="right-top"></span>
            <span class="left-bottom"></span>
            <span class="right-bottom"></span>
        </div>
    </div>

    <div class="bottom">
        <div class="count-topic e1">
            <div class="com-count-title">一号机可添加再生产品情况</div>
            <div class="com-screen-content">
                <div id="main6" style="width:100%;height:300px;"></div>
            </div>
            <span class="left-top"></span>
            <span class="right-top"></span>
            <span class="left-bottom"></span>
            <span class="right-bottom"></span>
        </div>
        <div class="count-topic e2">
            <div class="com-count-title">二号机可添加再生产品情况</div>
            <div class="com-screen-content">
                <div id="main7" style="width:100%;height:300px;"></div>
            </div>
            <span class="left-top"></span>
            <span class="right-top"></span>
            <span class="left-bottom"></span>
            <span class="right-bottom"></span>
        </div>
    </div>
    <div class="bottom">
        <div class="count-topic e1">
            <div class="com-count-title">一号机连续生产100吨可添加再生产品情况</div>
            <div class="com-screen-content">
                <div id="main8" style="width:100%;height:300px;"></div>
            </div>
            <span class="left-top"></span>
            <span class="right-top"></span>
            <span class="left-bottom"></span>
            <span class="right-bottom"></span>
        </div>
        <div class="count-topic e2">
            <div class="com-count-title">二号机连续生产100吨可添加再生产品情况</div>
            <div class="com-screen-content">
                <div id="main9" style="width:100%;height:300px;"></div>
            </div>
            <span class="left-top"></span>
            <span class="right-top"></span>
            <span class="left-bottom"></span>
            <span class="right-bottom"></span>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<div id="productStatement" style="width: 100%;height:95%;display: none;">
        <h2>机组铣刨料使用情况汇总</h2>
        <div style="width: 100%;">
            <div class="titleDiv">两台机组铣刨料使用情况</div>
            <table width="90%" class="table">
                <thead>
                <tr>
                    <th>

                    </th>
                    <th>
                        1#机组
                    </th>
                    <th>
                        2#机组
                    </th>
                    <th>
                        合计
                    </th>
                </tr>
                </thead>
                <tr>
                    <td>
                        累计生产量（万吨）
                    </td>
                    <td id="crew1_accumulative_total">

                    </td>
                    <td id="crew2_accumulative_total">

                    </td>
                    <td id="accumulative_total">

                    </td>
                </tr>
                <tr>
                    <td>
                        旧料累计使用量（万吨）
                    </td>
                    <td id="crew1_regenerate_accumulative_total">
                        13
                    </td>
                    <td id="crew2_regenerate_accumulative_total">
                        1.34
                    </td>
                    <td id="regenerate_total">
                        213
                    </td>
                </tr>
                <tr>
                    <td>
                        综合比例（%）
                    </td>
                    <td id="crew1_comprehensive_proportion">
                        13
                    </td>
                    <td id="crew2_comprehensive_proportion">
                        1.34
                    </td>
                    <td id="total_comprehensive_proportion">
                        213
                    </td>
                </tr>
                <tr>
                    <td>
                        可添加混合料产量（万吨）
                    </td>
                    <td id="pelco-d_crew1_mixture">

                    </td>
                    <td id="pelco-d_crew2_mixture">

                    </td>
                    <td id="pelco-d_total_mixture">

                    </td>
                </tr>
                <tr>
                    <td>
                        可添加比例（%）
                    </td>
                    <td id="pelco-d_crew1_proportion">

                    </td>
                    <td id="pelco-d_crew2_proportion"">

                    </td>
                    <td id="pelco-d_total_proportion">

                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 100%;">
            <div class="titleDiv">两台机组满100吨可添加未添加情况</div>
            <table width="90%" class="table">
                <thead>
                <tr>
                    <th colspan="3">
                        1#机组
                    </th>
                </tr>
                </thead>
                <thead>
                <tr>
                    <th>
                        日期
                    </th>
                    <th>
                        规格品种
                    </th>
                    <th>
                        数量（吨）
                    </th>
                </tr>
                </thead>
                <tbody id="crew1Body">

                </tbody>
                <thead>
                <tr>
                    <th colspan="3">
                        2#机组
                    </th>
                </tr>
                </thead>
                <thead>
                <tr>
                    <th>
                        日期
                    </th>
                    <th>
                        规格品种
                    </th>
                    <th>
                        数量（吨）
                    </th>
                </tr>
                </thead>
                <tbody  id="crew2Body">

                </tbody>
            </table>
        </div>
    <button id="print_button" style="width: 15%;margin-top:20px;margin-left: 40%;margin-bottom: 50px;height: 40px;" onclick="printReport('productStatement');">打印报告</button>
</div>

<input id="path" value="${path}" type="hidden">
<script src="../../../static/js/qc/pooled_regenerate.js"></script>

<script type="text/javascript">
    function autoScroll(obj) {
        $(obj).find("ul").animate({
            marginTop: "-39px"
        }, 500, function () {
            $(this).css({marginTop: "0px"}).find("li:first").appendTo(this);
        })
    }


</script>
</body>
</html>