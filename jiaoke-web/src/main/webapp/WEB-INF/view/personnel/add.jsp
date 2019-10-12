<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <title>添加员工信息</title>
    <link type="text/css" rel="stylesheet" href="../../../static/js/jeDate/skin/jedate.css">
    <style>
        body {
            padding: 0;
            margin: 0;
            border: 0;
        }

        table {
            width: 100%;
            margin: auto;
            border-collapse: collapse;
            border-spacing: 0;
            font-size: 13px;
        }

        table td {
            border: solid 1px #d6d6d6;
            text-indent: 0;
            padding: 5px 10px;
        }

        .table-td-name {
            background: #f6f6f6;
            text-align: right;
            padding-right: 1%;
            white-space: nowrap;
            width: 10%;
        }

        table tbody tr td input {
            width: 100%;
            height: 25px;
            outline: none;
            border: 1px solid #b3b3b3;
            text-indent: 5px;
        }

        table tbody tr td select {
            width: 100%;
            height: 25px;
            outline: none;
        }

        .title {
            width: 100%;
            margin: 20px 0 10px;
            height: 40px;
            text-align: center;
            line-height: 40px;
        }

        .title span{
            font-size: 20px;
        }

        .outer-style {
            width: 80%;
            margin: 0 auto;
        }

        .bottom-button-style {
            padding-top: 30px;
            text-align: center;
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

        .left-spacing {
            margin-left: 20px;
        }
    </style>
</head>
<body>
<div class="outer-style">
    <div class="title">
        <span>添加员工</span>
    </div>

    <form id="personnelInfo">
        <table>
            <tbody>
            <tr>
                <td class="table-td-name">部门</td>
                <td>
                    <select name="department">
                        <c:forEach items="${departmentList}" var="dep">
                            <option value="${dep.departmentKey}">${dep.departmentName}</option>
                        </c:forEach>
                    </select>
                </td>

                <td class="table-td-name">岗位类别</td>
                <td>
                    <select name="jobCategory">
                        <option value="0">高层经营管理人员</option>
                        <option value="1">中层经营管理人员</option>
                        <option value="2">一般经营管理人员</option>
                        <option value="3">专业技术人员</option>
                        <option value="4">技能操作人员</option>
                    </select>
                </td>

                <td class="table-td-name">职务(岗位)</td>
                <td>
                    <input type="text" name="job" autocomplete="off">
                </td>

                <td class="table-td-name">姓名</td>
                <td>
                    <input type="text" name="name" id="name" autocomplete="off">
                </td>
            </tr>

            <tr>
                <td class="table-td-name">性别</td>
                <td>
                    <select name="sex">
                        <option value="0">男</option>
                        <option value="1">女</option>
                    </select>
                </td>
                <td class="table-td-name">身份证号</td>
                <td>
                    <input type="text" name="idCard" autocomplete="off">
                </td>
                <td class="table-td-name">出生日期</td>
                <td>
                    <input type="text" name="birthdayStr" class="birthday-picker" onfocus="this.blur()">
                </td>
                <td class="table-td-name">年龄</td>
                <td>
                    <input type="text" name="age" autocomplete="off">
                </td>
            </tr>

            <tr>
                <td class="table-td-name">民族</td>
                <td>
                    <input type="text" name="nation" autocomplete="off">
                </td>
                <td class="table-td-name">户籍</td>
                <td>
                    <input type="text" name="nativePlace" autocomplete="off">
                </td>
                <td class="table-td-name">户口所在地</td>
                <td colspan="3">
                    <input type="text" name="registeredResidence" autocomplete="off">
                </td>
            </tr>

            <tr>
                <td class="table-td-name">联系电话</td>
                <td>
                    <input type="text" name="phone" autocomplete="off">
                </td>
                <td class="table-td-name">政治面貌</td>
                <td>
                    <select name="politicCountenance">
                        <option value="0">男</option>
                        <option value="1">女</option>
                    </select>
                </td>
                <td class="table-td-name">入党日期</td>
                <td>
                    <input type="text" name="joinPartyDateStr" class="join-party-picker" onfocus="this.blur()">
                </td>
                <td class="table-td-name">参加工作时间</td>
                <td>
                    <input type="text" name="joinWorkDateStr" class="join-work-picker" onfocus="this.blur()">
                </td>
            </tr>

            <tr>
                <td class="table-td-name">工作年限</td>
                <td>
                    <input type="text" name="workingYears" autocomplete="off">
                </td>
                <td class="table-td-name">职称级别</td>
                <td>
                    <input type="text" name="titleLevel" autocomplete="off">
                </td>
                <td class="table-td-name">职称系列</td>
                <td>
                    <input type="text" name="titleSeries" autocomplete="off">
                </td>
                <td class="table-td-name">职称名称</td>
                <td>
                    <input type="text" name="titleName" autocomplete="off">
                </td>
            </tr>

            <tr>
                <td class="table-td-name">工种名称</td>
                <td>
                    <input type="text" name="professionName" autocomplete="off">
                </td>
                <td class="table-td-name">工人技术等级</td>
                <td>
                    <input type="text" name="technologyGrade" autocomplete="off">
                </td>
                <td class="table-td-name">原学历</td>
                <td>
                    <select name="originalEducation">
                        <option value="0">初中及以下</option>
                        <option value="1">高中</option>
                        <option value="2">技校</option>
                        <option value="3">中专</option>
                        <option value="4">专科</option>
                        <option value="5">本科</option>
                        <option value="6">硕士</option>
                        <option value="7">博士</option>
                    </select>
                </td>
                <td class="table-td-name">原学位</td>
                <td>
                    <select name="originalDegree">
                        <option value="0">学士</option>
                        <option value="1">硕士</option>
                        <option value="2">博士</option>
                        <option value="3">博士后</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td class="table-td-name">原毕业学校</td>
                <td>
                    <input type="text" name="originalGraduationSchool" autocomplete="off">
                </td>
                <td class="table-td-name">原专业</td>
                <td>
                    <input type="text" name="originalProfession" autocomplete="off">
                </td>
                <td class="table-td-name">原毕业时间</td>
                <td>
                    <input type="text" name="originalGraduationDateStr" class="original-graduation-picker"
                           onfocus="this.blur()">
                </td>
                <td class="table-td-name">现学历</td>
                <td>
                    <select name="nowEducation">
                        <option value="0">初中及以下</option>
                        <option value="1">高中</option>
                        <option value="2">技校</option>
                        <option value="3">中专</option>
                        <option value="4">专科</option>
                        <option value="5">本科</option>
                        <option value="6">硕士</option>
                        <option value="7">博士</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td class="table-td-name">现学位</td>
                <td>
                    <select name="nowDegree">
                        <option value="0">学士</option>
                        <option value="1">硕士</option>
                        <option value="2">博士</option>
                        <option value="3">博士后</option>
                    </select>
                </td>
                <td class="table-td-name">现毕业学校</td>
                <td>
                    <input type="text" name="nowGraduationSchool" autocomplete="off">
                </td>
                <td class="table-td-name">现专业</td>
                <td>
                    <input type="text" name="nowProfession" autocomplete="off">
                </td>
                <td class="table-td-name">现毕业时间</td>
                <td>
                    <input type="text" name="nowGraduationDateStr" class="now-graduation-picker" onfocus="this.blur()">
                </td>
            </tr>

            <tr>
                <td class="table-td-name">其他证书</td>
                <td>
                    <input type="text" name="otherCertificates" autocomplete="off">
                </td>
                <td class="table-td-name">在岗情况</td>
                <td>
                    <input type="text" name="postSituation" autocomplete="off">
                </td>
                <td class="table-td-name">用工类型</td>
                <td>
                    <select name="workType">
                        <option value="0">自由职工</option>
                        <option value="1">外包职工</option>
                    </select>
                </td>
                <td class="table-td-name">转正时间</td>
                <td>
                    <input type="text" name="correctionDateStr" class="correction-picker" onfocus="this.blur()">
                </td>
            </tr>

            <tr>
                <td class="table-td-name">预计退休时间</td>
                <td>
                    <input type="text" name="estimateRetirementDateStr" class="estimate-retirement-picker"
                           onfocus="this.blur()">
                </td>
                <td class="table-td-name">退休时间</td>
                <td>
                    <input type="text" name="retirementDateStr" class="retirement-picker" onfocus="this.blur()">
                </td>
                <td class="table-td-name">身体情况</td>
                <td>
                    <input type="text" name="physicalCondition" autocomplete="off">
                </td>
                <td class="table-td-name">退休单位</td>
                <td>
                    <input type="text" name="retirementCompany" autocomplete="off">
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <div class="bottom-button-style">
        <input type="button" value="返回" onclick="previousPage()" class="return-but">
        <input type="button" value="确认" onclick="addPersonnelInfo()" class="commit-but left-spacing">
    </div>
</div>
</body>
<script type="text/javascript" src="../../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../../static/js/jeDate/src/jedate.js"></script>
<script src="../../../static/js/oa/layer/layer.js"></script>
<script>

    //日期选择器
    jeDate(".birthday-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    jeDate(".join-party-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    jeDate(".join-work-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    jeDate(".original-graduation-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    jeDate(".now-graduation-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    jeDate(".correction-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    jeDate(".estimate-retirement-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    jeDate(".retirement-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: true,
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

    function addPersonnelInfo() {
        if ($.trim($("#name").val()) === '') {
            top.window.tips("员工姓名不可为空！", 6, 5, 1000);
        } else {
            $.ajax({
                type: "POST",
                url: '${path}/personnel/add',
                data: $('#personnelInfo').serialize(),
                error: function (request) {
                    layer.msg("出错！");
                },
                success: function (result) {
                    if (result === "success") {
                        window.location.href = "${path}/personnel/toBasic?page=1";
                        top.window.tips("添加成功！", 0, 1, 1000);
                    } else {
                        top.window.tips("添加失败！", 0, 2, 1000);
                    }
                }
            })
        }
    }
</script>
</html>
