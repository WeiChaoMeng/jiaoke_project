<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2019-8-8
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>警报处理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../../../static/layui/css/layui.css" media="all">
    <link href="../../../static/css/qc/app-light.css" rel="stylesheet" type="text/css">
    <script src="../../../static/js/echarts/echarts.js"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<div class="row">
    <div class="col-md-6" style="    margin-top: 10px;"  >
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="card-title">
                    <strong>一号机组三级预警产品</strong>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div id="chart1" style="position: relative;height: 250px;width: 540px;">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="row align-items-center my-3">
                            <div class="col">
                                <strong>无级预警</strong>
                                <div class="my-0 text-muted small">产品盘数</div>
                            </div>
                            <div class="col-auto">
                                <strong id="crew1warning0">0</strong>
                            </div>
                            <div class="col-3">
                                <div class="progress" style="height: 4px;">
                                    <div class="progress-bar" role="progressbar" style="width: 85%" aria-valuenow="85"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row align-items-center my-3">
                            <div class="col">
                                <strong>一级预警</strong>
                                <div class="my-0 text-muted small">产品盘数</div>
                            </div>
                            <div class="col-auto">
                                <strong id="crew1warning1" >0</strong>
                            </div>
                            <div class="col-3">
                                <div class="progress" style="height: 4px;">
                                    <div class="progress-bar" role="progressbar" style="width: 75%" aria-valuenow="75"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row align-items-center my-3">
                            <div class="col">
                                <strong>二级预警</strong>
                                <div class="my-0 text-muted small">产品盘数</div>
                            </div>
                            <div class="col-auto">
                                <strong id="crew1warning2" >0</strong>
                            </div>
                            <div class="col-3">
                                <div class="progress" style="height: 4px;">
                                    <div class="progress-bar" role="progressbar" style="width: 62%" aria-valuenow="62"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6" style="    margin-top: 10px;" >
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="card-title">
                    <strong>二号机组三级预警产品</strong>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div id="chart2" style="position: relative;height: 250px;width: 540px;">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="row align-items-center my-3">
                            <div class="col">
                                <strong>无级预警</strong>
                                <div class="my-0 text-muted small">产品盘数</div>
                            </div>
                            <div class="col-auto">
                                <strong id="crew2warning0" >0 </strong>
                            </div>
                            <div class="col-3">
                                <div class="progress" style="height: 4px;">
                                    <div class="progress-bar" role="progressbar" style="width: 85%" aria-valuenow="85"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row align-items-center my-3">
                            <div class="col">
                                <strong>一级预警</strong>
                                <div class="my-0 text-muted small">产品盘数</div>
                            </div>
                            <div class="col-auto">
                                <strong id="crew2warning1" >0</strong>
                            </div>
                            <div class="col-3">
                                <div class="progress" style="height: 4px;">
                                    <div class="progress-bar" role="progressbar" style="width: 75%" aria-valuenow="75"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row align-items-center my-3">
                            <div class="col">
                                <strong>二级预警</strong>
                                <div class="my-0 text-muted small">产品盘数</div>
                            </div>
                            <div class="col-auto">
                                <strong  id="crew2warning2">0</strong>
                            </div>
                            <div class="col-3">
                                <div class="progress" style="height: 4px;">
                                    <div class="progress-bar" role="progressbar" style="width: 62%" aria-valuenow="62"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<table class="layui-hide" id="test" lay-filter="test"></table>
<input  id="path" value="${path}" type="hidden" >
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">填写原因</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script src="../../../static/layui/layui.js" charset="utf-8"></script>
<script src="../../../static/js/jquery.min.js" type="text/javascript"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    (function ($) {
        getTwoCrewPro();
    })(jQuery);

    function  getTwoCrewPro(){
        var path = $("#path").val();
        $.ajax({
            url:path + "/getTwoCrewPro.do",
            type: "GET",
            dataType: "json",
            success: function(res){
                var crew1Leve0Num = 0;
                var crew1Leve1Num = 0;
                var crew1Leve2Num = 0;
                var crew1Arr = [];

                var crew2Leve0Num = 0;
                var crew2Leve1Num = 0;
                var crew2Leve2Num = 0;
                var crew2Arr = [];
                if (res.state === 'success'){
                    var arr = res.data;
                    for (var i = 0; i < arr.length;i++){
                       var crewNum = arr[i].produce_crewNum;
                       var warningLeve = arr[i].core_warning_level;

                        if (crewNum === 1){
                            switch (warningLeve) {
                                case 0:
                                    crew1Leve0Num += Number(arr[i].total);
                                    break;
                                case 1:
                                    crew1Leve1Num += Number(arr[i].total);
                                    break;
                                case 2:
                                    crew1Leve2Num += Number(arr[i].total);
                                    break;
                                case 3:
                                    crew1Arr.push(arr[i]);
                                    break;
                            }
                        }else {
                            switch (warningLeve) {
                                case 0:
                                    crew2Leve0Num += Number(arr[i].total);
                                    break;
                                case 1:
                                    crew2Leve1Num += Number(arr[i].total);
                                    break;
                                case 2:
                                    crew2Leve2Num += Number(arr[i].total);
                                    break;
                                case 3:
                                    crew2Arr.push(arr[i]);
                                    break;
                            }
                        }
                    }
                } else {
                    layui.use('layer', function () {
                        var layer = layui.layer;
                        layer.msg("饼图查询失败");
                    });
                }

                if (crew1Arr.length > 0 ){
                    showChar1Bar(crew1Arr);
                    $("#crew1warning0").empty().append(crew1Leve0Num + "<i>盘<i>");
                    $("#crew1warning1").empty().append(crew1Leve1Num + "<i>盘<i>");
                    $("#crew1warning2").empty().append(crew1Leve2Num + "<i>盘<i>");
                } else {
                    layui.use('layer', function () {
                        var layer = layui.layer;
                        layer.msg("机组1今日无三级预警");
                    });
                }

                if (crew2Arr.length > 0){
                    showChar2Bar(crew2Arr);
                    $("#crew2warning0").empty().append(crew2Leve0Num + "<i>盘<i>");
                    $("#crew2warning1").empty().append(crew2Leve1Num + "<i>盘<i>");
                    $("#crew2warning2").empty().append(crew2Leve2Num + "<i>盘<i>");
                } else {
                    layui.use('layer', function () {
                        var layer = layui.layer;
                        layer.msg("机组2今日无三级预警");
                    });
                }
            }
        })
    }
    function showChar1Bar(arr) {


        var myChart = echarts.init(document.getElementById('chart1'));

        var m2R2Data= [];
        var nameArr = [];
        for (var i = 0; i < arr.length;i++){
            m2R2Data.push({value:arr[i].total,name:arr[i].pro_name,proDate:arr[i].produce_date,rationId:arr[i].produce_ratio_id,crewNum:1});
            nameArr.push(arr[i].pro_name);
        }

        option = {
            color: ['#37a2da','#32c5e9','#9fe6b8','#ffdb5c','#ff9f7f','#fb7293','#e7bcf3','#8378ea'],
            tooltip: {
                trigger: 'item',
                formatter:function (parms){
                    var str=  parms.seriesName+"</br>"+
                        "盘数："+ parms.data.value+"</br>"+
                        "三级预警占比："+ parms.percent+"%";
                    return  str ;
                }
            },
            legend: {
                show: true,
                top: "center",
                left: '70%',
                data:nameArr,
                itemWidth: 20,
                itemHeight: 20,
                padding: [0, 5],
                itemGap: 25,
                textStyle: {
                    color: '#b0b9cb'
                }
            },
            series: [
                {
                    name:'报警信息',
                    type:'pie',
                    center: ['30%', '50%'],
                    radius: ['30%', '75%'],
                    clockwise: true, //饼图的扇区是否是顺时针排布
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: true,
                            position: 'inner',
                            color: '#fff',
                            formatter:function (parms){
                                return parms.data.legendname
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            length:5,
                            length2:3,
                            smooth:true,
                        }
                    },
                    data:m2R2Data
                }
            ]
        };
        myChart.setOption(option);
        myChart.on('click', function (params) {
            setLayTable(params.data.proDate,params.data.rationId,params.data.crewNum);
        });
        window.addEventListener("resize", function () {
            myChart.resize();
        });
    };
    function showChar2Bar(arr) {
        var myChart = echarts.init(document.getElementById('chart2'));

        var m2R2Data= [];
        var nameArr = [];
        for (var i = 0; i < arr.length;i++){
            m2R2Data.push({value:arr[i].total,name:arr[i].pro_name,proDate:arr[i].produce_date,rationId:arr[i].produce_ratio_id,crewNum:2});
            nameArr.push(arr[i].pro_name);
        }
        option = {
            color: ['#37a2da','#32c5e9','#9fe6b8','#ffdb5c','#ff9f7f','#fb7293','#e7bcf3','#8378ea'],
            tooltip: {
                trigger: 'item',
                formatter:function (parms){
                    var str=  parms.seriesName+"</br>"+
                        "盘数："+ parms.data.value+"</br>"+
                        "三级预警占比："+ parms.percent+"%";
                    return  str ;
                }
            },
            legend: {
                show: true,
                top: "center",
                left: '70%',
                data:nameArr,
                itemWidth: 20,
                itemHeight: 20,
                padding: [0, 5],
                itemGap: 25,
                textStyle: {
                    color: '#b0b9cb'
                }
            },
            series: [
                {
                    name:'报警信息',
                    type:'pie',
                    center: ['30%', '50%'],
                    radius: ['30%', '75%'],
                    clockwise: true, //饼图的扇区是否是顺时针排布
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: true,
                            position: 'inner',
                            color: '#fff',
                            formatter:function (parms){
                                return parms.data.legendname
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            length:5,
                            length2:3,
                            smooth:true,
                        }
                    },
                    data:m2R2Data
                }
            ]
        };
        myChart.setOption(option);
        myChart.on('click', function (params) {
            setLayTable(params.data.proDate,params.data.rationId,params.data.crewNum);
        });
        window.addEventListener("resize", function () {
            myChart.resize();
        });
    }

    function setLayTable(date,rationNum,crewNum){
        var path = $("#path").val();

        layui.use('table', function () {
            var table = layui.table;
            table.render({
                id:'idtest',
                elem: '#test'
                , url: path + '/getProDataByRation.do'
                ,method: 'POST'
                ,where : {
                    proDate: date
                    ,rationNum: rationNum
                    ,crewNum:crewNum
                }
                , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
                , defaultToolbar: ['filter', 'exports', 'print'//自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                ]
                , title: '机组预警信息表'
                , cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    , {field: 'id', title: 'ID', width: 150, fixed: 'left', unresize: true, sort: true}
                    , {field: 'proDate', title: '日期时间', width: 350, sort: true}
                    , {field: 'produce_disc_num', title: '盘号', width: 150}
                    , {field: 'pro_name', title: '配比名称', width: 150}
                    , {field: 'materialOneMoudle', title: '骨料1设计比', width: 150}
                    , {field: 'materialOneActual', title: '骨料1实际比', width: 150}
                    , {field: 'materialOneDeviation', title: '骨料1偏差比', width: 150}
                    , {field: 'materialOneLeve', title: '骨料1预警级别', width: 150}
                    , {field: 'asphaltMoudle', title: '沥青设计比', width: 150}
                    , {field: 'asphaltActual', title: '沥青实际比', width: 150}
                    , {field: 'asphaltDeviation', title: '沥青偏差比', width: 150}
                    , {field: 'asphaltLeve', title: '沥青预警级别', width: 150}
                    , {field: 'warehouseOneMoudle', title: '一仓设计温度', width: 150}
                    , {field: 'warehouseOneActual', title: '一仓实际温度', width: 150}
                    , {field: 'warehouseOneDeviation', title: '一仓偏差比', width: 150}
                    , {field: 'warehouseOneLeve', title: '一仓预警级别', width: 150}
                    , {field: 'warning_reason', title: '报警原因', width: 300}
                   // ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
                ]]
            });

            //头工具栏事件
            table.on('toolbar(test)', function (obj) {
                var checkStatus = table.checkStatus(obj.config.id);
                switch (obj.event) {
                    case 'getCheckData':
                        var data = checkStatus.data;
                        if (data.length === 0){
                            layer.msg('请选择产品');
                            break;
                        }
                        layer.prompt({
                            formType: 2,
                            maxlength: 140,
                            title: '输入预警原因'
                        },function(val, index){
                            var arr = "";
                            for (var i = 0; i < data.length;i++){
                                if (i === 0){
                                    arr += data[i].id;
                                } else {
                                    arr += "," + data[i].id;
                                }

                            }
                            sendProductWarningMsg(val,arr);
                            layer.close(index);
                        });
                        break;
                    case 'getCheckLength':
                        var data = checkStatus.data;
                        layer.msg('选中了：' + data.length + ' 个');
                        break;
                    case 'isAll':
                        layer.msg(checkStatus.isAll ? '全选' : '未全选');
                        break;

                    //自定义头工具栏右侧图标 - 提示
                    case 'LAYTABLE_TIPS':
                        layer.alert('这是工具栏右侧自定义的一个图标按钮');
                        break;
                }

            });

            //监听行工具事件
            table.on('tool(test)', function (obj) {
                var data = obj.data;
                //console.log(obj)
                if (obj.event === 'del') {
                    layer.confirm('真的删除行么', function (index) {
                        obj.del();
                        layer.close(index);
                    });
                } else if (obj.event === 'edit') {
                    layer.prompt({
                        formType: 2
                        , value: data.email
                    }, function (value, index) {
                        obj.update({
                            email: value
                        });
                        layer.close(index);
                    });
                }
            });
        });
    }

    function sendProductWarningMsg(val,arr) {
        var path = $("#path").val();
        $.ajax({
            url: path + "/addProductWarningMsg.do",
            type: "post",
            dataType:"json",
            data: {
                "proMsg":val,
                "idArr":arr
            },
            success: function(msg){
                if (msg.message === 'success'){
                    layer.alert("添加完成");
                } else {
                    layer.alert("添加失败");
                }
            }
        })
    }

    function isBlank(s) {
        if (s == "undefined" || s == null || s == "" || s.length == 0) {
            return true;
        }
        return false;
    }

</script>

</body>
</html>
