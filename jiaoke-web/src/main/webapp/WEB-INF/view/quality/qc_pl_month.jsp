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
    <title>产品月报表</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <script src="/static/js/echarts/echarts.js"></script>
    <script src="/static/js/echarts/uimaker.js"></script>
</head>

<body style="padding:10px 8px 100px 8px;">

    <!--form start-->

    <div class="div_data">

        <div class="">
            <div class="">
                <div class="boxtitle">
                    <span>产品月报表</span>
                </div>

                <div class="boxdown">
                    <table class="simpletable">

                        <thead>
                            <th>报表时间</th>
                            <th>生产总数量<i>(盘)</i></th>
                            <th>生产总重量<i>(吨)</i></th>
                            <th>报警产品数量<i>(盘)</i></th>
                            <th>操作</th>
                        </thead>

                        <tbody>

                            <tr>
                                <td>2017-11-01报表</td>
                                <td>256<i> 盘</i></td>
                                <td>23666<i> t</i></td>

                                <td>10<i> 盘</i></td>
                                <td>

                                    <a class="selected" id="add" href="" target="_self"><i class="toolico iconfont">&#xe970;</i>查看</a>
                                    <a href="" download="commons-io-2.4-src.zip"><i class="toolico iconfont">&#xe8e5;</i>导出</a>

                                </td>
                            </tr>

                            <tr>
                                <td>2017-11-01报表</td>
                                <td>256<i> 盘</i></td>
                                <td>23666<i> t</i></td>

                                <td>10<i> 盘</i></td>
                                <td>

                                    <a class="selected" id="add" href="qc_dm_data_matching.jsp" target="_self"><i class="toolico iconfont">&#xe970;</i>查看</a>
                                    <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont">&#xe8e5;</i>导出</a>

                                </td>
                            </tr>

                            <tr>
                                <td>2017-11-01报表</td>
                                <td>256<i> 盘</i></td>
                                <td>23666<i> t</i></td>

                                <td>10<i> 盘</i></td>
                                <td>

                                    <a class="selected" id="add" href="qc_dm_data_matching.jsp" target="_self"><i class="toolico iconfont">&#xe970;</i>查看</a>
                                    <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont">&#xe8e5;</i>导出</a>

                                </td>
                            </tr>

                            <tr>
                                <td>2017-11-01报表</td>
                                <td>256<i> 盘</i></td>
                                <td>23666<i> t</i></td>

                                <td>10<i> 盘</i></td>
                                <td>

                                    <a class="selected" id="add" href="qc_dm_data_matching.jsp" target="_self"><i class="toolico iconfont">&#xe970;</i>查看</a>
                                    <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont">&#xe8e5;</i>导出</a>

                                </td>
                            </tr>

                            <tr>
                                <td>2017-11-01报表</td>
                                <td>256<i> 盘</i></td>
                                <td>23666<i> t</i></td>

                                <td>10<i> 盘</i></td>
                                <td>

                                    <a class="selected" id="add" href="qc_dm_data_matching.jsp" target="_self"><i class="toolico iconfont">&#xe970;</i>查看</a>
                                    <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont">&#xe8e5;</i>导出</a>

                                </td>
                            </tr>

                            <tr>
                                <td>2017-11-01报表</td>
                                <td>256<i> 盘</i></td>
                                <td>23666<i> t</i></td>

                                <td>10<i> 盘</i></td>
                                <td>

                                    <a class="selected" id="add" href="qc_dm_data_matching.jsp" target="_self"><i class="toolico iconfont">&#xe970;</i>查看</a>
                                    <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont">&#xe8e5;</i>导出</a>

                                </td>
                            </tr>

                            <tr>
                                <td>2017-11-01报表</td>
                                <td>256<i> 盘</i></td>
                                <td>23666<i> t</i></td>

                                <td>10<i> 盘</i></td>
                                <td>

                                    <a class="selected" id="add" href="qc_dm_data_matching.jsp" target="_self"><i class="toolico iconfont">&#xe970;</i>查看</a>
                                    <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont">&#xe8e5;</i>导出</a>

                                </td>
                            </tr>

                            <tr>
                                <td>2017-11-01报表</td>
                                <td>256<i> 盘</i></td>
                                <td>23666<i> t</i></td>

                                <td>10<i> 盘</i></td>
                                <td>

                                    <a class="selected" id="add" href="qc_dm_data_matching.jsp" target="_self"><i class="toolico iconfont">&#xe970;</i>查看</a>
                                    <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont">&#xe8e5;</i>导出</a>

                                </td>
                            </tr>

                            <tr>
                                <td>2017-11-01报表</td>
                                <td>256<i> 盘</i></td>
                                <td>23666<i> t</i></td>

                                <td>10<i> 盘</i></td>
                                <td>

                                    <a class="selected" id="add" href="qc_dm_data_matching.jsp" target="_self"><i class="toolico iconfont">&#xe970;</i>查看</a>
                                    <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont">&#xe8e5;</i>导出</a>

                                </td>
                            </tr>

                            <tr>
                                 <td>2017-11-01报表</td>
                                <td>256<i> 盘</i></td>
                                <td>23666<i> t</i></td>

                                <td>10<i> 盘</i></td>
                                <td>

                                    <a class="selected" id="add" href="qc_dm_data_matching.jsp" target="_self"><i class="toolico iconfont">&#xe970;</i>查看</a>
                                    <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont">&#xe8e5;</i>导出</a>

                                </td>
                            </tr>

                            <tr>
                                <td>2017-11-01报表</td>
                                <td>256<i> 盘</i></td>
                                <td>23666<i> t</i></td>

                                <td>10<i> 盘</i></td>
                                <td>

                                    <a class="selected" id="add" href="qc_dm_data_matching.jsp" target="_self"><i class="toolico iconfont">&#xe970;</i>查看</a>
                                    <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont">&#xe8e5;</i>导出</a>

                                </td>
                            </tr>

                            <tr>
                                <td>2017-11-01报表</td>
                                <td>256<i> 盘</i></td>
                                <td>23666<i> t</i></td>

                                <td>10<i> 盘</i></td>
                                <td>

                                    <a class="selected" id="add" href="qc_dm_data_matching.jsp" target="_self"><i class="toolico iconfont">&#xe970;</i>查看</a>
                                    <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont">&#xe8e5;</i>导出</a>

                                </td>
                            </tr>

                            <tr>
                                <td>2017-11-01报表</td>
                                <td>256<i> 盘</i></td>
                                <td>23666<i> t</i></td>

                                <td>10<i> 盘</i></td>
                                <td>

                                    <a class="selected" id="add" href="qc_dm_data_matching.jsp" target="_self"><i class="toolico iconfont">&#xe970;</i>查看</a>
                                    <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont">&#xe8e5;</i>导出</a>

                                </td>
                            </tr>

                            <tr>
                                <td>2017-11-01报表</td>
                                <td>256<i> 盘</i></td>
                                <td>23666<i> t</i></td>

                                <td>10<i> 盘</i></td>
                                <td>

                                    <a class="selected" id="add" href="qc_dm_data_matching.jsp" target="_self"><i class="toolico iconfont">&#xe970;</i>查看</a>
                                    <a href="../../download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip"><i class="toolico iconfont">&#xe8e5;</i>导出</a>

                                </td>
                            </tr>

                        </tbody>

                    </table>
                </div>

            </div>
        </div>
        <div class="pagination">
            <ul class="pagelist">
                <li><a href="#" class="first">首页</a></li>
                <li><a href="#" class="selected pageico"><i class="iconfont">&#xe68a;</i></a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">6</a></li>
                <li><a href="#">7</a></li>
                <li><a href="#">8</a></li>
                <li><a href="#">9</a></li>
                <li><a href="#" class="pageico"><i class="iconfont">&#xe673;</i></a></li>
                <li><a href="#">尾页</a></li>
            </ul>

            <span class="pageinfo">共 50 条记录，每页 10 条，当前第 1 页，共 5 页</span>
        </div>
    </div>


</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>

</html>