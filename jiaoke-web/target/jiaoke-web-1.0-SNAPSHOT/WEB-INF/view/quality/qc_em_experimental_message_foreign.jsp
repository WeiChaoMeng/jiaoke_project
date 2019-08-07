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

<head>
    <meta charset="utf-8">
    <title>实验信息</title>
    <link type="text/css" rel="stylesheet" href="/static/css/qc/experimental_model.css">
</head>
<body style="width: 95%;">
<h1>北京市政路桥建材集团有限公司路驰分公司
    <span>实验报告</span>
</h1>
<input type="text" style="margin-left: 60%;    border: none;text-align: right;" name="experiment_num"
       value = "No.2019-BLH-0473" readonly="readonly" />
<input type="text" style="display: none;" name="Id" value = "No.2019-BLH-0473"  />
<input type="text" style="display: none;" name="order_ticket_num" value = "No.2019-BLH-0473"  />
<input type="text" style="display: none;" name="materials_num" value = "No.2019-BLH-0473"  />

<form  class="bootstrap-frm">

    <label>
        <span>样品名称 :</span>
        <input type="text" class="doubleInput" name="materials_name" value ="No.2019-BLH-0473" readonly="readonly" />
        <span>取样地点 :</span>
        <input type="text" class="doubleInput" name="sampling_spot" value ="涞水" readonly="readonly" />
    </label>

    <label>
        <span>样品产地 :</span>
        <input type="text" class="simplInput" name="manufacturers_name" value ="涞水" readonly="readonly" />
    </label>

    <label>
        <span>样品规格 :</span>
        <input type="text" class="doubleInput" name="sampling_standard" value ="机制砂" readonly="readonly"  />
        <span>取样日期 :</span>
        <input type="text" class="doubleInput" name="sampling_date" value ="Valid Email Address" readonly="readonly"  />
    </label>

    <label>
        <!-- <span>样品类别 :</span>
        <input type="email" class="doubleInput" name="email" placeholder="Valid Email Address" /> -->
        <span>实验日期 :</span>
        <input type="text" class="simplInput" name="test_date" value ="Valid Email Address" readonly="readonly"  />
    </label>

    <label>
        <span>委托单位 :</span>
        <input type="text" class="simplInput" name="entrusting_party" value ="涞水" readonly="readonly" />
    </label>


    <label>
        <span>实验项目 :</span>
        <input type="text" class="simplInput" name="required_experimental" value ="涞水" readonly="readonly" />
    </label>

    <label>
        <span>实验规程 :</span>
        <input type="text" class="simplInput" name="experimental_procedures" value ="涞水" readonly="readonly" />
    </label>

    <div class="experiment">
        <span>实验检测结果 :</span>
        <HR style="border:3 solid #DADADA" SIZE=1>
        <div class="table">
            <table border="1" cellspacing="0" cellpadding="10" width="100%" id="firstTable" >
                <thead id="firstThead">
                <tr class="firstHead">
                    <th colspan="1" rowspan="2">实验项目</th>
                    <th colspan="1" rowspan="2">技术要求</th>
                    <th colspan="3">试验结果</th>
                    <th colspan="1" rowspan="2">试验方法</th>
                </tr>
                <tr class="twoHead" id="firstTwoHead" >
                    <th>机制砂</th>
                </tr>
                </thead>
                <tbody id="firstTbody" >
                <tr>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="表观相对密度"
                               readonly="readonly" />
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="≯26" readonly="readonly" />
                    </td>
                    <td colspan="3">
                        <input type="text" class="td_input" name="num" placeholder="11.0" />
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="T0316"
                               readonly="readonly" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="毛体积相对密度"
                               readonly="readonly" />
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="≯26" readonly="readonly" />
                    </td>
                    <td colspan="3">
                        <input type="text" class="td_input" name="num" placeholder="11.0" />
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="T0316"
                               readonly="readonly" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="砂当量      %"
                               readonly="readonly" />
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="≯26" readonly="readonly" />
                    </td>
                    <td colspan="3">
                        <input type="text" class="td_input" name="num" placeholder="11.0" />
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="T0316"
                               readonly="readonly" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="压碎值   %"
                               readonly="readonly" />
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="≯26" readonly="readonly" />
                    </td>
                    <td colspan="3">
                        <input type="text" class="td_input" name="num" placeholder="11.0" />
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="T0316"
                               readonly="readonly" />
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
                        <input type="text" class="td_input" name="num" value="机制砂" readonly="readonly" />
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="0.4" />
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="0.4" />
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="0.4" />
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="0.4" />
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="0.4" />
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="0.4" />
                    </td>
                    <td>
                        <input type="text" class="td_input" name="num" placeholder="0.4" />
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <HR style="border:3 solid #DADADA;" SIZE=1>
    </div>

    <div class="conclusion">
        <span>结论：&nbsp;</span>
        <textarea type="text" id="verdict"
                  placeholder="  依据《公路沥青路面施工技术规范》(JTG F40-2004 )，该检测指标符合要求。"> 依据《公路沥青路面施工技术规范》(JTG F40-2004 )，该检测指标符合要求。</textarea>
    </div>

    <div class="report">
        <span>负责人 :</span>
        <input type="text" name="charge_person" value=" " readonly="readonly"  />
        <span>审核 :</span>
        <input type="text" name="check_person" readonly="readonly"   />
        <span>报告人 :</span>
        <input type="text" name="report_person" readonly="readonly"   />
    </div>

    <div class="datediv">
        <span>报告日期 :</span>
        <input type="text" id="report_date" name="report_date" value=" 2017-03-18" readonly="readonly"  />
    </div>
</form>

<input  id="path" value="${path}" type="hidden" >
<input  id="id" value="${id}" type="hidden" >
</body>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/layer/layer.js"></script>
<script type="text/javascript" src="/static/js/qc/experimental_message_foreign.js"></script>

</html>