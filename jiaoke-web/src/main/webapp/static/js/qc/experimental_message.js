//页面加载时获取
(function ($) {
    var id = $("#id").val();
    var tem = getExperimentalProjectMessage(id);
    showExperimentalProjectItem(tem);
})(jQuery);

function getExperimentalProjectMessage(id) {
    var basePath = $("#path").val();
    var tem = "";
    $.ajax({
        type: "POST",
        async:false,
        url: basePath + "/getExperimentalProjectMessage.do",
        data: {
            "id":id
        },
        dataType:'JSON',
        success:function (res) {
            if (res){
                for (var i = 0 ; i < res.length;i++) {
                    for (var p in  res[i]){

                        if ($.trim(res[i][p]) !== ""){
                            $("input[name='"+p+"']").val(res[i][p]);
                        }
                    }

                    if (tem == "undefined" || tem == null || tem == ""){
                        tem = res[i].table_name;
                    }else {
                        tem += "," + res[i].table_name;
                    }
                }
            }
        }
    })
    return tem;
}

function showExperimentalProjectItem(tem) {
    var basePath = $("#path").val();
    var experiment_num = $("input[name='experiment_num']").val();
    $.ajax({
        type: "POST",
        url: basePath + "/showExperimentalProjectItem.do",
        data: {
            "tableName":tem,
            "experiment_num":experiment_num
        },
        dataType:'JSON',
        success:function (res) {

            if (res){
                var material_num = res[0][0].materials_num;
                switch (material_num) {
                    //细集料 quality_test_material_dictionary ID
                    case 1:
                        showFineAggregate(res);
                        break;
                    //粗集料 quality_test_material_dictionary ID
                    case 2:
                        showCoarseAggregate(res);
                        break;
                    //矿粉 quality_test_material_dictionary ID
                    case 3:
                        showAsphalt(res);
                        break;
                    //沥青 quality_test_material_dictionary ID
                    case 4:
                        showAsphalt(res);
                        break;
                }
            }
        }
    })
}

Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "H+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

String.prototype.isBlank = function () {
    var s = $.trim(this);
    if (s == "undefined" || s == null || s == "" || s.length == 0) {
        return true;
    }
    return false;
};

//编写显示沥青实验信息(沥青、粗集料、细集料)
function showAsphalt(msg) {

    var firstHead = '<th>项目</th>'
        + '<th>单位</th>'
        + '<th>试验结果</th>'
        + '<th>试验方法</th>'
        + '<th>技术要求</th>';

    var firstTbody = '';
    var secondTable = '';

    for (var i = 0; i < msg.length; i++){
        for (var j = 0;j < msg[i].length;j++) {
            var  temHtml = '<tr>'
                + '<td><input type="text" class="td_input" name="asphalt_name"  value="' + msg[i][j]['asphalt_name']  + '" readonly="readonly" /></td>'
                + '<td><input type="text" class="td_input" name="asphalt_unit" value="' + msg[i][j]['asphalt_unit']  + '" readonly="readonly"  /></td>'
                + '<td><input type="text" class="td_input" name="asphalt_result" value="' + msg[i][j]['asphalt_result']  + '" /></td>'
                + '<td><input type="text" class="td_input" name="asphalt_method" value="' + msg[i][j]['asphalt_method']  + '"/></td>'
                + '<td><input type="text" class="td_input" name="asphalt_requirements" value="' + msg[i][j]['asphalt_requirements']  + '"/></td>'
                + '</tr>';

            if (msg[i][j]['asphalt_name'].indexOf("质量变化") != -1 || msg[i][j]['asphalt_name'].indexOf("残留针入度比") != -1  ||msg[i][j]['asphalt_name'].indexOf("延度10℃") != -1 ){
                secondTable += temHtml;
            }else {
                firstTbody += temHtml;
            }
        }
    }

    $("#firstTwoHead").remove();
    $("#firstThead").empty().append(firstHead);
    $("#firstTbody").empty().append(firstTbody);
    $("#secondTbody").empty().append(secondTable);

    if (secondTable != ''){
        $("#secondDiv").before('<span class="asphalt_span">沥青薄膜烘箱试验 TFOT </span>');
    }

    //修改样式
    $("#secondTable").css("margin","0");
    $("#firstTable").css("margin","30 0 0 0");

}

//编写显示细集料   实验信息
function showFineAggregate(msg) {
debugger
    var firstTbody = '';
    var secondTable = '';

    for (var i = 0; i < msg.length; i++){
        for (var j = 0;j < msg[i].length;j++) {
            var  temHtml= "";
            if (msg[i][j].fine_sieve_pore){
                temHtml = '<tr>'
                    + '<td><input type="text" class="td_input" name="fine_sieve_pore" value="' + msg[i][j].fine_sieve_pore +'" readonly="readonly" /> </td>'
                    + '<td><input type="text" class="td_input" name="fine_sieve_pore_4_75"   value="' + msg[i][j].fine_sieve_pore_4_75 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="fine_sieve_pore_2_36" value="' + msg[i][j].fine_sieve_pore_2_36 +'"   /> </td>'
                    + '<td><input type="text" class="td_input" name="fine_sieve_pore_1_18"  value="' + msg[i][j].fine_sieve_pore_1_18 +'" /> </td>'
                    + '<td><input type="text" class="td_input" name="fine_sieve_pore_0_6" value="' + msg[i][j].fine_sieve_pore_0_6 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="fine_sieve_pore_0_3" value="' + msg[i][j].fine_sieve_pore_0_3 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="fine_sieve_pore_0_15"  value="' + msg[i][j].fine_sieve_pore_0_15 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="fine_sieve_pore_0_075" value="' + msg[i][j].fine_sieve_pore_0_075 +'"  /> </td>'
                    + '</tr>';

                secondTable += temHtml;
            } else {
                temHtml = '<tr>'
                    + '<td><input type="text" class="td_input" name="fine_name"  value="' + msg[i][j]['fine_name']  + '" readonly="readonly" /></td>'
                    + '<td><input type="text" class="td_input" name="fine_requirements" value="' + msg[i][j]['fine_requirements']  + '"  /></td>'
                    + '<td colspan="3"><input type="text" class="td_input" name="fine_result" value="' + msg[i][j]['fine_result']  + '"  /></td>'
                    + '<td><input type="text" class="td_input" name="fine_method" value="' + msg[i][j]['fine_method']  + '"  /></td>'
                    + '</tr>';

                firstTbody += temHtml;
            }
        }

    }

    if (secondTable.isBlank()){
        $("#secondDiv").remove();
    }else {
        $("#secondTbody").empty().append(secondTable);
    }


    $("#firstTbody").empty().append(firstTbody);

}

//编写显示粗集料实验信息
function showCoarseAggregate(msg) {


    var firstHead = '<th>实验项目</th>'
        + '<th>技术要求</th>'
        + '<th>试验结果</th>'
        + '<th>试验方法</th>';

    var firstTwoHead = '<th>10-20mm</th>'
        + '<th>10-15mm</th>'
        + '<th>5-10mm</th>';

    var secondTwoHead ='<th>筛孔mm</th>'
        +'<th>19.0</th>'
        +'<th>16.0</th>'
        +'<th>13.2</th>'
        +'<th>9.5</th>'
        +'<th>4.75</th>'
        + '<th>2.36</th>'
        +'<th>1.18</th>'
        +'<th>0.6</th>'
        +'<th>0.3</th>'
        +'<th>0.15</th>'
        +'<th>0.075</th>';

    var firstTbody = '';
    var secondTable = '';

    for (var i = 0; i < msg.length; i++){
        var  temHtml= "";
        for (var j = 0;j < msg[i].length;j++) {
            if (msg[i][j].coarse_sieve_pore){
                temHtml = '<tr>'
                    + '<td><input type="text" class="td_input" name="coarse_sieve_pore"  value="'+ msg[i][j].coarse_sieve_pore +'"  /></td>'
                    + '<td><input type="text" class="td_input" name="coarse_sieve_pore_19_0" value="'+ msg[i][j].coarse_sieve_pore_19_0 +'"  /></td>'
                    + '<td><input type="text" class="td_input" name="coarse_sieve_pore_16_0" value="'+ msg[i][j].coarse_sieve_pore_16_0 +'"  /></td>'
                    + '<td><input type="text" class="td_input" name="coarse_sieve_pore_13_2" value="'+ msg[i][j].coarse_sieve_pore_13_2 +'" /></td>'
                    + '<td><input type="text" class="td_input" name="coarse_sieve_pore_9_5" value="'+ msg[i][j].coarse_sieve_pore_9_5 +'"  /></td>'
                    + '<td><input type="text" class="td_input" name="coarse_sieve_pore_4_75" value="'+ msg[i][j].coarse_sieve_pore_4_75 +'"  /></td>'
                    + '<td><input type="text" class="td_input" name="coarse_sieve_pore_2_36" value="'+ msg[i][j].coarse_sieve_pore_2_36 +'" /></td>'
                    + '<td><input type="text" class="td_input" name="coarse_sieve_pore_1_18" value="'+ msg[i][j].coarse_sieve_pore_1_18 +'"  /></td>'
                    + '<td><input type="text" class="td_input" name="coarse_sieve_pore_0_6" value="'+ msg[i][j].coarse_sieve_pore_0_6 +'"  /></td>'
                    + '<td><input type="text" class="td_input" name="coarse_sieve_pore_0_3" value="'+ msg[i][j].coarse_sieve_pore_0_3 +'" /></td>'
                    + '<td><input type="text" class="td_input" name="coarse_sieve_pore_0_15" value="'+ msg[i][j].coarse_sieve_pore_0_15 +'"  /></td>'
                    + '<td><input type="text" class="td_input" name="coarse_sieve_pore_0_075" value="'+ msg[i][j].coarse_sieve_pore_0_075 +'" /></td>'
                    + '</tr>';
                secondTable += temHtml;
            }else {
                    if (msg[i][j].coarse_name.indexOf("压碎值") != -1 || msg[i][j].coarse_name.indexOf("磨耗损失") != -1){
                        temHtml = '<tr>'
                            + '<td><input type="text" class="td_input" name="coarse_name"  value="' +  msg[i][j]['coarse_name']  + '" readonly="readonly" /></td>'
                            + '<td><input type="text" class="td_input" name="coarse_requirements" value="' +  msg[i][j]['coarse_requirements']  + '"/></td>'
                            + '<td colspan="3"><input type="text" class="td_input" name="coarse_result" value="' +  msg[i][j]['coarse_result']  + '" /></td>'
                            + '<td><input type="text" class="td_input" name="coarse_method" value="' +  msg[i][j]['coarse_method']  + '" /></td>'
                            + '</tr>';
                        firstTbody += temHtml;
                    }else {
                        temHtml = '<tr>'
                            + '<td><input type="text" class="td_input" name="coarse_name"  value="' +  msg[i][j]['coarse_name']  + '" readonly="readonly" /></td>'
                            + '<td><input type="text" class="td_input" name="coarse_requirements"  value="' +  msg[i][j]['coarse_requirements']  + '" /></td>'
                            + '<td ><input type="text" class="td_input" name="coarse_exper_result10_20"  value="' +  msg[i][j]['coarse_exper_result10_20']  + '" /></td>'
                            + '<td ><input type="text" class="td_input" name="coarse_result10_15"  value="' +  msg[i][j]['coarse_result10_15']  + '" /></td>'
                            + '<td ><input type="text" class="td_input" name="coarse_result5_10" value="' +  msg[i][j]['coarse_result5_10']  + '" /></td>'
                            + '<td><input type="text" class="td_input" name="coarse_method"  value="' +  msg[i][j]['coarse_method']  + '" /></td>'
                            + '</tr>';
                        firstTbody += temHtml;
                    }

            }
        }


    }


    if (secondTable.isBlank()){
        $("#secondDiv").remove();
    }else {
        $("#secondTwoHead").empty().append(secondTwoHead);
        $("#secondTbody").empty().append(secondTable);
    }

    $("#firstTwoHead").empty().append(firstTwoHead);
    $("#firstHead").empty().append(firstHead);
    $("#firstTbody").empty().append(firstTbody);
}