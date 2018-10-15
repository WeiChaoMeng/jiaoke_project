// 初始化
$(function () {

});
/***********************间隔执行Start*****************************/
window.setInterval(getWarningData,3000);
/***********************间隔执行End*****************************/
function getWarningData() {
    $.ajax({
        url:"http://localhost:8080/getQualityWarningData.do",
        type:"post",
        dataType:"json",
        success:function (res) {
            $("#crew1_material").empty();
            $("#crew2_material").empty();
            var materialStr = "";
            var messageStr = "";
            var warningLeve = "";
            if (res != "" || res != null){
                for (var i = 0; i < res.length; i++){
                    materialStr = "#crew" + res[i].produce_crewNum + "_" + 'material';
                    messageStr = "#crew" +   res[i].produce_crewNum + "_" + 'message';

                    switch (res[i].warning_level) {
                        case "1":
                            warningLeve = "一级预警";
                            break;
                        case "2":
                            warningLeve = "二级预警";
                            break;
                        case "3":
                            warningLeve = "三级预警";
                            break;
                    }
                    if (res[i].material_name == '沥青温度' ||res[i].material_name == '混合料温度' ||res[i].material_name == '骨料温度' ) {
                        $(materialStr).append(
                            '<tr class="warning_table_even">'
                            +   '<td>' + res[i].material_name + '</td>'
                            +    '<td>'+res[i].moudle_ratio+'<i>℃</i></td>'
                            +    '<td>'+res[i].actual_ratio+'<i>℃</i></td>'
                            +    '<td>'+res[i].deviation_ratio+'<i>℃</i></td>'
                            +   '<td>'+warningLeve+'</td>'
                            +   '</tr>'
                        )
                    }else {
                        $(materialStr).append(
                            '<tr class="warning_table_even">'
                            +   '<td>' + res[i].material_name + '</td>'
                            +    '<td>'+res[i].moudle_ratio+'<i>%</i></td>'
                            +    '<td>'+res[i].actual_ratio+'<i>%</i></td>'
                            +    '<td>'+res[i].deviation_ratio+'<i>%</i></td>'
                            +   '<td>'+warningLeve +'</td>'
                            +   '</tr>'
                        )
                    }


                }
            }
        }
    })
}
 