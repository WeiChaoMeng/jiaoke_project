
var dataArray;

$(function () {
    //查询前三天数据
     getThreeDayData();
    //页面初始化时加载第一次数据
    getDateByPageNum(1);
    //翻页
    $(".zxf_pagediv").createPage({
        pageNum: Math.ceil(dataArray.length / 50),
        current: 1,
        backfun: function(e) {
            e.pageNum = Math.ceil(dataArray.length / 50);
            getDateByPageNum(e.current);
        }
    });

})

/**
 * 查询三天前数据
 */
function getThreeDayData() {
    var basePath = $("#path").val();
    var index = layer.load(3, {
        shade: [0.1,'#fff'] //0.1透明度的白色背景
    });
    $.ajax({
        url:basePath + "/getThreeDayData.do",
        type:"get",
        async:false,
        dataType:"json",
        beforeSend:function(){
            var index = layer.load(3, {
                shade: [0.1,'#fff'] //0.1透明度的白色背景
            });
        },
        complete:function(){
            layer.closeAll();
        },
        success:function (res) {
            dataArray = res;
            var htmlStr = '';
            for (var i = 0; i < dataArray.length;i++){
                if (dataArray[i]){
                    var project_name = dataArray[i].project_name ? dataArray[i].project_name:"";
                    htmlStr += "<tr>"
                        + "<td >" + dataArray[i].produce_date + "</td>"
                        + "<td>" + dataArray[i].produce_time  + "</td>"
                        + "<td>" + (dataArray[i].crewNums === 'data1'? '机组1':'机组2')  + "</td>"
                        + "<td>" + dataArray[i].produce_disc_num  + "</td>"
                        + "<td>" + dataArray[i].produce_car_num  + "</td>"
                        + "<td title=" + project_name + ">" + project_name  + "</td>"
                        + "<td>" + dataArray[i].pro_name  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_10  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_9  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_8  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_7  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_6  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_5  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_4  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_3  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_2  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_1  + "</td>"
                        + "<td>" + dataArray[i].material_stone_4  + "</td>"
                        + "<td>" + dataArray[i].material_stone_3  + "</td>"
                        + "<td>" + dataArray[i].material_stone_2  + "</td>"
                        + "<td>" + dataArray[i].material_stone_1  + "</td>"
                        + "<td>" + dataArray[i].material_asphalt  + "</td>"
                        + "<td>" + dataArray[i].material_regenerate  + "</td>"
                        + "<td>" + dataArray[i].material_additive_3  + "</td>"
                        + "<td>" + dataArray[i].material_additive_2  + "</td>"
                        + "<td>" + dataArray[i].material_additive_1  + "</td>"
                        + "<td>" + dataArray[i].material_additive  + "</td>"
                        + "<td>" + dataArray[i].material_total  + "</td>"
                        + "<td>" + dataArray[i].temperature_warehouse_1  + "</td>"
                        + "<td>" + dataArray[i].temperature_mixture  + "</td>"
                        + "<td>" + dataArray[i].temperature_asphalt  + "</td>"
                        + "<td>" + dataArray[i].temperature_aggregate  + "</td>"
                        + "<td>" + dataArray[i].temperature_duster  + "</td>"
                        + "</tr>";
                }
            }

            $("#allProductData").empty().append(htmlStr);
        }
    })
    layer.close(index);
}

/**
 * 渲染到页面
 * @param currentNum
 */
function getDateByPageNum(currentNum){
    var arrayStart = (currentNum - 1) * 50;
    var arrayEnd = arrayStart + 50;
    var htmlStr;
    for (var i = arrayStart; i < arrayEnd; i++ ){
        if (dataArray[i]){
            var project_name = dataArray[i].project_name ? dataArray[i].project_name:"";
            htmlStr += "<tr>"
                + "<td class='prodate' >" + dataArray[i].produce_date + "</td>"
                + "<td>" + dataArray[i].produce_time  + "</td>"
                + "<td>" + (dataArray[i].crewNums === 'data1'? '机组1':'机组2')  + "</td>"
                + "<td>" + dataArray[i].produce_disc_num  + "</td>"
                + "<td>" + dataArray[i].produce_car_num  + "</td>"
                + "<td title=" + project_name + ">" + project_name  + "</td>"
                + "<td>" + dataArray[i].pro_name  + "</td>"
                + "<td>" + dataArray[i].material_aggregate_10  + "</td>"
                + "<td>" + dataArray[i].material_aggregate_9  + "</td>"
                + "<td>" + dataArray[i].material_aggregate_8  + "</td>"
                + "<td>" + dataArray[i].material_aggregate_7  + "</td>"
                + "<td>" + dataArray[i].material_aggregate_6  + "</td>"
                + "<td>" + dataArray[i].material_aggregate_5  + "</td>"
                + "<td>" + dataArray[i].material_aggregate_4  + "</td>"
                + "<td>" + dataArray[i].material_aggregate_3  + "</td>"
                + "<td>" + dataArray[i].material_aggregate_2  + "</td>"
                + "<td>" + dataArray[i].material_aggregate_1  + "</td>"
                + "<td>" + dataArray[i].material_stone_4  + "</td>"
                + "<td>" + dataArray[i].material_stone_3  + "</td>"
                + "<td>" + dataArray[i].material_stone_2  + "</td>"
                + "<td>" + dataArray[i].material_stone_1  + "</td>"
                + "<td>" + dataArray[i].material_asphalt  + "</td>"
                + "<td>" + dataArray[i].material_regenerate  + "</td>"
                + "<td>" + dataArray[i].material_additive_3  + "</td>"
                + "<td>" + dataArray[i].material_additive_2  + "</td>"
                + "<td>" + dataArray[i].material_additive_1  + "</td>"
                + "<td>" + dataArray[i].material_additive  + "</td>"
                + "<td>" + dataArray[i].material_total  + "</td>"
                + "<td>" + dataArray[i].temperature_warehouse_1  + "</td>"
                + "<td>" + dataArray[i].temperature_mixture  + "</td>"
                + "<td>" + dataArray[i].temperature_asphalt  + "</td>"
                + "<td>" + dataArray[i].temperature_aggregate  + "</td>"
                + "<td>" + dataArray[i].temperature_duster  + "</td>"
                + "</tr>";
        }

    }
    $("#productData").empty().append(htmlStr);
}


function  getModelByDateTimeAndCrew(rationNum) {
    var path = $("#path").val();
    var start = $("#inpstart").val();
    var end = $("#inpend").val();
    if (start.isBlanks() || end.isBlanks() ){
        layer.alert('请先选择日期');
        return false;
    }
    var crew = $("#crew_num option:selected").val();

    if (crew === "select") {
        layer.alert("请选择机组");
        return false;
    }
    $.ajax({
        //该接口使用的是动态管理里面的接口，如需修改需自定义
        url: path + "/getRatioListByDateTime.do",
        type: "post",
        dataType:"json",
        data:{"startDateTime":start,"endDateTime":end,"crew":crew},
        success:function (res) {
            var rationArry = res.rationList;
            var projectArry = res.projectList;
            if (rationArry.length === 0){
                layer.alert('该日期并无生产');
                $("#pro_message").text("该日期并无生产");
            }else {
                $("#ratio_id").empty().append('<option value="select" >请选择</option>');
                for (var i = 0; i < rationArry.length;i++){
                    var modId = rationArry[i].modele_id;
                    if (modId === 0 || modId === '0'){
                        continue
                    }
                    if (rationNum != null){
                        if (Number(rationNum) ===  modId ) {
                            $("#ratio_id").append("<option selected = 'selected' value=" + modId + ">" + rationArry[i].pro_name + "</option>");
                        }else {
                            $("#ratio_id").append("<option  value=" + modId + ">" + rationArry[i].pro_name + "</option>");
                        }
                    } else {
                        $("#ratio_id").append("<option value=" + modId + ">" + rationArry[i].pro_name + "</option>");
                    }

                }

                //渲染工程
                if (projectArry.length > 0){
                    $("#project_id").empty().append("<option value='select' >请选择</option>");
                    for (var j = 0; j < projectArry.length;j++ ){
                        if (projectArry[j]){
                            $("#project_id").append("<option value=" +  projectArry[j].project_name + ">" + projectArry[j].project_name + "</option>");
                        }
                    }
                }
            }
        }
    })

}


function getProjectByDateTimeAndCrewAndRation() {
    var path = $("#path").val();
    var start = $("#inpstart").val();
    var end = $("#inpend").val();
    var crew = $("#crew_num option:selected").val();
    var rationId = $("#ratio_id option:selected").val();
    if (crew === 'select'){
        return false;
    }
    if (crew === 'select'){
        layer.alert('请选择机组');
        return false;
    }

    $.ajax({
        url: path + "/getProjectByDateTimeAndCrewAndRation.do",
        type:"POST",
        dataType: "json",
        data:{"startDate":start,
            "endDate":end,
            "crew":crew,
            "rationId":rationId},
        success:function (res) {
            $("#project_id").empty().append("<option value='select' >请选择</option>");
            if (res.message === 'success'){
                var projectArry = res.proNameList;
                for (var j = 0; j < projectArry.length;j++ ){
                    if (projectArry[j]){
                        $("#project_id").append("<option value=" +  projectArry[j].project_name + ">" + projectArry[j].project_name + "</option>");
                    }
                }
            }
        }
    })
}


function selectPromessageByRaionModel(){
    var path = $("#path").val();
    var start = $("#inpstart").val();
    var end = $("#inpend").val();
    if (start.isBlanks() || end.isBlanks() ){
        layer.alert('请先选择日期');
        return false;
    }

    var crew = $("#crew_num option:selected").val();
    var rationId = $("#ratio_id option:selected").val();
    var projectName = $("#project_id option:selected").val();

    if (crew === 'select'){
            layer.alert('请选择机组');
            return false;
    }

    //判断机组号和配比是否存在。弃用的逻辑，必选项
    // if (crew.isBlanks() || rationId.isBlanks()){
    //     layer.alert('请选择机组或配比号');
    //     return false;
    // }

    $.ajax({
        url: path + "/getPromessageByRaionModel.do",
        type:"post",
        dataType: "json",
        data:{"startDate":start,
                "endDate":end,
                "crew":crew,
                "rationId":rationId,
                "projectName":projectName},

        beforeSend:function(){
            var index = layer.load(3, {
                shade: [0.1,'#fff'] //0.1透明度的白色背景
            });
        },
        complete:function(){
            layer.closeAll();
        },
        success:function (res) {
            dataArray = res;

            if (!(rationId === 'select')){
                var htmlStr = '<a href="#" id="submits"  onclick="showPromessageSVG()" >更多<i class="iconfont"></i></a>';
            }
            $("#submits").remove();
            $(".boxtitle").append(htmlStr);

            //全部产品渲染
            var htmlStrs = '';
            for (var i = 0; i < dataArray.length;i++){
                if (dataArray[i]){
                    var project_name = dataArray[i].project_name ? dataArray[i].project_name:"";
                    htmlStrs += "<tr>"
                        + "<td class='prodate' >" + dataArray[i].produce_date + "</td>"
                        + "<td>" + dataArray[i].produce_time  + "</td>"
                        + "<td>" + (dataArray[i].crewNums === 'data1'? '机组1':'机组2')  + "</td>"
                        + "<td>" + dataArray[i].produce_disc_num  + "</td>"
                        + "<td>" + dataArray[i].produce_car_num  + "</td>"
                        + "<td title=" + project_name + ">" + project_name  + "</td>"
                        + "<td>" + dataArray[i].pro_name  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_10  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_9  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_8  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_7  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_6  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_5  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_4  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_3  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_2  + "</td>"
                        + "<td>" + dataArray[i].material_aggregate_1  + "</td>"
                        + "<td>" + dataArray[i].material_stone_4  + "</td>"
                        + "<td>" + dataArray[i].material_stone_3  + "</td>"
                        + "<td>" + dataArray[i].material_stone_2  + "</td>"
                        + "<td>" + dataArray[i].material_stone_1  + "</td>"
                        + "<td>" + dataArray[i].material_asphalt  + "</td>"
                        + "<td>" + dataArray[i].material_regenerate  + "</td>"
                        + "<td>" + dataArray[i].material_additive_3  + "</td>"
                        + "<td>" + dataArray[i].material_additive_2  + "</td>"
                        + "<td>" + dataArray[i].material_additive_1  + "</td>"
                        + "<td>" + dataArray[i].material_additive  + "</td>"
                        + "<td>" + dataArray[i].material_total  + "</td>"
                        + "<td>" + dataArray[i].temperature_warehouse_1  + "</td>"
                        + "<td>" + dataArray[i].temperature_mixture  + "</td>"
                        + "<td>" + dataArray[i].temperature_asphalt  + "</td>"
                        + "<td>" + dataArray[i].temperature_aggregate  + "</td>"
                        + "<td>" + dataArray[i].temperature_duster  + "</td>"
                        + "</tr>";
                }
            }

            $("#allProductData").empty().append(htmlStrs);

            //计算平均值
            // var proDate = "";
            var crew = "";
            var proName = "";
            var aggregate10 = 0;
            var aggregate9 = 0;
            var aggregate8 = 0;
            var aggregate7 = 0;
            var aggregate6 = 0;
            var aggregate5 = 0;
            var aggregate4 = 0;
            var aggregate3 = 0;
            var aggregate2 = 0;
            var aggregate1 = 0;
            var stone1 = 0;
            var stone2 = 0;
            var stone3 = 0;
            var stone4 = 0;
            var asphalt = 0;
            var regenerate = 0;
            var additive1 = 0;
            var additive2 = 0;
            var additive3 = 0;
            var additive4 = 0;
            var total = 0;
            var warehouse1 = 0;
            var mixture = 0;
            var temasphalt = 0;
            var aggregate = 0;
            var duster = 0;

            for (var i = 0; i < res.length;i++){
                crew = res[i].crewNums === 'data1'? '机组1':'机组2';
                proName = res[i].pro_name;
                aggregate6 += res[i].material_aggregate_10;
                aggregate5 += res[i].material_aggregate_9;
                aggregate4 += res[i].material_aggregate_8;
                aggregate3 += res[i].material_aggregate_7;
                aggregate6 += res[i].material_aggregate_6;
                aggregate5 += res[i].material_aggregate_5;
                aggregate4 += res[i].material_aggregate_4;
                aggregate3 += res[i].material_aggregate_3;
                aggregate2 += res[i].material_aggregate_2;
                aggregate1 += res[i].material_aggregate_1;
                stone4 += res[i].material_stone_4;
                stone3 += res[i].material_stone_3;
                stone2 += res[i].material_stone_2;
                stone1 += res[i].material_stone_1;
                asphalt += res[i].material_asphalt;
                regenerate += res[i].material_regenerate;
                additive1 += res[i].material_additive;
                additive2 += res[i].material_additive_1;
                additive3 += res[i].material_additive_2;
                additive4 += res[i].material_additive_3;
                total += res[i].material_total;
                warehouse1 += res[i].temperature_warehouse_1;
                mixture += res[i].temperature_mixture;
                temasphalt += res[i].temperature_asphalt;
                aggregate += res[i].temperature_aggregate;
                duster += res[i].temperature_duster;
            }
            var totalStr = "<tr>"
                + "<td>" + "总量值" + "</td>"
                + "<td>" +  " " + "</td>"
                + "<td>" + crew + "</td>"
                + "<td>" +  " " + "</td>"
                + "<td>" +  " " + "</td>"
                + "<td>" +  " " + "</td>"
                + "<td>" +  proName + "</td>"
                + "<td>" +( aggregate10/1000).toFixed(2) + "吨</td>"
                + "<td>" + ( aggregate9/1000).toFixed(2)+ "吨</td>"
                + "<td>" + ( aggregate8/1000).toFixed(2) + "吨</td>"
                + "<td>" + ( aggregate7/1000).toFixed(2) + "吨</td>"
                + "<td>" +( aggregate6/1000).toFixed(2) + "吨</td>"
                + "<td>" + ( aggregate5/1000).toFixed(2)+ "吨</td>"
                + "<td>" + ( aggregate4/1000).toFixed(2) + "吨</td>"
                + "<td>" + ( aggregate3/1000).toFixed(2) + "吨</td>"
                + "<td>" + ( aggregate2/1000).toFixed(2)  + "吨</td>"
                + "<td>" + ( aggregate1/1000).toFixed(2)  + "吨</td>"
                + "<td>" + ( stone4/1000).toFixed(2)  + "吨</td>"
                + "<td>" + ( stone3/1000).toFixed(2) + "吨</td>"
                + "<td>" + ( stone2/1000).toFixed(2)  + "吨</td>"
                + "<td>" + ( stone1/1000).toFixed(2) + "吨</td>"
                + "<td>" + (asphalt/1000).toFixed(2)  + "吨</td>"
                + "<td>" +  (regenerate/1000).toFixed(2) + "吨</td>"
                + "<td>" +  (additive1/1000).toFixed(2) + "吨</td>"
                + "<td>" +  (additive2/1000).toFixed(2) + "吨</td>"
                + "<td>" +  (additive3/1000).toFixed(2) + "吨</td>"
                + "<td>" +  (additive4/1000).toFixed(2) + "吨</td>"
                + "<td>" + (total/1000).toFixed(2)  + "吨</td>"
                + "<td>" + ( warehouse1/res.length).toFixed(2) + "℃</td>"
                + "<td>" +  ( mixture/res.length).toFixed(2) + "℃</td>"
                + "<td>" + ( temasphalt/res.length).toFixed(2)  + "℃</td>"
                + "<td>" + ( aggregate/res.length).toFixed(2) + "℃</td>"
                + "<td>" +  ( duster/res.length).toFixed(2) + "℃</td>"
                + "</tr>";
            var svgTotal = (total/res.length).toFixed(2);
            var svgHtmlStr = "<tr>"
                + "<td>" + "平均值" + "</td>"
                + "<td>" +  " " + "</td>"
                + "<td>" + crew + "</td>"
                + "<td>" +  " " + "</td>"
                + "<td>" +  " " + "</td>"
                + "<td>" +  " " + "</td>"
                + "<td>" +  proName + "</td>"
                + "<td>" +( aggregate10 /res.length/svgTotal*100).toFixed(2) + "%</td>"
                + "<td>" +( (aggregate9 - aggregate10) /res.length/svgTotal*100).toFixed(2) + "%</td>"
                + "<td>" +( (aggregate8 - aggregate9) /res.length/svgTotal*100).toFixed(2) + "%</td>"
                + "<td>" +( (aggregate7 - aggregate8) /res.length/svgTotal*100).toFixed(2) + "%</td>"
                + "<td>" +( (aggregate6 - aggregate7) /res.length/svgTotal*100).toFixed(2) + "%</td>"
                + "<td>" + ( (aggregate5 - aggregate6) /res.length/svgTotal*100).toFixed(2)+ "%</td>"
                + "<td>" + ( (aggregate4 - aggregate5)/res.length/svgTotal*100).toFixed(2) + "%</td>"
                + "<td>" + (( aggregate3 - aggregate4 )/res.length/svgTotal*100).toFixed(2) + "%</td>"
                + "<td>" + ( (aggregate2 - aggregate3) /res.length/svgTotal*100).toFixed(2)  + "%</td>"
                + "<td>" + ( (aggregate1 - aggregate2)/res.length/svgTotal*100).toFixed(2)  + "%</td>"
                + "<td>" + ( stone4/res.length/svgTotal*100).toFixed(2)  + "%</td>"
                + "<td>" + ( stone3/res.length/svgTotal*100).toFixed(2) + "%</td>"
                + "<td>" + ( stone2/res.length/svgTotal*100).toFixed(2)  + "%</td>"
                + "<td>" + ( stone1/res.length/svgTotal*100).toFixed(2) + "%</td>"
                + "<td>" + ( asphalt/res.length/svgTotal*100).toFixed(2)  + "%</td>"
                + "<td>" +  ( regenerate/res.length/svgTotal*100).toFixed(2) + "%</td>"
                + "<td>" +  ( additive1/res.length/svgTotal*100).toFixed(2) + "%</td>"
                + "<td>" +  ( additive2/res.length/svgTotal*100).toFixed(2) + "%</td>"
                + "<td>" +  ( additive3/res.length/svgTotal*100).toFixed(2) + "%</td>"
                + "<td>" +  ( additive4/res.length/svgTotal*100).toFixed(2) + "%</td>"
                + "<td>" + ( total/res.length).toFixed(2)  + "</td>"
                + "<td>" + ( warehouse1/res.length).toFixed(2) + "℃</td>"
                + "<td>" +  ( mixture/res.length).toFixed(2) + "℃</td>"
                + "<td>" + ( temasphalt/res.length).toFixed(2)  + "℃</td>"
                + "<td>" + ( aggregate/res.length).toFixed(2) + "℃</td>"
                + "<td>" +  ( duster/res.length).toFixed(2) + "℃</td>"
                + "</tr>";

            var modelHtml = "<tr>"
                + "<td>" + "设定值" + "</td>"
                + "<td>" +  " " + "</td>"
                + "<td>" + crew + "</td>"
                + "<td>" +  " " + "</td>"
                + "<td>" +  " " + "</td>"
                + "<td>" +  " " + "</td>"
                + "<td>" +  res[0].pro_name  + "</td>"
                + "<td>" + res[0].repertory_ten + "%</td>"
                + "<td>" + res[0].repertory_nine + "%</td>"
                + "<td>" +  res[0].repertory_eight + "%</td>"
                + "<td>" + res[0].repertory_seven + "%</td>"
                + "<td>" + res[0].repertory_six + "%</td>"
                + "<td>" + res[0].repertory_five + "%</td>"
                + "<td>" +  res[0].repertory_four + "%</td>"
                + "<td>" + res[0].repertory_three + "%</td>"
                + "<td>" +  res[0].repertory_two + "%</td>"
                + "<td>" +  res[0].repertory_one + "%</td>"
                + "<td>" +res[0].breeze_four + "%</td>"
                + "<td>" +res[0].breeze_three + "%</td>"
                + "<td>" +res[0].breeze_two + "%</td>"
                + "<td>" +res[0].breeze + "%</td>"
                + "<td>" + res[0].ratio_stone  + "%</td>"
                + "<td>" +  (Number(res[0].ratio_regenerate1) + Number(res[0].ratio_regenerate2) + Number(res[0].ratio_regenerate3))  + "%</td>"
                + "<td>" +  res[0].ratio_additive + "%</td>"
                + "<td>" +  res[0].ratio_additive_two + "%</td>"
                + "<td>" +  res[0].ratio_additive_three + "%</td>"
                + "<td>" +  res[0].ratio_additive_four + "%</td>"
                + "<td>" + " "  + "</td>"
                + "<td>" + res[0].temperature_asphalt + "℃-" + res[0].temperature_asphalt_up + "℃</td>"
                + "<td>" + res[0].temperature_mixture + "℃-" + res[0].temperature_mixture_up + "℃</td>"
                + "<td>" + res[0].temperature_asphalt + "℃-" + res[0].temperature_asphalt  + "℃</td>"
                + "<td>" + res[0].temperature_aggregate + "℃-" + res[0].temperature_aggregate + "℃</td>"
                + "<td>" +  res[0].temperature_milling + "℃-" + res[0].temperature_milling + "℃</td>"
                + "</tr>";

            getDateByPageNum(1);
            $("#productData").append(totalStr);
            $("#allProductData").append(totalStr);
            $("#productData").append(svgHtmlStr);
            $("#allProductData").append(svgHtmlStr);
            $("#productData").append(modelHtml);
            $("#allProductData").append(modelHtml);
        }
    });



}

function showPromessageSVG(){
    var path = $("#path").val();
    var start = $("#inpstart").val();
    var end = $("#inpend").val();
    var crew = $("#crew_num option:selected").val();
    var rationId = $("#ratio_id option:selected").val();

    layer.open({
        type: 2,
        title: '产品均值信息',
        shadeClose: true,
        maxmin: true,
        shade: 0.8,
        area: ['90%', '90%'],
        content: path + '/getProSvgmessage.do?startDate=' + start + '&endDate=' + end + '&crew=' + crew + '&rationId=' + rationId //iframe的url
    });
}


//到处Excel
//打印表格
var idTmr;

function getExplorer() {
    var explorer = window.navigator.userAgent;
    //ie
    if(explorer.indexOf("MSIE") >= 0) {
        return 'ie';
    }
    //firefox
    else if(explorer.indexOf("Firefox") >= 0) {
        return 'Firefox';
    }
    //Chrome
    else if(explorer.indexOf("Chrome") >= 0) {
        return 'Chrome';
    }
    //Opera
    else if(explorer.indexOf("Opera") >= 0) {
        return 'Opera';
    }
    //Safari
    else if(explorer.indexOf("Safari") >= 0) {
        return 'Safari';
    }
}

function method5(tableid) {
    var temName;
    var ahtml = ' <a href="#" id="exportExcel" style="display:none" ></a>';//提供给下面自定义文件名的操作
    $("#"+tableid).after(ahtml);
    if(getExplorer() === 'ie') {
        var curTbl = document.getElementById(tableid);
        var oXL = new ActiveXObject("Excel.Application");
        var oWB = oXL.Workbooks.Add();
        var xlsheet = oWB.Worksheets(1);
        var sel = document.body.createTextRange();
        sel.moveToElementText(curTbl);
        sel.select();
        sel.execCommand("Copy");
        xlsheet.Paste();
        oXL.Visible = true;

        try {
            var fname = oXL.Application.GetSaveAsFilename("Excel.xls",
                // "Excel Spreadsheets (*.xls), *.xls");
                "Excel Spreadsheets (" + temName +".xls), " + temName + ".xls");
        } catch(e) {
            print("Nested catch caught " + e);
        } finally {
            oWB.SaveAs(fname);
            oWB.Close(savechanges = false);
            oXL.Quit();
            oXL = null;
            idTmr = window.setInterval("Cleanup();", 1);
        }

    } else {

        var startDate = $("#inpstart").val();
        if (startDate){
            temName = startDate;
        } else {
            var date = new Date();
            temName = date.toLocaleDateString();
        }
        tableToExcel(tableid,temName)
    }
}

function Cleanup() {
    window.clearInterval(idTmr);
    CollectGarbage();
}
var tableToExcel = (function() {

    var uri = 'data:application/vnd.ms-excel;base64,',
        template = '<html><head><meta charset="UTF-8"></head><body><table  border="1">{table}</table></body></html>',
        base64 = function(
            s) {
            return window.btoa(unescape(encodeURIComponent(s)))
        },
        format = function(s, c) {
            return s.replace(/{(\w+)}/g, function(m, p) {
                return c[p];
            })
        }
    return function(table, name) {
        if(!table.nodeType)
            table = document.getElementById(table)
        var ctx = {
            worksheet: name || 'Worksheet',
            table: table.innerHTML
        }

        document.getElementById("exportExcel").href = uri
            + base64(format(template, ctx));
        document.getElementById("exportExcel").download = name + ".xls";//自定义文件名
        document.getElementById("exportExcel").click();
         // window.location.href = uri + base64(format(template, ctx))
    }
})()

String.prototype.isBlanks = function () {
    var s = $.trim(this);
    if (s == "undefined" || s == null || s == "" || s.length == 0) {
        return true;
    }
    return false;
};