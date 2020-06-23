<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2018/9/26
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>

<html class="x-admin-sm">
<head>
    <meta charset="utf-8">
    <title>配比模板</title>
    <link href="../../../static/css/default.css" rel="stylesheet" type="text/css">
    <script src="../../../static/new/lib/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../../../static/new/css/xadmin.css">
    <script type="text/javascript" src="../../../static/new/js/xadmin.js"></script>

</head>

<body >
<div class="x-nav">
            <span class="layui-breadcrumb">
                <%--<a href="/default.do" onclick="inv()">首页</a>--%>
                <a><cite>主页</cite></a>
                <a><cite>质量管控</cite></a>
                <a><cite>配比管理</cite></a>
            </span>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                    <div class="layui-card-body ">
                            <button class="layui-btn layui-btn-danger" id="btn_click">
                                <i class="layui-icon"></i>删除
                            </button>
                            <button class="layui-btn" id="from_click">
                                <i class="layui-icon"></i>新建配比
                            </button>
                            <button class="layui-btn" id="former_years" onclick="showOldRaio()" >
                                <i class="layui-icon"></i>查看往年配比
                            </button>
                    </div>

                    <div class="layui-card-body ">
                        <table class="layui-table layui-form" lay-filter="demo">
                            <thead>
                            <tr>
                                <th style="width: 3%;">
                                </th>
                                <th style="width: 10%">一号机组编号</th>
                                <th style="width: 10%">二号机组编号</th>
                                <th style="width: 15%">模板名称</th>
                                <th style="width: 15%">上传时间</th>
                                <th style="width: 15%">备注信息</th>
                                <th style="width: 15%">上传人</th>
                                <th style="width: 15%">操作</th>
                            </thead>
                            <tbody  >
                            <c:forEach items="${pageBean.pageData}" var="item">
                                <tr>
                                    <td>
                                        <input type="checkbox" style="display: block;" name="spCodeId" value="${item.messageId}">
                                    </td>
                                    <td>${item.crew1Id}</td>
                                    <td>${item.crew2Id}</td>
                                    <td><a href="#">${item.modelName}</a></td>
                                    <td>${item.createTime}</td>
                                    <td>${item.remaker}</td>
                                    <td>${item.createUser}</td>
                                    <td class="td-manage">
                                        <button class="layui-btn layui-btn layui-btn-xs" name="${item.messageId}" onclick="showRatio(this.name)" ><i class="layui-icon">&#xe63c;</i>详情</button>
                                        <button class="layui-btn layui-btn layui-btn-xs" name="${item.messageId}" onclick="editRatio(this.name)"><i class="layui-icon">&#xe642;</i>编辑</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                    <div class="layui-card-body" style="display: inline-block;width: 100%;">
                        <div id="paging" class="paging-div">
                            <c:choose>
                                <c:when test="${pageBean.dataCountNum > 0}">
                                    <div class="pagination">
                                        <ul class="pagelist">
                                                <%--首页--%>
                                            <c:choose>
                                                <c:when test="${pageBean.currentPageNum == 1}">
                                                    <li><a href="javascript:;" class="first">首页</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li><a href="<c:url value="${pageBean.url}"></c:url> " >首页</a></li>
                                                </c:otherwise>
                                            </c:choose>

                                                <%-- 上一页 --%>
                                            <c:if test="${pageBean.currentPageNum > 1}">
                                                <li><a href="<c:url value="${pageBean.url}currentPageNum=${pageBean.currentPageNum - 1 }"></c:url> "><i class="iconfont">&#xe68a;</i></a></li>
                                            </c:if>

                                            <c:choose>
                                                <c:when test="${pageBean.pageCount <= 10 }">
                                                    <c:set var="begin" value="1"></c:set>
                                                    <c:set var="end" value="${pageBean.pageCount}"></c:set>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="begin" value="${pageBean.currentPageNum - 4}"></c:set>
                                                    <c:set var="end" value="${pageBean.currentPageNum + 5}"></c:set>
                                                    <c:choose>

                                                        <c:when test="${begin < 1}">
                                                            <c:set var="begin" value="1"/>
                                                            <c:set var="end" value="10"/>
                                                        </c:when>

                                                        <c:when test="${end > pageBean.pageCount}">
                                                            <c:set var="begin" value="${pageBean.pageCount - 9}"></c:set>
                                                            <c:set var="end" value="${pageBean.pageCount}"></c:set>
                                                        </c:when>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:forEach begin="${begin}" end="${end}" var="i">
                                                <c:choose>
                                                    <c:when test="${i == pageBean.currentPageNum }">
                                                        <li><a href="javascript:;" class="selected pageico" >${i}</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li><a href="<c:url value="${pageBean.url}currentPageNum=${i}"></c:url>">${i}</a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>

                                                <%--下一页--%>
                                            <c:if test="${pageBean.currentPageNum < pageBean.pageCount}">
                                                <li><a href="<c:url value="${pageBean.url}currentPageNum=${pageBean.currentPageNum + 1 }"></c:url> " class="pageico"><i class="iconfont">&#xe673;</i></a></li>
                                            </c:if>

                                                <%--尾页--%>
                                            <c:choose>
                                                <c:when test="${pageBean.currentPageNum == pageBean.pageCount}">
                                                    <li><a href="javascript:;" class="first">尾页</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li><a href="<c:url value="${pageBean.url}currentPageNum=${pageBean.pageCount}"></c:url>  " >尾页</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </ul>

                                        <span class="pageinfo">共 ${pageBean.dataCountNum} 条记录，每页 ${pageBean.eachPageDataNum} 条，当前第 ${pageBean.currentPageNum} 页，共 ${pageBean.pageCount} 页</span>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <span style="position: absolute;top: 45%;left: 45%;font: 14px/1.5 'Microsoft YaHei',arial,tahoma,\5b8b\4f53,sans-serif;color: #a29c9c;">本年暂无配比</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>

    <div id="showOldRation" style="padding-top: 8px;display: none;">

    </div>
    <!--删除弹出-->
    <div class="popup_back" style="display:none;">
    </div>
    <div class="popup_window_first" style="display:none;">
        <p class="popup_cont">是否删除？</p>
        <a href="javascript:void(0)" class="popup_btn" onclick="delectRatio();">确定</a>
        <a href="javascript:void(0)" class="popup_btn" onclick="closeWindow();">取消</a>
    </div>
    <!--新建模板弹出-->
    <div id="addRatioBrk" class="form_background"  style="display:none;" ></div>
    <div id="addRatio" class="ration_form_model" style="display:none;" >
        <form  id="myForm"   action="/addRation.do" method="post" >
            <table class="my_form_table">

                <tbody>

                <tr>
                    <td class="tlabels">配比名称：</td>
                    <td colspan="3">
                        <input type="text" id="proName" name="proName"  required="required"  style="width: 82%;" class="forminput inputstyle" style="width: 72%;" value="cl-17沥青模板">
                    </td>
                </tr>

                <tr>
                    <td class="tlabels">1#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="repertoryOne" class="forminput inputstyle" value="0.0">
                    </td>
                    <td class="tlabels">2#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertoryTwo" class="forminput inputstyle" value="0.0">
                    </td>
                </tr>

                <tr>
                    <td class="tlabels">3#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="repertoryThree" class="forminput inputstyle" value="0.0">
                    </td>
                    <td class="tlabels">4#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="repertoryFour" class="forminput inputstyle" value="0.0">
                    </td>
                </tr>

                <tr>
                    <td class="tlabels">5#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="repertoryFive" class="forminput inputstyle" value="0.0">
                    </td>
                    <td class="tlabels">6#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="repertorySix" class="forminput inputstyle" value="0.0">
                    </td>
                </tr>

                <tr>
                    <td class="tlabels">矿粉：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="breeze" class="forminput inputstyle" value="0.0">
                    </td>
                    <td class="tlabels">沥青(含量)：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="ratioStone" class="forminput inputstyle" value="0.0">
                    </td>
                </tr>


                <tr>
                    <td class="tlabels">沥青加热温度 上/下限：</td>
                    <td>
                        <input type="number" name="temperatureAsphalt" class="my_form_input" value="0">
                        <input type="number" name="temperatureAsphaltUp" class="my_form_input" value="0">
                    </td>
                    <td class="tlabels">骨料加热温度 上/下限：</td>
                    <td>
                        <input type="number" name="temperatureAggregate" class="my_form_input" value="0">
                        <input type="number" name="temperatureAggregateUp" class="my_form_input" value="0">
                    </td>
                </tr>

                <tr>
                    <td class="tlabels">混合料出厂温度 上/下限：</td>
                    <td>
                        <input type="number" name="temperatureMixture" class="my_form_input" value="0">
                        <input type="number" name="temperatureMixtureUp" class="my_form_input" value="0">
                    </td>
                    <td class="tlabels">一仓温度 上/下限：</td>
                    <td>
                        <input type="number" name="temperatureMilling" class="my_form_input" value="0">
                        <input type="number" name="temperatureMillingUp" class="my_form_input" value="0">
                    </td>
                </tr>

                <tr>
                    <td class="tlabels">再生料：</td>
                    <td>
                        <select class="form_swidth" name="regenerate" data-value="0">
                            <c:forEach items="${listRegenerate}" var="item">
                                <option value="${item.id}">${item.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td class="tlabels">再生料粗、中、细：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="ratioRegenerate1" class="my_form_input" style="width: 54px;" value="0.0">
                        <input type="number" min="0.0" step="0.01" name="ratioRegenerate3" class="my_form_input" style="width: 54px;" value="0.0">
                        <input type="number" min="0.0" step="0.01" name="ratioRegenerate2" class="my_form_input" style="width: 54px;" value="0.0">
                    </td>
                </tr>


                <tr>
                    <td class="tlabels">添加剂：</td>
                    <td>
                        <select class="form_swidth" name="additive" data-value="0">
                            <c:forEach items="${listAdditive}" var="item">
                                <option value="${item.id}">${item.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td class="tlabels">添加剂含量：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="ratioAdditive" class="forminput inputstyle" value="0.0">
                    </td>
                </tr>

                <tr>
                    <td class="tlabels">模板在机组一的编号：</td>
                    <td>
                        <input type="number" id="crew1ModeleId" name="crew1ModeleId"  required="required"  class="forminput inputstyle" value="0">
                    </td>
                    <td class="tlabels">模板在机组二的编号：</td>
                    <td>
                        <input type="number"  id="crew2ModeleId" name="crew2ModeleId"  required="required"  class="forminput inputstyle" value="0">
                    </td>
                </tr>

                <tr>
                    <td class="tlabels">上传人：</td>
                    <td>
                        <input type="text" name="upUser"  required="required"  class="forminput inputstyle" value="张三">
                    </td>
                    <td class="tlabels">备注：</td>
                    <td>
                        <input type="text" name="remark"  required="required"  class="forminput inputstyle" value="对模板相关备注">
                    </td>
                </tr>

                </tbody>

            </table>

            <div class="form_btn">
                <input type="submit"  id="btn"  value="保存" class="btn_save">
            </div>

        </form>
    </div>

    <!--查看模板弹出-->
    <div id="showRatioBrk" class="form_background"  style="display:none;" ></div>
    <div id="showRatio" class="ration_form_model" style="display:none;" >
            <table class="my_form_table">
                <tbody>

                <tr>
                    <td colspan="3">
                        <input type="text" data-value="proName" disabled="disabled"  style="width: 97%;font-size: 24px;padding-bottom: 13px;padding-left: 35%;border: aliceblue;" class="ration_forminput ration_inputstyle" style="width: 72%;" value="cl-17沥青模板">
                    </td>
                </tr>

                <tr>
                    <td class="ration_tlabels">1#仓：</td>
                    <td>
                        <input type="number" disabled="disabled" data-value="repertoryOne" class="ration_forminput ration_inputstyle" value="3">
                    </td>
                    <td class="ration_tlabels">2#仓：</td>
                    <td>
                        <input type="number" disabled="disabled"  data-value="repertoryTwo" class="ration_forminput ration_inputstyle" value="5">
                    </td>
                </tr>

                <tr>
                    <td class="ration_tlabels">3#仓：</td>
                    <td>
                        <input type="number"  disabled="disabled" data-value="repertoryThree" class="ration_forminput ration_inputstyle" value="17">
                    </td>
                    <td class="ration_tlabels">4#仓：</td>
                    <td>
                        <input type="number" disabled="disabled" data-value="repertoryFour" class="ration_forminput ration_inputstyle" value="35">
                    </td>
                </tr>

                <tr>
                    <td class="ration_tlabels">5#仓：</td>
                    <td>
                        <input type="number" disabled="disabled" data-value="repertoryFive" class="ration_forminput ration_inputstyle" value="75">
                    </td>
                    <td class="ration_tlabels">6#仓：</td>
                    <td>
                        <input type="number" disabled="disabled" data-value="repertorySix" class="ration_forminput ration_inputstyle" value="85">
                    </td>
                </tr>

                <tr>
                    <td class="ration_tlabels">矿粉：</td>
                    <td>
                        <input type="number" disabled="disabled" data-value="breeze" class="ration_forminput ration_inputstyle" value="5">
                    </td>
                    <td class="ration_tlabels">沥青(含量)：</td>
                    <td>
                        <input type="number" disabled="disabled" data-value="ratioStone" class="ration_forminput ration_inputstyle" value="1">
                    </td>
                </tr>


                <tr>
                    <td class="tlabels">沥青加热温度 上/下限：</td>
                    <td>
                        <input type="number" disabled="disabled"  data-value="temperatureAsphalt" class="my_form_input" >
                        <input type="number" disabled="disabled"  data-value="temperatureAsphaltUp" class="my_form_input">
                    </td>
                    <td class="tlabels">骨料加热温度 上/下限：</td>
                    <td>
                        <input type="number" disabled="disabled"  data-value="temperatureAggregate"  class="my_form_input">
                        <input type="number" disabled="disabled"  data-value="temperatureAggregateUp" class="my_form_input">
                    </td>
                </tr>

                <tr>
                    <td class="tlabels">混合料出厂温度 上/下限：</td>
                    <td>
                        <input type="number" disabled="disabled"  data-value="temperatureMixture"  class="my_form_input" >
                        <input type="number" disabled="disabled"  data-value="temperatureMixtureUp"  class="my_form_input" >
                    </td>
                    <td class="tlabels">一仓温度 上/下限：</td>
                    <td>
                        <input type="number" disabled="disabled"  data-value="temperatureMilling"  class="my_form_input" >
                        <input type="number" disabled="disabled"  data-value="temperatureMillingUp"  class="my_form_input" >
                    </td>
                </tr>


                <tr>
                    <td class="ration_tlabels">再生料粗、中、细：</td>
                    <td>
                        <input type="number" disabled="disabled" data-value="ratioRegenerate1" class="ration_form_input" style="width: 54px;" value="1">
                        <input type="number"  disabled="disabled" data-value="ratioRegenerate3"  class="ration_form_input" style="width: 54px;" value="1">
                        <input type="number" disabled="disabled" data-value="ratioRegenerate2" class="ration_form_input" style="width: 54px;" value="1">
                    </td>
                    <td class="ration_tlabels">添加剂比：</td>
                    <td>
                        <input type="number" disabled="disabled" data-value="ratioAdditive" class="ration_forminput ration_inputstyle" value="2">
                    </td>
                </tr>

                <tr>
                    <td class="ration_tlabels">模板在机组一的编号：</td>
                    <td>
                        <input type="number" disabled="disabled"  data-value="crew1ModeleId"    class="ration_forminput ration_inputstyle" value="52">
                    </td>
                    <td class="ration_tlabels">模板在机组二的编号：</td>
                    <td>
                        <input type="number" disabled="disabled"  data-value="crew2ModeleId"    class="ration_forminput ration_inputstyle" value="37">
                    </td>
                </tr>

                <tr>
                    <td class="ration_tlabels">上传人：</td>
                    <td>
                        <input type="text" data-value="upUser"  disabled="disabled"  class="ration_forminput ration_inputstyle" value="">
                    </td>
                    <td class="ration_tlabels">备注：</td>
                    <td>
                        <input type="text" data-value="remark"  disabled="disabled"  class="ration_forminput ration_inputstyle" value="">
                    </td>
                </tr>

                </tbody>

            </table>
        </form>
    </div>

    <!--编辑机组模板弹出-->
    <div id="editRatioBrk" class="form_background"  style="display:none;" ></div>
    <div id="editRatio" class="ration_form_model" style="display:none;" >
        <form  id="myEditForm"   action="/EditRation.do" method="post" >
        <table class="my_form_table">
            <tbody>

            <tr>
                <td class="tlabels">配比名称：</td>
                <td colspan="3">
                    <input type="text" data-value="proName" name="proName"    style="width: 82%;" class="forminput inputstyle" style="width: 72%;">
                </td>
            </tr>

            <tr>
                <td class="tlabels">1#仓：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="repertoryOne" name="repertoryOne" class="forminput inputstyle" >
                </td>
                <td class="tlabels">2#仓：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="repertoryTwo"  name="repertoryTwo" class="forminput inputstyle" >
                </td>
            </tr>

            <tr>
                <td class="tlabels">3#仓：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="repertoryThree" name="repertoryThree" class="forminput inputstyle">
                </td>
                <td class="tlabels">4#仓：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="repertoryFour" name="repertoryFour" class="forminput inputstyle">
                </td>
            </tr>

            <tr>
                <td class="tlabels">5#仓：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="repertoryFive" name="repertoryFive" class="forminput inputstyle" >
                </td>
                <td class="tlabels">6#仓：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="repertorySix" name="repertorySix" class="forminput inputstyle">
                </td>
            </tr>

            <tr>
                <td class="tlabels">矿粉：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="breeze" name="breeze" class="forminput inputstyle">
                </td>
                <td class="tlabels">沥青(含量)：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="ratioStone" name="ratioStone" class="forminput inputstyle" >
                </td>
            </tr>


            <tr>
                <td class="tlabels">沥青加热温度 上/下限：</td>
                <td>
                    <input type="number" data-value="temperatureAsphalt" name="temperatureAsphalt" class="my_form_input" >
                    <input type="number" data-value="temperatureAsphaltUp" name="temperatureAsphaltUp" class="my_form_input">
                </td>
                <td class="tlabels">骨料加热温度 上/下限：</td>
                <td>
                    <input type="number" data-value="temperatureAggregate" name="temperatureAggregate" class="my_form_input">
                    <input type="number" data-value="temperatureAggregateUp" name="temperatureAggregateUp" class="my_form_input">
                </td>
            </tr>

            <tr>
                <td class="tlabels">混合料出厂温度 上/下限：</td>
                <td>
                    <input type="number" data-value="temperatureMixture" name="temperatureMixture" class="my_form_input" >
                    <input type="number" data-value="temperatureMixtureUp" name="temperatureMixtureUp" class="my_form_input" >
                </td>
                <td class="tlabels">一仓温度 上/下限：</td>
                <td>
                    <input type="number" data-value="temperatureMilling" name="temperatureMilling" class="my_form_input" >
                    <input type="number" data-value="temperatureMillingUp" name="temperatureMillingUp" class="my_form_input" >
                </td>
            </tr>

            <tr>
                <td class="tlabels">再生料：</td>
                <td>
                    <select class="form_swidth" data-value="regenerate" name="regenerate" >
                        <c:forEach items="${listRegenerate}" var="item">
                            <option value="${item.id}">${item.name}</option>
                        </c:forEach>
                    </select>
                </td>
                <td class="tlabels">再生料粗、中、细：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="ratioRegenerate1" name="ratioRegenerate1" class="my_form_input" style="width: 54px;" value="0.0">
                    <input type="number" min="0.0" step="0.01" data-value="ratioRegenerate3" name="ratioRegenerate3" class="my_form_input" style="width: 54px;" value="0.0">
                    <input type="number" min="0.0" step="0.01" data-value="ratioRegenerate2" name="ratioRegenerate2" class="my_form_input" style="width: 54px;" value="0.0">
                </td>
            </tr>


            <tr>
                <td class="tlabels">添加剂：</td>
                <td>
                    <select class="form_swidth" data-value="additive" name="additive" >
                        <c:forEach items="${listAdditive}" var="item">
                            <option value="${item.id}">${item.name}</option>
                        </c:forEach>
                    </select>
                </td>
                <td class="tlabels">添加剂含量：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="ratioAdditive" name="ratioAdditive" class="forminput inputstyle">
                </td>
            </tr>

            <tr>
                <td class="tlabels">模板在机组一的编号：</td>
                <td>
                    <input type="number" data-value="crew1ModeleId" name="crew1ModeleId"    class="forminput inputstyle" >
                </td>
                <td class="tlabels">模板在机组二的编号：</td>
                <td>
                    <input type="number"  data-value="crew2ModeleId" name="crew2ModeleId" class="forminput inputstyle" >
                </td>
            </tr>

            <tr>
                <td class="tlabels">上传人：</td>
                <td>
                    <input type="text" data-value="upUser" name="upUser"   class="forminput inputstyle" >
                </td>
                <td class="tlabels">备注：</td>
                <td>
                    <input type="text" data-value="remark" name="remark"   class="forminput inputstyle" >
                </td>
                <<input type="text" name="id" data-value="id" style="display: none">
            </tr>

            </tbody>
        </table>

        <div class="form_btn">
            <input type="submit"  id="edit"  value="修改" class="btn_save">
        </div>

        </form>
    </div>

    <!--级配模板弹出-->
    <div id="showGradingBrk" class="form_background"  style="display:none;" ></div>
    <div id="showGrading" class="ration_form_model" style="display:none;" >
        <table class="my_form_table">
            <tbody>
            <tr>
                <td class="my_grading_tlables">一号机组模板号：</td>
                <td>
                    <input type="number" id="crew1_num" class="my_grading_input">

                </td>
                <td class="my_grading_tlables">二号机组模板号：</td>
                <td>
                    <input type="number" id="crew2_num" class="my_grading_input">
                </td>
                <td class="my_grading_tlables">级配Excell</td>
                <td>
                    <input type="file" id="excel-file" style="border: none;"  class="ration_forminput ration_inputstyle">
                </td>
            </tr>
            <tr>

            </tr>

            </tbody>

        </table>
        <div id="result"></div>
        <div class="form_btn">
            <input type="button" onclick="sendGrading()" value="上传" class="ration_btn_cancel" style="padding-top: 0px">
            <input type="button" onclick="closeGrading()" value="关闭" class="ration_btn_cancel">
        </div>

        </form>

    </div>

    <input type="text" value="${path}" id="path" style="display: none" >

</body>

<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/static/js/datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript" src="/static/js/qc/ration_moudel.js"></script>
<script type="text/javascript" src="/static/js/qc/xlsx.core.min.js"></script>

</html>