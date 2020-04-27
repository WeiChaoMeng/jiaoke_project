//页面加载时获取
(function ($) {

    $.fn.exist = function(){
        if($(this).length>=1){
            return true;
        }
        return false;
    };

    var id = $("#id").val();
    getExperimentalItemMsgById(id);
})(jQuery);

//读取实验信息
function getExperimentalItemMsgById(id) {
    var basePath = $("#path").val();
    $.ajax({
        type: "POST",
        url: basePath + "/getExperimentalItemMsgByIdForeign.do",
        data:{"id":id},
        dataType:'json',
        success: function(msg){
            //循环委托单基本信息
            for (var p in msg){
                $("input[name='" + p +"']").val(msg[p]);
            }
            //获取当前时间并展示
            var time2 = new Date().Format("yyyy-MM-dd");
            $("#report_date").val(time2);

            //查询委托单已选试验信息
            getExperimentalItemListById(id);
        }
    })
}

function getExperimentalItemListById(id) {
    var basePath = $("#path").val();
    $.ajax({
        type: "POST",
        url: basePath + "/getExperimentalItemListByIdForeign.do",
        data:{"id":id},
        dataType:'json',
        async: false,
        success:function (msg) {

            if (!jQuery.isEmptyObject(msg)){
                var material_num = msg[0].material_num;
                switch (material_num) {
                    //细集料 quality_test_material_dictionary ID
                    case 1:
                        showFineAggregate(msg);
                        break;
                    //粗集料 quality_test_material_dictionary ID
                    case 2:
                        showCoarseAggregate(msg);
                        break;
                        //矿粉 quality_test_material_dictionary ID
                    case 3:
                        showBrzzez(msg);
                        break;
                        //沥青 quality_test_material_dictionary ID
                    case 4:
                        showAsphalt(msg);
                        break;
                }
            } else {
                layer.alert("抱歉，未能查询到该实验");
            }
        }
    })
}

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
        var  temHtml = '<tr>'
                    + '<input type="text"  hidden = "hidden" name="table_name" value="' + msg[i]['table_name'] + '" />'
                    + '<td><input type="text" class="td_input" name="asphalt_name"  value="' + msg[i]['name']  + '" readonly="readonly" /></td>'
                    + '<td><input type="text" class="td_input" name="asphalt_unit" value="cm" /></td>'
                    + '<td><input type="text" class="td_input" name="asphalt_result" value="11.0" /></td>'
                    + '<td><input type="text" class="td_input" name="asphalt_method" value="T 0605" /></td>'
                    + '<td><input type="text" class="td_input" name="asphalt_requirements" value="不小于30" /></td>'
                    + '</tr>';
        if (msg[i].experimentId == 7 || msg[i].experimentId == 8 ||msg[i].experimentId == 9 ){
            secondTable += temHtml;
        }else {
            firstTbody += temHtml;
        }
    }

    $("#firstTwoHead").remove();
    $("#firstThead").empty().append(firstHead);
    $("#firstTbody").empty().append(firstTbody);
    $("#secondTbody").empty().append(secondTable);

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

        var  temHtml= "";
        if (msg[i]['name'] .indexOf("筛分试验") == -1){
            temHtml = '<tr>'
                + '<input type="text"  name="table_name" value="' + msg[i]['table_name'] + '" />'
                + '<td><input type="text" class="td_input" name="fine_name"  value="' + msg[i]['name']  + '" readonly="readonly" /></td>'
                + '<td><input type="text" class="td_input" name="fine_requirements" value="≯26" /></td>'
                + '<td colspan="3"><input type="text" class="td_input" name="fine_result" value="11.0" /></td>'
                + '<td><input type="text" class="td_input" name="fine_method" value="T 0605" /></td>'
                + '</tr>';

            firstTbody += temHtml;
        }else {
            temHtml = '<tr>'
                + '<input type="text"  name="table_name" value="' + msg[i]['table_name'] + '" />'
                + '<td><input type="text" class="td_input" name="fine_sieve_pore" value="机制砂" readonly="readonly" /> </td>'
                + '<td><input type="text" class="td_input" name="fine_sieve_pore_4_75"   /> </td>'
                + '<td><input type="text" class="td_input" name="fine_sieve_pore_2_36"  /> </td>'
                + '<td><input type="text" class="td_input" name="fine_sieve_pore_1_18"  /> </td>'
                + '<td><input type="text" class="td_input" name="fine_sieve_pore_0_6" /> </td>'
                + '<td><input type="text" class="td_input" name="fine_sieve_pore_0_3" /> </td>'
                + '<td><input type="text" class="td_input" name="fine_sieve_pore_0_15"  /> </td>'
                + '<td><input type="text" class="td_input" name="fine_sieve_pore_0_075" /> </td>'
                + '</tr>';

            secondTable += temHtml;
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

        var  temHtml ="";

        if (msg[i]['name'] .indexOf("筛分试验") == -1){
            if (msg[i]['name'].indexOf("压碎值") != -1 || msg[i]['name'].indexOf("磨耗损失") != -1){
                temHtml = '<tr>'
                    + '<td><input type="text" class="td_input" name="coarse_name"  value="' + msg[i]['name']  + '" readonly="readonly" /></td>'
                    + '<td><input type="text" class="td_input" name="coarse_requirements" value="cm" /></td>'
                    + '<td colspan="3"><input type="text" class="td_input" name="coarse_result" value="11.0" /></td>'
                    + '<td><input type="text" class="td_input" name="coarse_method" value="T 0605" /></td>'
                    + '</tr>';
                firstTbody += temHtml;
            }else {
                temHtml = '<tr>'
                    + '<td><input type="text" class="td_input" name="coarse_name"  value="' + msg[i]['name']  + '" readonly="readonly" /></td>'
                    + '<td><input type="text" class="td_input" name="coarse_requirements" value="cm" /></td>'
                    + '<td ><input type="text" class="td_input" name="coarse_exper_result10_20" value="11.0" /></td>'
                    + '<td ><input type="text" class="td_input" name="coarse_result10_15" value="11.0" /></td>'
                    + '<td ><input type="text" class="td_input" name="coarse_result5_10" value="11.0" /></td>'
                    + '<td><input type="text" class="td_input" name="coarse_method" value="T 0605" /></td>'
                    + '</tr>';
                firstTbody += temHtml;
            }


        }else {
            temHtml = '<tr>'
                + '<input type="text" name="table_name" value="' + msg[i]['table_name'] + '" />'
                + '<td><input type="text" class="td_input" name="coarse_sieve_pore"   /></td>'
                + '<td><input type="text" class="td_input" name="coarse_sieve_pore_19_0"  /></td>'
                + '<td><input type="text" class="td_input" name="coarse_sieve_pore_16_0"  /></td>'
                + '<td><input type="text" class="td_input" name="coarse_sieve_pore_13_2" /></td>'
                + '<td><input type="text" class="td_input" name="coarse_sieve_pore_9_5"  /></td>'
                + '<td><input type="text" class="td_input" name="coarse_sieve_pore_4_75"  /></td>'
                + '<td><input type="text" class="td_input" name="coarse_sieve_pore_2_36" /></td>'
                + '<td><input type="text" class="td_input" name="coarse_sieve_pore_1_18"  /></td>'
                + '<td><input type="text" class="td_input" name="coarse_sieve_pore_0_6"  /></td>'
                + '<td><input type="text" class="td_input" name="coarse_sieve_pore_0_3" /></td>'
                + '<td><input type="text" class="td_input" name="coarse_sieve_pore_0_15"  /></td>'
                + '<td><input type="text" class="td_input" name="coarse_sieve_pore_0_075" /></td>'
                + '</tr>';
            secondTable += temHtml;
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

//编写显示矿粉信息
function showBrzzez(msg) {

    var firstHead = '<th>实验项目</th>'
        + '<th>技术要求</th>'
        + '<th>试验结果</th>'
        + '<th>试验方法</th>';

    var firstTbody = '';

    for (var i = 0; i < msg.length; i++){
        var  temHtml = '<tr>'
            + '<td><input type="text" class="td_input" name="breeze_name"  value="' + msg[i]['name']  + '" readonly="readonly" /></td>'
            + '<td><input type="text" class="td_input" name="breeze_requirements" value=">2.5" /></td>'
            + '<td><input type="text" class="td_input" name="breeze_result" value="11.0" /></td>'
            + '<td><input type="text" class="td_input" name="breeze_method" value="T 0353" /></td>'
            + '</tr>';

            firstTbody += temHtml;
    }

    $("#firstTwoHead").remove();
    $("#firstThead").empty().append(firstHead);
    $("#firstTbody").empty().append(firstTbody);
    $("#secondDiv").remove();


    //修改样式
    $("#firstTable").css("margin","30 0 0 0");
}

//表单提交
function sendFrom(){
    var basePath = $("#path").val();
    var data = [];
    $('input[type=text]').each(function (i) {
        var tem = new Object();
        tem.name = $(this).attr("name");
        tem.value = $(this).val();
        data.push(tem);
    })

    //文本域
    var verdict = $("#verdict").text();
    var tem = new Object();
    tem.name = 'verdict';
    tem.value = verdict;
    data.push(tem);

    //获取实验数据
    var firstTest = getExperimentFromData();
    var coarseTest = "";
    if ($('#secondTbody').exist()){
        coarseTest = getCoarseData();
    }
    var json_str = JSON.stringify(data);


    $.ajax({
        type: "POST",
        url: basePath + "/sendFromDataForeign.do",
        data:{"fromJson":json_str,
                "firstTest":firstTest,
                "coarseTest":coarseTest},
        dataType:'json',
        async: false,
        success:function (res) {
            if (res.message == 'success'){
                parent.location.reload(); // 父页面刷新
                var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                parent.layer.close(index);
                layer.msg('实验数据添加成功');
            }else {
                layer.close(layer.index);
                layer.msg('实验数据添加失败');
            }
        }
    })
}


String.prototype.isBlank = function () {
    var s = $.trim(this);
    if (s == "undefined" || s == null || s == "" || s.length == 0) {
        return true;
    }
    return false;
};

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


//查询第一种实验
function getExperimentFromData() {

    var firstList = [];
    //获取第一种实验各类数据
    $("#firstTbody").find('tr').each(function (i) {
        var obj={};
        $(this).find("input[type=text]").each(function (j) {
            var name = $(this).attr("name");
            obj[name] = $(this).val();
        })
        firstList.push(obj);
    })
    return JSON.stringify(firstList);
}

//查询第二种实验
function getCoarseData() {
    var coarseData= [];
    //获取筛孔类相关实验
    $("#secondTbody").find('tr').each(function (i) {
        var obj={};
        $(this).find("input[type=text]").each(function (j) {
            var name = $(this).attr("name");
            obj[name] = $(this).val();
        })
        coarseData.push(obj);
    })

    return JSON.stringify(coarseData);
}