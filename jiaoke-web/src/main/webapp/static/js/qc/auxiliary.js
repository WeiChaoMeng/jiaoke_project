


var custom = jeDate("#test11",{
    format: "YYYY-MM-DD",
    multiPane:false,
    range:" to "
});

function  getModelByDateAndCrew(rationNum) {
    var path = $("#path").val();
    var proDate = $("#test11").val();
    var crew = $("#crew_num option:selected").val();

    if (proDate == null || proDate == ""){
        alert("请选择日期范围用于确认材料")
    }else {
        $.ajax({
            url: path + "/getRatioListByDate.do",
            type: "post",
            dataType:"json",
            data:{"proData":proDate,"crew":crew},
            success:function (res) {
                if (res == null){
                    $("#pro_message").text("该日期并无生产");
                }else {
                    for (var i = 0; i < res.length;i++){
                        if (rationNum != null){
                            debugger
                            if (rationNum == res[i].modele_id ) {
                                $("#ratio_id").append("<option selected = 'selected' value=" + res[i].modele_id + ">" + res[i].pro_name + "</option>");
                            }else {
                                $("#ratio_id").append("<option  value=" + res[i].modele_id + ">" + res[i].pro_name + "</option>");
                            }
                        } else {
                            $("#ratio_id").append("<option value=" + res[i].modele_id + ">" + res[i].pro_name + "</option>");
                        }

                    }
                }
            }
        })
    }
}

function selectProductMessage(){

    var path = $("#path").val();
    var proDate = $("#test11").val();
    var crew = $("#crew_num option:selected").val();
    var rationId = $("#ratio_id option:selected").val();
    var waringLeve = $("#waring_leve option:selected").val();



    if (proDate == null || proDate == "" ){
        alert("请选择日期范围")

    }else {
        if (proDate.indexOf("undefined") != -1){
            alert("日期有误，请重新选择")
        }else {
            window.location.href = path + "/qc_auxiliary_analysis.do?proData=" + proDate + "&crew=" + crew + "&rationId=" + rationId + "&warningLive=" + waringLeve;
        }
    }

}