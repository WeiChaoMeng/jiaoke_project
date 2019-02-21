



function  getModelByDateAndCrew(rationNum) {
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