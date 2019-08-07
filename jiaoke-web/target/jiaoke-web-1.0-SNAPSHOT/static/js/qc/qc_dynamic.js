
//选择日期与机组后查询日期内生产的模板
function  getProduceRatioByCrew(rationNum) {

    var path = $("#path").val();
    var dateStart = $("#inpstart").val();
    var dateEnd = $("#inpend").val();
    var proDate = "";
    if (dateStart == null  || dateStart == "" || dateEnd == null || dateEnd == "" ){
        layer.alert('请先选择日期');
        return false;
    }else {
        proDate = dateStart + "to" + dateEnd;
    }
    var crew = $("#crew_num option:selected").val();

    if (proDate == null || proDate == ""){

    }else {
        $.ajax({
            url: path + "/getRatioListByDate.do",
            type: "post",
            dataType:"json",
            data:{"proData":proDate,"crew":crew},
            success:function (res) {
                if (res.length <= 0){
                    layer.alert("该日期并无生产");
                    $("#pro_message").text("该日期并无生产");
                }else {
                    $("#ratio_id").empty();
                    for (var i = 0; i < res.length;i++){
                        if (rationNum != null){
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

//点击材料时发送数据到后台接口
function chengeHref(id){

    var href = $("#"+id).attr('href');
    var path = $("#path").val();
    var dateStart = $("#inpstart").val();
    var dateEnd = $("#inpend").val();
    var date = "";
    if (dateStart == null  || dateStart == "" || dateEnd == null || dateEnd == "" ){
        layer.alert('请先选择日期');
        return false;
    }else {
        date = dateStart + "to" + dateEnd;
    }
    var crew = $("#crew_num option:selected").val();
    var ratioNum = $("#ratio_id option:selected").val();

    if (date == "" || date == null) {alert("请选择日期");return false; };
    if (crew == "0") {alert("请选择机组号"); return false;};
    if (ratioNum == "0") {alert("请选择模板号"); return false;};


    if(href == ''){
        $("#"+id).attr("href",path+"/getEcharsDataByMaterialAndDate.do?date="+ date + "&material="+id + "&ratioNum=" + ratioNum +"&crew=" + crew);
    }

}


//获取当前日期
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate() - 1 ;
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}

