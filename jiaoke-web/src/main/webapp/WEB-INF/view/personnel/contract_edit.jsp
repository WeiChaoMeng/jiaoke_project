<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <title>编辑合同</title>
    <link type="text/css" rel="stylesheet" href="../../../static/js/jeDate/skin/jedate.css">
    <link type="text/css" rel="stylesheet" href="../../../static/css/personnel/personnelAdd.css">
</head>
<body>
<div class="outer-style" style="width: 80%">
    <div class="title">
        <span>编辑员工合同信息</span>
    </div>

    <form id="userContract">
        <table>
            <tbody>
            <tr>
                <td class="table-td-name">姓名</td>
                <td>
                    <input type="text" value="${userContract.name}" class="input-readonly" readonly>
                    <input type="hidden" name="id" value="${userContract.id}">
                </td>

                <td class="table-td-name">性别</td>
                <td>
                    <input type="text" value="${userContract.sex}" class="input-readonly" readonly>
                </td>

                <td class="table-td-name">入职日期</td>
                <td>
                    <input type="text" value="${userContract.joinedDate}" class="input-readonly" readonly>
                </td>
            </tr>

            <tr>
                <td class="table-td-name" colspan="6" style="text-align: center;padding: 10px 0;font-size: 14px;">签订情况</td>
            </tr>

            <tr>
                <td class="table-td-name">首次签订期限</td>
                <td>
                    <select name="firstTerm">
                        <c:choose>
                            <c:when test="${userContract.firstTerm == 0}">
                                <option value="0" selected>—</option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">—</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${userContract.firstTerm == 1}">
                                <option value="1" selected>三年</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">三年</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${userContract.firstTerm == 2}">
                                <option value="2" selected>五年</option>
                            </c:when>
                            <c:otherwise>
                                <option value="2">五年</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${userContract.firstTerm == 3}">
                                <option value="3" selected>无固定</option>
                            </c:when>
                            <c:otherwise>
                                <option value="3">无固定</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${userContract.firstTerm == 4}">
                                <option value="4" selected>其他</option>
                            </c:when>
                            <c:otherwise>
                                <option value="4">其他</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>

                <td class="table-td-name">首次签订日期</td>
                <td>
                    <input type="text" name="firstSign" class="first-sign-picker" value="${userContract.firstSign}"
                           onfocus="this.blur()">
                </td>

                <td class="table-td-name">首次签订终止日期</td>
                <td>
                    <input type="text" name="firstStop" class="first-stop-picker" value="${userContract.firstStop}"
                           onfocus="this.blur()">
                </td>
            </tr>

            <tr>
                <td class="table-td-name" colspan="6" style="text-align: center;padding: 10px 0;font-size: 14px;">签订情况</td>
            </tr>

            <tr>
                <td class="table-td-name">续签期限</td>
                <td>
                    <select name="renewTerm">
                        <c:choose>
                            <c:when test="${userContract.renewTerm == 0}">
                                <option value="0" selected>—</option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">—</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${userContract.renewTerm == 1}">
                                <option value="1" selected>三年</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">三年</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${userContract.renewTerm == 2}">
                                <option value="2" selected>五年</option>
                            </c:when>
                            <c:otherwise>
                                <option value="2">五年</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${userContract.renewTerm == 3}">
                                <option value="3" selected>无固定</option>
                            </c:when>
                            <c:otherwise>
                                <option value="3">无固定</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${userContract.renewTerm == 4}">
                                <option value="4" selected>其他</option>
                            </c:when>
                            <c:otherwise>
                                <option value="4">其他</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>

                <td class="table-td-name">续签签订日期</td>
                <td>
                    <input type="text" name="renewSign" class="renew-sign-picker" value="${userContract.renewSign}"
                           onfocus="this.blur()">
                </td>

                <td class="table-td-name">续签终止日期</td>
                <td>
                    <input type="text" name="renewStop" class="renew-stop-picker" value="${userContract.renewStop}"
                           onfocus="this.blur()">
                </td>
            </tr>

            <tr>
                <td class="table-td-name" colspan="6" style="text-align: center;padding: 10px 0;font-size: 14px;">签订情况</td>
            </tr>

            <tr>
                <td class="table-td-name">最终签订期限</td>
                <td>
                    <select name="lastTerm">
                        <c:choose>
                            <c:when test="${userContract.lastTerm == 0}">
                                <option value="0" selected>—</option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">—</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${userContract.lastTerm == 1}">
                                <option value="1" selected>三年</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">三年</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${userContract.lastTerm == 2}">
                                <option value="2" selected>五年</option>
                            </c:when>
                            <c:otherwise>
                                <option value="2">五年</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${userContract.lastTerm == 3}">
                                <option value="3" selected>无固定</option>
                            </c:when>
                            <c:otherwise>
                                <option value="3">无固定</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${userContract.lastTerm == 4}">
                                <option value="4" selected>其他</option>
                            </c:when>
                            <c:otherwise>
                                <option value="4">其他</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>

                <td class="table-td-name">最终签订日期</td>
                <td>
                    <input type="text" name="lastSign" class="last-sign-picker" value="${userContract.lastSign}"
                           onfocus="this.blur()">
                </td>

                <td class="table-td-name">最终签订终止日期</td>
                <td>
                    <input type="text" name="lastStop" class="last-stop-picker" value="${userContract.lastStop}"
                           onfocus="this.blur()">
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <div class="bottom-button-style">
        <input type="button" value="返回" onclick="previousPage()" class="return-but">
        <input type="button" value="确认" onclick="editPersonnelInfo()" class="commit-but left-spacing">
    </div>
</div>
</body>
<script type="text/javascript" src="../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../static/js/jeDate/src/jedate.js"></script>
<script src="../../../static/js/oa/layer/layer.js"></script>
<script>
    jeDate(".first-sign-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    jeDate(".first-stop-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
        donefun: function (obj) {
            workingYearsChange(obj)
        }
    });

    jeDate(".renew-sign-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    jeDate(".renew-stop-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    jeDate(".last-sign-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
        donefun: function (obj) {
            correctionChange(obj.val)
        }
    });

    jeDate(".last-stop-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    //返回上一页
    function previousPage() {
        window.history.back();
    }

    //提交修改
    function editPersonnelInfo() {
        $.ajax({
            type: "POST",
            url: '${path}/personnel/contractEdit',
            data: $('#userContract').serialize(),
            error: function (request) {
                layer.msg("出错！");
            },
            success: function (result) {
                if (result === "success") {
                    window.location.href = "${path}/personnel/toContract?page=1";
                    top.window.tips("编辑成功！", 0, 1, 1000);
                } else {
                    top.window.tips("编辑失败！", 0, 2, 1000);
                }
            }
        })
    }
</script>
</html>
