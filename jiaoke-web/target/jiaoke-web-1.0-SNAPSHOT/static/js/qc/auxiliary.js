



function  getModelByDateTimeAndCrew(rationNum) {
    var path = $("#path").val();
    var start = $("#inpstart").val();
    var end = $("#inpend").val();
    var proDate = "";
    if (start == null  || start == "" || end == null || end == "" ){
        layer.alert('请先选择日期');
        return false;
    }else {
        proDate = start + "to" + end;
    }
    var crew = $("#crew_num option:selected").val();

    if (proDate == null || proDate == ""){
        layer.alert("请选择日期范围用于确认材料");
        return false;
    }
    if (crew == "sect") {
        layer.alert("请选择机组");
        return false;
    }
        $.ajax({
            //该接口使用的是动态管理里面的接口，如需修改需自定义
            url: path + "/getRatioListByDate.do",
            type: "post",
            dataType:"json",
            data:{"proData":proDate,"crew":crew},
            success:function (res) {
                if (res.length === 0){
                    layer.alert('该日期并无生产');
                    $("#pro_message").text("该日期并无生产");
                }else {
                    $("#ratio_id").empty();
                    for (var i = 0; i < res.length;i++){
                        debugger
                        var modId = res[i].modele_id;
                        if (rationNum != null){
                            if (Number(rationNum) ===  modId ) {
                                $("#ratio_id").append("<option selected = 'selected' value=" + modId + ">" + res[i].pro_name + "</option>");
                            }else {
                                $("#ratio_id").append("<option  value=" + modId + ">" + res[i].pro_name + "</option>");
                            }
                        } else {
                            $("#ratio_id").append("<option value=" + modId + ">" + res[i].pro_name + "</option>");
                        }

                    }
                }
            }
        })

}

function selectProductMessage(){

    var path = $("#path").val();

    var start = $("#inpstart").val();
    var end = $("#inpend").val();
    var proDate = "";
    if (start == null  || start == "" || end == null || end == "" ){
        layer.alert('请先选择日期');
        return false;
    }else {
        proDate = start + "to" + end;
    }

    var crew = $("#crew_num option:selected").val();
    var rationId = $("#ratio_id option:selected").val();
    var waringLeve = $("#waring_leve option:selected").val();



    if (proDate == null || proDate == "" ){
        layer.alert("请选择日期范围");
    }else {
        if (proDate.indexOf("undefined") != -1){
            layer.alert("日期有误，请重新选择");
        }else {
            window.location.href = path + "/qc_auxiliary_analysis.do?proData=" + proDate + "&crew=" + crew + "&rationId=" + rationId + "&warningLive=" + waringLeve;
        }
    }

}
//记录当前点击的标签的Id
var tagId;
//点击查看按钮时弹出详细页面
function getProductById(producedId,prodate,discNum,crew,tagID) {
    debugger
    layer.close(layer.index);
    var path = $("#path").val();
    tagId = tagID;
    layer.open({
        type: 2,
        title: '产品详细信息',
        shadeClose: true,
        shade: false,
        maxmin: true, //开启最大化最小化按钮
        area: ['90%', '99%'],
        content: path + '/getProductById.do?producedId=' +producedId + '&prodate= ' + prodate +'&discNum=' + discNum + '&crew=' + crew
    });
}

function showProductByCondition(condition) {
    var proIndex;
    if (condition === 'up'){
        proIndex = --tagId;
    }else {
        proIndex = ++tagId;
    }

    $("#" + proIndex).click();

}