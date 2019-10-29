<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <title>编辑员工信息</title>
    <link type="text/css" rel="stylesheet" href="../../../static/js/jeDate/skin/jedate.css">
    <link type="text/css" rel="stylesheet" href="../../../static/css/personnel/personnelAdd.css">
</head>
<body>
<div class="outer-style">
    <div class="title">
        <span>编辑员工信息</span>
    </div>

    <form id="personnelInfo">
        <table>
            <tbody>
            <tr>
                <td class="table-td-name">部门</td>
                <td>
                    <select name="department">
                        <c:forEach items="${departmentList}" var="dep">
                            <c:choose>
                                <c:when test="${personnelInfo.department == dep.departmentName}">
                                    <option value="${dep.departmentName}" selected>${dep.departmentName}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${dep.departmentName}">${dep.departmentName}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </td>

                <td class="table-td-name">岗位类别</td>
                <td>
                    <select name="jobCategory">
                        <c:choose>
                            <c:when test="${personnelInfo.jobCategory == 0}">
                                <option value="0" selected>领导班子</option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">领导班子</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.jobCategory == 1}">
                                <option value="1" selected>中层管理人员</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">中层管理人员</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.jobCategory == 2}">
                                <option value="2" selected>一般管理人员</option>
                            </c:when>
                            <c:otherwise>
                                <option value="2">一般管理人员</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.jobCategory == 3}">
                                <option value="3" selected>一线生产工人</option>
                            </c:when>
                            <c:otherwise>
                                <option value="3">一线生产工人</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.jobCategory == 4}">
                                <option value="4" selected>其它</option>
                            </c:when>
                            <c:otherwise>
                                <option value="4">其它</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>

                <td class="table-td-name">职务(岗位)</td>
                <td>
                    <input type="text" name="job" value="${personnelInfo.job}" autocomplete="off">
                    <input type="hidden" name="id" value="${personnelInfo.id}">
                </td>

                <td class="table-td-name">副职</td>
                <td>
                    <input type="text" name="viceJob" value="${personnelInfo.viceJob}" autocomplete="off">
                </td>

                <td class="table-td-name">身份证号</td>
                <td>
                    <input type="text" name="idCard" value="${personnelInfo.idCard}" id="idCard"
                           onkeyup="this.value=this.value.replace(/\s+/g,'')" onchange="idCardCheck()" maxlength="18"
                           autocomplete="off">
                </td>
            </tr>

            <tr>
                <td class="table-td-name">姓名</td>
                <td>
                    <input type="text" name="name" id="name" value="${personnelInfo.name}" autocomplete="off">
                </td>

                <td class="table-td-name">性别</td>
                <td>
                    <input type="text" name="sex" id="sex" value="${personnelInfo.sex}" class="input-readonly" readonly>
                </td>

                <td class="table-td-name">出生日期</td>
                <td>
                    <input type="text" name="birthday" id="birthday" value="${personnelInfo.birthday}"
                           class="input-readonly" readonly>
                </td>

                <td class="table-td-name">年龄</td>
                <td>
                    <input type="text" name="age" id="age" value="${personnelInfo.age}" class="input-readonly" readonly>
                </td>

                <td class="table-td-name">民族</td>
                <td>
                    <input type="text" name="nation" value="${personnelInfo.nation}" autocomplete="off">
                </td>
            </tr>

            <tr>
                <td class="table-td-name">籍贯</td>
                <td>
                    <input type="text" name="nativePlace" value="${personnelInfo.nativePlace}" autocomplete="off">
                </td>

                <td class="table-td-name">户口所在地</td>
                <td>
                    <input type="text" name="registeredResidence" value="${personnelInfo.registeredResidence}"
                           autocomplete="off">
                </td>

                <td class="table-td-name">户口性质</td>
                <td>
                    <select name="accountNature">
                        <c:choose>
                            <c:when test="${personnelInfo.accountNature == 0}">
                                <option value="0" selected>本埠城镇</option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">本埠城镇</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.accountNature == 1}">
                                <option value="1" selected>本埠农村</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">本埠农村</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.accountNature == 2}">
                                <option value="2" selected>外埠城镇</option>
                            </c:when>
                            <c:otherwise>
                                <option value="2">外埠城镇</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.accountNature == 3}">
                                <option value="3" selected>外埠农村</option>
                            </c:when>
                            <c:otherwise>
                                <option value="3">外埠农村</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>

                <td class="table-td-name">联系电话</td>
                <td>
                    <input type="text" name="phone" value="${personnelInfo.phone}" autocomplete="off">
                </td>

                <td class="table-td-name">政治面貌</td>
                <td>
                    <select name="politicCountenance">
                        <c:choose>
                            <c:when test="${personnelInfo.politicCountenance == 0}">
                                <option value="0" selected>群众</option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">群众</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.politicCountenance == 1}">
                                <option value="1" selected>团员</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">团员</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.politicCountenance == 2}">
                                <option value="2" selected>中共党员</option>
                            </c:when>
                            <c:otherwise>
                                <option value="2">中共党员</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>
            </tr>

            <tr>
                <td class="table-td-name">入党日期</td>
                <td>
                    <input type="text" name="joinPartyDate" value="${personnelInfo.joinPartyDate}"
                           class="join-party-picker" onfocus="this.blur()">
                </td>

                <td class="table-td-name">参加工作时间</td>
                <td>
                    <input type="text" name="joinWorkDate" value="${personnelInfo.joinWorkDate}"
                           class="join-work-picker" onfocus="this.blur()">
                </td>

                <td class="table-td-name">工作年限</td>
                <td>
                    <input type="text" class="input-readonly" id="workingYears" name="workingYears"
                           value="${personnelInfo.workingYears}" readonly>
                </td>

                <td class="table-td-name">入职日期</td>
                <td>
                    <input type="text" name="joinedDate" id="joinedDate" class="correction-picker"
                           value="${personnelInfo.joinedDate}" onfocus="this.blur()">
                </td>

                <td class="table-td-name">转正日期</td>
                <td>
                    <input type="text" class="input-readonly" name="correctionDate" id="correctionDate"
                           value="${personnelInfo.correctionDate}" readonly>
                </td>
            </tr>

            <tr>
                <td class="table-td-name">职称级别</td>
                <td>
                    <select name="titleLevel">

                        <c:choose>
                            <c:when test="${personnelInfo.titleLevel == 0}">
                                <option value="0" selected>未取得职称</option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">未取得职称</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.titleLevel == 1}">
                                <option value="1" selected>员级</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">员级</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.titleLevel == 2}">
                                <option value="2" selected>助理</option>
                            </c:when>
                            <c:otherwise>
                                <option value="2">助理</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.titleLevel == 3}">
                                <option value="3" selected>中级</option>
                            </c:when>
                            <c:otherwise>
                                <option value="3">中级</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.titleLevel == 4}">
                                <option value="4" selected>副高级</option>
                            </c:when>
                            <c:otherwise>
                                <option value="4">副高级</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.titleLevel == 5}">
                                <option value="5" selected>正高级</option>
                            </c:when>
                            <c:otherwise>
                                <option value="5">正高级</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>

                <td class="table-td-name">职称系列</td>
                <td>
                    <input type="text" name="titleSeries" value="${personnelInfo.titleSeries}" autocomplete="off">
                </td>

                <td class="table-td-name">职称名称</td>
                <td>
                    <input type="text" name="titleName" value="${personnelInfo.titleName}" autocomplete="off">
                </td>

                <td class="table-td-name">工种名称</td>
                <td>
                    <input type="text" name="professionName" value="${personnelInfo.professionName}" autocomplete="off">
                </td>

                <td class="table-td-name">工人技术等级</td>
                <td>
                    <select name="technologyGrade">
                        <c:choose>
                            <c:when test="${personnelInfo.technologyGrade == 0}">
                                <option value="0" selected>未取证</option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">未取证</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.technologyGrade == 1}">
                                <option value="1" selected>初级</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">初级</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.technologyGrade == 2}">
                                <option value="2" selected>中级</option>
                            </c:when>
                            <c:otherwise>
                                <option value="2">中级</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.technologyGrade == 3}">
                                <option value="3" selected>高级</option>
                            </c:when>
                            <c:otherwise>
                                <option value="3">高级</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.technologyGrade == 4}">
                                <option value="4" selected>技师</option>
                            </c:when>
                            <c:otherwise>
                                <option value="4">技师</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.technologyGrade == 5}">
                                <option value="5" selected>高级技师</option>
                            </c:when>
                            <c:otherwise>
                                <option value="5">高级技师</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>
            </tr>

            <tr>
                <td class="table-td-name">原学历</td>
                <td>
                    <select name="originalEducation">
                        <c:choose>
                            <c:when test="${personnelInfo.originalEducation == 0}">
                                <option value="0" selected>初中及以下</option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">初中及以下</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.originalEducation == 1}">
                                <option value="1" selected>高中</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">高中</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.originalEducation == 2}">
                                <option value="2" selected>技校</option>
                            </c:when>
                            <c:otherwise>
                                <option value="2">技校</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.originalEducation == 3}">
                                <option value="3" selected>中专</option>
                            </c:when>
                            <c:otherwise>
                                <option value="3">中专</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.originalEducation == 4}">
                                <option value="4" selected>专科</option>
                            </c:when>
                            <c:otherwise>
                                <option value="4">专科</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.originalEducation == 5}">
                                <option value="5" selected>本科</option>
                            </c:when>
                            <c:otherwise>
                                <option value="5">本科</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.originalEducation == 6}">
                                <option value="6" selected>硕士</option>
                            </c:when>
                            <c:otherwise>
                                <option value="6">硕士</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.originalEducation == 7}">
                                <option value="7" selected>博士</option>
                            </c:when>
                            <c:otherwise>
                                <option value="7">博士</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>

                <td class="table-td-name">原学位</td>
                <td>
                    <select name="originalDegree">
                        <c:choose>
                            <c:when test="${personnelInfo.originalDegree == 0}">
                                <option value="0" selected>无</option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">无</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.originalDegree == 1}">
                                <option value="1" selected>学士</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">学士</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.originalDegree == 2}">
                                <option value="2" selected>硕士</option>
                            </c:when>
                            <c:otherwise>
                                <option value="2">硕士</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.originalDegree == 3}">
                                <option value="3" selected>博士</option>
                            </c:when>
                            <c:otherwise>
                                <option value="3">博士</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.originalDegree == 4}">
                                <option value="4" selected>博士后</option>
                            </c:when>
                            <c:otherwise>
                                <option value="4">博士后</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>

                <td class="table-td-name">原毕业学校</td>
                <td>
                    <input type="text" name="originalGraduationSchool" value="${personnelInfo.originalGraduationSchool}"
                           autocomplete="off">
                </td>

                <td class="table-td-name">原专业</td>
                <td>
                    <input type="text" name="originalProfession" value="${personnelInfo.originalProfession}"
                           autocomplete="off">
                </td>

                <td class="table-td-name">原毕业时间</td>
                <td>
                    <input type="text" name="originalGraduationDate" class="original-graduation-picker"
                           value="${personnelInfo.originalGraduationDate}" onfocus="this.blur()">
                </td>
            </tr>

            <tr>
                <td class="table-td-name">现学历</td>
                <td>
                    <select name="nowEducation">
                        <c:choose>
                            <c:when test="${personnelInfo.nowEducation == 0}">
                                <option value="0" selected>初中及以下</option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">初中及以下</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.nowEducation == 1}">
                                <option value="1" selected>高中</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">高中</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.nowEducation == 2}">
                                <option value="2" selected>技校</option>
                            </c:when>
                            <c:otherwise>
                                <option value="2">技校</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.nowEducation == 3}">
                                <option value="3" selected>中专</option>
                            </c:when>
                            <c:otherwise>
                                <option value="3">中专</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.nowEducation == 4}">
                                <option value="4" selected>专科</option>
                            </c:when>
                            <c:otherwise>
                                <option value="4">专科</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.nowEducation == 5}">
                                <option value="5" selected>本科</option>
                            </c:when>
                            <c:otherwise>
                                <option value="5">本科</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.nowEducation == 6}">
                                <option value="6" selected>硕士</option>
                            </c:when>
                            <c:otherwise>
                                <option value="6">硕士</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.nowEducation == 7}">
                                <option value="7" selected>博士</option>
                            </c:when>
                            <c:otherwise>
                                <option value="7">博士</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>

                <td class="table-td-name">现学位</td>
                <td>
                    <select name="nowDegree">
                        <c:choose>
                            <c:when test="${personnelInfo.nowDegree == 0}">
                                <option value="0" selected>无</option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">无</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.nowDegree == 1}">
                                <option value="1" selected>学士</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">学士</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.nowDegree == 2}">
                                <option value="2" selected>硕士</option>
                            </c:when>
                            <c:otherwise>
                                <option value="2">硕士</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.nowDegree == 3}">
                                <option value="3" selected>博士</option>
                            </c:when>
                            <c:otherwise>
                                <option value="3">博士</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.nowDegree == 4}">
                                <option value="4" selected>博士后</option>
                            </c:when>
                            <c:otherwise>
                                <option value="4">博士后</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>

                <td class="table-td-name">现毕业学校</td>
                <td>
                    <input type="text" name="nowGraduationSchool" value="${personnelInfo.nowGraduationSchool}"
                           autocomplete="off">
                </td>

                <td class="table-td-name">现专业</td>
                <td>
                    <input type="text" name="nowProfession" value="${personnelInfo.nowProfession}" autocomplete="off">
                </td>

                <td class="table-td-name">现毕业时间</td>
                <td>
                    <input type="text" name="nowGraduationDate" value="${personnelInfo.nowGraduationDate}"
                           class="now-graduation-picker" onfocus="this.blur()">
                </td>
            </tr>

            <tr>
                <td class="table-td-name">用工类型</td>
                <td>
                    <select name="workType">
                        <c:choose>
                            <c:when test="${personnelInfo.workType == 0}">
                                <option value="0" selected>自有职工</option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">自有职工</option>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${personnelInfo.workType == 1}">
                                <option value="1" selected>外包职工</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">外包职工</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>

                <td class="table-td-name">原职务</td>
                <td>
                    <input type="text" name="originalPosition" value="${personnelInfo.originalPosition}"
                           autocomplete="off">
                </td>

                <td class="table-td-name">原岗位</td>
                <td>
                    <input type="text" name="originalPost" value="${personnelInfo.originalPost}" autocomplete="off">
                </td>

                <td class="table-td-name">现岗位任职时间</td>
                <td>
                    <input type="text" name="currentPosition" value="${personnelInfo.currentPosition}"
                           class="current-position-picker" onfocus="this.blur()">
                </td>

                <td class="table-td-name">转岗时间</td>
                <td>
                    <input type="text" name="transfer" value="${personnelInfo.transfer}" class="transfer-picker"
                           onfocus="this.blur()">
                </td>
            </tr>

            <tr>
                <td class="table-td-name">在岗情况</td>
                <td>
                    <input type="text" name="postSituation" value="${personnelInfo.postSituation}" autocomplete="off">
                </td>

                <td class="table-td-name">身体情况</td>
                <td>
                    <input type="text" name="physicalCondition" value="${personnelInfo.physicalCondition}"
                           autocomplete="off">
                </td>

                <td class="table-td-name">其他证书</td>
                <td colspan="3">
                    <input type="text" name="otherCertificates" value="${personnelInfo.otherCertificates}"
                           autocomplete="off">
                </td>

                <td class="table-td-name">提交离职申请日期</td>
                <td>
                    <input type="text" name="submissionApply" value="${personnelInfo.submissionApply}"
                           class="submission-apply-picker" onfocus="this.blur()">
                </td>
            </tr>

            <tr>
                <td class="table-td-name">申请离职日期</td>
                <td>
                    <input type="text" name="applyLeave" value="${personnelInfo.applyLeave}" class="apply-leave-picker"
                           onfocus="this.blur()">
                </td>

                <td class="table-td-name">离职日期</td>
                <td>
                    <input type="text" name="leaveDate" value="${personnelInfo.leaveDate}" class="leave-date-picker"
                           onfocus="this.blur()">
                </td>

                <td class="table-td-name">预计退休时间</td>
                <td>
                    <input type="text" name="estimateRetirementDate"
                           value="${personnelInfo.estimateRetirementDate}" class="estimate-retirement-picker"
                           onfocus="this.blur()">
                </td>

                <td class="table-td-name">退休时间</td>
                <td>
                    <input type="text" name="retirementDate" value="${personnelInfo.retirementDate}"
                           class="retirement-picker" onfocus="this.blur()">
                </td>

                <td class="table-td-name">退休单位</td>
                <td>
                    <input type="text" name="retirementCompany" value="${personnelInfo.retirementCompany}"
                           autocomplete="off">
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
    jeDate(".join-party-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,
        isClear: true,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM",
        zIndex: 100000,
    });

    jeDate(".join-work-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM",
        zIndex: 100000,
        donefun: function (obj) {
            workingYearsChange(obj)
        }
    });

    jeDate(".original-graduation-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM",
        zIndex: 100000,
    });

    jeDate(".now-graduation-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,
        isClear: false,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM",
        zIndex: 100000,
    });

    jeDate(".correction-picker", {
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

    jeDate(".estimate-retirement-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,
        isClear: true,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    jeDate(".retirement-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,
        isClear: true,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    //现岗位任职时间
    jeDate(".current-position-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,                   //初始化
        isClear: true,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    //转岗时间
    jeDate(".transfer-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,                   //初始化
        isClear: true,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    //提交离职申请日期
    jeDate(".submission-apply-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,                   //初始化
        isClear: true,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    //申请离职日期
    jeDate(".apply-leave-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,                   //初始化
        isClear: true,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    //离职日期
    jeDate(".leave-date-picker", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        festival: false,
        isinitVal: false,                   //初始化
        isClear: true,                     //是否开启清空
        minDate: "1900-01-01",              //最小日期
        maxDate: "2099-12-31",              //最大日期
        format: "YYYY-MM-DD",
        zIndex: 100000,
    });

    //身份证校验
    function idCardCheck() {
        var validateRules = /^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|31)|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}([0-9]|x|X)$/
        var idCardNumber = $("#idCard").val();
        if (validateRules.test(idCardNumber)) {
            //身份证17位奇数：男，偶数：女
            if (idCardNumber.charAt(idCardNumber.length - 2) % 2 === 0) {
                $("#sex").val("女");
            } else {
                $("#sex").val("男");
            }

            //计算出生日期和年龄
            $.ajax({
                type: "POST",
                url: '${path}/personnel/idCardCheck',
                data: 'idCard=' + idCardNumber,
                dataType: "json",
                error: function (request) {
                    layer.msg("出错！");
                },
                success: function (result) {
                    $('#age').val(result.age);
                    $('#birthday').val(result.birthday);
                }
            })
        } else {
            top.window.tips("请重新检查身份证信息！", 6, 2, 2000);
        }
    }

    //工作年限计算
    function workingYearsChange(d) {
        $.ajax({
            type: "POST",
            url: '${path}/personnel/workingYears',
            data: 'joinWorkDate=' + d.val,
            dataType: "json",
            error: function (request) {
                layer.msg("出错！");
            },
            success: function (result) {
                $('#workingYears').val(result.workingYears);
            }
        })
    }

    //转正日期计算
    function correctionChange(d) {
        var date = new Date(d);
        date.setFullYear(date.getFullYear() + 1);
        date.setDate(date.getDate() - 1);
        var dateJson = date.toJSON();
        $('#correctionDate').val(dateJson.substring(0, 10));
    }

    //返回上一页
    function previousPage() {
        window.history.back();
    }

    //提交修改
    function editPersonnelInfo() {
        if ($.trim($("#name").val()) === '') {
            top.window.tips("员工姓名不可为空！", 6, 5, 1000);
        } else {
            $.ajax({
                type: "POST",
                url: '${path}/personnel/edit',
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
