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
                        showBrzzez(res);
                        break;
                    //沥青 quality_test_material_dictionary ID
                    case 4:
                        showAsphalt(res);
                        break;
                    case 5:
                        coarseMilling(res);
                        break;
                    case 6:
                        rockAsphalt(res);
                        break;
                    case 7:
                        showFibre(res);
                        break;
                    case 8:
                        showEmulsified(res);
                        break;
                    case 9:
                        showMixture(res);
                        break;
                    case 10:
                        fineMilling(res);
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

//编写显示沥青实验信息
function showAsphalt(msg) {

    var firstHead = '<th>项目</th>'
        + '<th>单位</th>'
        + '<th>试验结果</th>'
        + '<th >试验方法</th>'
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
    $("#secondTable").empty().append(secondTable);

    if (secondTable != ''){
        $("#secondDiv").before('<span class="asphalt_span">沥青薄膜烘箱试验 TFOT </span>');
        $("#secondTwoHead").remove();
    }

    //修改样式
    $("#secondTable").css("margin","0");
    $("#firstTable").css("margin","30 0 0 0");
}

//编写显示细集料   实验信息
function showFineAggregate(msg) {
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
        + '<th colspan="3">试验结果</th>'
        + '<th>试验方法</th>';

    var secondTwoHead ='<th>筛孔mm</th>'
        +'<th>37.5</th>'
        +'<th>31.5</th>'
        +'<th>26.5</th>'
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
                    + '<td><input type="text" class="td_input" name="coarse_sieve_pore_37_5" value="'+ msg[i][j].coarse_sieve_pore_37_5 +'" /></td>'
                    + '<td><input type="text" class="td_input" name="coarse_sieve_pore_31_5" value="'+ msg[i][j].coarse_sieve_pore_31_5 +'" /></td>'
                    + '<td><input type="text" class="td_input" name="coarse_sieve_pore_26_5" value="'+ msg[i][j].coarse_sieve_pore_26_5 +'" /></td>'
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

                        temHtml = '<tr>'
                            + '<td><input type="text" class="td_input" name="coarse_name"  value="' +  msg[i][j]['coarse_name']  + '" readonly="readonly" /></td>'
                            + '<td><input type="text" class="td_input" name="coarse_requirements" value="' +  msg[i][j]['coarse_requirements']  + '"/></td>'
                            + '<td colspan="3"><input type="text" class="td_input" name="coarse_result" value="' +  msg[i][j]['coarse_result']  + '" /></td>'
                            + '<td><input type="text" class="td_input" name="coarse_method" value="' +  msg[i][j]['coarse_method']  + '" /></td>'
                            + '</tr>';
                        firstTbody += temHtml;

            }
        }


    }


    if (secondTable.isBlank()){
        $("#secondDiv").remove();
    }else {
        $("#secondTwoHead").empty().append(secondTwoHead);
        $("#secondTbody").empty().append(secondTable);
    }

     $("#firstTwoHead").remove();
    $("#firstHead").empty().append(firstHead);
    $("#firstTbody").empty().append(firstTbody);
}

//编辑显示石粉实验信息
function showBrzzez(msg) {
    var firstHead = '<th>实验项目</th>'
        + '<th>技术要求</th>'
        + '<th>试验结果</th>'
        + '<th>试验方法</th>';

    var firstTbody = '';

    for (var j = 0; j < msg.length; j++){
        for (var i = 0; i <msg[j].length;i++) {
            var  temHtml = '<tr>'
                + '<td><input type="text" class="td_input" name="breeze_name"  value="' + msg[j][i]['breeze_name']  + '" readonly="readonly" /></td>'
                + '<td><input type="text" class="td_input" name="breeze_requirements" value="' + msg[j][i]['breeze_requirements'] +'"  readonly="readonly"  /></td>'
                + '<td><input type="text" class="td_input" name="breeze_result" value="'+  msg[j][i]['breeze_result']  +'" readonly="readonly"  /></td>'
                + '<td><input type="text" class="td_input" name="breeze_method" value="'+  msg[j][i]['breeze_method']  +'" readonly="readonly"  /></td>'
                + '</tr>';
            firstTbody += temHtml;
        }
    }

    $("#firstTwoHead").remove();
    $("#firstThead").empty().append(firstHead);
    $("#firstTbody").empty().append(firstTbody);
    $("#secondDiv").remove();


    //修改样式
    $("#firstTable").css("margin","30 0 0 0");
}

//编写显示粗刨铣料
function coarseMilling(msg){
    var firstHead = '<th>实验项目</th>'
        + '<th>技术要求</th>'
        + '<th colspan="3">试验结果</th>'
        + '<th>试验方法</th>';

    var firstTbody = '';

    var secondTwoHead ='<th>筛孔mm</th>'
        +'<th>37.5</th>'
        +'<th>31.5</th>'
        +'<th>26.5</th>'
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


    var secondTable = '';

    for (var i = 0; i < msg.length; i++){
        for (var j = 0;j < msg[i].length;j++) {
            var  temHtml= "";
            if (msg[i][j].mill_sieve_pore){
                temHtml = '<tr>'
                    + '<td><input type="text" class="td_input" name="mill_sieve_pore" value="' + msg[i][j].mill_sieve_pore +'" readonly="readonly" /> </td>'
                    + '<td><input type="text" class="td_input" name="mill_sieve_pore_37_5"   value="' + msg[i][j].mill_sieve_pore_37_5+'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mill_sieve_pore_31_5" value="' + msg[i][j].mill_sieve_pore_31_5+'"   /> </td>'
                    + '<td><input type="text" class="td_input" name="mill_sieve_pore_26_5"  value="' + msg[i][j].mill_sieve_pore_26_5 +'" /> </td>'
                    + '<td><input type="text" class="td_input" name="mill_sieve_pore_19_0" value="' + msg[i][j].mill_sieve_pore_19_0+'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mill_sieve_pore_16_0" value="' + msg[i][j].mill_sieve_pore_16_0 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mill_sieve_pore_13_2"  value="' + msg[i][j].mill_sieve_pore_13_2 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mill_sieve_pore_9_5" value="' + msg[i][j].mill_sieve_pore_9_5 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mill_sieve_pore_4_75"   value="' + msg[i][j].mill_sieve_pore_4_75 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mill_sieve_pore_2_36" value="' + msg[i][j].mill_sieve_pore_2_36 +'"   /> </td>'
                    + '<td><input type="text" class="td_input" name="mill_sieve_pore_1_18"  value="' + msg[i][j].mill_sieve_pore_1_18 +'" /> </td>'
                    + '<td><input type="text" class="td_input" name="mill_sieve_pore_0_6" value="' + msg[i][j].mill_sieve_pore_0_6 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mill_sieve_pore_0_3" value="' + msg[i][j].mill_sieve_pore_0_3 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mill_sieve_pore_0_15"  value="' + msg[i][j].mill_sieve_pore_0_15 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mill_sieve_pore_0_075" value="' + msg[i][j].mill_sieve_pore_0_075 +'"  /> </td>'
                    + '</tr>';

                secondTable += temHtml;
            } else {
                temHtml = '<tr>'
                    + '<td><input type="text" class="td_input" name="mill_name"  value="' + msg[i][j]['mill_name']  + '" readonly="readonly" /></td>'
                    + '<td><input type="text" class="td_input" name="mill_requirements" value="' + msg[i][j]['mill_requirements']  + '"  /></td>'
                    + '<td colspan="3"><input type="text" class="td_input" name="mill_result" value="' + msg[i][j]['mill_result']  + '"  /></td>'
                    + '<td><input type="text" class="td_input" name="mill_method" value="' + msg[i][j]['mill_method']  + '"  /></td>'
                    + '</tr>';

                firstTbody += temHtml;
            }
        }

    }


    if (secondTable.isBlank()){
        $("#secondDiv").remove();
    }else {
        $("#secondTwoHead").empty().append(secondTwoHead);
        $("#secondTbody").empty().append(secondTable);
    }

    $("#firstTwoHead").remove();
    $("#firstHead").empty().append(firstHead);
    $("#firstTbody").empty().append(firstTbody);
}
//编写显示细刨铣料
function fineMilling(msg){
    var firstHead = '<th>实验项目</th>'
        + '<th>技术要求</th>'
        + '<th colspan="3">试验结果</th>'
        + '<th>试验方法</th>';

    var firstTbody = '';

    var secondTwoHead ='<th>筛孔mm</th>'
        +'<th>37.5</th>'
        +'<th>31.5</th>'
        +'<th>26.5</th>'
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


    var secondTable = '';

    for (var i = 0; i < msg.length; i++){
        for (var j = 0;j < msg[i].length;j++) {
            var  temHtml= "";
            if (msg[i][j].millfine_sieve_pore){
                temHtml = '<tr>'
                    + '<td><input type="text" class="td_input" name="millfine_sieve_pore" value="' + msg[i][j].millfine_sieve_pore +'" readonly="readonly" /> </td>'
                    + '<td><input type="text" class="td_input" name="millfine_sieve_pore_37_5"   value="' + msg[i][j].millfine_sieve_pore_37_5+'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="millfine_sieve_pore_31_5" value="' + msg[i][j].millfine_sieve_pore_31_5+'"   /> </td>'
                    + '<td><input type="text" class="td_input" name="millfine_sieve_pore_26_5"  value="' + msg[i][j].millfine_sieve_pore_26_5 +'" /> </td>'
                    + '<td><input type="text" class="td_input" name="millfine_sieve_pore_19_0" value="' + msg[i][j].millfine_sieve_pore_19_0+'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="millfine_sieve_pore_16_0" value="' + msg[i][j].millfine_sieve_pore_16_0 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="millfine_sieve_pore_13_2"  value="' + msg[i][j].millfine_sieve_pore_13_2 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="millfine_sieve_pore_9_5" value="' + msg[i][j].millfine_sieve_pore_9_5 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="millfine_sieve_pore_4_75"   value="' + msg[i][j].millfine_sieve_pore_4_75 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="millfine_sieve_pore_2_36" value="' + msg[i][j].millfine_sieve_pore_2_36 +'"   /> </td>'
                    + '<td><input type="text" class="td_input" name="millfine_sieve_pore_1_18"  value="' + msg[i][j].millfine_sieve_pore_1_18 +'" /> </td>'
                    + '<td><input type="text" class="td_input" name="millfine_sieve_pore_0_6" value="' + msg[i][j].millfine_sieve_pore_0_6 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="millfine_sieve_pore_0_3" value="' + msg[i][j].millfine_sieve_pore_0_3 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="millfine_sieve_pore_0_15"  value="' + msg[i][j].millfine_sieve_pore_0_15 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="millfine_sieve_pore_0_075" value="' + msg[i][j].millfine_sieve_pore_0_075 +'"  /> </td>'
                    + '</tr>';

                secondTable += temHtml;
            } else {
                temHtml = '<tr>'
                    + '<td><input type="text" class="td_input" name="millfine_name"  value="' + msg[i][j]['millfine_name']  + '" readonly="readonly" /></td>'
                    + '<td><input type="text" class="td_input" name="millfine_requirements" value="' + msg[i][j]['millfine_requirements']  + '"  /></td>'
                    + '<td colspan="3"><input type="text" class="td_input" name="millfine_result" value="' + msg[i][j]['millfine_result']  + '"  /></td>'
                    + '<td><input type="text" class="td_input" name="millfine_method" value="' + msg[i][j]['millfine_method']  + '"  /></td>'
                    + '</tr>';

                firstTbody += temHtml;
            }
        }

    }


    if (secondTable.isBlank()){
        $("#secondDiv").remove();
    }else {
        $("#secondTwoHead").empty().append(secondTwoHead);
        $("#secondTbody").empty().append(secondTable);
    }

    $("#firstTwoHead").remove();
    $("#firstHead").empty().append(firstHead);
    $("#firstTbody").empty().append(firstTbody);
}
//编写岩沥青
function rockAsphalt(msg){
    var firstHead = '<th>实验项目</th>'
        + '<th>技术要求</th>'
        + '<th colspan="3">试验结果</th>'
        + '<th>试验方法</th>';

    var firstTbody = '';

    var secondTwoHead ='<th>筛孔mm</th>'
        +'<th>37.5</th>'
        +'<th>31.5</th>'
        +'<th>26.5</th>'
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


    var secondTable = '';

    for (var i = 0; i < msg.length; i++){
        for (var j = 0;j < msg[i].length;j++) {
            var  temHtml= "";
            if (msg[i][j].rock_sieve_pore){
                temHtml = '<tr>'
                    + '<td><input type="text" class="td_input" name="rock_sieve_pore" value="' + msg[i][j].rock_sieve_pore +'" readonly="readonly" /> </td>'
                    + '<td><input type="text" class="td_input" name="rock_sieve_pore_37_5"   value="' + msg[i][j].rock_sieve_pore_37_5+'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="rock_sieve_pore_31_5" value="' + msg[i][j].rock_sieve_pore_31_5+'"   /> </td>'
                    + '<td><input type="text" class="td_input" name="rock_sieve_pore_26_5"  value="' + msg[i][j].rock_sieve_pore_26_5 +'" /> </td>'
                    + '<td><input type="text" class="td_input" name="rock_sieve_pore_19_0" value="' + msg[i][j].rock_sieve_pore_19_0+'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="rock_sieve_pore_16_0" value="' + msg[i][j].rock_sieve_pore_16_0 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="rock_sieve_pore_13_2"  value="' + msg[i][j].rock_sieve_pore_13_2 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="rock_sieve_pore_9_5" value="' + msg[i][j].rock_sieve_pore_9_5 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="rock_sieve_pore_4_75"   value="' + msg[i][j].rock_sieve_pore_4_75 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="rock_sieve_pore_2_36" value="' + msg[i][j].rock_sieve_pore_2_36 +'"   /> </td>'
                    + '<td><input type="text" class="td_input" name="rock_sieve_pore_1_18"  value="' + msg[i][j].rock_sieve_pore_1_18 +'" /> </td>'
                    + '<td><input type="text" class="td_input" name="rock_sieve_pore_0_6" value="' + msg[i][j].rock_sieve_pore_0_6 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="rock_sieve_pore_0_3" value="' + msg[i][j].rock_sieve_pore_0_3 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="rock_sieve_pore_0_15"  value="' + msg[i][j].rock_sieve_pore_0_15 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="rock_sieve_pore_0_075" value="' + msg[i][j].rock_sieve_pore_0_075 +'"  /> </td>'
                    + '</tr>';

                secondTable += temHtml;
            } else {
                temHtml = '<tr>'
                    + '<td><input type="text" class="td_input" name="rock_name"  value="' + msg[i][j]['rock_name']  + '" readonly="readonly" /></td>'
                    + '<td><input type="text" class="td_input" name="rock_requirements" value="' + msg[i][j]['rock_requirements']  + '"  /></td>'
                    + '<td colspan="3"><input type="text" class="td_input" name="rock_result" value="' + msg[i][j]['rock_result']  + '"  /></td>'
                    + '<td><input type="text" class="td_input" name="rock_method" value="' + msg[i][j]['rock_method']  + '"  /></td>'
                    + '</tr>';

                firstTbody += temHtml;
            }
        }

    }


    if (secondTable.isBlank()){
        $("#secondDiv").remove();
    }else {
        $("#secondTwoHead").empty().append(secondTwoHead);
        $("#secondTbody").empty().append(secondTable);
    }

    $("#firstTwoHead").remove();
    $("#firstHead").empty().append(firstHead);
    $("#firstTbody").empty().append(firstTbody);
}
//显示纤维
function showFibre(msg) {

    var firstHead = '<th>实验项目</th>'
        + '<th>技术要求</th>'
        + '<th>试验结果</th>'
        + '<th>试验方法</th>';

    var firstTbody = '';
    var secondTable = '';
    var secondTwoHead = '';

    for (var i = 0; i < msg.length; i++){
        for (var j = 0;j < msg[i].length;j++) {
            var  temHtml = '<tr>'
                + '<td><input type="text" class="td_input" name="fibre_name"  value="' + msg[i][j]['fibre_name']  + '" readonly="readonly" /></td>'
                + '<td><input type="text" class="td_input" name="fibre_requirements" value="' + msg[i][j]['fibre_requirements']  + '"/></td>'
                + '<td><input type="text" class="td_input" name="fibre_result" value="' + msg[i][j]['fibre_result']  + '" /></td>'
                + '<td><input type="text" class="td_input" name="fibre_method" value="' + msg[i][j]['fibre_method']  + '"/></td>'
                + '</tr>';
                firstTbody += temHtml;

        }
    }

    if (secondTable.isBlank()){
        $("#secondDiv").remove();
    }else {
        $("#secondTwoHead").empty().append(secondTwoHead);
        $("#secondTbody").empty().append(secondTable);
    }

    $("#firstTwoHead").remove();
    $("#firstHead").empty().append(firstHead);
    $("#firstTbody").empty().append(firstTbody);
}
//编写乳化沥青
function showEmulsified(msg) {

    var firstHead = '<th>实验项目</th>'
        + '<th>技术要求</th>'
        + '<th>试验结果</th>'
        + '<th>试验方法</th>';

    var firstTbody = '';
    var secondTable = '';
    for (var i = 0; i < msg.length; i++){
        for (var j = 0;j < msg[i].length;j++) {
            var  temHtml = '<tr>'
                + '<td><input type="text" class="td_input" name="emulsified_name"  value="' + msg[i][j]['emulsified_name']  + '" readonly="readonly" /></td>'
                + '<td><input type="text" class="td_input" name="emulsified_requirements" value="' + msg[i][j]['emulsified_requirements']  + '"/></td>'
                + '<td><input type="text" class="td_input" name="emulsified_result" value="' + msg[i][j]['emulsified_result']  + '" /></td>'
                + '<td><input type="text" class="td_input" name="emulsified_method" value="' + msg[i][j]['emulsified_method']  + '"/></td>'
                + '</tr>';
            firstTbody += temHtml;

        }
    }

    if (secondTable.isBlank()){
        $("#secondDiv").remove();
    }else {
        $("#secondTwoHead").empty().append(secondTwoHead);
        $("#secondTbody").empty().append(secondTable);
    }

    $("#firstTwoHead").remove();
    $("#firstHead").empty().append(firstHead);
    $("#firstTbody").empty().append(firstTbody);

    //修改样式
    $("#firstTable").css("margin","30 0 0 0");
}
//编写沥青混合料
function showMixture(msg){
    var firstHead = '<th>实验项目</th>'
        + '<th>技术要求</th>'
        + '<th colspan="3">试验结果</th>'
        + '<th>试验方法</th>';

    var firstTbody = '';

    var secondTwoHead ='<th>筛孔mm</th>'
        +'<th>37.5</th>'
        +'<th>31.5</th>'
        +'<th>26.5</th>'
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


    var secondTable = '';

    for (var i = 0; i < msg.length; i++){
        for (var j = 0;j < msg[i].length;j++) {
            var  temHtml= "";
            if (msg[i][j].mixture_sieve_pore){
                temHtml = '<tr>'
                    + '<td><input type="text" class="td_input" name="mixture_sieve_pore" value="' + msg[i][j].mixture_sieve_pore +'" readonly="readonly" /> </td>'
                    + '<td><input type="text" class="td_input" name="mixture_sieve_pore_37_5"   value="' + msg[i][j].mixture_sieve_pore_37_5+'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mixture_sieve_pore_31_5" value="' + msg[i][j].mixture_sieve_pore_31_5+'"   /> </td>'
                    + '<td><input type="text" class="td_input" name="mixture_sieve_pore_26_5"  value="' + msg[i][j].mixture_sieve_pore_26_5 +'" /> </td>'
                    + '<td><input type="text" class="td_input" name="mixture_sieve_pore_19_0" value="' + msg[i][j].mixture_sieve_pore_19_0+'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mixture_sieve_pore_16_0" value="' + msg[i][j].mixture_sieve_pore_16_0 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mixture_sieve_pore_13_2"  value="' + msg[i][j].mixture_sieve_pore_13_2 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mixture_sieve_pore_9_5" value="' + msg[i][j].mixture_sieve_pore_9_5 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mixture_sieve_pore_4_75"   value="' + msg[i][j].mixture_sieve_pore_4_75 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mixture_sieve_pore_2_36" value="' + msg[i][j].mixture_sieve_pore_2_36 +'"   /> </td>'
                    + '<td><input type="text" class="td_input" name="mixture_sieve_pore_1_18"  value="' + msg[i][j].mixture_sieve_pore_1_18 +'" /> </td>'
                    + '<td><input type="text" class="td_input" name="mixture_sieve_pore_0_6" value="' + msg[i][j].mixture_sieve_pore_0_6 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mixture_sieve_pore_0_3" value="' + msg[i][j].mixture_sieve_pore_0_3 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mixture_sieve_pore_0_15"  value="' + msg[i][j].mixture_sieve_pore_0_15 +'"  /> </td>'
                    + '<td><input type="text" class="td_input" name="mixture_sieve_pore_0_075" value="' + msg[i][j].mixture_sieve_pore_0_075 +'"  /> </td>'
                    + '</tr>';

                secondTable += temHtml;
            } else {
                temHtml = '<tr>'
                    + '<td><input type="text" class="td_input" name="mixture_name"  value="' + msg[i][j]['mixture_name']  + '" readonly="readonly" /></td>'
                    + '<td><input type="text" class="td_input" name="mixture_requirements" value="' + msg[i][j]['mixture_requirements']  + '"  /></td>'
                    + '<td colspan="3"><input type="text" class="td_input" name="mixture_result" value="' + msg[i][j]['mixture_result']  + '"  /></td>'
                    + '<td><input type="text" class="td_input" name="mixture_method" value="' + msg[i][j]['mixture_method']  + '"  /></td>'
                    + '</tr>';

                firstTbody += temHtml;
            }
        }

    }


    if (secondTable.isBlank()){
        $("#secondDiv").remove();
    }else {
        $("#secondTwoHead").empty().append(secondTwoHead);
        $("#secondTbody").empty().append(secondTable);
    }

    $("#firstTwoHead").remove();
    $("#firstHead").empty().append(firstHead);
    $("#firstTbody").empty().append(firstTbody);
}