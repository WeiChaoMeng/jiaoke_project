<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>

<head>
    <meta charset="utf-8">
    <title>实验审批表</title>
    <link type="text/css" rel="stylesheet" href="/static/css/qc/experimental_model.css">
    <style>
        .handle-container {
            margin: 20px 0;
        }

        .handle-title {
            width: 100%;
            background: #afdbef;
            height: 40px;
        }

        .handle-title-script {
            font-size: 14px;
            padding-left: 10px;
            line-height: 40px;
            border: 1px #b3b3b3 solid;
            border-bottom: none;
        }

        .opinion-column {
            resize: none;
            width: 100%;
            font-size: 14px;
            height: 100%;
            outline: none;
            display: block;
            color: #000;
            border: solid 1px #c6c6c6;
            padding: 5px;
        }

        .form-but {
            text-align: center;
            margin-bottom: 20px;
        }

        .return-but {
            padding: 7px 20px;
            border: 1px #a5a5a5 solid;
            cursor: pointer;
            background: #ffffff;
            outline: none;
            border-radius: 5px;
        }

        .commit-but {
            padding: 7px 20px;
            border: 1px #a5a5a5 solid;
            cursor: pointer;
            background: #38adff;
            outline: none;
            border-radius: 5px;
            color: #FFFFFF;
        }

        .commit-but:hover, .return-but:hover {
            background: #6dbff9;
            color: #FFFFFF;
        }

        .receipt-container {
            margin-bottom: 20px;
            height: auto;
            border: 1px #b3b3b3 solid;
        }

        .receipt-title {
            width: 100%;
            background: #afdbef;
            height: 40px;
        }

        .receipt-script {
            font-size: 14px;
            padding-left: 10px;
            line-height: 40px;
        }

        .receipt-style {
            height: 15px;
        }

        .comment-container {
            height: 25px;
            padding: 10px;
            font-size: 13px;
        }

        .comment-style {
            width: 100%;
            height: 100%;
            line-height: 25px;
            background: #d8eef9;
        }

        .comment-name {
            float: left;
            margin: 0 15px;
            width: 40px;
        }

        .comment-message {
            float: left;
            margin: 0 15px;
        }

        .comment-date {
            float: left;
            margin: 0 15px;
        }
    </style>
</head>

<body style="width: 95%;">
<h1>北京市政路桥建材集团有限公司路驰分公司
    <span>实验报告</span>
</h1>
<input type="text" style="margin-left: 60%;    border: none;text-align: right;" name="experiment_num"
       value="No.2019-BLH-0473" readonly="readonly"/>
<input type="text" style="display: none;" name="Id" value="No.2019-BLH-0473"/>
<input type="text" style="display: none;" name="order_ticket_num" value="No.2019-BLH-0473"/>
<input type="text" style="display: none;" name="materials_num" value="No.2019-BLH-0473"/>

<form class="bootstrap-frm">

    <label>
        <span>样品名称 :</span>
        <input type="text" class="doubleInput" name="materials_name" value="No.2019-BLH-0473" readonly="readonly"/>
        <span>取样地点 :</span>
        <input type="text" class="doubleInput" name="sampling_spot" value="涞水" readonly="readonly"/>
    </label>

    <label>
        <span>样品产地 :</span>
        <input type="text" class="simplInput" name="manufacturers_name" value="涞水" readonly="readonly"/>
    </label>

    <label>
        <span>样品规格 :</span>
        <input type="text" class="doubleInput" name="sampling_standard" value="机制砂" readonly="readonly"/>
        <span>取样日期 :</span>
        <input type="text" class="doubleInput" name="sampling_date" value="Valid Email Address" readonly="readonly"/>
    </label>

    <label>
        <!-- <span>样品类别 :</span>
        <input type="email" class="doubleInput" name="email" placeholder="Valid Email Address" /> -->
        <span>实验日期 :</span>
        <input type="text" class="simplInput" name="test_date" value="Valid Email Address" readonly="readonly"/>
    </label>

    <label>
        <span>委托单位 :</span>
        <input type="text" class="simplInput" name="entrusting_party" value="涞水" readonly="readonly"/>
    </label>


    <label>
        <span>实验项目 :</span>
        <input type="text" class="simplInput" name="required_experimental" value="涞水" readonly="readonly"/>
    </label>

    <label>
        <span>实验规程 :</span>
        <input type="text" class="simplInput" name="experimental_procedures" value="涞水" readonly="readonly"/>
    </label>

    <div class="experiment">
        <span>实验检测结果 :</span>
        <HR style="border:3px solid #DADADA" SIZE=1>
        <div class="table">
            <table border="1" cellspacing="0" cellpadding="10" width="100%" id="firstTable">
                <thead id="firstThead">
                <tr class="firstHead">
                    <th colspan="1" rowspan="2">实验项目</th>
                    <th colspan="1" rowspan="2">技术要求</th>
                    <th colspan="3">试验结果</th>
                    <th colspan="1" rowspan="2">试验方法</th>
                </tr>
                <tr class="twoHead" id="firstTwoHead">
                    <th>机制砂</th>
                </tr>
                </thead>
                <tbody id="firstTbody">
                <tr>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="表观相对密度"
                               readonly="readonly"/>
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="≯26" readonly="readonly"/>
                    </td>
                    <td colspan="3">
                        <input type="text" class="td_input" name="num" placeholder="11.0"/>
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="T0316"
                               readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="毛体积相对密度"
                               readonly="readonly"/>
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="≯26" readonly="readonly"/>
                    </td>
                    <td colspan="3">
                        <input type="text" class="td_input" name="num" placeholder="11.0"/>
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="T0316"
                               readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="砂当量      %"
                               readonly="readonly"/>
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="≯26" readonly="readonly"/>
                    </td>
                    <td colspan="3">
                        <input type="text" class="td_input" name="num" placeholder="11.0"/>
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="T0316"
                               readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="压碎值   %"
                               readonly="readonly"/>
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="≯26" readonly="readonly"/>
                    </td>
                    <td colspan="3">
                        <input type="text" class="td_input" name="num" placeholder="11.0"/>
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="T0316"
                               readonly="readonly"/>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="table" id="secondDiv">
            <table border="1" cellspacing="0" cellpadding="10" width="100%" id="secondTable">
                <thead>
                <tr class="twoHead" id="secondTwoHead">
                    <th>筛孔mm</th>
                    <th>4.75</th>
                    <th>2.36</th>
                    <th>1.18</th>
                    <th>0.6</th>
                    <th>0.3</th>
                    <th>0.15</th>
                    <th>0.075</th>
                </tr>
                </thead>
                <tbody id="secondTbody">
                <tr>
                    <td>
                        <input type="text" class="td_input" name="num" value="机制砂" readonly="readonly"/>
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="0.4"/>
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="0.4"/>
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="0.4"/>
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="0.4"/>
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="0.4"/>
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="0.4"/>
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="0.4"/>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <HR style="border:3px solid #DADADA;" SIZE=1>
    </div>

    <div class="conclusion">
        <span>结论：&nbsp;</span>
        <textarea type="text" id="verdict"
                  placeholder="  依据《公路沥青路面施工技术规范》(JTG F40-2004 )，该检测指标符合要求。"> 依据《公路沥青路面施工技术规范》(JTG F40-2004 )，该检测指标符合要求。</textarea>
    </div>

    <div class="report">
        <span>负责人 :</span>
        <shiro:hasPermission name="experimentPrincipal">
            <input type="text" name="charge_person" id="chargePerson" value="${nickname}" readonly/>
        </shiro:hasPermission>
        <shiro:lacksPermission name="experimentPrincipal">
            <input type="text" name="charge_person" readonly/>
        </shiro:lacksPermission>

        <span>审核 :</span>
        <shiro:hasPermission name="experimentReviewer">
            <input type="text" name="check_person" id="checkPerson" value="${nickname}" readonly/>
        </shiro:hasPermission>
        <shiro:lacksPermission name="experimentReviewer">
            <input type="text" name="check_person" id="lackCheckPerson" readonly/>
        </shiro:lacksPermission>

        <span>报告人 :</span>
        <input type="text" name="report_person" readonly="readonly"/>
    </div>

    <div class="datediv">
        <span>报告日期 :</span>
        <input type="text" id="report_date" name="report_date" value=" 2017-03-18" readonly="readonly"/>
    </div>
</form>

<div style="width: 65%;margin: 0 auto">

    <div class="handle-container">

        <shiro:hasAnyPermission name="experimentPrincipal,experimentReviewer,materialPrincipal">
            <div class="handle-title">
                <div class="handle-title-script">处理意见</div>
            </div>

            <textarea id="processingOpinion" class="opinion-column" style="height: 72px;"></textarea>
        </shiro:hasAnyPermission>

        <div class="form-but" style="margin-top: 20px;">

            <shiro:hasAnyPermission name="experimentPrincipal,experimentReviewer">
                <button type="button" class="return-but" style="margin-right: 10px;" onclick="commitApproval(2)">回退
                </button>
            </shiro:hasAnyPermission>

            <button type="button" class="commit-but" onclick="commitApproval(1)">同意</button>

            <shiro:hasAnyPermission name="experimentPrincipal,experimentReviewer">
                <button type="button" class="return-but" style="margin-right: 10px;" onclick="commitApproval(3)">发送材料部</button>
            </shiro:hasAnyPermission>
        </div>
    </div>


    <div class="receipt-container">
        <div class="receipt-title">
            <div class="receipt-script">回执意见（共${commentsSize}条）</div>
        </div>

        <c:forEach items="${commentsList}" var="comments">
            <div class="comment-container">
                <div class="comment-style">
                    <span class="comment-name">${comments.userName}</span>
                    <span class="comment-message">${comments.message}</span>
                    <span class="comment-date">${comments.timeStr}</span>
                </div>
            </div>
        </c:forEach>

        <div class="receipt-style"></div>
    </div>
</div>

<input id="path" value="${path}" type="hidden">
<input id="id" value="${id}" type="hidden">
<input id="taskId" value="${taskId}" type="hidden">
</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/layer/layer.js"></script>
<script type="text/javascript" src="/static/js/qc/experimental_message.js"></script>
<script>

    //处理结果
    function commitApproval(flag) {
        var processingOpinion = $('#processingOpinion').val();
        var taskId = $('#taskId').val();
        var chargePerson = $('#chargePerson').val();
        var checkPerson = $('#checkPerson').val();
        var id = $('#id').val();

        $.ajax({
            type: "post",
            url: '/experimentApprovalSubmit',
            async: false,
            data: {
                'processingOpinion': processingOpinion,
                'taskId': taskId,
                'flag': flag,
                'chargePerson': chargePerson,
                'checkPerson': checkPerson,
                'id': id
            },
            success: function (data) {
                if (data === 'success') {
                    //返回上一页
                    window.location.href = '${path}/oaHomePage/toOaHomePage';
                    layer.msg('提交成功！');
                } else {
                    layer.msg('提交失败！');
                }
            },
            error: function (result) {
                layer.msg("出错！");
            }
        })
    }
</script>
</html>