<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>用车审批单审批处理</title>
    <link href="../../../../static/css/oa/act_table.css" rel="stylesheet" type="text/css">
    <link href="../../../../static/js/date_pickers/date_picker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../../../../static/js/jeDate/skin/jedate.css">
</head>

<body id="body">

<div class="table-title">
    <span>${oaActCar.title}</span>
</div>

<div class="top_toolbar" id="tool">
    <div class="top-toolbar-details">
        <div class="top-info-bar-user">
            <span>${oaActCar.promoterStr}</span>
        </div>

        <div class="top-info-bar-time">
            <span>${oaActCar.createTimeStr}</span>
        </div>

        <div class="printing-but-style">
            <button type="button" class="cursor_hand" onclick="printContent()">&#xea0e; 打印</button>
        </div>
    </div>

    <c:choose>
        <c:when test="${oaActCar.annex != ''}">
            <div class="top_toolbar" id="annexList" style="display: block;">
                <div class="top-annexes-details">

                    <div class="annexes-icon-details">
                        <button type="button" class="cursor_hand">&#xeac1;</button>
                    </div>

                    <c:forTokens items="${oaActCar.annex}" delims="," var="annex">
                        <div class="table-file">
                            <div class="table-file-content">
                                <span class="table-file-title"
                                      title="${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}">${fn:substring(annex,annex.lastIndexOf("_")+1,annex.length())}</span>
                                <a class="table-file-download icon"
                                   href="/fileDownloadHandle/download?fileName=${annex}"
                                   title="下载">&#xebda;</a>
                            </div>
                        </div>
                    </c:forTokens>
                </div>
            </div>
        </c:when>
    </c:choose>
</div>

<form id="oaActCar">
    <table class="formTable" style="margin: 0">
        <tbody>
        <tr>
            <td class="tdLabel">使用人</td>
            <td class="table-td-content">
                <input type="hidden" id="id" name="id" value="${oaActCar.id}">
                <input type="hidden" id="title" name="title" value="${oaActCar.title}">
                ${oaActCar.user}
            </td>

            <td class="tdLabel">事由</td>
            <td class="table-td-reason">
                ${oaActCar.cause}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">车牌号</td>
            <td class="table-td-content">
                ${oaActCar.licensePlate}
            </td>

            <td class="tdLabel">车辆性质</td>
            <td class="table-td-content">
                <div>
                    <c:choose>
                        <c:when test="${oaActCar.properties == 0}">
                            <input type="radio" style="vertical-align: middle;margin-right: 5px;" checked disabled>
                            <span style="margin-right: 10px;">私家车</span>
                        </c:when>

                        <c:otherwise>
                            <input type="radio" style="vertical-align: middle;margin-right: 5px;" disabled>
                            <span style="margin-right: 10px;">私家车</span>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${oaActCar.properties == 1}">
                            <input type="radio" style="vertical-align: middle;margin-right: 5px;" checked disabled>
                            <span>享车补车</span>
                        </c:when>

                        <c:otherwise>
                            <input type="radio" style="vertical-align: middle;margin-right: 5px;" disabled>
                            <span>享车补车</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">用车时间</td>
            <td class="table-td-content">
                ${oaActCar.startTime}
            </td>

            <td class="tdLabel">目的地</td>
            <td class="table-td-content">
                ${oaActCar.destination}
            </td>
        </tr>

        <tr>
            <td class="tdLabel">公里基数</td>
            <td class="table-td-content">
                ${oaActCar.cardinalNumber}
                <input type="hidden" id="cardinalNumber" value="${oaActCar.cardinalNumber}">
            </td>

            <td class="tdLabel">使用后数</td>
            <td class="table-td-content">
                <shiro:hasPermission name="lookup">
                    <input type="text" class="formInput" name="after" id="after"
                           onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" onblur="resultNum()" autocomplete="off">
                </shiro:hasPermission>
                <shiro:lacksPermission name="lookup">
                    ${oaActCar.after}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">行驶数</td>
            <td class="table-td-content">
                <shiro:hasPermission name="lookup">
                    <input type="text" class="formInput-readonly" id="drivingNumber" name="drivingNumber" readonly>
                </shiro:hasPermission>
                <shiro:lacksPermission name="lookup">
                    ${oaActCar.drivingNumber}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">计费(元)</td>
            <td class="table-td-content">
                <shiro:hasPermission name="lookup">
                    <input type="text" class="formInput-readonly" id="billing" name="billing" readonly>
                </shiro:hasPermission>
                <shiro:lacksPermission name="lookup">
                    ${oaActCar.billing}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">查表计数人</td>
            <td class="table-td-content">
                <shiro:hasPermission name="lookup">
                    <div style="width: 100%;height: 100%;" id="lookupContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="lookup">
                    ${oaActCar.lookup}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">交车时间</td>
            <td class="table-td-content">
                <shiro:hasPermission name="lookup">
                    <div style="width: 100%;height: 100%;" id="lookupDateContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="lookup">
                    <input type="hidden" class="formInput je-end-date" onfocus="this.blur()">
                    ${oaActCar.endTime}
                </shiro:lacksPermission>
            </td>
        </tr>

        <tr>
            <td class="tdLabel">审核人</td>
            <td class="table-td-content">
                <shiro:hasPermission name="principal">
                    <div style="width: 100%;height: 100%;" id="principalContent"></div>
                </shiro:hasPermission>

                <shiro:lacksPermission name="principal">
                    ${oaActCar.principal}
                </shiro:lacksPermission>
            </td>

            <td class="tdLabel">批准人</td>
            <td class="table-td-content">
                <shiro:hasPermission name="supervisor">
                    <div style="width: 100%;height: 100%;" id="principalContent"></div>
                </shiro:hasPermission>
                <shiro:lacksPermission name="supervisor">
                    ${oaActCar.supervisor}
                </shiro:lacksPermission>
            </td>
        </tr>
        </tbody>
    </table>
</form>

<div class="notice-tips">
    <span class="notice-tips-mark">*</span>
    <span class="notice-tips-script">说明：1.每公里2元。使用的车辆为享受车补待遇的，每公里1.2元。2.审核人为使用部门负责人，批准人为使用人部门主管领导。3.多人同时使用时费用均摊。4.费用按月报销或扣除。</span>
</div>

<div class="form-but" id="ret">
    <shiro:hasAnyPermission name="principal,supervisor,lookup">
        <button type="button" class="return-but" style="margin-right: 10px;" onclick="approvalProcessing(2)">回退</button>
    </shiro:hasAnyPermission>

    <shiro:hasPermission name="lookup">
        <button type="button" class="commit-but" onclick="commitAndUpdate(1)">同意</button>
    </shiro:hasPermission>

    <shiro:lacksPermission name="lookup">
        <button type="button" class="commit-but" onclick="approvalProcessing(1)">同意</button>
    </shiro:lacksPermission>
</div>

</body>
<script type="text/javascript" src="../../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../../static/js/jeDate/src/jedate.js"></script>
<script src="../../../../static/js/oa/layer/layer.js"></script>
<script>
    //流程执行步骤
    var car = JSON.parse('${oaActCarJson}');
    //标记
    var flag = 0;
    if (flag === 0) {
        if (car.lookup === "" || car.lookup === undefined) {
            $('#lookupContent').append('<input type="text" class="formInput-readonly" name="lookup" value="${nickname}" readonly="readonly">');
            $('#lookupDateContent').append('<input type="text" class="formInput je-end-date" name="endTime" onfocus="this.blur()">');
            flag = 1;
        } else {
            $('#lookupContent').append(car.lookup);
            $('#lookupDateContent').append(car.endTime);
        }
    } else {
        $('#lookupContent').append(car.lookup);
        $('#lookupDateContent').append(car.endTime);
    }

    if (flag === 0) {
        if (car.principal === "" || car.principal === undefined) {
            $('#principalContent').append('<input type="text" class="formInput-readonly" name="principal" value="${nickname}" readonly="readonly"><input type="hidden" name="principalDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#principalContent').append(car.principal);
        }
    } else {
        $('#principalContent').append(car.principal);
    }

    if (flag === 0) {
        if (car.supervisor === "" || car.supervisor === undefined) {
            $('#principalContent').append('<input type="text" class="formInput-readonly" name="supervisor" value="${nickname}" readonly="readonly"><input type="hidden" name="supervisorDate" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">');
            flag = 1;
        } else {
            $('#principalContent').append(car.supervisor);
        }
    } else {
        $('#principalContent').append(car.supervisor);
    }


    //日期选择器
    jeDate(".je-end-date", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD hh",
        zIndex: 100000,
    });

    //任务Id
    var taskId = JSON.parse('${taskId}');

    //查表计数人提交
    function commitAndUpdate(flag) {

        if ($.trim($("#drivingNumber").val()) === '') {
            top.window.tips("行驶数不可以为空！", 6, 5, 1000);
        } else {
            $.ajax({
                type: "POST",
                url: '${path}/car/lookupApprovalSubmit',
                data: $('#oaActCar').serialize() + "&taskId=" + taskId + "&flag=" + flag,
                error: function (request) {
                    window.top.tips("出错！", 6, 2, 1000);
                },
                success: function (result) {
                    if (result === "success") {
                        window.top.tips("处理成功！", 0, 1, 1000);
                        window.location.href = "${path}/oaIndex.do";
                    } else {
                        window.top.tips("处理失败！", 0, 1, 1000);
                    }
                }
            })
        }
    }

    //提交
    function approvalProcessing(flag) {
        $.ajax({
            type: "post",
            url: '${path}/car/lookupApprovalSubmit',
            data: $('#oaActCar').serialize() + "&taskId=" + taskId + "&flag=" + flag,
            async: false,
            success: function (data) {
                if (data === 'success') {
                    //返回上一页
                    window.location.href = '${path}/oaHomePage/toOaHomePage';
                    window.top.tips("处理成功！", 0, 1, 1000);
                } else {
                    window.top.tips("处理失败！", 0, 1, 1000);
                }
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }

    //计算行驶数
    function resultNum() {
        var beforeNum = $('#cardinalNumber').val();
        var afterNum = $('#after').val();

        if (afterNum !== "") {
            if (parseInt(afterNum) <= parseInt(beforeNum)) {
                layer.tips('不可以小于等于公里基数', '#after', {
                    tips: 1
                });
                $('#drivingNumber').val('');
            } else {
                $('#drivingNumber').val(parseInt(afterNum) - parseInt(beforeNum));
                $('#billing').val((parseInt(afterNum) - parseInt(beforeNum)) * 2);
            }
        } else {
            $('#drivingNumber').val('');
        }
    }

    //打印
    function printContent() {
        $('#tool,#ret').hide();
        $('#body').css('width', '100%');
        //执行打印
        window.print();
        $('#tool,#ret').show();
        $('#body').css('width', '80%');
    }
</script>
</html>

