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
        async:false,
        dataType:"json",
        success:function (res) {
            dataArray = res;
            foreachDataArray(1,dataArray);
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
            + "<td>" + (dataArray[i].produce_crewNum === 1?  dataArray[i].crew1RatioName:dataArray[i].crew2RatioName) + "</td>"
            + "<td>" + (dataArray[i].produce_crewNum === 1? '机组1':'机组2') + "</td>"
                + "<td>" + dataArray[i].骨料1 + "级预警" + "</td>"
                + "<td>" + dataArray[i].骨料1deviation + "%" + "</td>"
                + "<td>" + dataArray[i].沥青 + "级预警" + "</td>"
                + "<td>" + dataArray[i].沥青deviation + "%" + "</td>"
                + "<td>" + dataArray[i].一仓温度 + "级预警" + "</td>"
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
    var endDate = $("#inpend").val();
    var basePath = $("#path").val();
    debugger
    if (startDate && endDate){
        $.ajax({
            url:basePath + "/getAllCriticalWarningByDate.do",
            type:"post",
            dataType:"json",
            data:{
                "startDate":startDate,
                "endDate":endDate
            },
            success:function (res) {
                limitList(res);
            }
        })
    }else {
        layer.alert("请选择日期");
        return false;
    }


}