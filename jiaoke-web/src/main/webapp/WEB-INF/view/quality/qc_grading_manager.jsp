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
    <title>级配管理</title>
    <link href="/static/css/default.css" rel="stylesheet" type="text/css">
    <link href="/static/js/datepicker/css/bootstrap-datepicker.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/static/css/qc/zxf_page.css">
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
                <a><cite>级配管理</cite></a>
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
                    <button class="layui-btn" id="showBrk">
                        <i class="layui-icon"></i>新建级配
                    </button>
                    <button class="layui-btn" id="former_years" onclick="showOldGrading()" id="former_years" >
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
                            <th style="width: 15%">级配名称</th>
                            <th style="width: 15%">上传时间</th>
                            <th style="width: 15%">备注信息</th>
                            <th style="width: 15%">上传人</th>
                            <th style="width: 15%">操作</th>
                        </thead>
                        <tbody id="gradingList" >
                        </tbody>
                    </table>
                </div>

                <div class="layui-card-body" style="display: inline-block;width: 100%;">
                    <div  class="zxf_pagediv"></div>
                </div>
            </div>
        </div>
    </div>
</div>

    <!--删除弹出-->
    <div class="popup_back" style="display:none;">
    </div>
    <div class="popup_window_first" style="display:none;">
        <p class="popup_cont">是否删除？</p>
        <a href="javascript:void(0)" class="popup_btn" onclick="delectGrading();">确定</a>
        <a href="javascript:void(0)" class="popup_btn" onclick="closeWindow();">取消</a>
    </div>



    <!--级配模板相关弹出-->

    <!--展示级配模板弹出-->
    <div id="GradingBrk" class="form_background"  style="display:none;" ></div>
    <div id="Grading" class="ration_form_model" style="display:none;" >
        <table class="my_form_table" style="margin-top: 1%;">
            <tbody>
            <tr>
                <td class="my_grading_tlables">一号机组模板号：</td>
                <td>
                    <input type="number" readOnly="true"  name="crew1_num" class="my_grading_input">

                </td>
                <td class="my_grading_tlables">二号机组模板号：</td>
                <td>
                    <input type="number" readOnly="true"  name="crew2_num" class="my_grading_input">
                </td>
                <td class="my_grading_tlables">级配名称</td>
                <td>
                    <input type="text" readOnly="true"  name="grading_name"  class="my_grading_input">
                </td>
                <td class="my_grading_tlables">备注</td>
                <td>
                    <input type="text" readOnly="true"  name="grading_remaker"  class="my_grading_input_remaker">
                </td>
            </tr>

            </tbody>

        </table>
        <div id="showGradingMessage">
            <table class="simpletable">
                <tr class="even">
                    <td>筛孔</td>
                    <td>六仓</td>
                    <td>五仓</td>
                    <td>四仓</td>
                    <td>三仓</td>
                    <td>二仓</td>
                    <td>一仓</td>
                    <td>矿粉</td>
                    <td>粗再生料</td>
                    <td>细再生料</td>
                    <td>添加剂矿料</td>
                    <td>合成级配</td>
                    <td>中值</td>
                    <td>上限</td>
                    <td>下限</td>
                </tr>
                <tbody id="message">

                </tbody>
            </table>
        </div>

        <div class="form_btn">
            <%--<input type="button" onclick="closeGradingModel()" value="关闭" class="ration_btn_cancel">--%>
        </div>

        </form>

    </div>

    <!--上传级配模板弹出-->
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
                <td class="my_grading_tlables">级配名称</td>
                <td>
                    <input type="text" id="grading_name"  class="my_grading_input">
                </td>
                <td class="my_grading_tlables">上传人</td>
                <td>
                    <input type="text" id="up_user"  class="my_grading_input">
                </td>
                <td class="my_grading_tlables">备注</td>
                <td>
                    <input type="text" id="grading_remaker"  class="my_grading_input_remaker">
                </td>
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


    <!--编辑机组模板弹出-->
    <!--编辑级配模板弹出-->
    <div id="editGradingBrk" class="form_background"  style="display:none;" ></div>
    <div id="editGrading" class="ration_form_model" style="display:none;" >
        <table class="my_form_table">
            <tbody>
            <tr>
                <td class="my_grading_tlables">一号机组模板号：</td>
                <td>
                    <input type="number"   name="crew1_edit_num" class="my_grading_input">

                </td>
                <td class="my_grading_tlables">二号机组模板号：</td>
                <td>
                    <input type="number"  name="crew2_edit_num" class="my_grading_input">
                </td>
                <td class="my_grading_tlables">级配名称</td>
                <td>
                    <input type="text"  name="grading_edit_name"  class="my_grading_input">
                </td>
                <td class="my_grading_tlables">备注</td>
                <td>
                    <input type="text"   name="grading_edit_remaker"  class="my_grading_input_remaker">
                    <%--<input type="text"   name="id"  class="my_grading_input_remaker">--%>
                </td>
            </tr>

            </tbody>

        </table>
        <div id="editGradingMessage">
            <table class="simpletable">
                <tr class="even">
                    <td>筛孔</td>
                    <td>六仓</td>
                    <td>五仓</td>
                    <td>四仓</td>
                    <td>三仓</td>
                    <td>二仓</td>
                    <td>一仓</td>
                    <td>矿粉</td>
                    <td>粗再生料</td>
                    <td>细再生料</td>
                    <td>添加剂矿料</td>
                    <td>合成级配</td>
                    <td>中值</td>
                    <td>上限</td>
                    <td>下限</td>
                </tr>
                <tbody id="editMessage">

                </tbody>
            </table>
        </div>

        <div class="form_btn">
            <input type="button" onclick="editGrading()" value="修改" class="ration_btn_cancel" style="padding-top: 0px">
            <input type="button" onclick="closeEditGrading()" value="关闭" class="ration_btn_cancel">
        </div>

        </form>

    </div>

    <input type="text" value="${path}" id="path" style="display: none" >

</body>
<div id="showOldGrading" style="padding-top: 8px;display: none;">

</div>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/jquery.select.js"></script>
<script src="/static/js/layer/layer.js"></script>
<script type="text/javascript" src="/static/js/datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/static/js/datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript" src="/static/js/qc/zxf_page.js"></script>
<script type="text/javascript" src="/static/js/qc/grading_manager.js"></script>
<script type="text/javascript" src="/static/js/qc/xlsx.core.min.js"></script>

</html>