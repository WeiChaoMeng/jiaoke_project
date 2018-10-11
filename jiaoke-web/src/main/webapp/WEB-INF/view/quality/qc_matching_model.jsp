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
<%
    request.setAttribute("path",request.getContextPath());
%>
<head>
    <meta charset="utf-8">
    <title>配比模板</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/css/style/green.css" rel="stylesheet" type="text/css" id='link'>
    <link href="/static/js/datepicker/css/bootstrap-datepicker.css" rel="stylesheet">
</head>

<body style="padding:0px 8px 100px 8px;">


    <ul class="toolbar">
        <li><a href="#" id="from_click" ><i class="toolico iconfont">&#xe7e9;</i>新建</a></li>
        <li><a href="#" id="btn_click"><i class="toolico iconfont">&#xe7ea;</i>删除</a></li>
        <li>
            <a href="/static/download/commons-io-2.4-src.zip" download="commons-io-2.4-src.zip">
                <i class="toolico iconfont">&#xe7eb;</i>导出</a>
        </li>
    </ul>
    <!--toolbar end-->

    <!--tablebox start-->
    <div class="tablebox">
        <table>

            <thead>
                <th class="num"></th>
                <th>模板编号</th>
                <th>模板名称</th>
                <th>上传时间</th>
                <th>修改时间</th>
                <th>上传人</th>
                <th>操作</th>
            </thead>

            <tbody>

            <c:forEach items="${pageBean.pageData}" var="item">
                <tr>
                    <td class="tdnum"><input type="checkbox"></td>
                    <td>${item.messageId}</td>
                    <td><a href="#">${item.modelName}</a></td>
                    <td>${item.createTime}</td>
                    <td>${item.modifyTime}</td>
                    <td>${item.createUser}</td>
                    <td><a style="color: rgb(114, 112, 209);" >查看</a></td>
                </tr>
            </c:forEach>

            </tbody>

        </table>
    </div>
    <!--tablebox end-->

    <!--pagination start-->
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
    <!--pagination end-->
    <!--删除弹出-->
    <div class="popup_back" style="display:none;">
    </div>
    <div class="popup_window_first" style="display:none;">
        <p class="popup_cont">是否删除？</p>
        <a href="javascript:void(0)" class="popup_btn" onclick="closeWindow();">确定</a>
        <a href="javascript:void(0)" class="popup_btn" onclick="closeWindow();">取消</a>
    </div>
    <!--新建弹出-->
    <div class="form_background"  style="display:none;" ></div>
        <div class="form_model" style="display:none;" >
            <form  id="myForm" style="padding-top:7%;"  >
                <table class="my_form_table">
            
                    <tbody>
            
                        <tr>
                            <td class="tlabels">配比名称：</td>
                            <td colspan="3">
                                <input type="text" name="proName" style="width: 97%;" class="forminput inputstyle" style="width: 72%;" value="cl-17沥青模板"">
                            </td>
                        </tr>
            
                        <tr>
                            <td class="tlabels">1#仓：</td>
                            <td>
                                <input type="text" name="repertoryOne" class="forminput inputstyle" value="3">
                            </td>
                            <td class="tlabels">2#仓：</td>
                            <td>
                                <input type="text"  name="repertoryTwo" class="forminput inputstyle" value="5">
                            </td>
                        </tr>
            
                        <tr>
                            <td class="tlabels">3#仓：</td>
                            <td>
                                <input type="text" name="repertoryThree" class="forminput inputstyle" value="17">
                            </td>
                            <td class="tlabels">4#仓：</td>
                            <td>
                                <input type="text" name="repertoryFour" class="forminput inputstyle" value="35">
                            </td>
                        </tr>
            
                        <tr>
                            <td class="tlabels">5#仓：</td>
                            <td>
                                <input type="text" name="repertoryFive" class="forminput inputstyle" value="75">
                            </td>
                            <td class="tlabels">6#仓：</td>
                            <td>
                                <input type="text" name="repertorySix" class="forminput inputstyle" value="85">
                            </td>
                        </tr>
            
                        <tr>
                            <td class="tlabels">矿粉：</td>
                            <td>
                                <input type="text" name="breeze" class="forminput inputstyle" value="5">
                            </td>
                            <td class="tlabels">油石比：</td>
                            <td>
                                <input type="text" name="ratioStone" class="forminput inputstyle" value="1.2">
                            </td>
                        </tr>
            
            
                        <tr>
                            <td class="tlabels">沥青加热温度：</td>
                            <td>
                                <input type="text" name="temperatureAsphalt" class="forminput inputstyle" value="157">
                            </td>
                            <td class="tlabels">骨料加热温度：</td>
                            <td>
                                <input type="text" name="temperatureAggregate" class="forminput inputstyle" value="152">
                            </td>
                        </tr>
            
                        <tr>
                            <td class="tlabels">混合料出厂温度：</td>
                            <td>
                                <input type="text" name="temperatureMixture" class="forminput inputstyle" value="52">
                            </td>
                            <td class="tlabels">铣刨料加热温度：</td>
                            <td>
                                <input type="text" name="temperatureMilling" class="forminput inputstyle" value="37">
                            </td>
                        </tr>
            
                        <tr>
                            <td class="tlabels">再生料：</td>
                            <td>
                                <select class="form_swidth" name="regenerate" data-value="0">
                                    <c:forEach items="${listAdditive}" var="item">
                                        <option value="${item.id}">${item.name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td class="tlabels">再生料比1、2：</td>
                            <td>
                                <input type="text" name="ratioRegenerate1" class="my_form_input" value="2">
                                <input type="text" name="ratioRegenerate2" class="my_form_input" value="1">
                            </td>
                        </tr>
            
            
                        <tr>
                            <td class="tlabels">添加剂：</td>
                            <td>
                                <select class="form_swidth"  name="additive" data-value="0">
                                    <c:forEach items="${listRegenerate}" var="item">
                                        <option value="${item.id}">${item.name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td class="tlabels">添加剂比：</td>
                            <td>
                                <input type="text" name="ratioAdditive" class="forminput inputstyle" value="2">
                            </td>
                        </tr>
            
                    </tbody>
            
                </table>
            
                <div class="form_btn">
                    <input type="submit"  onclick="addRation()" value="保存" class="btn_save">
                    <input type="button" onclick="closefrom()" value="关闭" class="btn_cancel">
                </div>
            
            </form>
        </div>
</body>

<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/js/skin.js"></script>
<script type="text/javascript" src="/static/js/jquery.select.js"></script>
<script src="/static/js/layer/layer.js"></script>


<script type="text/javascript" src="/static/js/datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/static/js/datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>

<script type="text/javascript">
    $("#start").datepicker({
        "language": "zh-CN",
        "format": 'yyyy-mm-dd'
    })
    $("#end").datepicker({
        "language": "zh-CN",
        "format": 'yyyy-mm-dd'
    })
    $(".date .iconfont").click(function() {
        $(this).prev().trigger("focus");
    });

    $('select.select').select();

    //点击弹出删除按钮
    function closeWindow() {
        $('.popup_back,.popup_window_first').hide();
    }
    $('#btn_click').click(function() {
        $('.popup_window_first,.popup_back').show();
    });
    
    //点击弹出添加模板
    function closefrom() {
            $('.form_background,.form_model').hide();
    }
    $('#from_click').click(function () {
        $('.form_background,.form_model').show();
    });

    function addRation(){
        debugger
        var form = document.getElementById("myForm");
        var f = new FormData();
        $.ajax({
            url:${path}+"addRation.do",
            type:"post",
            async:false,
            data:f,
            success:function (res) {
                if (res.messages == 'success'){
                    location.reload();
                }
            }
        })
    }

</script>

<script>
    ;
    ! function() {
        //关于
        $('#add').on('click', function() {

            parent.layer.open({
                title: '信息添加',
                type: 2,
                area: ['600px', '450px'],
                fixed: false, //不固定
                maxmin: true,
                content: 'add.html'
            });

        });


    }();
</script>

</html>