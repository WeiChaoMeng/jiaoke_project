$(function () {
    var dataAray = getAllCriticalWarning();
    limitList(dataAray);
})

function getAllCriticalWarning() {
    var basePath = $("#path").val();
    var dataArray;
    $.ajax({
        url:basePath + "/getAllCriticalWarning.do",
        type:"get",
        dataType:"json",
        beforeSend: function (XMLHttpRequest) {
            // 过滤某种条件下才控制loading效果
            var index = layer.load(3, {
                shade: [0.8,'#fff'] //0.1透明度的白色背景
            });
        },
        success:function (res) {
            if (res != null){
                dataArray = res;
                foreachDataArray(1,dataArray);
            } else {
                layer.alert("近期无预警信息")
            }

        },
        complete:function (XMLHttpRequest, status) {
            layer.closeAll()
        }
    })
    return dataArray;
}

//循环list
function foreachDataArray(currentNum,dataArray) {

    var arrayStart = (currentNum - 1) * 15;
    var arrayEnd = arrayStart + 15;
    $("#criticalBody").empty();
    for (var i = arrayStart; i < arrayEnd; i++ ){

        if (dataArray[i]){
            var temHtml = "<tr>"
            + "<td>" + dataArray[i].produce_date+ "</td>"
            + "<td>" + dataArray[i].produce_time + "</td>"
            + "<td>" + dataArray[i].produce_disc_num + "</td>"
                + "<td>" + (dataArray[i].project_name? dataArray[i].project_name:' ') + "</td>"
            + "<td>" + (dataArray[i].produce_crewNum === 1?  dataArray[i].crew1RatioName:dataArray[i].crew2RatioName) + "</td>"
            + "<td>" + (dataArray[i].produce_crewNum === 1? '机组1':'机组2') + "</td>"
                + "<td style='color: #a94442;'>" + dataArray[i].骨料1 + "级预警" + "</td>"
                + "<td>" + dataArray[i].骨料1deviation + "%" + "</td>"
                + "<td style='color: #a94442;'>" + dataArray[i].沥青 + "级预警" + "</td>"
                + "<td>" + dataArray[i].沥青deviation + "%" + "</td>"
                + "<td style='color: #a94442;'>" + dataArray[i].一仓温度 + "级预警" + "</td>"
                + "<td>" + dataArray[i].一仓温度deviation + "℃" + "</td>"
                + "<td><a href='/getCeiticalWarning.do?proDate="+dataArray[i].produce_date+"&produceDisc="+dataArray[i].produce_disc_num+"&crewNum="+dataArray[i].produce_crewNum +"'>查看</a></td>"
                + "</tr>";
        } else {
            break;
        }


        $("#criticalBody").append(temHtml);
    }


}

function limitList(dataAray) {
    foreachDataArray(1,dataAray);
    //翻页
    $(".zxf_pagediv").createPage({
        pageNum: Math.ceil(dataAray.length/15),
        current: 1,
        backfun: function(e) {
            e.pageNum = Math.ceil(dataAray.length/15);
            foreachDataArray(e.current,dataAray);
        }
    });
}

function selectCeiticalWarning() {
    var startDate = $("#inpstart").val();
    var endDate = $("#warinpend").val();
    var project = $("#project_id option:selected").val();
    var basePath = $("#path").val();

    if (startDate && endDate){
        $.ajax({
            url:basePath + "/getAllCriticalWarningByDate.do",
            type:"post",
            dataType:"json",
            data:{
                "startDate":startDate,
                "endDate":endDate,
                "project":project
            },
            beforeSend: function (XMLHttpRequest) {
                // 过滤某种条件下才控制loading效果
                var index = layer.load(3, {
                    shade: [0.8,'#fff'] //0.1透明度的白色背景
                });
            },
            success:function (res) {
                if(!res){
                    layer.alert("未查询到结果")
                }else {
                    limitList(res);
                }
            },
            complete:function (XMLHttpRequest, status) {
                layer.closeAll()
            }
        })
    }else {
        layer.alert("请选择日期");
        return false;
    }


}

function getProjectByDate() {
    alert(111)
}