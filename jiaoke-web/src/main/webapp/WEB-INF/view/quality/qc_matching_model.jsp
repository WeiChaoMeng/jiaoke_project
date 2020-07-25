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
    <div id="addRatio" class="ration_form_model" style="display:none;" >
        <form  id="myForm"   action="/addRation.do" method="post" >
            <table class="my_form_table">

                <tbody>

                <tr>
                    <td class="my_tlabels">配比名称：</td>
                    <td colspan="3">
                        <input type="text" id="proName" name="proName"  required="required"  style="width: 82%;" class="my_form_input" style="width: 72%;" value="cl-17沥青模板">
                    </td>
                </tr>

                <tr>
                    <td class="my_tlabels">1#仓：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01" name="repertoryOne" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01"  name="repertoryOne_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" name="repertoryOne_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01"  name="repertoryOne_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryOne_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01"  name="repertoryOne_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryOne_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">2#仓：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01"  name="repertoryTwo" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01"  name="repertoryTwo_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryTwo_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertoryTwo_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryTwo_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01"  name="repertoryTwo_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number"  required="required"  max="0.0" step="0.01"   name="repertoryTwo_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">3#仓：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01" name="repertoryThree" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01"  name="repertoryThree_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryThree_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01"  name="repertoryThree_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryThree_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01"  name="repertoryThree_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryThree_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">4#仓：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01" name="repertoryFour" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01"  name="repertoryFour_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryFour_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertoryFour_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"   name="repertoryFour_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertoryFour_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"   name="repertoryFour_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">5#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="repertoryFive" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertoryFive_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryFive_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertoryFive_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryFive_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertoryFive_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryFive_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">6#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="repertorySix" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertorySix_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertorySix_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertorySix_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertorySix_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertorySix_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertorySix_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">7#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="repertorySeven" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertorySeven_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertorySeven_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertorySeven_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertorySeven_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertorySeven_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertorySeven_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">8#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="repertoryEight" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertoryEight_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryEight_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertoryEight_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryEight_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertoryEight_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryEight_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">9#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="repertoryNine" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertoryNine_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryNine_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertoryNine_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryNine_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertoryNine_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryNine_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">10#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="repertoryTen" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertoryTen_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryTen_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertoryTen_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryTen_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="repertoryTen_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="repertoryTen_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">矿粉1：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="breeze" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="breeze1_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="breeze1_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="breeze1_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="breeze1_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="breeze1_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="breeze1_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">矿粉2：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="breeze2" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="breeze2_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="breeze2_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="breeze2_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="breeze2_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="breeze2_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="breeze2_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">矿粉3：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="breeze3" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="breeze3_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="breeze3_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="breeze3_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="breeze3_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="breeze3_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="breeze3_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">矿粉4：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="breeze4" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="breeze4_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="breeze4_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="breeze4_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="breeze4_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="breeze4_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="breeze4_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">沥青(含量)：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="ratioStone" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="ratioStone_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="ratioStone_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="ratioStone_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="ratioStone_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="ratioStone_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="ratioStone_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">粗再生料：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="ratioRegenerate1" class="my_form_input" placeholder="0.0">
                    </td>
                    <td class="my_tlabels">细再生料：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="ratioRegenerate2" class="my_form_input" placeholder="0.0">
                    </td>
                    <td class="my_tlabels">中再生料：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" name="ratioRegenerate3" class="my_form_input" placeholder="0.0">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">再生料一级预警上/下限：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="regenerate_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="regenerate_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">再生料二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="regenerate_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="regenerate_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">再生料三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="regenerate_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="regenerate_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">添加剂一：</td>
                    <td>
                        <input type="number"  min="0.0" step="0.01" name="ratioAdditive" class="my_form_input" placeholder="0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="additive_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="additive_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="additive_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="additive_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="additive_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="additive_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">添加剂二：</td>
                    <td>
                        <input type="number"  min="0.0" step="0.01"  name="ratioAdditiveTwo" class="my_form_input" placeholder="0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="additive1_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="additive1_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="additive1_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="additive1_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="additive1_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="additive1_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">添加剂三：</td>
                    <td>
                        <input type="number"  min="0.0" step="0.01" name="ratioAdditiveThree" class="my_form_input" placeholder="0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="additive2_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="additive2_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="additive2_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="additive2_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="additive2_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="additive2_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">添加剂四：</td>
                    <td>
                        <input type="number"  min="0.0" step="0.01" name="ratioAdditiveFour" class="my_form_input" placeholder="0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="additive3_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="additive3_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="additive3_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="additive3_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="additive3_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="additive3_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">沥青温度上/下限：</td>
                    <td>
                        <input type="number" min="0"   name="temperatureAsphaltUp" class="my_form_input" placeholder="上限">
                        <input type="number" min="0"  name="temperatureAsphalt" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureAsphalt_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureAsphalt_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureAsphalt_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureAsphalt_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureAsphalt_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number"required="required"  max="0.0" step="0.01"  name="temperatureAsphalt_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">骨料加热温度上/下限：</td>
                    <td>
                        <input type="number" min="0"  name="temperatureAggregateUp" class="my_form_input" placeholder="上限">
                        <input type="number" min="0"   name="temperatureAggregate" class="my_form_input" placeholder="下限">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureAggregate_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureAggregate_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureAggregate_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureAggregate_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureAggregate_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureAggregate_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>

                    <td class="my_tlabels">混合料温度上/下限：</td>
                    <td>
                        <input type="number"  min="0"  name="temperatureMixtureUp" class="my_form_input" placeholder="上限">
                        <input type="number" min="0"  name="temperatureMixture" class="my_form_input" placeholder="下限">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureMixture_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureMixture_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureMixture_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureMixture_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureMixture_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureMixture_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">一仓温度上/下限限：</td>
                    <td>
                        <input type="number" min="0"  name="temperatureMilling" class="my_form_input" placeholder="下限">
                        <input type="number" min="0"  name="temperatureMillingUp" class="my_form_input" placeholder="上限">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureMilling_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureMilling_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureMilling_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureMilling_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureMilling_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureMilling_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">模板在机组一的编号：</td>
                    <td>
                        <input type="number" id="crew1ModeleId" name="crew1ModeleId"  required="required"  class="my_form_input" style="width: 120px;" value="0">
                    </td>
                    <td class="my_tlabels">模板在机组二的编号：</td>
                    <td>
                        <input type="number"  id="crew2ModeleId" name="crew2ModeleId"  required="required"  class="my_form_input" style="width: 120px;" value="0">
                    </td>
                    <td class="my_tlabels">上传人：</td>
                    <td>
                        <input type="text" name="upUser"  required="required"  class="my_form_input" style="width: 120px;" value="张三">
                    </td>
                    <td class="my_tlabels">备注：</td>
                    <td>
                        <input type="text" name="remark"  required="required"  class="my_form_input" style="width: 120px;" value="对模板相关备注">
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
    <div id="showRatio" class="ration_form_model" style="display:none;" >
    <form  >
        <table class="my_form_table">
            <tbody>
            <tr>
                <td class="my_tlabels">配比名称：</td>
                <td colspan="3">
                    <input type="text"  data-value="proName"  required="required"  style="width: 82%;" class="my_form_input" style="width: 72%;" value="cl-17沥青模板">
                </td>
            </tr>

            <tr>
                <td class="my_tlabels">1#仓：</td>
                <td>
                    <input type="number" required="required"  min="0.0" step="0.01" data-value="repertoryOne" class="my_form_input" value="0.0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" required="required"  min="0.0" step="0.01"  data-value="repertoryOne_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" data-value="repertoryOne_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" required="required"  min="0.0" step="0.01"  data-value="repertoryOne_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0"  data-value="repertoryOne_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" required="required"  min="0.0" step="0.01"  data-value="repertoryOne_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0"  data-value="repertoryOne_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">2#仓：</td>
                <td>
                    <input type="number" required="required"  min="0.0" step="0.01"  data-value="repertoryTwo" class="my_form_input" value="0.0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" required="required"  min="0.0" step="0.01"  data-value="repertoryTwo_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0"  data-value="repertoryTwo_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertoryTwo_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" data-value="repertoryTwo_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" required="required"  min="0.0" step="0.01"  data-value="repertoryTwo_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number"  required="required"  max="0.0"  data-value="repertoryTwo_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">3#仓：</td>
                <td>
                    <input type="number" required="required"  min="0.0" step="0.01" data-value="repertoryThree" class="my_form_input" value="0.0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" required="required"  min="0.0" step="0.01"  data-value="repertoryThree_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertoryThree_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" required="required"  min="0.0" step="0.01"  data-value="repertoryThree_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertoryThree_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" required="required"  min="0.0" step="0.01"  data-value="repertoryThree_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertoryThree_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">4#仓：</td>
                <td>
                    <input type="number" required="required"  min="0.0" step="0.01" data-value="repertoryFour" class="my_form_input" value="0.0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" required="required"  min="0.0" step="0.01"  data-value="repertoryFour_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertoryFour_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertoryFour_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0"  data-value="repertoryFour_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertoryFour_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0"  data-value="repertoryFour_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">5#仓：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="repertoryFive" class="my_form_input" value="0.0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertoryFive_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertoryFive_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertoryFive_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertoryFive_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertoryFive_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertoryFive_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">6#仓：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="repertorySix" class="my_form_input" value="0.0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertorySix_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertorySix_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertorySix_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertorySix_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertorySix_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertorySix_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">7#仓：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="repertorySeven" class="my_form_input" value="0.0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertorySeven_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertorySeven_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertorySeven_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertorySeven_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertorySeven_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertorySeven_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">8#仓：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="repertoryEight" class="my_form_input" value="0.0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertoryEight_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertoryEight_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertoryEight_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertoryEight_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertoryEight_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertoryEight_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">9#仓：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="repertoryNine" class="my_form_input" value="0.0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertoryNine_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertoryNine_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertoryNine_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertoryNine_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertoryNine_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertoryNine_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">10#仓：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="repertoryTen" class="my_form_input" value="0.0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertoryTen_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertoryTen_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertoryTen_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertoryTen_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="repertoryTen_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertoryTen_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">矿粉1：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="breeze" class="my_form_input" value="0.0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="breeze1_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="breeze1_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="breeze1_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="breeze1_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="breeze1_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="breeze1_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">矿粉2：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="breeze2" class="my_form_input" value="0.0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="breeze2_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="breeze2_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="breeze2_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="breeze2_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="breeze2_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="breeze2_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">矿粉3：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="breeze3" class="my_form_input" value="0.0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="breeze3_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="breeze3_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="breeze3_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="breeze3_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="breeze3_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="breeze3_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">矿粉4：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="breeze4" class="my_form_input" value="0.0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="breeze4_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="breeze4_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="breeze4_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="breeze4_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="breeze4_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="breeze4_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">沥青(含量)：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="ratioStone" class="my_form_input" value="0.0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="ratioStone_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="ratioStone_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="ratioStone_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="ratioStone_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="ratioStone_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="ratioStone_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">粗再生料：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="ratioRegenerate1" class="my_form_input" placeholder="0.0">
                </td>
                <td class="my_tlabels">细再生料：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="ratioRegenerate2" class="my_form_input" placeholder="0.0">
                </td>
                <td class="my_tlabels">中再生料：</td>
                <td>
                    <input type="number" min="0.0" step="0.01" data-value="ratioRegenerate3" class="my_form_input" placeholder="0.0">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">再生料一级预警上/下限：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="regenerate_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="regenerate_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">再生料二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="regenerate_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="regenerate_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">再生料三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="regenerate_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="regenerate_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">添加剂一：</td>
                <td>
                    <input type="number" data-value="ratioAdditive" class="my_form_input" placeholder="0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="additive_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="additive_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="additive_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="additive_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="additive_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="additive_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">添加剂二：</td>
                <td>
                    <input type="number" data-value="ratioAdditive1" class="my_form_input" placeholder="0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="additive1_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="additive1_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="additive1_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="additive1_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="additive1_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="additive1_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">添加剂三：</td>
                <td>
                    <input type="number" data-value="ratioAdditive2" class="my_form_input" placeholder="0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="additive2_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="additive2_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="additive2_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="additive2_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="additive2_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="additive2_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">添加剂四：</td>
                <td>
                    <input type="number" data-value="ratioAdditive3" class="my_form_input" placeholder="0">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="additive3_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="additive3_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="additive3_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="additive3_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="additive3_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="additive3_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">沥青温度上/下限：</td>
                <td>
                    <input type="number" data-value="temperatureAsphalt" class="my_form_input" placeholder="下限 例: -10">
                    <input type="number" data-value="temperatureAsphaltUp" class="my_form_input" placeholder="上限">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="temperatureAsphalt_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="temperatureAsphalt_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="temperatureAsphalt_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="temperatureAsphalt_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="temperatureAsphalt_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number"required="required"  max="0.0" step="0.01"  data-value="temperatureAsphalt_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">骨料加热温度上/下限：</td>
                <td>
                    <input type="number" data-value="temperatureAggregateUp" class="my_form_input" placeholder="上限">
                    <input type="number" data-value="temperatureAggregate" class="my_form_input" placeholder="下限">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="temperatureAggregate_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"   step="0.01"  data-value="temperatureAggregate_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="temperatureAggregate_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="temperatureAggregate_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="temperatureAggregate_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="temperatureAggregate_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">混合料温度上/下限：</td>
                <td>
                    <input type="number" data-value="temperatureMixture" class="my_form_input" placeholder="下限">
                    <input type="number" data-value="temperatureMixtureUp" class="my_form_input" placeholder="上限">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="temperatureMixture_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="temperatureMixture_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="temperatureMixture_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="temperatureMixture_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="temperatureMixture_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="temperatureMixture_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">一仓温度上/下限限：</td>
                <td>
                    <input type="number" data-value="temperatureMilling" class="my_form_input" placeholder="下限">
                    <input type="number" data-value="temperatureMillingUp" class="my_form_input" placeholder="上限">
                </td>
                <td class="my_tlabels">一级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="temperatureMilling_leve1_up" class="my_form_input"   placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="temperatureMilling_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">二级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="temperatureMilling_leve2_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="temperatureMilling_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
                <td class="my_tlabels">三级预警上/下限设定值：</td>
                <td>
                    <input type="number" min="0.0" step="0.01"  data-value="temperatureMilling_leve3_up" class="my_form_input" placeholder="上限">
                    <input type="number" required="required"  max="0.0" step="0.01"  data-value="temperatureMilling_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                </td>
            </tr>
            <tr>
                <td class="my_tlabels">模板在机组一的编号：</td>
                <td>
                    <input type="number"  data-value="crew1ModeleId"  required="required"  class="my_form_input" style="width: 120px;" value="0">
                </td>
                <td class="my_tlabels">模板在机组二的编号：</td>
                <td>
                    <input type="number"   data-value="crew2ModeleId"  required="required"  class="my_form_input" style="width: 120px;" value="0">
                </td>
                <td class="my_tlabels">上传人：</td>
                <td>
                    <input type="text" data-value="upUser"  required="required"  class="my_form_input" style="width: 120px;" value="张三">
                </td>
                <td class="my_tlabels">备注：</td>
                <td>
                    <input type="text" data-value="remark"  required="required"  class="my_form_input" style="width: 120px;" value="对模板相关备注">
                </td>
            </tr>
            </tbody>

        </table>
    </form>
    </div>
    <!--编辑机组模板弹出-->
    <div id="editRatio" class="ration_form_model" style="display:none;" >
        <form  id="myEditForm"   action="/EditRation.do" method="post" >
            <table class="my_form_table">
                <tbody>
                <tr>
                    <td class="my_tlabels">配比名称：</td>
                    <td colspan="3">
                        <input type="text" data-value="id" name="id" style="width: 82%;display: none;" class="my_form_input" >

                        <input type="text" data-value="proName" name="proName"  required="required"  style="width: 82%;" class="my_form_input" style="width: 72%;" value="cl-17沥青模板">
                    </td>
                </tr>

                <tr>
                    <td class="my_tlabels">1#仓：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01" data-value="repertoryOne" name="repertoryOne" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.1" data-value="repertoryOne_leve1_up"  name="repertoryOne_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.1"  data-value="repertoryOne_leve1_down" name="repertoryOne_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01" data-value="repertoryOne_leve2_up"   name="repertoryOne_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.1" data-value="repertoryOne_leve2_down"   name="repertoryOne_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01"  data-value="repertoryOne_leve3_up"   name="repertoryOne_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.1" data-value="repertoryOne_leve3_down"  name="repertoryOne_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">2#仓：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01" data-value="repertoryTwo"   name="repertoryTwo" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01" data-value="repertoryTwo_leve1_up"   name="repertoryTwo_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.1" data-value="repertoryTwo_leve1_down"  name="repertoryTwo_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryTwo_leve2_up"  name="repertoryTwo_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.1" data-value="repertoryTwo_leve2_down" name="repertoryTwo_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01" data-value="repertoryTwo_leve3_up"  name="repertoryTwo_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number"  required="required"  max="0.0" step="0.1" data-value="repertoryTwo_leve3_down"   name="repertoryTwo_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">3#仓：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01" data-value="repertoryThree" name="repertoryThree" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01" data-value="repertoryThree_leve1_up"   name="repertoryThree_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertoryThree_leve1_down" name="repertoryThree_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01" data-value="repertoryThree_leve2_up"  name="repertoryThree_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertoryThree_leve2_down"  name="repertoryThree_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01" data-value="repertoryThree_leve3_up" name="repertoryThree_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertoryThree_leve3_down" name="repertoryThree_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">4#仓：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01" data-value="repertoryFour" name="repertoryFour" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" required="required"  min="0.0" step="0.01" data-value="repertoryFour_leve1_up" name="repertoryFour_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  data-value="repertoryFour_leve1_down" name="repertoryFour_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryFour_leve2_up"  name="repertoryFour_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required" data-value="repertoryFour_leve2_down"  max="0.0" step="0.1"  name="repertoryFour_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryFour_leve3_up"   name="repertoryFour_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.1" data-value="repertoryFour_leve3_down"   name="repertoryFour_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">5#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryFive"  name="repertoryFive" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryFive_leve1_up"  name="repertoryFive_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertoryFive_leve1_down"  name="repertoryFive_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryFive_leve2_up"  name="repertoryFive_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertoryFive_leve2_down"  name="repertoryFive_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryFive_leve3_up"  name="repertoryFive_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertoryFive_leve3_down" name="repertoryFive_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">6#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertorySix"  name="repertorySix" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertorySix_leve1_up"  name="repertorySix_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertorySix_leve1_down"  name="repertorySix_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertorySix_leve2_up"  name="repertorySix_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertorySix_leve2_down"   name="repertorySix_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertorySix_leve3_up" name="repertorySix_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertorySix_leve3_down"  name="repertorySix_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">7#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertorySeven"  name="repertorySeven" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertorySeven_leve1_up" name="repertorySeven_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertorySeven_leve1_down" name="repertorySeven_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertorySeven_leve2_up"  name="repertorySeven_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertorySeven_leve2_down"  name="repertorySeven_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertorySeven_leve3_up" name="repertorySeven_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertorySeven_leve3_down"   name="repertorySeven_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">8#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryEight"  name="repertoryEight" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryEight_leve1_up" name="repertoryEight_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertoryEight_leve1_down"  name="repertoryEight_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryEight_leve2_up" name="repertoryEight_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertoryEight_leve2_down"  name="repertoryEight_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  data-value="repertoryEight_leve3_up" name="repertoryEight_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertoryEight_leve3_down"  name="repertoryEight_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">9#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryNine" name="repertoryNine" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryNine_leve1_up" name="repertoryNine_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertoryNine_leve1_down"  name="repertoryNine_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryNine_leve2_up" name="repertoryNine_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertoryNine_leve2_down" name="repertoryNine_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryNine_leve3_up" name="repertoryNine_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertoryNine_leve3_down" name="repertoryNine_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">10#仓：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryTen"  name="repertoryTen" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryTen_leve1_up"  name="repertoryTen_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertoryTen_leve1_down" name="repertoryTen_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryTen_leve2_up" name="repertoryTen_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertoryTen_leve2_down" name="repertoryTen_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="repertoryTen_leve3_up" name="repertoryTen_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="repertoryTen_leve3_down"   name="repertoryTen_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">矿粉1：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="breeze" name="breeze" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="breeze1_leve1_up" name="breeze1_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="breeze1_leve1_down" name="breeze1_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="breeze1_leve2_up" name="breeze1_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="breeze1_leve2_down" name="breeze1_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="breeze1_leve3_up" name="breeze1_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="breeze1_leve3_down" name="breeze1_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">矿粉2：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="breeze2" name="breeze2" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="breeze2_leve1_up" name="breeze2_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="breeze2_leve1_down" name="breeze2_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="breeze2_leve2_up" name="breeze2_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  data-value="breeze2_leve2_down"  name="breeze2_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  data-value="breeze2_leve3_up" name="breeze2_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="breeze2_leve3_down" name="breeze2_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">矿粉3：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="breeze3" name="breeze3" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="breeze3_leve1_up" name="breeze3_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="breeze3_leve1_down" name="breeze3_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="breeze3_leve2_up" name="breeze3_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="breeze3_leve2_down" name="breeze3_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="breeze3_leve3_up" name="breeze3_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="breeze3_leve3_down" name="breeze3_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">矿粉4：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="breeze4" name="breeze4" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="breeze4_leve1_up"  name="breeze4_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="breeze4_leve1_down"  name="breeze4_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="breeze4_leve2_up"  name="breeze4_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="breeze4_leve2_down"  name="breeze4_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="breeze4_leve3_up" name="breeze4_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  data-value="breeze4_leve3_down" name="breeze4_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">沥青(含量)：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="ratioStone" name="ratioStone" class="my_form_input" value="0.0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  data-value="ratioStone_leve1_up"  name="ratioStone_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="ratioStone_leve1_down"  name="ratioStone_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="ratioStone_leve2_up"  name="ratioStone_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="ratioStone_leve2_down" name="ratioStone_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="ratioStone_leve3_up" name="ratioStone_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="ratioStone_leve3_down" name="ratioStone_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">粗再生料：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="ratioRegenerate1" name="ratioRegenerate1" class="my_form_input" placeholder="0.0">
                    </td>
                    <td class="my_tlabels">细再生料：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="ratioRegenerate2" name="ratioRegenerate2" class="my_form_input" placeholder="0.0">
                    </td>
                    <td class="my_tlabels">中再生料：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="ratioRegenerate3"  name="ratioRegenerate3" class="my_form_input" placeholder="0.0">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">再生料一级预警上/下限：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="regenerate_leve1_up"  name="regenerate_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="regenerate_leve1_down" name="regenerate_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">再生料二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="regenerate_leve2_up" name="regenerate_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required" data-value="regenerate_leve2_down" max="0.0" step="0.01"  name="regenerate_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">再生料三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  data-value="regenerate_leve3_up"  name="regenerate_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required" data-value="regenerate_leve3_down"  max="0.0" step="0.01"  name="regenerate_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">添加剂一：</td>
                    <td>
                        <input type="number"  min="0.0" step="0.01" data-value="ratioAdditive" name="ratioAdditive" class="my_form_input" placeholder="0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="additive_leve1_up" name="additive_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="additive_leve1_down"  name="additive_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="additive_leve2_up" name="additive_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  data-value="additive_leve2_down" name="additive_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="additive_leve3_up" name="additive_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  data-value="additive_leve3_down" name="additive_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">添加剂二：</td>
                    <td>
                        <input type="number"  min="0.0" step="0.01" data-value="ratioAdditive1" name="ratioAdditive1" class="my_form_input" placeholder="0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="additive1_leve1_up" name="additive1_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="additive1_leve1_down" name="additive1_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="additive1_leve2_up" name="additive1_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  data-value="additive1_leve2_down"  name="additive1_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="additive1_leve3_up"  name="additive1_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  data-value="additive1_leve3_down"  name="additive1_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">添加剂三：</td>
                    <td>
                        <input type="number"  min="0.0" step="0.01" name="ratioAdditive2" data-value="ratioAdditive2"  class="my_form_input" placeholder="0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="additive2_leve1_up"  data-value="additive2_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="additive2_leve1_down"  name="additive2_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="additive2_leve2_up"  name="additive2_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  data-value="additive2_leve2_down"    name="additive2_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  data-value="additive2_leve3_up"  name="additive2_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="additive2_leve3_down" name="additive2_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">添加剂四：</td>
                    <td>
                        <input type="number"  min="0.0" step="0.01" data-value="ratioAdditive3" name="ratioAdditive3" class="my_form_input" placeholder="0">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="additive3_leve1_up" name="additive3_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="additive3_leve1_down"  name="additive3_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="additive3_leve2_up"   name="additive3_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="additive3_leve2_down"  name="additive3_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01" data-value="additive3_leve3_up"  name="additive3_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01" data-value="additive3_leve3_down"  name="additive3_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">沥青温度上/下限：</td>
                    <td>
                        <input type="number" name="temperatureAsphaltUp" data-value="temperatureAsphaltUp" class="my_form_input" placeholder="上限">
                        <input type="number" name="temperatureAsphalt" data-value="temperatureAsphalt" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureAsphalt_leve1_up" data-value="temperatureAsphalt_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureAsphalt_leve1_down"  data-value="temperatureAsphalt_leve1_down"  class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureAsphalt_leve2_up" data-value="temperatureAsphalt_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureAsphalt_leve2_down" data-value="temperatureAsphalt_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureAsphalt_leve3_up"  data-value="temperatureAsphalt_leve3_up"  class="my_form_input" placeholder="上限">
                        <input type="number"required="required"  max="0.0" step="0.01"  name="temperatureAsphalt_leve3_down" data-value="temperatureAsphalt_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">骨料加热温度上/下限：</td>
                    <td>
                        <input type="number" name="temperatureAggregateUp" data-value="temperatureAggregateUp" class="my_form_input" placeholder="上限">
                        <input type="number" name="temperatureAggregate" data-value="temperatureAggregate" class="my_form_input" placeholder="下限">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureAggregate_leve1_up" data-value="temperatureAggregate_leve1_up"  class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureAggregate_leve1_down" data-value="temperatureAggregate_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureAggregate_leve2_up" data-value="temperatureAggregate_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureAggregate_leve2_down" data-value="temperatureAggregate_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureAggregate_leve3_up" data-value="temperatureAggregate_leve3_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureAggregate_leve3_down" data-value="temperatureAggregate_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>

                    <td class="my_tlabels">混合料温度上/下限：</td>
                    <td>
                        <input type="number" name="temperatureMixtureUp" data-value="temperatureMixtureUp"  class="my_form_input" placeholder="上限">
                        <input type="number" name="temperatureMixture" data-value="temperatureMixture" class="my_form_input" placeholder="下限">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureMixture_leve1_up" data-value="temperatureMixture_leve1_up"  class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureMixture_leve1_down" data-value="temperatureMixture_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureMixture_leve2_up" data-value="temperatureMixture_leve2_up" class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureMixture_leve2_down" data-value="temperatureMixture_leve2_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureMixture_leve3_up" data-value="temperatureMixture_leve3_up"  class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureMixture_leve3_down"  data-value="temperatureMixture_leve3_down"  class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">一仓温度上/下限限：</td>
                    <td>
                        <input type="number" name="temperatureMillingUp" data-value="temperatureMillingUp" class="my_form_input" placeholder="上限">
                        <input type="number" name="temperatureMilling" data-value="temperatureMilling" class="my_form_input" placeholder="下限">
                    </td>
                    <td class="my_tlabels">一级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureMilling_leve1_up" data-value="temperatureMilling_leve1_up" class="my_form_input"   placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureMilling_leve1_down" data-value="temperatureMilling_leve1_down" class="my_form_input"  placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">二级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureMilling_leve2_up" data-value="temperatureMilling_leve2_up"  class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureMilling_leve2_down"  data-value="temperatureMilling_leve2_down"   class="my_form_input" placeholder="下限 例: -10">
                    </td>
                    <td class="my_tlabels">三级预警上/下限设定值：</td>
                    <td>
                        <input type="number" min="0.0" step="0.01"  name="temperatureMilling_leve3_up" data-value="temperatureMilling_leve3_up"  class="my_form_input" placeholder="上限">
                        <input type="number" required="required"  max="0.0" step="0.01"  name="temperatureMilling_leve3_down" data-value="temperatureMilling_leve3_down" class="my_form_input" placeholder="下限 例: -10">
                    </td>
                </tr>
                <tr>
                    <td class="my_tlabels">模板在机组一的编号：</td>
                    <td>
                        <input type="number" name="crew1ModeleId" data-value="crew1ModeleId"  required="required"  class="my_form_input" style="width: 120px;" value="0">
                    </td>
                    <td class="my_tlabels">模板在机组二的编号：</td>
                    <td>
                        <input type="number"  name="crew2ModeleId" data-value="crew2ModeleId"  required="required"  class="my_form_input" style="width: 120px;" value="0">
                    </td>
                    <td class="my_tlabels">上传人：</td>
                    <td>
                        <input type="text" name="upUser" data-value="upUser"  required="required"  class="my_form_input" style="width: 120px;" value="张三">
                    </td>
                    <td class="my_tlabels">备注：</td>
                    <td>
                        <input type="text" name="remark" data-value="remark" required="required"  class="my_form_input" style="width: 120px;" value="对模板相关备注">
                    </td>
                </tr>
                </tbody>

            </table>

            <div class="form_btn">
                <input type="submit"    value="修改" class="btn_save">
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